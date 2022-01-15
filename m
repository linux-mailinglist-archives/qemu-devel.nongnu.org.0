Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CF748F6F3
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 14:05:15 +0100 (CET)
Received: from localhost ([::1]:42542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8ik5-0000lY-RD
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 08:05:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n8iOI-0001zl-8Y
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 07:42:42 -0500
Received: from [2001:41c9:1:41f::167] (port=48700
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n8iOF-0007gd-U6
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 07:42:41 -0500
Received: from [2a00:23c4:8ba0:4900:614:7796:ec2b:4f88]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1n8iNT-0005qh-9K; Sat, 15 Jan 2022 12:41:55 +0000
Message-ID: <9ea7d052-5587-7f6c-c58c-1bb78cea0f4c@ilande.co.uk>
Date: Sat, 15 Jan 2022 12:42:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220108091419.2027710-1-yangxiaojuan@loongson.cn>
 <20220108091419.2027710-2-yangxiaojuan@loongson.cn>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220108091419.2027710-2-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:4900:614:7796:ec2b:4f88
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH v4 01/30] target/loongarch: Update README
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, philmd@redhat.com,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/01/2022 09:13, Xiaojuan Yang wrote:

> Mainly introduce how to run the softmmu
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
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
> +
> +  Add support softmmu emulation support in the following series patches.
> +  Mainly emulate a virt 3A5000 board and ls7a bridge that is not exactly
> +  the same as the host. Kernel code and uefi code is on the github.
> +  All required binaries can get from github for test.
> +
> +  1.Download kernel and the cross-tools.(vmlinux)
> +
> +      https://github.com/loongson/linux/tree/loongarch-next
> +      https://github.com/loongson/build-tools/releases/latest/download/loongarch64-clfs-20211202-cross-tools.tar.xz
> +
> +  2.Download uefi code.(loongarch_bios.bin)
> +
> +      https://github.com/loongson/edk2/tree/LoongArch
> +      https://github.com/loongson/edk2-platforms
> +
> +  3.Download the clfs-system and make a ramdisk with busybox.(ramdisk)
> +
> +  4.Run with command,eg:
> +
> +   ./build/qemu-system-loongarch64 -m 4G -smp 4 --cpu Loongson-3A5000 --machine loongson3-ls7a -kernel ./vmlinux -initrd ./ramdisk  -append "root=/dev/ram console=ttyS0,115200 rdinit=/sbin/init loglevel=8" -monitor tcp::4000,server,nowait -nographic
> +
> +The vmlinux, ramdisk and uefi binary loongarch_bios.bin can get from :
> +    git clone https://github.com/yangxiaojuan-loongson/qemu-binary
>   
>   - Note.
>     We can get the latest LoongArch documents or LoongArch tools at https://github.com/loongson/

This target/loongarch/README file doesn't exist in git master, so presumably this is 
based upon another series, possibly introducing linux-user support?

Is the plan to merge the linux-user support first? If so then you should add a 
Based-on tag to the cover letter referencing the corresponding linux-user patch series.

Also: I don't see a URL for a git repo containing the complete patchset which can 
help making some bits of review easier.


ATB,

Mark.

