Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 168836C2C3A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 09:23:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peXH6-0004Oi-42; Tue, 21 Mar 2023 04:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1peXGv-0004JL-UU
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 04:23:09 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1peXGt-0006UR-RE
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 04:23:09 -0400
Received: by mail-wr1-x429.google.com with SMTP id i9so12729962wrp.3
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 01:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112; t=1679386986;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=afNgq1D2QXqYvXFmdiDcZ72USqxf3taFmgJjCEfZhWU=;
 b=KOMEtsrpXKzo6NBJrs3L0NXt1aR1Naca9/JguubuJ/VW2BQcirNf+CI6EqFxAQwnd2
 SIYJ0Sory6O6G79aAdCS2lqEwWiF2G52lyx+KhYPTCjkJa8pvnyyeKGTaH7ndxyLEmU1
 c9Z64xr78rflPZg+IZ/pIp7crxi4whhe93MedKkkZF+PSHz6snMTgWUm3r2AKVADV/B8
 onSGpeSVrtd9SvuYMGaWDIk7ewT7VPrtcRjKIh4P2TupIQoewoxOmf0SMRBP9fXIEN09
 0UUC1T3monV5OVsoB8yUb1YUVB+werl93AWQaHvc3JvPHz6ElcUR1ttxVw98XqD3cck0
 MWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679386986;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=afNgq1D2QXqYvXFmdiDcZ72USqxf3taFmgJjCEfZhWU=;
 b=xZcOBgWF64AXS03LPQhR6LARmXmb8lK/ZVwFTk19rEcjk9OnmF+uiSvO7oVsBXpnIN
 So9w94VykwstdIV4ceDFQ8f5KQatuzO6IxEkD1EiYveQnUMU0bf63j2g7Pq9k1GLVs1U
 6gm2G/46Gyl1z99FJQ8vBtKlvks9xdj7GO0ax2EXXVl2foqDCOYb+ZdwWddHLW+c49Na
 8huYFw9RLidnWdiVcUJBcrc2ZHwL154sqyOwjNPzTdE9R+9WKeqdXA0wfsbny2k5jeCS
 96tCNun+ybHAA/UgM5J4gRLz8kK3UhOz9ITUevr9mxcRkferJxOPvCHOeS5MwjIbKMaa
 wWNw==
X-Gm-Message-State: AO0yUKWDe64DZHoIugfEXfKzM3c267W0D2O9v6bn13cMWs4sMMWsnuev
 dM2kVz2Qci2FpJ5aTWH6+RaYs0+Pr/f6s+UxthWQ9Q==
X-Google-Smtp-Source: AK7set/DF0PlmvgNv2WRGHBNmH/fNxj2ERd1mUEa4eUgAAtLvbplZGEDWammKwmBDv7tvMLxlhLX4Qf3qnwWg6qOqpE=
X-Received: by 2002:a5d:5012:0:b0:2c7:1b1b:4f92 with SMTP id
 e18-20020a5d5012000000b002c71b1b4f92mr444556wrt.0.1679386986185; Tue, 21 Mar
 2023 01:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230320093847.539751-1-kraxel@redhat.com>
 <20230320093847.539751-2-kraxel@redhat.com>
In-Reply-To: <20230320093847.539751-2-kraxel@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 21 Mar 2023 13:52:55 +0530
Message-ID: <CAARzgwwjV=sb1=i2aZRTSdGJj5ZpnRrh3ksM+4Hwz-d=XRGYew@mail.gmail.com>
Subject: Re: [PULL 1/6] acpi: enable tests/data/acpi updates
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::429;
 envelope-from=ani@anisinha.ca; helo=mail-wr1-x429.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Mar 20, 2023 at 3:08=E2=80=AFPM Gerd Hoffmann <kraxel@redhat.com> w=
rote:
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bi=
os-tables-test-allowed-diff.h
> index dfb8523c8bf4..b5ed0904b5ff 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,2 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/virt/SRAT.acpihmatvirt",

Should we also add   tests/data/acpi/virt/SSDT.memh ?

> --
> 2.39.2
>

