Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 746246EDDE3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 10:24:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDx9-0001uO-9Z; Tue, 25 Apr 2023 04:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1prDww-0001tR-7L
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 04:22:59 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1prDwt-0004ET-0G
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 04:22:56 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-304935cc79bso74876f8f.2
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 01:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20221208.gappssmtp.com; s=20221208; t=1682410968; x=1685002968; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tiDjHKMzLm/Keme4JHM3u73/XBgnf7oiUZ2XLzwQOx0=;
 b=3Gxhe+EbrJIDUlrl6GhjKoZmYy/B/RBv/QNZvNTFavsaZbQyT8rE/afik+j/OircX4
 +z+JXWy6ZbD8C2tz++rrtlx0ScB+OgEqROUJSst0fDBgpRxb1K/mCSWx5c9eesx7fQS0
 Ci221hGhRx/UoxK+NRRcTo8SfI8LxfohhaEqEre6m/uiP7owqR6YHfF2a3H6fnyasw6c
 HjeuPf+e6rTbl+s+D2IR5zK3mWlVaPuPMUaHJCVUKpLBHTAOFoG7RbG2pERts8X0ng85
 xwm5BQGUpR0zwU3hFdeq3fdbzVsuAQ8cce4ZmIDYU4FD0xrBvX2Gy1mZ2PDUAugGydJY
 RCvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682410968; x=1685002968;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tiDjHKMzLm/Keme4JHM3u73/XBgnf7oiUZ2XLzwQOx0=;
 b=feuyPgrlotVhypCj+J2B1PnwKZ0JaZzUQ25XlLzdMX8YkyYY7zDuvcjDRRM7Zs/62u
 y0Ep+2sjFrkummS/INUawmjmVBFjT4xGySr2iZdPBG1Uw0f3PKqPDzXKESdiTFZZ30yL
 M0UgdbZPIM51YSD4IASTB9l98R12plF+QkDETTGzEF4PviIBdoacez1kch2LqLHB0Abz
 bMnzohFTxwLKtmKNQyULnacvX1VdjUlw0fmF8vKHHkaZWewaG+8d3o7V5BYSl3E7/1aZ
 3rVsyPKYxSCqxCDdf6Xpz/nRzvTq/b26ztOfHxWH+c8vw7cfVysz1bKwLUqvRUIuFu3D
 Zsbg==
X-Gm-Message-State: AAQBX9dAP2y+0FoLmq4iuFonQ1lyhowXpq5hLpsGjiIp947qmtkY8myw
 1xb6V7rlSmlUczmRdE7+8SPmKHGBzpygWT37fi0zoA==
X-Google-Smtp-Source: AKy350Yod6sM7x3kzoRi4EGCbeP6Jzb8i0y/E2r6k5otft3rEaA6K1GyErkYapRs+7nHnvODmO+uOPFiCxg7KscalBA=
X-Received: by 2002:a5d:6103:0:b0:2fb:a3e:7cb0 with SMTP id
 v3-20020a5d6103000000b002fb0a3e7cb0mr11380210wrt.10.1682410967952; Tue, 25
 Apr 2023 01:22:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1682408661.git.mst@redhat.com>
 <104593c3ad48f3857e9c48d9e3e7feb3566444c7.1682408661.git.mst@redhat.com>
In-Reply-To: <104593c3ad48f3857e9c48d9e3e7feb3566444c7.1682408661.git.mst@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 25 Apr 2023 13:52:36 +0530
Message-ID: <CAARzgwyxGYdNVUvf7ocSJ7wZcEEOU78p8jxsEEC_cK+M6Ysjfg@mail.gmail.com>
Subject: Re: [PULL 18/31] Add my old and new work email mapping and use work
 email to support acpi
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Ani Sinha <anisinha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::42b;
 envelope-from=ani@anisinha.ca; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Apr 25, 2023 at 1:15=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> From: Ani Sinha <ani@anisinha.ca>
>
> Updating mailmap to indicate ani@anisinha.ca and anisinha@redhat.com are =
one
> and the same person. Also updating my email in MAINTAINERS for all my acp=
i work
> (reviewing patches and biosbits) to my work email. Also doing the same fo=
r
> bios bits test framework documentation.
>
> Signed-off-by: Ani Sinha <anisinha@redhat.com>
> Message-Id: <20230329040834.11973-1-anisinha@redhat.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

I think you can squash this one with patch #2 in the PR.

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 83c0373872..e365a7a47e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1894,7 +1894,7 @@ F: hw/pci/pcie_doe.c
>  ACPI/SMBIOS
>  M: Michael S. Tsirkin <mst@redhat.com>
>  M: Igor Mammedov <imammedo@redhat.com>
> -R: Ani Sinha <ani@anisinha.ca>
> +R: Ani Sinha <anisinha@redhat.com>
>  S: Supported
>  F: include/hw/acpi/*
>  F: include/hw/firmware/smbios.h
> --
> MST
>

