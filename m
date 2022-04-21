Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A15F9509EE5
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:48:02 +0200 (CEST)
Received: from localhost ([::1]:57698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhVI1-00025W-PB
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUtk-00014R-DO
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:22:56 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:34998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUth-0004GC-EU
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:22:56 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2ef4a241cc5so48581507b3.2
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RmzqmMYSCE4vydYYrv6g/wXHBnLUvcWjWC+1vTEZQ+I=;
 b=x9w5Si5d5UfOZgmQJFc93J9m7QvWUVwZt8kBgTD5iXOMMw18pPGkPBGZIWBshQG8la
 8J+mxXhZDZ1163/S2HjattlD+0o7/GRkSyu4LDBbWJS0FPKhpySbyzfl4FxI283uZ3uw
 2Gc70n4hq/pSsfIWwDWE30kS+kdtOanS9dYbK+0TmFXu+nsnLlnh5HS3p33Qcdf4mNje
 gHv37GF+DbSxXM4lN6QK3qhzJWzo2TYfUlavMCIwT/qlobjHN1RXIAvP9drXjD/ocpOl
 ya54GL2RYh/P/1IECUQ/YZ53sW7ZpuwZRmd85t5Lwc8Pyxj7S57PeDPY4sjhmEoOXMyG
 4VrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RmzqmMYSCE4vydYYrv6g/wXHBnLUvcWjWC+1vTEZQ+I=;
 b=oQvO/F80LO3NBmLZUL4M/MFdC/r1B11SodCeJLd9zJOjXsdBjJTZSI2DVY6CqRybRi
 jA69nHCLeINX0/dIa7bL8uw/gHiVwyS5Wno9a56FshUBsON3j407eox68Y0IRusIEfeH
 IrSmBAIefQA40hOhJVqwEX0pCx3lzcUMn70D/MK7l8uqRHxPqfsTkvULblMgRp+ffaIB
 RoDSCdWVFplb/hDbFIj3lWCpkWQBYxM9OzsDDUlXdrrfAsXNXxLocUHiVhP5V6jSgevn
 IGmmJ9pbx2p+Qfu/9opbihDOtP61pU6sOC6X3unbBjXKTV5AVoiRPl5t4yLfgzJTMMRr
 yy2w==
X-Gm-Message-State: AOAM533sv5D4Ok1+oWuDortScKYv7JO+wlmAlkPYUGU6PSSYVp0AtC5O
 GTRav+hDGAAaiSBqAMXaGrqqNnLg2DwQpCpYD7T2cw==
X-Google-Smtp-Source: ABdhPJw0XP72OgBYcMmODYjn61bLGCdGpvzcG4xTcwNVc2j5OBM0gvyGCwDknUY2XJ53SWD+IcTODwqYPBIkhPXZ+jc=
X-Received: by 2002:a81:3450:0:b0:2f1:d8f4:cd9c with SMTP id
 b77-20020a813450000000b002f1d8f4cd9cmr11191470ywa.455.1650540172445; Thu, 21
 Apr 2022 04:22:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
 <20220405223640.2595730-10-wuhaotsh@google.com>
In-Reply-To: <20220405223640.2595730-10-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 12:22:41 +0100
Message-ID: <CAFEAcA-J-=DVtHwDuPmn40t7ix9FUC1aQysBHMq5gfGRA1f12w@mail.gmail.com>
Subject: Re: [PATCH for-7.1 09/11] pc-bios: Add NPCM8xx Bootrom
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Uri.Trichter@nuvoton.com, titusr@google.com, venture@google.com,
 hskinnemoen@google.com, qemu-devel@nongnu.org, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, Vishal.Soni@microsoft.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 5 Apr 2022 at 23:38, Hao Wu <wuhaotsh@google.com> wrote:
>
> The bootrom is a minimal bootrom that can be used to bring up
> an NPCM845 Linux kernel. Its source code can be found at
> github.com/google/vbootrom/tree/master/npcm8xx
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviwed-by: Titus Rwantare <titusr@google.com>
> ---
>  pc-bios/npcm8xx_bootrom.bin | Bin 0 -> 608 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  create mode 100644 pc-bios/npcm8xx_bootrom.bin
>
> diff --git a/pc-bios/npcm8xx_bootrom.bin b/pc-bios/npcm8xx_bootrom.bin
> new file mode 100644
> index 0000000000000000000000000000000000000000..6370d6475635c4d445d2b927311edcd591949c82
> GIT binary patch
> literal 608
> zcmdUrKTE?<6vfX=0{*3B5ET?nwWA^;qEk()n=Xb9-4dxoSBrz#p|QJQL~zokn{Eyc
> z?PBXUkU+aB?k?IbNQftG5ej|*FC2c{bKkr7zLy3jhNxj`gc_y5h&V=Ru)PgZC)Y`f
> zTqA9Am28qL<U6@cMtA>Hlr*^&hT#;re-)dpxT0U42|O+cWOcx=B;{6xXH04vx?cjm
> z+%U{oFx!aPpV3>ZKz0i$XA-yq{f}<H?{MHBq+VwIvR9WmcL(xr1vuIRGELcRC-S+P
> zl3%RlR5(6+1;xg_<~xR#bPItDN1*Hp^{JyNs7o*BMq0Q9q1#>x4;|pb<NWIbQ8wb1
> zTac^<ebj^E^Ig<?U?(PO-w>w;l#@9zGd|z-rs*H@V-o%PEV)D-)8n2%DyH5@w_^Y8
> LH5R3RMV#gjxYTW}

You can't just dump a sourceless binary into pc-bios/.
Check out the commit that added the npcm7xx bootrom blob
for what else you need: that's commit d1cb5eda67a0a6.

In particular you need to document it in the README file, and have
runes in the Makefile to rebuild the blob from source (and running
the Makefile should be how the blob in the commit was created!).
You'll probably also want a preceding commit to bump the vbootrom
submodule commit and provide a fresh npcm7xx_bootrom blob from
whatever commit you choose to bump the submodule to.

thanks
-- PMM

