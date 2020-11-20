Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0692BB0F2
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:51:08 +0100 (CET)
Received: from localhost ([::1]:37210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg9cp-0002KT-L1
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:51:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kg9Yp-0006Ej-6T
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:46:59 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:35563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kg9Yn-0002Hs-AF
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:46:58 -0500
Received: by mail-ej1-x630.google.com with SMTP id f23so13795546ejk.2
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 08:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PPPKBYAiDqptk788z53LcyJhrcZDocJaQEsVvVQJRNM=;
 b=qNkKGnm9MVIUHFsIPfcKlHv+IvszNNUWR9y1LKwS9GKDF4YLBXEGtXVVMFtYMjWBny
 2/KbtsjxRwazeczYlPAj6ZqqRm3JO8InW6p0JJ6i2HvpbxRkylWtIseZPECt2pAzumLb
 Z0KDPRf5sm5N/3UTIxtkQcMwuOZamdmQpGfUd+DcDgdES/OiiIYugltXtnMGYAEDd0rV
 gxZ5nfxPvdEFVoC4NY3xMmw+8oVS0Twy0xLuLLhjBl7jXzOY1vWw3g3aQ2qX49MvlObN
 HtNKS9jGSt05hC4STfw8bSbt7Q2meXp0FEDJm0i+r3g6OQVEUgrebfCGJgUDY4e/WVod
 rfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PPPKBYAiDqptk788z53LcyJhrcZDocJaQEsVvVQJRNM=;
 b=t2erxhDuoksPTkgFPTnDyMQX8V5JNN5c9cqU1zUOxKHmtLVgqGy+5JmP4RvUSo00RJ
 otH4UVu9G2hdJUtdcCW5Igdrsy/GkFcq2BZThjh3hKkm2C5BENKVCdH1siehWvWSffpw
 yaL1OVHtWu8ExhLUcqurPm0KGXLH6ZKZFNFq0KpuL1Cd01PSxLXPDNAF3nJN9fPbCj2T
 IGsFlbtmlwkR4SZzYFn66A71sq9Caikn/4b7XhNFG/U7Dwq3D0R/KovlJJz8eLfjHKhh
 hvnNFCjYuz2Tv05lSemqgPCKLR0xc0Q6aVsCe8ljWu1uDRl7udnAzCJtZc9mG5DUxJGo
 Il4Q==
X-Gm-Message-State: AOAM532e4xSree9iH1TXgC5yFS5x9d0vPLtyiwvFOF8uk9G+7zt29Yem
 E8+n9vr22PdpnBVmFSilxdhnB+ZXZgWJVpLjsRGGww==
X-Google-Smtp-Source: ABdhPJw70HRVY+ETDdojOZrLC+NKN4A9t0bzkz9n1kK9MSW6u5RFOwP/xcghooKJvOP/BkqYEyc1zFEu8vYeBYry6Rk=
X-Received: by 2002:a17:906:5a88:: with SMTP id
 l8mr32520180ejq.407.1605890815595; 
 Fri, 20 Nov 2020 08:46:55 -0800 (PST)
MIME-Version: 1.0
References: <20201120152140.2493197-1-f4bug@amsat.org>
 <20201120152140.2493197-2-f4bug@amsat.org>
In-Reply-To: <20201120152140.2493197-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Nov 2020 16:46:44 +0000
Message-ID: <CAFEAcA8udfqjmYn64PZJP6xv_T_v=7Ff7CAj1jeapuZbvBupxw@mail.gmail.com>
Subject: Re: [PATCH-for-5.2 1/4] docs/system: Deprecate raspi2/raspi3 machine
 aliases
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Krempa <pkrempa@redhat.com>, Libvirt <libvir-list@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 Nov 2020 at 15:21, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Since commit aa35ec2213b ("hw/arm/raspi: Use more specific
> machine names") the raspi2/raspi3 machines have been renamed
> as raspi2b/raspi3b.
>
> Note, rather than the raspi3b, the raspi3ap introduced in
> commit 5be94252d34 ("hw/arm/raspi: Add the Raspberry Pi 3
> model A+") is a closer match to what QEMU models, but only
> provides 512 MB of RAM.
>
> As more Raspberry Pi 2/3 models are emulated, in order
> to avoid confusion, deprecate the raspi2/raspi3 machine
> aliases.
>
> ACKed-by: Peter Krempa <pkrempa@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  docs/system/deprecated.rst | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index d98464098f5..d1bc03d7e61 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -346,6 +346,13 @@ This machine has been renamed ``fuloong2e``.
>  These machine types are very old and likely can not be used for live mig=
ration
>  from old QEMU versions anymore. A newer machine type should be used inst=
ead.
>
> +Raspberry Pi ``raspi2`` and ``raspi3`` machines (since 5.2)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +The Raspberry Pi machines come in various models (A, A+, B, B+). To be a=
ble
> +to distinct which model is used, the ``raspi2`` and ``raspi3`` machines =
 have

"to distinguish which model QEMU is implementing"

> +been respectively renamed ``raspi2b`` and ``raspi3b``.

"been renamed ``raspi2b`` and ``raspi3b`` respectively"

(or just drop 'respectively' altogether and assume the reader can
figure out which is which ;-))


Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

