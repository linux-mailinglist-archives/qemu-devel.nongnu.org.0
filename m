Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 279BD3A6928
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 16:39:43 +0200 (CEST)
Received: from localhost ([::1]:42722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsnkc-0005cw-8F
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 10:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lsnie-0002iu-0m
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:37:40 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:43606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lsnic-00018K-0V
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:37:39 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 3-20020a05600c0243b029019f2f9b2b8aso119711wmj.2
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 07:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=p9/6DjV3DBWF0FJU0yop/mMNHxWTtFvZPNXYGZSsTHA=;
 b=KDj8tOJVsx3Qmn+AMdLQCi2KsnTXv/aCpIJmnz/aeko0eT4HxcAfgkxzqQJsxIERAT
 y4KgmzWdkli3yeQ0/rp35QNM0g+Fmp2JZdbfdQYJX4T+qZO75AvAsn6mMwVu3DgNp5Rd
 AcSm8iMGuGtkCPnH9VnrKXTG2ePXwm9hQjjtGG1MRQ/PV+tQqsezQTy5Uife510WTduG
 +kEJxMBrEGR5Dmz1uMGnP1d4FbPiJgAjNe/WndEWy3nypriD+8UIjFO2KtcGkeiVZ0zu
 RPGYF4skNhZGx1w8TmDYTlmB9tO0iB5M9BTxe5PclzxVaIoWIorqxG6ln76ZOLhUEnLa
 R5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
 :message-id:user-agent:mime-version:content-transfer-encoding;
 bh=p9/6DjV3DBWF0FJU0yop/mMNHxWTtFvZPNXYGZSsTHA=;
 b=JWnW6oVGNNAn6F7dwUsheeLcogfVT8qFTviyGv8+q2Up+t5WE0CYuwADNZDczA3GO6
 UlkLULweStSUu1+5uTeFuY42+VHOzn1iH6rqHl+ZFgPm6GCnquNm/GCZeakdy8Ij0KAh
 bvm2n9AitwARoXIcV7rdpRkKDKSIzXzoS2ZMpdKipNOO8fKKDiRwwN/br5de54F+Hr5R
 AysbFVLbjCpoweHMToCwD3WdicgqBKKdPOHxyD6SNz8bUDiS16zbZnNCAuEP9OKghXH/
 4I0b0lLVkmDkKhRIUYI/AIIvHxVLFG46Dj0PvAVBMfgftN+1U1LQh4e2IiL0BfkG3DO3
 xzXw==
X-Gm-Message-State: AOAM531rhmetp32hC9Y/NsxNlhleuQZMGkhHHnr8AENiqo5WVfI/+KIr
 gQybNFngIErF5oGuM88wZ2SLfQ==
X-Google-Smtp-Source: ABdhPJwBfBAxeJ7EBiWn0XswOIL89W02i77K2HV5aQRCMYsdcxtV6TbcdiCIb1QIDFBU2CMtRLNchQ==
X-Received: by 2002:a1c:1d04:: with SMTP id d4mr16724187wmd.126.1623681456167; 
 Mon, 14 Jun 2021 07:37:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j5sm8243654wro.73.2021.06.14.07.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 07:37:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 41B851FF7E;
 Mon, 14 Jun 2021 15:37:34 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: tb_flush() calls causing long Windows XP boot times
References: <BCB8773B-FC54-4C25-9B60-92C263165D38@gmail.com>
 <CAFEAcA-YuyZ9kyivh1dL_chxrtvBF=jOf3L59JuroL2U-e+Xsg@mail.gmail.com>
 <1ee4b7cf-d445-6497-705f-510009fc74f8@ilande.co.uk>
 <874ke4iqf8.fsf@linaro.org>
 <3D29C466-BB81-4BCA-96E9-A46721B1ED59@gmail.com>
 <d9109542-dd68-3e8b-4f53-a09576e16b1f@redhat.com>
 <87sg1ogsvj.fsf@linaro.org>
 <f81315ce-6cf5-c0c4-5b48-9188e3dcd71a@ilande.co.uk>
Date: Mon, 14 Jun 2021 15:37:34 +0100
In-Reply-To: <f81315ce-6cf5-c0c4-5b48-9188e3dcd71a@ilande.co.uk> (Mark
 Cave-Ayland's message of "Sun, 13 Jun 2021 15:03:00 +0100")
Message-ID: <878s3cjyvl.fsf@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 incoming+qemu-project-qemu-11167699-3xhw7c0pviow7og92yv73e0tr-issue-404@incoming.gitlab.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Programmingkid <programmingkidx@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:

> On 11/06/2021 19:22, Alex Benn=C3=A9e wrote:
>
> (added Gitlab on CC)
>
>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>=20
>>> On 11/06/21 17:01, Programmingkid wrote:
>>>> Hello Alex,
>>>> The good news is the source code to Windows XP is available
>>>> online:https://github.com/cryptoAlgorithm/nt5src
>>>
>>> It's leaked, so I doubt anybody who's paid to work on Linux or QEMU
>>> would touch that with a ten-foot pole.
>> Indeed.
>> Anyway what the OP could do is run QEMU with gdb and -d nochain and
>> stick a breakpoint (sic) in breakpoint_invalidate. Then each time it
>> hits you can examine the backtrace to cpu_loop_exec_tb and collect the
>> data from tb->pc. Then you will have a bunch of addresses in Windows
>> that keep triggering the behaviour. You can then re-run with -dfilter
>> and -d in_asm,cpu to get some sort of idea of what Windows is up to.
>
> I have been able to recreate this locally using my WinXP and it looks
> like during boot WinXP goes into a tight loop where it writes and
> clears a set of breakpoints via writes to DB7 which is what causes the
> very slow boot time.
>
> Once boot proceeds further into the login screen, the same code seems
> to called periodically once every second or so which has less of a
> performance impact.
>
>
> This gives a repeated set of outputs like this:
>
> ##### bpi @ 0x90
> ### dp7 add bp inst @ 0x8053cab8, index 1
> ##### bpi @ 0xa4
> ### dp7 add bp inst @ 0x8053cab8, index 2
> ##### bpi @ 0xff
> ### dp7 add bp inst @ 0x8053cab8, index 3
> ##### bpi @ 0xf

That's weird - maybe this is a misunderstanding of the x86 debug
registers but it looks like it's setting each one to all the same value.=20

> ### dp7 remove bp inst @ 0x8053f58a, index 0
> ##### bpi @ 0x90
> ### dp7 remove bp inst @ 0x8053f58a, index 1
> ##### bpi @ 0xa4
> ### dp7 remove bp inst @ 0x8053f58a, index 2
> ##### bpi @ 0xff
> ### dp7 remove bp inst @ 0x8053f58a, index 3
> ...
> ...
> ### dp7 add bp inst @ 0x8053c960, index 0
> ##### bpi @ 0x90
> ### dp7 add bp inst @ 0x8053c960, index 1
> ##### bpi @ 0xa4
> ### dp7 add bp inst @ 0x8053c960, index 2
> ##### bpi @ 0xff
> ### dp7 add bp inst @ 0x8053c960, index 3
> ##### bpi @ 0xf
> ### dp7 remove bp inst @ 0x8053c730, index 0
> ##### bpi @ 0x90
> ### dp7 remove bp inst @ 0x8053c730, index 1
> ##### bpi @ 0xa4
> ### dp7 remove bp inst @ 0x8053c730, index 2
> ##### bpi @ 0xff
> ### dp7 remove bp inst @ 0x8053c730, index 3
> ...
> ...

I wonder if this is Windows check pointing itself by observing when it
gets to a particular place in the boot sequence. I guess we don't have
any symbols for the addresses it's setting?

>
> From a vanilla XP install the 2 main sections of code which alter the
> breakpoint registers are at 0x8053cab8 (enable) and 0x8053f58a
> (disable):

Ahh I misread - so those are the addresses of the routines and not where
it's sticking the breakpoint?

I notice from a bit of googling that there is a boot debugger. I wonder
if /nodebug in boot.ini stops this behaviour?

  https://docs.microsoft.com/en-us/troubleshoot/windows-server/performance/=
switch-options-for-boot-files

--=20
Alex Benn=C3=A9e

