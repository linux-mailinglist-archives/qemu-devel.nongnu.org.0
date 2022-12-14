Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B1464C91F
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 13:37:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Qzc-0007Si-9M; Wed, 14 Dec 2022 07:36:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1p5QzW-0007Nn-9Z
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 07:36:06 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1p5QzS-0003rq-31
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 07:36:04 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2E69E223E2;
 Wed, 14 Dec 2022 12:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671021359; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t1/pKJe7lx/Q5yJoyJZ9Vj/NXqtCjxv+OTtOGdpYPo0=;
 b=KWE5YlTW8SVMV/cJ9EZ6uO8TgKGh6OYRO3SJhChUn529bgM0M34He0fxK0ACSLt+22Bswx
 /nZZ5j/MT0RI7VCiW2Nx4edIv/ssZvhKYgWXAkn2bdmq+lx4/XD3b+qCQnd4lCsldYBWeW
 v0I+wGCMD20oCCY8ccNj8XuuZSbGYwE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671021359;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t1/pKJe7lx/Q5yJoyJZ9Vj/NXqtCjxv+OTtOGdpYPo0=;
 b=6poGJSHGgPeR2ucOsLVFZv+zgbmi0ruvoUdyJZQIJpFQxhjINLoF6E68CECnJnR1T49IQg
 lXs2fNmtmrHGEWCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0DC9A1333E;
 Wed, 14 Dec 2022 12:35:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DGWcAS/DmWP6ZwAAMHmgww
 (envelope-from <cfontana@suse.de>); Wed, 14 Dec 2022 12:35:59 +0000
Message-ID: <3471fec3-f9cc-9e97-07d2-4ab163786c71@suse.de>
Date: Wed, 14 Dec 2022 13:35:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: QEMU function trace
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 wanghw364 <wanghw364@163.com>
Cc: qemu-devel@nongnu.org
References: <4019c9d3.7721.1850b729a80.Coremail.wanghw364@163.com>
 <87y1rbjlk6.fsf@linaro.org>
 <4fc789e6.5fe0.1850fe10037.Coremail.wanghw364@163.com>
 <87tu1yjnma.fsf@linaro.org> <87pmcmjlhw.fsf@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <87pmcmjlhw.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c;
 envelope-from=cfontana@suse.de; helo=smtp-out1.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/14/22 12:00, Alex Bennée wrote:
> 
> Alex Bennée <alex.bennee@linaro.org> writes:
> 
>> wanghw364  <wanghw364@163.com> writes:
>>
>>> Thanks. I have several questions as below, please help, thanks.
>>>
>>> 1.What do you mean by "only have debug symbols available for linux-user so"? What does the linux-user so
>>> refer to?
>>>  qemu_plugin_insn_symbol() can only see symbols from linux-user so?
>>
>> The linux-user ELF loader will read the debug symbols (if they exist)
>> and populate the syminfos structures that lookup_symbol uses. It's
>> partially obscured by the ELF loaders heavy use of macros but see:
>>
>>   static void glue(load_symbols, SZ)(struct elfhdr *ehdr, int fd, int must_swab,
>>                                      int clear_lsb, symbol_fn_t sym_cb)
>>
>> in elf_ops.h
>>
>>> 2.The purpose of teaching the linux kernel loader to understand and relocate symbols from an ELF kernel
>>> image,
>>> or extract then and feed them directly to the plugin, is to solve
>>> the issue that qemu_plugin_insn_symbol()
>>> can't see kernel symbol?
>>
>> Yes. This is slightly complicated by the fact that the kernel loaders don't
>> expect to load pure ELF files but something that is wrapped up as a
>> Linux loader. For example:
>>
>>   ➜  file vmlinux
>>   vmlinux: ELF 64-bit LSB pie executable, ARM aarch64, version 1
>> (SYSV), statically linked,
>> BuildID[sha1]=21166458a10404e6157abf0da4a0921144c72675, with
>> debug_info, not stripped
>>   🕙10:07:42 alex@zen:linux.git/builds/arm64.initramfs with
>> arm64/aarch64-linux-gnu- on  linux-6.0.y [$!?]
>>   ➜  file arch/arm64/boot/Image
>>   arch/arm64/boot/Image: Linux kernel ARM64 boot executable Image, little-endian, 4K pages
>>
>> The second file is what is actually passed to -kernel in a typical boot.
>>
>> The logic in arm_setup_direct_kernel_boot() implies you can load ELFs
>> directly and boot them but for some reason the Linux kernel doesn't work
>> if you try this way.
> 
> Replying to myself - this is because the vmlinux image is based of
> kernel virtual address. So the import thing the loader does is create
> the initial vaddr mappings and relocate the kernel to that location
> before running it. See the function primary_entry in head.S in the
> kernel.
> 
> So perhaps for system emulation it would be useful to have a -symbols
> option to load symbols from another file.
> 

Hi Alex,

it doesn't need to be a tcg plugin-only feature right, it's possible to use qemu to debug the guest also when using KVM..

Ciao,

Claudio

