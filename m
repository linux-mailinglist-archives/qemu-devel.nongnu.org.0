Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA1648D1B9
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 05:43:58 +0100 (CET)
Received: from localhost ([::1]:51284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7rxs-0002ag-NN
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 23:43:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n7rvx-0001nv-ED
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 23:41:57 -0500
Received: from [2a00:1450:4864:20::32c] (port=33504
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n7rvv-0007yx-VD
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 23:41:57 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 o7-20020a05600c510700b00347e10f66d1so2197770wms.0
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 20:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rRgjIPZAMfyNauGGHIKOX091JCYAgZevyPfFhtUJQts=;
 b=Rn4+emlflINHAHBiSJ3Gzd6GT/de+VWv1au7GWk8b6OrMoecsjCkN7c2+18t9vc79g
 7/bhYYKnUbclewXy8OEZ2KoO7zxZurf+4JJrLx9x4uaDDYYrUAM1m56vbxB/gB+PxRQE
 HZkeZyGPq+n/OKrDrWG/sUMFsEJzVyYJBdn7TY9KsBwwrfn4BuXazF9bR9Ktitc2dbij
 E0YYlNoJBPpEsqvZvlsHm4bYM3TFrgtrE2RT4OE0MDnUnRSinq+7ohA5qBgkYzX5ycVx
 9icDwH5VvCF/25c11L298V7PN4DF/vIQXmRLI29BDg8DTAXerFFqkrDzA86+HG/4eOMg
 Vd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rRgjIPZAMfyNauGGHIKOX091JCYAgZevyPfFhtUJQts=;
 b=uxzhJZOUHfWuPo/5LJpdd93WM6ckTA+NfkogYKqW4kzZuR5iJkiblizUU/qLr3f8ea
 vHbsmuTdecK5//oPPmSXQXHnN9vGQSXoI7t4qEW6T0bWKZpRLjZWTEkzAJZfjqat5upV
 5q5xZDBX3KBbuuh1Aj0OYVqN5ufJaDyccD8n7/Zg8oOJBCVa3VFHmCWXMdCtd/SgfyrL
 9s5GziHv4F+98Ztf9WMo72eFhruVbFgfhWAoB4rpa2jpSZPIsClaOIHDTipqZUGzFfAS
 4les16PhBj9BgsH3kZ4fcvGqIaBvMm7QZEPt7VkHk0fa9myfCbSwsi5n8qm8xMT4pNkq
 MMSA==
X-Gm-Message-State: AOAM533KkFFjUPbjVOP7dLyGUDsTeDudQ0kmgBuQFcr1vzC9Nf/yoBXL
 Vm/oGBIqIZ1N3CcDk24KGYS/kx9tYrWR8I5DQ42vMA==
X-Google-Smtp-Source: ABdhPJwq/inlKzSq75AY+T0EiU9ZxyChPaiKkzBbfN+RsyzMC//uRd8wWeOw7uPjcUk1dOIBM5ntx6MYREPqrrRjUC4=
X-Received: by 2002:a7b:c0c1:: with SMTP id s1mr9159071wmh.176.1642048913903; 
 Wed, 12 Jan 2022 20:41:53 -0800 (PST)
MIME-Version: 1.0
References: <20220112081329.1835-1-jiangyifei@huawei.com>
 <20220112081329.1835-14-jiangyifei@huawei.com>
In-Reply-To: <20220112081329.1835-14-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Jan 2022 10:11:41 +0530
Message-ID: <CAAhSdy2oOiiJ=ogzP4+StyvJpqaa-zjPGqKA2hy2T3JcCO7jCA@mail.gmail.com>
Subject: Re: [PATCH v5 13/13] target/riscv: enable riscv kvm accel
To: Yifei Jiang <jiangyifei@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::32c;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Mingwang Li <limingwang@huawei.com>, KVM General <kvm@vger.kernel.org>,
 libvir-list@redhat.com, Bin Meng <bin.meng@windriver.com>,
 QEMU Developers <qemu-devel@nongnu.org>, wanbo13@huawei.com,
 Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org,
 wanghaibin.wang@huawei.com, Alistair Francis <Alistair.Francis@wdc.com>,
 fanliang@huawei.com, "Wubin \(H\)" <wu.wubin@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 12, 2022 at 1:44 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Add riscv kvm support in meson.build file.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  meson.build | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meson.build b/meson.build
> index c1b1db1e28..06a5476254 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -90,6 +90,8 @@ elif cpu in ['ppc', 'ppc64']
>    kvm_targets = ['ppc-softmmu', 'ppc64-softmmu']
>  elif cpu in ['mips', 'mips64']
>    kvm_targets = ['mips-softmmu', 'mipsel-softmmu', 'mips64-softmmu', 'mips64el-softmmu']
> +elif cpu in ['riscv']
> +  kvm_targets = ['riscv32-softmmu', 'riscv64-softmmu']
>  else
>    kvm_targets = []
>  endif
> --
> 2.19.1
>
>
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

