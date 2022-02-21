Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B59CC4BD8C2
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 10:57:01 +0100 (CET)
Received: from localhost ([::1]:58500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM5RE-0006lJ-Pp
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 04:57:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nM5ML-0000B1-8A
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:51:57 -0500
Received: from [2607:f8b0:4864:20::1035] (port=46894
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nM5MI-0004jj-Sa
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:51:56 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 j10-20020a17090a94ca00b001bc2a9596f6so3305289pjw.5
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 01:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LQH0oXYOtonMJ/YymHMO0iip6tbgo2yPt2wFBQnpQPs=;
 b=XNWvK9S3nmEtvFBsP3LXBaxUCwjZOXwAkCFcPuTkxQxDO7C3fsigVPNu2UuKBxk9J6
 H+7aEAGVVLOBMMPU/KUI3Z4lu/96YSBLpThoIBGlJdxz1foqj7V4X0tKup1OGLjCGKNx
 U99TUt3ME5SEdOjrTmnv1EgKeV2Eqy+biejfqB3e+mBJvcPyYVb0lpVX4kT6bnboqoJh
 1DLizOA2TAa8HSn8z/wbeY3RdR76AxRktYdA+XQWGErJpq4l5MoUvaKoFtJuj5arhGoB
 1z1pdEW/lm2f5b0vSnjX6UUv80u0t2MfjW9xEDMQeaOCNS8zYwq4IhUSs9rEkVFo4tBD
 M6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LQH0oXYOtonMJ/YymHMO0iip6tbgo2yPt2wFBQnpQPs=;
 b=rtmlastNrwqXx1E5oyyRrpTS1Mw5NHRZkKWOv8KqcV0FyMYW7a2ChusFrWY7wM7j1Q
 hh3tSpAncVloVxpY8yDXA2loTW8VQ0RR9ntI+F+GycQfOfc2OZGPpad21bZu1Hk7Zrdc
 gb/pZkrFSc9Z83Y3QTb5BFJgdVU+qDqtjtm8xo6YFjZ2sPqnrDZ/lmx7yPDojnUteA2s
 RKlfVAu96jAPDu8MzK/gXb9od2py4nxiuqdlzZxw4qqGx7meEuRYQStU43RD14FigNXB
 +EV9Rm0ht7gBux35OP5yil5ZxNzaSSOUwWj8xgEgBYSFrX0kH+X4AyTpVIOTuW4JyHiJ
 tUpg==
X-Gm-Message-State: AOAM5325d3iIFYRtPc6Bv//FE4M0w6nFSSNeh725M9itGfp/ZU/rLCc4
 UgdW2BxAmKwA3jRCNc1oascvAYtUpRNr/un/r7Q=
X-Google-Smtp-Source: ABdhPJzj+ZuQk9cqdUsx94ps+dYux2wLeG8B+O6heHBti9pS88aj8InSxsgxxilaFe0Uhs7eDP8gW7FQ4DbiNTQeX+k=
X-Received: by 2002:a17:902:e8c2:b0:14d:bc86:be4d with SMTP id
 v2-20020a170902e8c200b0014dbc86be4dmr18375051plg.106.1645437113439; Mon, 21
 Feb 2022 01:51:53 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
 <YhMtxWcFMjdQTioe@apples>
In-Reply-To: <YhMtxWcFMjdQTioe@apples>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 21 Feb 2022 09:51:42 +0000
Message-ID: <CAJSP0QVNRYTOGDsjCJJLOT=7yo1EB6D9LBwgQ4-CE539HdgHNQ@mail.gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=stefanha@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, kvm <kvm@vger.kernel.org>,
 Sergio Lopez <slp@redhat.com>, Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
 John Snow <jsnow@redhat.com>, Alex Agache <aagch@amazon.com>,
 qemu-devel <qemu-devel@nongnu.org>, "Florescu, Andreea" <fandree@amazon.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 Keith Busch <kbusch@kernel.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Feb 2022 at 06:14, Klaus Jensen <its@irrelevant.dk> wrote:
>
> On Jan 28 15:47, Stefan Hajnoczi wrote:
> > Dear QEMU, KVM, and rust-vmm communities,
> > QEMU will apply for Google Summer of Code 2022
> > (https://summerofcode.withgoogle.com/) and has been accepted into
> > Outreachy May-August 2022 (https://www.outreachy.org/). You can now
> > submit internship project ideas for QEMU, KVM, and rust-vmm!
> >
> > If you have experience contributing to QEMU, KVM, or rust-vmm you can
> > be a mentor. It's a great way to give back and you get to work with
> > people who are just starting out in open source.
> >
> > Please reply to this email by February 21st with your project ideas.
> >
> > Good project ideas are suitable for remote work by a competent
> > programmer who is not yet familiar with the codebase. In
> > addition, they are:
> > - Well-defined - the scope is clear
> > - Self-contained - there are few dependencies
> > - Uncontroversial - they are acceptable to the community
> > - Incremental - they produce deliverables along the way
> >
> > Feel free to post ideas even if you are unable to mentor the project.
> > It doesn't hurt to share the idea!
> >
> > I will review project ideas and keep you up-to-date on QEMU's
> > acceptance into GSoC.
> >
> > Internship program details:
> > - Paid, remote work open source internships
> > - GSoC projects are 175 or 350 hours, Outreachy projects are 30
> > hrs/week for 12 weeks
> > - Mentored by volunteers from QEMU, KVM, and rust-vmm
> > - Mentors typically spend at least 5 hours per week during the coding period
> >
> > Changes since last year: GSoC now has 175 or 350 hour project sizes
> > instead of 12 week full-time projects. GSoC will accept applicants who
> > are not students, before it was limited to students.
> >
> > For more background on QEMU internships, check out this video:
> > https://www.youtube.com/watch?v=xNVCX7YMUL8
> >
> > Please let me know if you have any questions!
> >
> > Stefan
> >
>
> Hi,
>
> I'd like to revive the "NVMe Performance" proposal from Paolo and Stefan
> from two years ago.
>
>   https://wiki.qemu.org/Internships/ProjectIdeas/NVMePerformance
>
> I'd like to mentor, but since this is "iothread-heavy", I'd like to be
> able to draw a bit on Stefan, Paolo if possible.

Hi Klaus,
I can give input but I probably will not have enough time to
participate as a full co-mentor or review every line of every patch.

If you want to go ahead with the project, please let me know and I'll post it.

One thing I noticed about the project idea is that KVM ioeventfd
doesn't have the right semantics to emulate the traditional Submission
Queue Tail Doorbell register. The issue is that ioeventfd does not
capture the value written by the driver to the MMIO register. eventfd
is a simple counter so QEMU just sees that the guest has written but
doesn't know which value. Although ioeventfd has modes for matching
specific values, I don't think that can be used for NVMe Submission
Queues because there are too many possible register values and each
one requires a separate file descriptor. It might request 100s of
ioeventfds per sq, which won't scale.

The good news is that when the Shadow Doorbell Buffer is implemented
and enabled by the driver, then I think it becomes possible to use
ioeventfd for the Submission Queue Tail Doorbell.

I wanted to mention this so applicants/interns don't go down a dead
end trying to figure out how to use ioeventfd for the traditional
Submission Queue Tail Doorbell register.

Stefan

