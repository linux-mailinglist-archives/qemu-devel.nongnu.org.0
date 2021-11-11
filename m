Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C7144D63C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 12:57:35 +0100 (CET)
Received: from localhost ([::1]:37316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml8hy-0003mo-IM
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 06:57:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1ml8gu-00032e-QB
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:56:28 -0500
Received: from [2a00:1450:4864:20::12b] (port=38828
 helo=mail-lf1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1ml8gr-0000yz-Vt
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:56:28 -0500
Received: by mail-lf1-x12b.google.com with SMTP id bi37so8626574lfb.5
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 03:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1vFRGxaAxjC43+aaKwLSZTGi+UmpbjiOyz3LD7RCjZU=;
 b=bUIXR36sp6OL1HTAAIrD/dP8ls97r4XJnF2Wfd2AHtip4Q2yTyJdodB2La6BK11FuM
 Sgz0nn2ZyXIgfFes4R0UaljnleOjfvznb0Vincsr0EjomhDDVBceaLI4Y357UrDeHN+t
 lzl2VffjH3XkfXpLHfg9j4zCD3WX2jXCBUsJN3bK72posYmr53zd4Py/fWFxMjadZXnV
 95pVLPaaIbrbyMV/g/sMhQ6Pb3KrQPOYhDyuSsLwlMU201YpgKbLcKcPKR6X1pmorRyd
 DxPk35rHVGzTg3wJ4nf3EupHjshfjOuC1hNYY4T8X3YKr9gAMxKSbGlVlkOfT2HcvsLP
 jTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1vFRGxaAxjC43+aaKwLSZTGi+UmpbjiOyz3LD7RCjZU=;
 b=VWjQjOi+1RHHrpERCICJyT1TYkP6ydszDMSbnylzsQWfHUeLi0x5mJIqGG21vjLaNW
 ROmTNjmthBa+exBomgReZ2yT5V5+tncm9KDMTnyhwVf5tmRp2LOicAvskmgXf0ZlSXvy
 vY3HociwDxvs9pnbrmjPZwW3Csw/ucPhkuwTLKsoBswOcIA5iDlhbeCJeEciY6C+D+gZ
 QJx/ZQ2VoSFgpVjlz87pR96GZu7PCflWY57n0r7/KGBR+436pr6IvCNdl1Bhlj3Hg6ap
 jOQw6vKzu7XP8X8lnibjbDJQHTUC77H2eLoMXmOg4O8b72g+BLY0DCm544NO8h734zw/
 Wnbg==
X-Gm-Message-State: AOAM531So+RZg0eOW86eU9im8bMV0fQKVYyhJqJoxI0/yb9++KR+4w2P
 KtScSnd8U/KimeIArVc3KRQwF7ERDQxB9hmMerijm+ui
X-Google-Smtp-Source: ABdhPJzRyfI18X6MdQBwOM+njpZN/UEjVdzeBU6ib/AN0UHCBA2kfBweG0Wd7nJ7j7lhsKFgdVbYfIqZkxEi5Wy2jcQ=
X-Received: by 2002:a05:6000:15c6:: with SMTP id
 y6mr8031930wry.422.1636631443129; 
 Thu, 11 Nov 2021 03:50:43 -0800 (PST)
MIME-Version: 1.0
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
 <1636594528-8175-2-git-send-email-yangxiaojuan@loongson.cn>
In-Reply-To: <1636594528-8175-2-git-send-email-yangxiaojuan@loongson.cn>
From: chen huacai <zltjiangshi@gmail.com>
Date: Thu, 11 Nov 2021 19:50:31 +0800
Message-ID: <CABDp7VrcFX597_5OsV07hYCNondh1jhC49K10kXaGTmOUWTU6g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 01/30] target/loongarch: Update README
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=zltjiangshi@gmail.com; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-level <qemu-devel@nongnu.org>, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Xiaojuan,

On Thu, Nov 11, 2021 at 9:41 AM Xiaojuan Yang <yangxiaojuan@loongson.cn> wrote:
>
> Mainly introduce how to run the softmmu
>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>  target/loongarch/README | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/target/loongarch/README b/target/loongarch/README
> index 09f809cf80..6f64bde22f 100644
> --- a/target/loongarch/README
> +++ b/target/loongarch/README
> @@ -71,6 +71,26 @@
>        ./qemu-loongarch64  /opt/clfs/usr/bin/pwd
>        ...
>
> +- Softmmu emulation
> +
> +  Add support softmmu emulation support in the following series patches.
> +  Mainly emulate a virt 3A5000 board that is not exactly the same as the host.
> +  Kernel code is on the github and the uefi code will be opened in the near future.
> +  All required binaries can get from github for test.
> +
> +  1.Download kernel and the cross-tools.(vmlinux)
> +
> +      wget https://github.com/loongson/linux
This is a git repo URL, I think we cannot use wget to download.

> +      wget https://github.com/loongson/build-tools/releases/latest/download/loongarch64-clfs-20210831-cross-tools.tar.xz
> +
> +  2.Download the clfs-system and made a ramdisk with busybox.(ramdisk)
> +
> +  3.Run with command,eg:
> +
> +   ./build/qemu-system-loongarch64 -m 4G -smp 16 --cpu Loongson-3A5000 --machine loongson7a -kernel ./vmlinux -initrd ./ramdisk  -append "root=/dev/ram console=ttyS0,115200 rdinit=/sbin/init loglevel=8" -monitor tcp::4000,server,nowait -nographic
It isn't recommended to use "loongson7a" as the machine name. In my
opinion, we will have two types of machines run in qemu (One is an
emulated LS7A and the other is pure virtual). I think we can call them
"loongson3-ls7a" and "loongson3-virt".

Huacai
> +
> +The vmlinux, ramdisk and uefi binary loongarch_bios.bin can get from :
> +    git clone https://github.com/yangxiaojuan-loongson/qemu-binary
>
>  - Note.
>    We can get the latest LoongArch documents or LoongArch tools at https://github.com/loongson/
> --
> 2.27.0
>
>


-- 
Huacai Chen

