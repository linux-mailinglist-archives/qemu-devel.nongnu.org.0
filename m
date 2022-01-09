Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF88A488883
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 10:37:02 +0100 (CET)
Received: from localhost ([::1]:34284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6UdK-0002DY-1M
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 04:37:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTq-0005RS-51
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:27:14 -0500
Received: from mail.xen0n.name ([115.28.160.31]:55720
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTn-0006Kw-CA
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:27:13 -0500
Received: from [192.168.9.172] (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id C880D62E79;
 Sun,  9 Jan 2022 17:26:45 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1641720405; bh=w32OZHW8FUpUMft+eWCKpZ/C97F1sdOYsabU5tRwcmM=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=hxGV6OTR70NPFIX4vzHb29brqEuD73YJmvquFGyDGtybpVutOrNGGh/0WHwV/AAEn
 FTuozi32dToe9CvDfvmcSBKP/rt+Pw9IFvMxPedWGJry4BsuEtoPKFF1cBdTUmXe++
 bsXF2zBrBw7KeuxmGu1tIh9FhcF3N4v+z7OUknfY=
Message-ID: <dc89f8e9-e417-1833-e864-810bf63b4152@xen0n.name>
Date: Sun, 9 Jan 2022 17:25:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0a1
From: WANG Xuerui <i.qemu@xen0n.name>
Subject: Re: [RFC PATCH v4 01/30] target/loongarch: Update README
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220108091419.2027710-1-yangxiaojuan@loongson.cn>
 <20220108091419.2027710-2-yangxiaojuan@loongson.cn>
Content-Language: en-US
In-Reply-To: <20220108091419.2027710-2-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 philmd@redhat.com, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/8/22 17:13, Xiaojuan Yang wrote:
> Mainly introduce how to run the softmmu
This sentence serves little purpose and is broken English, so it is 
better removed.
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/README | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
>
> diff --git a/target/loongarch/README b/target/loongarch/README
> index d5780c5918..337ba55f33 100644
> --- a/target/loongarch/README
> +++ b/target/loongarch/README
> @@ -72,6 +72,31 @@
>         ./qemu-loongarch64  /opt/clfs/usr/bin/pwd
>         ...
>   
> +- Softmmu emulation
You may mean "System emulation" instead?
> +
> +  Add support softmmu emulation support in the following series patches.
People don't care about patch series when they look at this file after 
everything is merged; they are NOT looking at Patchew or mailing lists 
when browsing code either locally or on GitLab/GitHub. You may just drop 
this sentence.
> +  Mainly emulate a virt 3A5000 board and ls7a bridge that is not exactly
> +  the same as the host. Kernel code and uefi code is on the github.
So what exactly is the difference? And does it affect general use?
> +  All required binaries can get from github for test.
English problem; "You can get all required binaries from GitHub for 
testing."
> +
> +  1.Download kernel and the cross-tools.(vmlinux)
> +
> +https://github.com/loongson/linux/tree/loongarch-next
> +https://github.com/loongson/build-tools/releases/latest/download/loongarch64-clfs-20211202-cross-tools.tar.xz
> +
> +  2.Download uefi code.(loongarch_bios.bin)
> +
> +https://github.com/loongson/edk2/tree/LoongArch
> +https://github.com/loongson/edk2-platforms
> +
> +  3.Download the clfs-system and make a ramdisk with busybox.(ramdisk)
How do we make the ramdisk, or is it prebuilt too? It's not clear from 
the description.
> +
> +  4.Run with command,eg:
> +
> +   ./build/qemu-system-loongarch64 -m 4G -smp 4 --cpu Loongson-3A5000 --machine loongson3-ls7a -kernel ./vmlinux -initrd ./ramdisk  -append "root=/dev/ram console=ttyS0,115200 rdinit=/sbin/init loglevel=8" -monitor tcp::4000,server,nowait -nographic
> +
> +The vmlinux, ramdisk and uefi binary loongarch_bios.bin can get from :
Broken English too.
> +    git clonehttps://github.com/yangxiaojuan-loongson/qemu-binary
>   
>   - Note.
>     We can get the latest LoongArch documents or LoongArch tools athttps://github.com/loongson/

Overall the English is so badly written that I cannot easily comprehend 
some of the sentences, even as a native Chinese speaker, familiar with 
common Chinglish patterns.

I suggest just rewriting the whole thing, possibly with help from 
someone else more familiar with technical English in your company. You'd 
want to check your other usages of English throughout the series, too.


