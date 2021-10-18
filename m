Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CC843235E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 17:55:09 +0200 (CEST)
Received: from localhost ([::1]:38816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcUyi-00020p-7j
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 11:55:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mcUtr-0005zn-1v
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 11:50:07 -0400
Received: from [115.28.160.31] (port=35832 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mcUtn-0003rG-Ee
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 11:50:06 -0400
Received: from [192.168.9.172] (unknown [101.88.135.223])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id C89AF60AED;
 Mon, 18 Oct 2021 23:49:56 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1634572197; bh=1vcCJ2D801yfuG1+nTuWGFo7DVdToUTP5/rzH15UPsY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tC1aEkIYHc1lNFs/h7YU7+ePyqw/ei6N6gKUJjVUs2pT/lAP8mXVq07Bj9rxPaMrm
 ODAQ6x+LMjXowtQxjhHbjdhjj4IhwizUPb2yI7hMU5ohTI1M3mko3cnwk6F1ptQOlu
 c97qjSNN+SYpH8jO9CbscVzf4B+wTrlel3qVkARE=
Message-ID: <c0b25e56-e730-017e-dbd9-3cb2769ba1aa@xen0n.name>
Date: Mon, 18 Oct 2021 23:49:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:95.0) Gecko/20100101
 Thunderbird/95.0a1
Subject: Re: [PATCH v7 21/21] scripts: add loongarch64 binfmt config
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1634561247-25499-1-git-send-email-gaosong@loongson.cn>
 <1634561247-25499-22-git-send-email-gaosong@loongson.cn>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <1634561247-25499-22-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, alex.bennee@linaro.org,
 richard.henderson@linaro.org, laurent@vivier.eu, peterx@redhat.com,
 f4bug@amsat.org, yangxiaojuan@loongson.cn, alistair.francis@wdc.com,
 maobibo@loongson.cn, pbonzini@redhat.com, bmeng.cn@gmail.com,
 philmd@redhat.com, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Song,

On 10/18/21 20:47, Song Gao wrote:
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   scripts/qemu-binfmt-conf.sh | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
> index 7de996d..5575bdd 100755
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
> +loongarch64_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'

Here the EI_OSABI (7th, 0-based offset) byte is ignored which is okay 
(we want at least ELFOSABI_SYSV=0 and ELFOSABI_GNU=3 but not others, 
mask of this byte could be "\xfc" to exclude values > 3).

However, the EI_ABIVERSION (8th) byte is fixed to be zero; according to 
the draft LoongArch ELF psABI spec [1] there might be future revision(s) 
to necessitate a bump of ABI version, but it's highly unlikely to in 
turn require modifications to QEMU code, with almost all logic happening 
in the dynamic loader. I suggest unmasking this whole byte (setting mask 
for this byte to "\x00").

[1]: 
https://github.com/loongson/LoongArch-Documentation/blob/50e62f196afd4fae7f25dc98854167f97528046b/docs/LoongArch-ELF-ABI-EN.adoc

> +loongarch64_family=loongarch
> +
>   qemu_get_family() {
>       cpu=${HOST_ARCH:-$(uname -m)}
>       case "$cpu" in

