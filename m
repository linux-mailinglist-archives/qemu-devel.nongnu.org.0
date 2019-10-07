Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B357BCE939
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Oct 2019 18:30:15 +0200 (CEST)
Received: from localhost ([::1]:47520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHVtm-0003KW-4q
	for lists+qemu-devel@lfdr.de; Mon, 07 Oct 2019 12:30:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59129)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iHVpI-0007bF-0B
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 12:25:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iHVpG-00006P-NV
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 12:25:35 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:39991)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iHVpG-000064-I7
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 12:25:34 -0400
Received: by mail-oi1-x229.google.com with SMTP id k9so12185320oib.7
 for <qemu-devel@nongnu.org>; Mon, 07 Oct 2019 09:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HusvXg4yWOYFa3BHbZJfsdpgQIQqnCoCWKHaGz85Ob8=;
 b=hbeT/aJVI+4Evi2IcoJCUCPcLFTeXEZOaI4vtTEHzhkgXCnP5gfgPLy8vYBTWW+7EX
 WSinzGKuQLOIe2IVg58PJP3oIcAVi2YRXbG06jACrzM+h6qOeCrhORFd+SNRdtOXUZWf
 6Ul2LALCg7ElqaPA+xZRc9EEztb749724Lbm14j5V2AbGOVXW2zop+IgXI6v8GQJnP5O
 lzpcC3WqR4GQSzIl9ZRkFMCgkFX3j5ciIGURAgD81HPeisy8pMtSj2vKIjjP1DRM6Qf3
 /wiAhKgj6U0I64FZknc96k8Vnoy42oEtlxEyqlqOZ1FTKLtTSXVSWMAgVKzP/3IY8eEb
 jN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HusvXg4yWOYFa3BHbZJfsdpgQIQqnCoCWKHaGz85Ob8=;
 b=OQ5RLc/PYywxR/png2B/FIL9vaplGdo9bZgHgsTx744/MbtfVYttFvQL3HkHb/etLw
 bBj08ty18lCitRYbd58pIfmnBYFRTsNyhjYOvcIhr8sYW/1Fde+0c/lnpSuloYUC8800
 2RAFxxr5O6EQhcIk1LIROIO1r8IbFzbZg7CLhKw0uHtX5PHL3PtUkv7NLnuMj/OeDHJn
 L9GUtDv4+L8PCgzNBuZkHkUgc8j6XQuMn5eIx9AJzeCZKG9fwxDbaq+EaC/V/t2xEat+
 HZ/BDuC72bSVJ2soAjvYQKZQ8SF172/B81ENx5FBe0T6Yg62dVaA1c+5yvPaMhebMMov
 mPcw==
X-Gm-Message-State: APjAAAUVyZZ4QI2xK4+y2EOcqhwVNVxxzf2IUKwTMA1QVC0WM/WClY8w
 xBTigv7Z19UzlCFtmPSOt3BVK/pqnjUg7zi3Es5g/w==
X-Google-Smtp-Source: APXvYqw6Vr/q9u8TXrDKyElpqxd1ugwwqPWaKYa3JB4GgpOkwtJ6ipQtvN3AcS2JCB15UmZSV7Zy1c8DFx7P3I8Nf+I=
X-Received: by 2002:aca:50d8:: with SMTP id e207mr118494oib.48.1570465533375; 
 Mon, 07 Oct 2019 09:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <20191007160708.26208-1-alex.bennee@linaro.org>
In-Reply-To: <20191007160708.26208-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Oct 2019 17:25:22 +0100
Message-ID: <CAFEAcA940hceuNdjNDBuJugrz64=7TQK78dR+KfYaR3xuhYf8w@mail.gmail.com>
Subject: Re: [PATCH] .travis.yml: reduce scope of the --enable-debug build
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::229
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Oct 2019 at 17:22, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Adding debug makes things run a bit slower so lets not hammer all the
> targets.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  .travis.yml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/.travis.yml b/.travis.yml
> index d0b9e099b9..fc0888aff5 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -124,12 +124,13 @@ matrix:
>          - CACHE_NAME=3D"${TRAVIS_BRANCH}-linux-gcc-default"
>
>
> +    # --enable-debug implies --enable-debug-tcg, also runs quite a bit s=
lower
>      - env:
> -        - CONFIG=3D"--enable-debug --enable-debug-tcg --disable-user"
> +        - CONFIG=3D"--enable-debug --enable-debug-tcg --target-list=3D${=
MAIN_SOFTMMU_TARGETS}"
>          - CACHE_NAME=3D"${TRAVIS_BRANCH}-linux-gcc-debug"

If (as noted in the comment) --enable-debug implies
--enable-debug-tcg, why do we need to give both options ?

thanks
-- PMM

