Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 813D855FAC5
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 10:39:32 +0200 (CEST)
Received: from localhost ([::1]:53602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6TER-0000ZO-JD
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 04:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1o6TA4-0006T8-4x
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 04:35:02 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:54944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1o6TA1-00073W-HV
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 04:34:59 -0400
Received: by mail-pj1-x1036.google.com with SMTP id cv13so15001166pjb.4
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 01:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dBPzQu7IQdkvUJePP+Ep8ZGJkWIpVUwg4/oS4wTWZ30=;
 b=Y0+iud64MOmkzYS0ncpp3hseyDEKctEOhUIS9L6xgwzkEMqxcCMFrEFi9f+f5fwB0L
 M3eg/BCtoAa2v7hQ0YEfQQfKeqXwrTZ+1l/j8dVHIuzY+Yn3zla2apTbKihH2KjSXVGx
 Q/wPxAYOCJOhbiHDRSk9gZapWP5+xcVLgCuNi8gcCDfsCxAvhBmAp1Dkw6YZ4dgiCMsF
 T/3iHcglDop71j+u52Tvh33/ih+J887hQMMDbHDqwn1pA2eBy9Ugh9xpyS8XvMhuZJ+A
 MzeeD6iRkrhBEHmkivpxQ8nalhcCQpz2OuZtQ/MmiLX+QlsAwKTbEUaIkXIb/qf+OltT
 eBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dBPzQu7IQdkvUJePP+Ep8ZGJkWIpVUwg4/oS4wTWZ30=;
 b=KVB2DSdfS0g2+ZV5dKSYeze8PxlCN7ZBwmiFnG/g9EyY7yiW0f83chbI9B0JcUmRHv
 8ZzCJrAhxRvkcL/zoJd0P5x9he1VMKjxprQUEaQnCV8Sy15FQ9Ius+vHLdZh2Ollx4i+
 9JcQd2qapORj/k8VAqQXrNyxD4zs3uMO5sQMIjnfndRiOxrZu6IQgj4JIoio5DFSznZF
 17SeTb316w+E0FNDr3TpjimTz3uEUJqdD1ptYJVuPmDNOA2Ccutv4vOgxUhgUPfL1xAT
 mfUjR3iyLoI294wVmMNBLqxBTh2hdnfRmaOnbm4BYwqaxYdShmyIGUHWEiHUJHlFJaoM
 +3QA==
X-Gm-Message-State: AJIora/dYsK6iMkdMsy35wf8cKvLNrIWpiGbSPj+mCB1xvuEWfkuQ6Hs
 2RaGf/wfPO4YBiCLFzrcWJcoBtZMXKUKBGAb8GU=
X-Google-Smtp-Source: AGRyM1v5y9vPzJapET10mZKrNuJe71sJzcomcOWDEJfqvkCF5B4PX3JllqjCAtiqUHEB3D9SG59xpeummi2ZZDZjj7Y=
X-Received: by 2002:a17:90b:3812:b0:1ec:ca8a:f15c with SMTP id
 mq18-20020a17090b381200b001ecca8af15cmr2566999pjb.187.1656491691679; Wed, 29
 Jun 2022 01:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220628114307.697943-1-richard.henderson@linaro.org>
 <20220628114307.697943-3-richard.henderson@linaro.org>
 <CAMo8BfJgo184TYxr0O-t5x68Ac1U3t9LWWvPeUEwm-E_qizGWQ@mail.gmail.com>
 <b4f49f9d-769d-e307-b01d-aadc5df70642@linaro.org>
In-Reply-To: <b4f49f9d-769d-e307-b01d-aadc5df70642@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 29 Jun 2022 01:34:46 -0700
Message-ID: <CAMo8BfLZ2cxvQLUvc2C38_sPqHQ4=H8rDbKephrGU2s4-1Vv6w@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] target/xtensa: Use semihosting/syscalls.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 28, 2022 at 5:36 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 6/28/22 19:08, Max Filippov wrote:
> > On Tue, Jun 28, 2022 at 4:43 AM Richard Henderson
> > <richard.henderson@linaro.org> wrote:

...

> >> diff --git a/hw/xtensa/sim.c b/hw/xtensa/sim.c
> >> index 946c71cb5b..5cca6a170e 100644
> >> --- a/hw/xtensa/sim.c
> >> +++ b/hw/xtensa/sim.c
> >> @@ -87,9 +87,6 @@ XtensaCPU *xtensa_sim_common_init(MachineState *machine)
> >>           xtensa_create_memory_regions(&sysram, "xtensa.sysram",
> >>                                        get_system_memory());
> >>       }
> >> -    if (serial_hd(0)) {
> >> -        xtensa_sim_open_console(serial_hd(0));
> >> -    }
> >
> > I've noticed that with this change '-serial stdio' and its variants are still
> > accepted in the command line, but now they do nothing.
>
> Pardon?  They certainly will do something, via writes to the serial hardware.

What I meant was that with '-serial' option prior to this change it was
possible to redirect the standard streams of the sim machine, to stdio,
or socket or wherever, but after this change the option will be accepted,
but the machine will always have its first three file descriptors connected
to the QEMU's first three file descriptors.

I'd print a warning here, saying that the behavior has changed and
the '-semihosting-config chardev' must be used now.

> > This quiet
> > change of behavior is unfortunate. I wonder if it would be acceptable
> > to map the '-serial stdio' option in the presence of '-semihosting' to
> > something like '-chardev stdio,id=id1 -semihosting-config chardev=id1'?
>
> I dunno.  I'm wary of having xtensa be unique here.  Alex, thoughts?

Yeah, I thought about it some more and now it doesn't look like a good
idea to me either.

> >> +            switch (regs[4]) {
> >> +            case SELECT_ONE_READ:
> >> +                events = G_IO_IN;
> >> +                break;
> >> +            case SELECT_ONE_WRITE:
> >> +                events = G_IO_OUT;
> >> +                break;
> >> +            case SELECT_ONE_EXCEPT:
> >> +                events = G_IO_PRI;
> >> +                break;
> >> +            default:
> >> +                xtensa_cb(cs, -1, EINVAL);
> >
> > This doesn't match what there used to be: it was possible to call
> > select_one with rq other than SELECT_ONE_* and that would've
> > passed NULL for all fd sets in the select invocation turning it into
> > a sleep. It would return 0 after the timeout.
>
> Hmm.  Is there any documentation of what it was *supposed* to do?  Passing rq ==
> 0xdeadbeef and expecting a specific behaviour seems odd.

I haven't found any documentation for that simcall.
All I can say is that the logic in the code that used to be here is matching
exactly the logic in the code of the xtensa ISS from Cadence/Tensilica.

-- 
Thanks.
-- Max

