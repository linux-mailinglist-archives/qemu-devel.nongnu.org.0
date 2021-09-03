Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2616F3FFF45
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 13:36:05 +0200 (CEST)
Received: from localhost ([::1]:41730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM7UK-0006MW-6N
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 07:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mM7F5-0002j4-ML
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:20:19 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mM7F2-0008Cw-Ti
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:20:19 -0400
Received: by mail-wr1-x42b.google.com with SMTP id g18so7717877wrc.11
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 04:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/rKgeH7MI2pBgM0dR8PZMOcDrjdgk/9otCuZnAdGY3g=;
 b=wYqOH8YCm8rySRIzOY0mS03lf87qcKgvbtK+Edt+rJB9fpshqKz5/uA3ToBVr+F24z
 JsLr3819gZVNib5AloyRWz6prW+CCK/4sLKrVu4xyiIPpmjbXKYf0gp5bvpiY7lO1v/M
 LWIqkcfK8GrQ5G4ffgd+oRG9I26to0sMppHZ1wfGEOQyr+XKlVSNoy2ovS0JSuRRIRk3
 J6tHb/Lo+XD5PTQYRTkUtiZ1xA3EnhspRtVzCZyTMHSI8sCP5ofvWDVuB5DVFdg0EVYv
 Gzbd5gejoEkTNq7jxfzdS+qv7RDtIXeZTPWAUh88gKKfC63UgBfEwt9cKAs9mS8TWvGV
 p0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/rKgeH7MI2pBgM0dR8PZMOcDrjdgk/9otCuZnAdGY3g=;
 b=MJhOw879U4CFXaYfRwMQQMOXCPEfPG9692ckja3h/bTyEqNpl+hTJYPRul6J4zBv/1
 r5cep5IRbIkrTFIA0HKv7jhqUdWQjb6pwTbOFSxX7QlCohjW3Fo8oRiu2IdJbG0d3l+q
 ZznyBIhSrUkHnGpZ03KCdyPcAvVr5XcTE1J87A2Z3U/5eccVx9uRKyQ1DcCDyQrP6UtA
 P2H5ecf5xFRK0a9/oS/gz/IRbqLfYWLiksIOteeGecw906OJR0C/8iX4r8Es/M4FuaaG
 FArwDYKZ1v2/I/vWV+ikIYMaeU6LNXbK3NFe+BCPwwCSv8R+ToLVnW+GN4kCJXczeaYR
 wfng==
X-Gm-Message-State: AOAM531FV+ZLphv6QkIfVos571lPt+KhLvdCz6oK9/01ujfI5iBFpcSJ
 5c8EWSjxJV9Uxja11H/3SnCauo043zOFNzILSTquWA==
X-Google-Smtp-Source: ABdhPJxSPh5i16Zop68sa1a8B2GPLmcOEbi1ELKdZd9/+Z2df6c85Gh0YFK4tsoqmVKA5RECu9r7c2sGDJ6tA4L8eEM=
X-Received: by 2002:a5d:6cae:: with SMTP id a14mr3353739wra.275.1630668015090; 
 Fri, 03 Sep 2021 04:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <CALUzjTYPpo680Ub6CCx7-N2o=Q6Q6Kh=DLNCcUq-1F0JbCThOw@mail.gmail.com>
 <CAFEAcA89Dua-t14v3DH-LFG+4UDtU81PuaTOruLTQJw+T25eiA@mail.gmail.com>
 <CALUzjTY56_A3mMtvWGFTyyZAKshWSeUfcHWJFFxYSm7P7BuNAQ@mail.gmail.com>
 <CAFEAcA_Zvw1V5=8OxUXerb3zg=C6AGLfQgZ5k1kCY5NGT-CdHw@mail.gmail.com>
 <CALUzjTa1ZNFFjdo6eCy13TCrqAibYLMzJ7JqjY5+GwpukhfMAQ@mail.gmail.com>
 <CAFEAcA_EAx858BpONn+7+wCCxwCOsUm42gUMP0LW5JZwd5AkCA@mail.gmail.com>
 <CALUzjTaDo94110xX7bAr4B5y_XEXqoFH==88hsgffau0rNgZAw@mail.gmail.com>
In-Reply-To: <CALUzjTaDo94110xX7bAr4B5y_XEXqoFH==88hsgffau0rNgZAw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Sep 2021 12:19:26 +0100
Message-ID: <CAFEAcA-8iXVQtjv3akpwz==D6wvY7JDvKbpP5QgrLGdxBNLJeg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_How_does_qemu_detect_the_completion_of_interrupt?=
 =?UTF-8?Q?_execution=EF=BC=9F?=
To: Duo jia <jiaduo19920301@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 3 Sept 2021 at 11:54, Duo jia <jiaduo19920301@gmail.com> wrote:
>
> I do some support on STM8 arch, the reference manual link is:
>>
>> https://www.st.com/resource/en/reference_manual/cd00218714-stm8l050j3-st=
m8l051f3-stm8l052c6-stm8l052r8-mcus-and-stm8l151l152-stm8l162-stm8al31-stm8=
al3l-lines-stmicroelectronics.pdf
>
> I don't kown when to check the "PENDING" because I can't get the when int=
errrupt exec over.
> Is there a similar implementation in qemu=EF=BC=9F

Thanks for the link. Looking at that spec, the condition
for "interrupt execution has finished" is "the guest executes an
IRET instruction". However, you don't need to do anything special
at that point (beyond making the IRET instruction do the things
it should do with restoring registers).

If you look at the diagram, the check you need to make
is "do the I1:I0 bits for this pending interrupt specify a
higher priority than the values in CCR.I1 and I0?". That is
how you determine "interrupt has higher priority than current one"
to know whether to actually take the interrupt.

On interrupt entry the CCR bits are set from the ITC_SPRx registers,
which means that taking an interrupt automatically sets the CPU
priority such that the interrupt cannot be nested. And
finishing the execution of the interrupt routine will automatically
allow a pending second interrupt to be taken immediately, because
the IRET instruction restores the old values of CCR.I1,I0, and
those old values then mean that the CPU is at a priority that
permits the pending interrupt to be taken.

thanks
-- PMM

