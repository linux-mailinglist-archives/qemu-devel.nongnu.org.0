Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9345531737D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:37:09 +0100 (CET)
Received: from localhost ([::1]:43478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9y6e-00049e-KP
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:37:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9xzL-0008IR-Ez
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:29:39 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:42353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9xzC-0001yK-4V
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:29:35 -0500
Received: by mail-ej1-x62e.google.com with SMTP id l25so6950442eja.9
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qrka3QVrjrgjQf2unQs+JJVjFYJdKCkVcYz6AfhnIwA=;
 b=YZLVQ3sYj4wemqvmmNoRCOmUHw+AdXyTWihO1jT7jiTpfosEUizaitsr25wKPXN8OL
 5V/+PD7mUJQor9uz9Gp9V+aVO2MMtJSf6aGbdiqodYX0EEkg3mWOmMCiAZaYqbQRF0cb
 2y2DC0CSt6/lZ8tEnqMWRneUN14C+BdefI1EysBE5KBRQ9Fcyp2FWk76KZJZOUIx4Jq7
 yrOYfvvT7VHUnFC69iSLScY7v0yhwr6aU1SBVufa1fmXVbJTZUd8RAxEvYiPffeWuHLa
 mqHVN11VieoTxbVyoqOnweZCDmN+zrxmtMMywkGFqjIvUpeEJqGItF4GdUZO9evNlJmL
 cIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qrka3QVrjrgjQf2unQs+JJVjFYJdKCkVcYz6AfhnIwA=;
 b=XQxiWR0V+hyKK9zA9s8MvxMM9US6OHs4hSaCV2xlr/aWre3b3purf7qTRpBgS65AUX
 Tdeb3KpvgD++5s9vZx8+OBKt24vIXAD/tUP9VgQ6XMt9WNLg2oz+gsUPbZC5Z05r2BL5
 khVpoBx7EnTSzp3MWtIct563pGOUHgdRyPqlgz5kV6bJl+FYLfDwO721ZWpDYa8Uss5A
 Ncad9LmBRTcH0h+LkezLTvrrUOi06BVrm2iUoxzdvA5aeEP+VQfwuMs6oxGB8BrcUzmR
 M5IXH+moEdzDIK14/EflanSLVddZeVcLoXXeBahmXuNCdpXtDrWCV8NY9fo3EHveMcyT
 3wGQ==
X-Gm-Message-State: AOAM533kHdELtAPVRFRfm9SZ+XlPnHV6CYwcNT6prCMKCjRyIqCqUjWF
 28P2Y5CpZ0SocczBXuFx+f81JbZ7a4lFQ0iG+QiKqA==
X-Google-Smtp-Source: ABdhPJw+c8P0OHa18T2YTFfarEAkIhoRbmMUriidGHdeV/D68zKiObXAbKfT4pOWfM1n0GQwbEgBqJJppzFqc+XjJ7U=
X-Received: by 2002:a17:906:184e:: with SMTP id
 w14mr5348369eje.56.1612996164861; 
 Wed, 10 Feb 2021 14:29:24 -0800 (PST)
MIME-Version: 1.0
References: <1612952597-62595-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1612952597-62595-1-git-send-email-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Feb 2021 22:29:13 +0000
Message-ID: <CAFEAcA9PcOJhaunebGeR3x+ZBYvTyYVGy2sGTa7QAjjGamyjEg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/block: nvme: Fix a build error in nvme_get_feature()
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Feb 2021 at 10:23, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Current QEMU HEAD nvme.c does not compile:
>
>   hw/block/nvme.c:3242:9: error: =E2=80=98result=E2=80=99 may be used uni=
nitialized in this function [-Werror=3Dmaybe-uninitialized]
>          trace_pci_nvme_getfeat_vwcache(result ? "enabled" : "disabled");
>          ^
>   hw/block/nvme.c:3150:14: note: =E2=80=98result=E2=80=99 was declared he=
re
>      uint32_t result;
>               ^
>
> Explicitly initialize the result to fix it.
>
> Fixes: aa5e55e3b07e ("hw/block/nvme: open code for volatile write cache")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> ---
>
> Changes in v2:
> - update function name in the commit message
>
>  hw/block/nvme.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 5ce21b7..c122ac0 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -3228,6 +3228,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeR=
equest *req)
>          result =3D ns->features.err_rec;
>          goto out;
>      case NVME_VOLATILE_WRITE_CACHE:
> +        result =3D 0;
>          for (i =3D 1; i <=3D n->num_namespaces; i++) {
>              ns =3D nvme_ns(n, i);
>              if (!ns) {
> --

Also spotted by Coverity: CID 1446371

-- PMM

