Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9643A8216
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 16:12:52 +0200 (CEST)
Received: from localhost ([::1]:49062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9oB-0004ie-IW
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 10:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lt9aa-0006Lf-D7
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:58:48 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:35375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lt9aO-0005tg-FK
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:58:48 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id if15so11575295qvb.2
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 06:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=W5lkLRRNEzCWNChGKauN66nQMuqgWYSGqJLW3wT0duE=;
 b=HRU6bHr5PMoSm5iW9rBQsmFwsmPaya+S64j06fBC7elL95TE4FEMJ8UjmCfi+zQWwn
 5p+ncma1NsukHeaMff2aDoZRWdzcK1Qf/gH9gEwVRVpUQhBcho4uMyZd+ggz1Nct2dhY
 uWxLmgYe4e2XUKIKyirMceWa/nMgsBhD58R1X+rUbKk8ndtu+dREdlcqmrwXOyzAkmff
 kTOWrp3IAtgfuqSefqJ0OQcaJv8lDp3X5ITQs+qyyf4orbN9YDJ9WZnhsjkun5KwUub/
 ut/Bz5H/Ooq+qwcKul3oITEnDvh5B3pFNmKXgTezQEsck1ovUveFaGkV0wohMsiWM+TV
 FEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=W5lkLRRNEzCWNChGKauN66nQMuqgWYSGqJLW3wT0duE=;
 b=W7MjlqTaGGwQmDGJpWj/0BQoOjMZCz3JHq00mfmMK1d1I+fxFm3Oa2A1wxJqJ6fRGr
 C3anFMcCSZ6RODvUVW7yXtH4xpTRLABPX3Ly/WhSqF9YtkezJnoosiy1wMk3msTubOZF
 FAFRvNkI1zzoCWM2rTqlc6bG17RJ9452ReXJbFjsRwegogN/+cUmQ6ABbdyXqiEo60vn
 hiYBDliBS3NLZlWh1xM5MFnmiQkR/W1VVNBa0C3Q+pMDQ0fVcUp5MoAv0ANNCY+TQ4yM
 oUoFVb1fHIPDXNxUKnNXlvA4pe66Ukqk3EjQRTAqhyFNv+7KwYAnXEFZsCEmujlAJ9Lq
 esaw==
X-Gm-Message-State: AOAM530IbZNqZsm0QZ9RCmKyy4LZ1gSj9AdLxjimQJ5LBIFh7njp4+fo
 rxrm9bvn600N7OWqAmGfv3I=
X-Google-Smtp-Source: ABdhPJysGSp+cglkoL1B72Jb/ui0Jf416kkT8W+HY4jnjQkMruOWwfTWFbgFeZNtKGI/oP3tGFUJYA==
X-Received: by 2002:ad4:576e:: with SMTP id r14mr5402208qvx.20.1623765514891; 
 Tue, 15 Jun 2021 06:58:34 -0700 (PDT)
Received: from [192.168.0.6] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id b132sm12516762qkg.116.2021.06.15.06.58.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Jun 2021 06:58:34 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: tb_flush() calls causing long Windows XP boot times
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <878s3cjyvl.fsf@linaro.org>
Date: Tue, 15 Jun 2021 09:58:32 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <4006E151-B420-4925-A6C9-CD036EE559F2@gmail.com>
References: <BCB8773B-FC54-4C25-9B60-92C263165D38@gmail.com>
 <CAFEAcA-YuyZ9kyivh1dL_chxrtvBF=jOf3L59JuroL2U-e+Xsg@mail.gmail.com>
 <1ee4b7cf-d445-6497-705f-510009fc74f8@ilande.co.uk>
 <874ke4iqf8.fsf@linaro.org> <3D29C466-BB81-4BCA-96E9-A46721B1ED59@gmail.com>
 <d9109542-dd68-3e8b-4f53-a09576e16b1f@redhat.com> <87sg1ogsvj.fsf@linaro.org>
 <f81315ce-6cf5-c0c4-5b48-9188e3dcd71a@ilande.co.uk>
 <878s3cjyvl.fsf@linaro.org>
To: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=programmingkidx@gmail.com; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 incoming+qemu-project-qemu-11167699-3xhw7c0pviow7og92yv73e0tr-issue-404@incoming.gitlab.com,
 QEMU devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jun 14, 2021, at 10:37 AM, Alex Benn=C3=A9e =
<alex.bennee@linaro.org> wrote:
>=20
> Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:
>=20
>> On 11/06/2021 19:22, Alex Benn=C3=A9e wrote:
>>=20
>> (added Gitlab on CC)
>>=20
>>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>>=20
>>>> On 11/06/21 17:01, Programmingkid wrote:
>>>>> Hello Alex,
>>>>> The good news is the source code to Windows XP is available
>>>>> online:https://github.com/cryptoAlgorithm/nt5src
>>>>=20
>>>> It's leaked, so I doubt anybody who's paid to work on Linux or QEMU
>>>> would touch that with a ten-foot pole.
>>> Indeed.
>>> Anyway what the OP could do is run QEMU with gdb and -d nochain and
>>> stick a breakpoint (sic) in breakpoint_invalidate. Then each time it
>>> hits you can examine the backtrace to cpu_loop_exec_tb and collect =
the
>>> data from tb->pc. Then you will have a bunch of addresses in Windows
>>> that keep triggering the behaviour. You can then re-run with =
-dfilter
>>> and -d in_asm,cpu to get some sort of idea of what Windows is up to.
>>=20
>> I have been able to recreate this locally using my WinXP and it looks
>> like during boot WinXP goes into a tight loop where it writes and
>> clears a set of breakpoints via writes to DB7 which is what causes =
the
>> very slow boot time.
>>=20
>> Once boot proceeds further into the login screen, the same code seems
>> to called periodically once every second or so which has less of a
>> performance impact.
>>=20
>>=20
>> This gives a repeated set of outputs like this:
>>=20
>> ##### bpi @ 0x90
>> ### dp7 add bp inst @ 0x8053cab8, index 1
>> ##### bpi @ 0xa4
>> ### dp7 add bp inst @ 0x8053cab8, index 2
>> ##### bpi @ 0xff
>> ### dp7 add bp inst @ 0x8053cab8, index 3
>> ##### bpi @ 0xf
>=20
> That's weird - maybe this is a misunderstanding of the x86 debug
> registers but it looks like it's setting each one to all the same =
value.=20
>=20
>> ### dp7 remove bp inst @ 0x8053f58a, index 0
>> ##### bpi @ 0x90
>> ### dp7 remove bp inst @ 0x8053f58a, index 1
>> ##### bpi @ 0xa4
>> ### dp7 remove bp inst @ 0x8053f58a, index 2
>> ##### bpi @ 0xff
>> ### dp7 remove bp inst @ 0x8053f58a, index 3
>> ...
>> ...
>> ### dp7 add bp inst @ 0x8053c960, index 0
>> ##### bpi @ 0x90
>> ### dp7 add bp inst @ 0x8053c960, index 1
>> ##### bpi @ 0xa4
>> ### dp7 add bp inst @ 0x8053c960, index 2
>> ##### bpi @ 0xff
>> ### dp7 add bp inst @ 0x8053c960, index 3
>> ##### bpi @ 0xf
>> ### dp7 remove bp inst @ 0x8053c730, index 0
>> ##### bpi @ 0x90
>> ### dp7 remove bp inst @ 0x8053c730, index 1
>> ##### bpi @ 0xa4
>> ### dp7 remove bp inst @ 0x8053c730, index 2
>> ##### bpi @ 0xff
>> ### dp7 remove bp inst @ 0x8053c730, index 3
>> ...
>> ...
>=20
> I wonder if this is Windows check pointing itself by observing when it
> gets to a particular place in the boot sequence. I guess we don't have
> any symbols for the addresses it's setting?
>=20
>>=20
>> =46rom a vanilla XP install the 2 main sections of code which alter =
the
>> breakpoint registers are at 0x8053cab8 (enable) and 0x8053f58a
>> (disable):
>=20
> Ahh I misread - so those are the addresses of the routines and not =
where
> it's sticking the breakpoint?
>=20
> I notice from a bit of googling that there is a boot debugger. I =
wonder
> if /nodebug in boot.ini stops this behaviour?
>=20
>  =
https://docs.microsoft.com/en-us/troubleshoot/windows-server/performance/s=
witch-options-for-boot-files
>=20
> --=20
> Alex Benn=C3=A9e

Hi Alex,=20

I tried your suggestion of using /nodebug. It did not stop the =
tb_flush() function from being called.=20=

