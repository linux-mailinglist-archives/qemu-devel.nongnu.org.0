Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 006733D0BBA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:09:31 +0200 (CEST)
Received: from localhost ([::1]:47266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69AP-0003rw-VV
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6942-0006Z0-QY
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:02:54 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6941-0008IS-5T
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:02:54 -0400
Received: by mail-wr1-x42e.google.com with SMTP id m2so1545207wrq.2
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 03:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=qE/1+W+Jp+TK7m9gMN6V6r4zcQHB8cmAWo3GF1T5o6E=;
 b=scI40cL7RUMYdGJGJjH8ar87qCKTLDLMGbs/Gh6ixZtDMGebr2An3tMp+s9d3VUMSM
 wZ1aF590jwEZnVbcfcAag7w6PTfZv89hQQ/JwzasGUr/mk1z9kBxTaocvA8td2L2oQSs
 PzJSmdUszsEMEtrFZngttvw41DSCGVYYia7HGWAyp35D7QhpuFoU9ZPRZ/ruEFfuw10m
 wLeHCtjETyrmOmOx6qVhxmPn1B9nnrzhZpa2RaJESWC9HhY1LBy55tK9DQHB7nL6/8t8
 +n9jIOMt3t3b2ll7uM/BPDf92AfjthAJmwksZDSjyb4e2irgbZzZJ22cj077m0VJjy4f
 6ZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=qE/1+W+Jp+TK7m9gMN6V6r4zcQHB8cmAWo3GF1T5o6E=;
 b=LWXWBmhM0VLkC0B67hbjJ/HFvyURQPor8eEv0XkbWGyaA1BPP1TnBIhmPdF0fW5ghZ
 Nhkr51GB36xTPA2O/o2kmDUrqmY0Bja6Xc1mXr2+rPjN0ciGISSOlbgFhVnWthAWL7dk
 R4mLxDNmS8sqyr/8It8yzGQgpTMDpRx8wgIzSg+0JmDHCEaznVmBvFSdlwgrco1O0DSJ
 WgB9if5C2Rpa08YJBXAapJ7gBZr5bgewU2sw4aY8hfINkCna8cmXy+nahuyUboJhfQQc
 VACI9ZzOrnv0kTBxJAyJOBIUMBf/XGmoWcNInvLDqimw+qUkCcJe0RAC9YIC+DG6+Th3
 jk3Q==
X-Gm-Message-State: AOAM531BatucJFQQ0E9e5DO2qqaCWkt22OmYD1rH94qaqSJgZgyrHwFA
 yapZu96al7r7tMEz/J/g51O2Ig==
X-Google-Smtp-Source: ABdhPJyfcfFm8FWTyTmsAAMS51pPcP9/FR5FgrlR+qsSsr/yu2JIjqL+3Q4vIsHHnqMXIIWugLZW8Q==
X-Received: by 2002:adf:d1cf:: with SMTP id b15mr41531894wrd.93.1626861770947; 
 Wed, 21 Jul 2021 03:02:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t5sm26623108wrw.38.2021.07.21.03.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 03:02:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E893E1FF7E;
 Wed, 21 Jul 2021 11:02:48 +0100 (BST)
References: <20210720195439.626594-1-richard.henderson@linaro.org>
 <20210720195439.626594-12-richard.henderson@linaro.org>
 <CAFEAcA93CkPxmWCnSDaaJ01iTZ2KbabFu_cBKp7O9+BDHHmKfw@mail.gmail.com>
 <6e101005-ce67-3179-b446-c9b963b6bda2@linaro.org>
 <2a1b3fb7-e701-f2a6-0777-caa90a9e3a51@amsat.org>
 <7f5d1a72-4a50-b9dc-6300-6d3d7698415b@amsat.org>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH for-6.1 v6 11/17] hw/core: Introduce
 CPUClass.gdb_adjust_breakpoint
Date: Wed, 21 Jul 2021 10:56:24 +0100
In-reply-to: <7f5d1a72-4a50-b9dc-6300-6d3d7698415b@amsat.org>
Message-ID: <87h7gokmrb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On 7/20/21 11:53 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 7/20/21 11:08 PM, Richard Henderson wrote:
>>> On 7/20/21 10:56 AM, Peter Maydell wrote:
>>>> On Tue, 20 Jul 2021 at 20:54, Richard Henderson
>>>> <richard.henderson@linaro.org> wrote:
>>>>>
>>>>> This will allow a breakpoint hack to move out of AVR's translator.
>>>>>
>>>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>>>
<snip>
>>>> So previously for AVR we would have considered the bp at 0x100
>>>> and the one at 0x800100 as distinct (in the sense that the only way
>>>> the gdb remote protocol distinguishes breakpoints is by "what address",
>>>> and these have different addresses). After this change, they won't
>>>> be distinct, because if you set a bp at 0x100 and 0x800100 and then
>>>> try to remove the one at 0x100 we might remove the 0x800100 one,
>>>> because we're storing only the adjusted-address, not the one gdb used.
>
> Yes. Looks good.
>
>>>>
>>>> This might not matter in practice...
>>>
>>> I don't think it will matter.
>>>
>>> Currently, if it sets both 0x100 and 0x800100, then we'll record two
>>> breakpoints, and with either we'll raise EXCP_DEBUG when pc =3D=3D 0x10=
0.
>>>
>>> Afterward, we'll have two CPUBreakpoint structures that both contain
>>> 0x100, and when pc =3D=3D 0x100 we'll raise EXCP_DEBUG.=C2=A0 If gdb re=
moves the
>>> breakpoint at 0x800100, we'll remove one of the two CPUBreakpoint.=C2=
=A0 But
>>> we'll still stop at 0x100, as expected.=C2=A0 When it removes the break=
point
>>> at 0x100, both CPUBreakpoint structures will be gone.
>>>
>>> In principal, gdb could now add a breakpoint at 0x800100 and remove it
>>> with 0x100, where it could not before.=C2=A0 But I don't expect that to
>>> happen.=C2=A0 If we reported any kind of status to gdb re the breakpoint
>>> insertion or removal (e.g. bp not found), then it might matter, but we
>>> don't.
>
> IIUC QEMU model is "hardware breakpoint". I don't know how gdb deals
> if user add both soft/hard bp. Neither do I know how many soft/hard
> bp are "annouced" via gdbstub monitor to gdb (Alex?).

The gdbstub treats both the same and I don't think gdb cares about the
limit until we tell it we can't insert a breakpoint (which we won't
because breakpoints are infinite).

--=20
Alex Benn=C3=A9e

