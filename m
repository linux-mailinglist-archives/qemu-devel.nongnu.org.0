Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C5E474C75
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 21:05:58 +0100 (CET)
Received: from localhost ([::1]:56648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxE3h-0008Vf-TD
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 15:05:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxE1k-0007om-Cp
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 15:03:56 -0500
Received: from [2607:f8b0:4864:20::933] (port=33716
 helo=mail-ua1-x933.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mxE1i-0001fq-Oe
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 15:03:55 -0500
Received: by mail-ua1-x933.google.com with SMTP id a14so37002921uak.0
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 12:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=I3BFp2i3LxHC8TaDOV7RomMpl6KaeJ+UJu5krvIDd84=;
 b=OXC4PwxKya0NwCE0oT2lsEy4LVmiJN8TVlTJCSm/9SrykTfEt3AjwDZf7Y1O8YpKZi
 CmmiwmeG+oMYob0kS2NzidGRNnv+yJDPrGgSd3THQUdIw3cy8ofk/aJkZhkLbikfFDOK
 Ce/lmtw4JSr8Q9GtDXfqLlgkUnwQy/bVr1sV89aB8Bs4JWTL0HMNMgZxXSkZ0BxtKYjF
 2yGlfCydw56O4B5HYmehhh6Fvh1boi5xLUrq3yjrz5PyVrmqCgARMtgRjnE2RJzQ+b0J
 6UBFDQByGDUO16s2ZUormitIbJysgX2bRPYbWPRACzmNXBCeKQ3cz42bkeueSO2MTl1O
 CLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=I3BFp2i3LxHC8TaDOV7RomMpl6KaeJ+UJu5krvIDd84=;
 b=RnfkkjAWrx0rU96iJZIgplKp8y/VZdg5RMs4K67Nhrdhi+j8vm4hWxQr38wBUW1ItN
 xvs9j/dY2OT4GPgsAtUxv5Y7sA+bhZSk29lC6w/kbH7vGDcNbnytLziSTO2b3g9FPxs2
 d4sBWWRHnElhXxo0VwTe4QEUR81kJqdwPQbBJ8+E0s+Aa3JDOH8vg0YYClrYvgJIIpOV
 XTYIapTCFo0gHPnURtviv2cfsNrqesefilF9LLmDxEei6L7OIoTXq8OyykS/xbYoGL2J
 E2eo74LE3MgBJnar6KlUKTRD7AqZSIDmpsDstcPjPwloqdZG5yzTNpOStOtGr7fgaroK
 r5mw==
X-Gm-Message-State: AOAM531j9HdSQKnngUCdyZfbquUkt9+TgkZt+LxBk3xUpdBdf6e923l4
 s+I6o2Ne1U0wkolJR4sNCLFrKA==
X-Google-Smtp-Source: ABdhPJxrBxxi5rmLcvANGjzSkCfn6745apC07XaEXgdSUSX66NffqOdqxs642hGrFmZwJ8Qoy5tviQ==
X-Received: by 2002:ab0:36d2:: with SMTP id v18mr8050110uau.37.1639512233445; 
 Tue, 14 Dec 2021 12:03:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j17sm183995vkp.27.2021.12.14.12.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 12:03:51 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 12CDD1FF96;
 Tue, 14 Dec 2021 20:03:50 +0000 (GMT)
References: <2e540a20-9733-4ba4-520c-31cf6d9eac93@engene.se>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Marcus Engene <mengpg2@engene.se>
Subject: Re: Qemu Userspace Emulator with library + method
Date: Tue, 14 Dec 2021 19:59:34 +0000
In-reply-to: <2e540a20-9733-4ba4-520c-31cf6d9eac93@engene.se>
Message-ID: <87pmpzgdi2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::933
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=alex.bennee@linaro.org; helo=mail-ua1-x933.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Marcus Engene <mengpg2@engene.se> writes:

> Hi,
>
> I'd like to do instruction traces with library+function name included.
>
> From what I understand in_asm only shows instructions when they are being=
 JIT:ed.=20
> If I call a function twice I only see the instructions once so it makes s=
ense.
>
> As a workaround, I tried to do a plugin. I looked at the examples in cont=
rib/plugins and it seems to work nicely. I see all instructions in
> userspace:
>
> 0000004000802100 48 89 e7                             movq %rsp, %rdi
> 0000004000802103 e8 08 0e 00 00                       callq 0x4000802f10
> 0000004000802f10 f3 0f 1e fa                          endbr64=20
> 0000004000802f14 55                                   pushq %rbp
> 0000004000802f15 48 89 e5                             movq %rsp, %rbp
> 0000004000802f18 41 57                                pushq %r15

This looks like you could expand/tweak the existing execlog to get what
you want rather than writing a whole new plugin.

> However, for it to be super useful, I'd also like to see what library or =
source file each instruction lives, and what function we're in.
>
> Example output from perf + intel_pt
>
> a.out 602812 [006] 206712.277263361:      7f8d50217084 brk+0x4 (/usr/lib/=
x86_64-linux-gnu/ld-2.31.so)         mov $0xc, %eax
> a.out 602812 [006] 206712.277263361:      7f8d50217089 brk+0x9 (/usr/lib/=
x86_64-linux-gnu/ld-2.31.so)         syscall=20
> a.out 602812 [006] 206712.277264027:      7f8d5021708b brk+0xb (/usr/lib/=
x86_64-linux-gnu/ld-2.31.so)         cmp $0xfffffffffffff000, %rax
> a.out 602812 [006] 206712.277264027:      7f8d50217091 brk+0x11 (/usr/lib=
/x86_64-linux-gnu/ld-2.31.so)         jnbe 0x7f8d502170a8
> a.out 602812 [006] 206712.277264027:      7f8d50217093 brk+0x13 (/usr/lib=
/x86_64-linux-gnu/ld-2.31.so)         movq  %rax, 0x1106e
> (%rip)
>
> Is this doable? Do you have any advice on where to start?

Totally.

>
> I tried to get the "symbol" in the plugin, but I only get null values.

You mean using qemu_plugin_insn_symbol()?

IIRC that only works on the main binary and of course needs a
non-stripped binary. Basically we would need to expand the elf loader to
consider libraries as well. However that will require some sort of hook
to spot them getting mapped in by the guests ld.so. Maybe we could add
some heuristics to the mmap syscalls to spot that?

>
> Kind regards,
> Marcus


--=20
Alex Benn=C3=A9e

