Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C604488877
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 10:29:50 +0100 (CET)
Received: from localhost ([::1]:45386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6UWL-0007Rx-Dy
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 04:29:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTb-0004c3-LS
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:26:59 -0500
Received: from mail.xen0n.name ([115.28.160.31]:55722
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1n6UTa-0006Km-06
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 04:26:59 -0500
Received: from [192.168.9.172] (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 6C05F62E78;
 Sun,  9 Jan 2022 17:26:45 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1641720405; bh=mKBLr7U3bwgkEY9Pnt+vLJ6xzNEvQMQlI2QzcPSj5+4=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=lTBhp7I9S1GikC/vD6s7MeIZfBAHKrCXZu5Hlgu++mwUNpu0u8S02grdx57lr+MN2
 O52lzzlZc+ieUJT8UrJrc3KoFEupvhLV57KUoNoyah+ZX8yCSxuv4OoT4U3XgQR5E1
 RyYgfxL3DLmEB0URvixC9R3Ty/98708Jd3cw/o5Y=
Message-ID: <1e00afd4-afe9-ec13-45dc-dc853af2f9d0@xen0n.name>
Date: Sun, 9 Jan 2022 17:25:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0a1
From: WANG Xuerui <i.qemu@xen0n.name>
Subject: Re: [PATCH v14 26/26] scripts: add loongarch64 binfmt config
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20220106094200.1801206-1-gaosong@loongson.cn>
 <20220106094200.1801206-27-gaosong@loongson.cn>
Content-Language: en-US
In-Reply-To: <20220106094200.1801206-27-gaosong@loongson.cn>
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/6/22 17:42, Song Gao wrote:
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Reviewed-by: Richard Henderson<richard.henderson@linaro.org>
> ---
>   scripts/qemu-binfmt-conf.sh | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
> index 7de996d536..da6a937be8 100755
> --- a/scripts/qemu-binfmt-conf.sh
> +++ b/scripts/qemu-binfmt-conf.sh
> @@ -4,7 +4,7 @@
>   qemu_target_list="i386 i486 alpha arm armeb sparc sparc32plus sparc64 \
>   ppc ppc64 ppc64le m68k mips mipsel mipsn32 mipsn32el mips64 mips64el \
>   sh4 sh4eb s390x aarch64 aarch64_be hppa riscv32 riscv64 xtensa xtensaeb \
> -microblaze microblazeel or1k x86_64 hexagon"
> +microblaze microblazeel or1k x86_64 hexagon loongarch64"
>   
>   i386_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x03\x00'
>   i386_mask='\xff\xff\xff\xff\xff\xfe\xfe\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
> @@ -140,6 +140,10 @@ hexagon_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x
>   hexagon_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
>   hexagon_family=hexagon
>   
> +loongarch64_magic='\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x02\x01'
> +loongarch64_mask='\xff\xff\xff\xff\xff\xff\xff\xfc\x00\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
> +loongarch64_family=loongarch
> +
>   qemu_get_family() {
>       cpu=${HOST_ARCH:-$(uname -m)}
>       case "$cpu" in

We don't have code in qemu_get_family to recognize "loongarch*" from 
uname output as "loongarch" family (you can even understand it as I 
missed this change in my TCG port series...), but otherwise this looks OK.

I can add the host CPU family recognition myself; for this patch,

Reviewed-by: WANG Xuerui <git@xen0n.name>


