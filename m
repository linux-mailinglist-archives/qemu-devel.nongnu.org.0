Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D070435C61
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 09:48:57 +0200 (CEST)
Received: from localhost ([::1]:60242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdSoq-0005fX-B7
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 03:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mdSm9-0002X2-HX
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 03:46:10 -0400
Received: from mail.xen0n.name ([115.28.160.31]:43282
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mdSm4-0001mR-T2
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 03:46:09 -0400
Received: from [100.100.57.93] (unknown [220.248.53.61])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 58E79600B5;
 Thu, 21 Oct 2021 15:45:42 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1634802342; bh=RSVEJvWBUE6I3I9FEa0K5L90rv5Rq/0gRa1TcdVs0yk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AjbggCuCIOIyzUvuCuVWOVTCQkhGShMCAL5dKJEUzYA1SH0I3yqtdsqx8q3eOLFvZ
 44CrjV4sFYmQZ6qTYd4P763sf9pz5Erd1oqDPRSZO1TZaazGrOg8KcSJPXLtIjQY3c
 /0vv6A6DXme5chz0u5Ou4EHG1Nq0ZT3hN0Ntu4Uw=
Message-ID: <c198a78a-83ea-5445-7ec2-82a1d88065e6@xen0n.name>
Date: Thu, 21 Oct 2021 15:45:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:95.0)
 Gecko/20100101 Thunderbird/95.0a1
Subject: Re: [PATCH v7 21/21] scripts: add loongarch64 binfmt config
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>
References: <1634561247-25499-1-git-send-email-gaosong@loongson.cn>
 <1634561247-25499-22-git-send-email-gaosong@loongson.cn>
 <c0b25e56-e730-017e-dbd9-3cb2769ba1aa@xen0n.name>
 <462f4784-bcfe-0783-12c5-7afaca4a3b89@loongson.cn>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <462f4784-bcfe-0783-12c5-7afaca4a3b89@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.267,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, f4bug@amsat.org,
 wuxiaotian@loongson.cn, alex.bennee@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, peterx@redhat.com, laurent@vivier.eu,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 pbonzini@redhat.com, bmeng.cn@gmail.com, philmd@redhat.com,
 chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/10/21 14:24, Song Gao wrote:
> Hi, Xuerui
>
> On 10/18/2021 11:49 PM, WANG Xuerui wrote:
>> Hi Song,
>>
>> On 10/18/21 20:47, Song Gao wrote:
>>> Signed-off-by: Song Gao <gaosong@loongson.cn>
>>> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   scripts/qemu-binfmt-conf.sh | 6 +++++-
>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
>>> index 7de996d..5575bdd 100755
>>> --- a/scripts/qemu-binfmt-conf.sh
>>> +++ b/scripts/qemu-binfmt-conf.sh
>>> @@ -4,7 +4,7 @@
>>>   qemu_target_list="i386 i486 alpha arm armeb sparc sparc32plus sparc64 \
>>>   ppc ppc64 ppc64le m68k mips mipsel mipsn32 mipsn32el mips64 mips64el \
>>>   sh4 sh4eb s390x aarch64 aarch64_be hppa riscv32 riscv64 xtensa xtensaeb \
>>> -microblaze microblazeel or1k x86_64 hexagon"
>>> +microblaze microblazeel or1k x86_64 hexagon loongarch64"
>>>     i386_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x03\x00'
>>>   i386_mask='\xff\xff\xff\xff\xff\xfe\xfe\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
>>> @@ -140,6 +140,10 @@ hexagon_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x
>>>   hexagon_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
>>>   hexagon_family=hexagon
>>>   +loongarch64_magic='\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x02\x01'
>>> +loongarch64_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
>> Here the EI_OSABI (7th, 0-based offset) byte is ignored which is okay (we want at least ELFOSABI_SYSV=0 and ELFOSABI_GNU=3 but not others, mask of this byte could be "\xfc" to exclude values > 3).
>>
> The EI_OSABI can not be modified. If we support FreeBSD and OpenBSD in the future.

Then the respective changes would belong to a different place than here,
i.e. "binfmt" which is IIRC Linux-only? We can't support running BSD
binaries on top of Linux with user-only emulation AFAIK.

But again, leaving this as-is should pose minimal risk. Even if we only
accept 0~3 at binfmt_misc matching time, we would still let through 1
and 2, so that's not enough and wouldn't make any difference. So while I
don't think you're right wrt the reason you stated, I'd still agree with
not touching this EI_OSABI mask byte.


