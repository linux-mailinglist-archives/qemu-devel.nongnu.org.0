Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 036483A9A02
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 14:14:10 +0200 (CEST)
Received: from localhost ([::1]:48796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltUQr-0006rR-1s
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 08:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1ltUP8-00062n-BQ
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 08:12:22 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:38831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1ltUP4-0000Gg-2I
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 08:12:22 -0400
Received: by mail-qk1-x72d.google.com with SMTP id c138so2289236qkg.5
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 05:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=AFBKQMTWChP9uxAj6/oVIw5e5q34X3Ft7JeojWOoDKk=;
 b=SoJ5o1l3d1L6raroIIdyyoDOhnvG+Hsqm0XPvZ/I38mydbwxI2em0iQng5d2LKvnGb
 BUxGucvSEvy7vQCv/bdPZu1elaJBfLwR7x1RpsT+Bz1Nfjv1p+Rb7w9RT8dReqfxxvfQ
 fuYyDlJGYM7BR8LZexkn854A+o0PAN3UErHH4/j0h/anroxm2ttTf1oZ3Ht0RrnO2tHv
 eURSqwMOo0it7KcKVSfk3ih61yWzqY1qpSEY14cjPxW/VBD1/F3XggWNJZNxyqpGZpQF
 IDcn/0S+kS8Sdre1Hd7O9EkPhU88nlUkqtZ/5PNwIWDNfQEYSiz/0xztXZv0fE6nXKQi
 F/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=AFBKQMTWChP9uxAj6/oVIw5e5q34X3Ft7JeojWOoDKk=;
 b=gR0GlTvBBvalCbI2X7I3XD6QHPZqo+lEMA27huIgOSLKSbUZSAEoLlTMEwalqs/CBt
 L7+VG0AfH7DKhCLCKNjxuBzZNimfEFCJCTj/e6qdwU5/aDXvBZDIiWKur7y4MRu3uCuo
 R7hSLh7OoQcCgkLVVsu9vy2+mdG+2x7U/fbyfxoEwbPv908IU8ziSrB7di6EyH83hzAO
 TadYUK2Bq9xK5FnmlRqRPP0v2i+oXobVJcUT7d5eA676OGJSnF5oJIEi7s0Ofdk6F41V
 wCVuY23pqyS2PvcgX8j27aOt1dpNzcl3ZAflvkg9S8A1nT1pm7eePIz8l9oFKombc1vy
 1XAg==
X-Gm-Message-State: AOAM5304kaYOFzEzDLI7XZbafjGguZT6B3SpFnlo9nxEqOYNsC5ES5+0
 otQ+KfX+M2SNXvnNGqj55bE=
X-Google-Smtp-Source: ABdhPJxJBy8Yl1b5l6DPh4tSrd3CXA5piRMZ74hVA/PKKRqrS4j3iGX4oyNHoISwXLiN6cx9gvMxdA==
X-Received: by 2002:a05:620a:29d4:: with SMTP id
 s20mr4917841qkp.287.1623845536877; 
 Wed, 16 Jun 2021 05:12:16 -0700 (PDT)
Received: from [192.168.0.6] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id g2sm1118010qtb.63.2021.06.16.05.12.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Jun 2021 05:12:16 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: tb_flush() calls causing long Windows XP boot times
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <9d0b277d-415f-0f4e-3f09-03445f89848f@linaro.org>
Date: Wed, 16 Jun 2021 08:12:15 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <CB323D41-288A-47DD-9AEC-35B1BA7C580F@gmail.com>
References: <BCB8773B-FC54-4C25-9B60-92C263165D38@gmail.com>
 <CAFEAcA-YuyZ9kyivh1dL_chxrtvBF=jOf3L59JuroL2U-e+Xsg@mail.gmail.com>
 <1ee4b7cf-d445-6497-705f-510009fc74f8@ilande.co.uk>
 <874ke4iqf8.fsf@linaro.org> <3D29C466-BB81-4BCA-96E9-A46721B1ED59@gmail.com>
 <d9109542-dd68-3e8b-4f53-a09576e16b1f@redhat.com> <87sg1ogsvj.fsf@linaro.org>
 <f81315ce-6cf5-c0c4-5b48-9188e3dcd71a@ilande.co.uk>
 <878s3cjyvl.fsf@linaro.org> <4006E151-B420-4925-A6C9-CD036EE559F2@gmail.com>
 <9d0b277d-415f-0f4e-3f09-03445f89848f@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x72d.google.com
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
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 incoming+qemu-project-qemu-11167699-3xhw7c0pviow7og92yv73e0tr-issue-404@incoming.gitlab.com,
 QEMU devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jun 15, 2021, at 9:58 PM, Richard Henderson =
<richard.henderson@linaro.org> wrote:
>=20
> On 6/15/21 6:58 AM, Programmingkid wrote:
>>> Ahh I misread - so those are the addresses of the routines and not =
where
>>> it's sticking the breakpoint?
>>>=20
>>> I notice from a bit of googling that there is a boot debugger. I =
wonder
>>> if /nodebug in boot.ini stops this behaviour?
>>>=20
>>>  =
https://docs.microsoft.com/en-us/troubleshoot/windows-server/performance/s=
witch-options-for-boot-files
>>>=20
>>> --=20
>>> Alex Benn=C3=A9e
>> Hi Alex,
>> I tried your suggestion of using /nodebug. It did not stop the =
tb_flush() function from being called.
>=20
> We are not expecting zero calls to tb_flush (it is used for other =
things, including buffer full), but we are hoping that it reduces the =
frequency of the calls.

Agreed.

> I'm guessing you didn't immediately see the slowdown vanish, and so =
there was no change to the frequency of the calls.

Correct.

> FWIW, if you switch to the qemu console, you can see how many flushes =
have occurred with "info jit".

Thank you very much for this information.

I'm currently learning about the x86's debug registers D0 to D7. There =
are a lot of rules associated with them. So my guess is one or more =
rules may not be implemented in QEMU. I will try to test them out in =
FreeDOS and compare notes with a real x86 CPU.

A possible workaround might be to implement a command line option that =
allows the user to specify how often the tb_flush() call is made. When I =
eliminated the call I could not find any problems with my VM's. I =
understand if this is not possible.=20



