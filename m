Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27584B53C4
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 15:52:38 +0100 (CET)
Received: from localhost ([::1]:35454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJciS-0006Nm-EB
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 09:52:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nJc4H-0008I0-Uy
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:11:07 -0500
Received: from [2607:f8b0:4864:20::1032] (port=38431
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nJc4F-0004ss-Ic
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 09:11:05 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 h14-20020a17090a130e00b001b88991a305so18976065pja.3
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 06:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PdZPgVs5vPBvparmcotK7oV7z3Yf94yHSi1g5mgwvgQ=;
 b=NFgMfI8iL9RjntLuL4L3Et/g8KAn+nqwhLCO1e8b0pgIBU78F7OsD10QzjnlCQpWBh
 sw9AGwM8pNao9geY2Zc5GRwBVH2y34nJ8kRKWumfvIwDW4Is7FYQpMC9VIkkxSjZpJfb
 ljXq4sZEP2Ih9CqtXe1zXOANirwykegokz4kZHbRAGgkATUmBsB5cNtDLbEWaL0ie0Yd
 9M186tDOqQg24kxlmlExINAPEHRLwVamX2Pr2ERFZtkbxHegWrpkuUSJh2MQ11k7Imuf
 eDUQ8bf1VCcDPyj9qamrCz/la6MV4GTP3Qll7qg+CiNq64n3Den7HWLyun+jGhgKUmyz
 EGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PdZPgVs5vPBvparmcotK7oV7z3Yf94yHSi1g5mgwvgQ=;
 b=RNW5HD3CksTWb5HI6zqT6DS7nkSfqmPuwSoFTV019zRZi/WqSg9eDQMRC8UGKdlKt5
 LnIX7tALpmUcebd3gbMOvC5MRHIN0GdzER8Fad9dcmBazU08bU91zKhP2y23R4pduz5x
 YlG3pwS45u0hMLHiKo1xxPW9CY1Zsk2c/mc3WhqGglI+HwJ2qU4bj5fO/y6Acsj1fpik
 KtcDMCdfv5n0ML4H+2Df2SJUHu4sEeMsAfP3K5ZKAEbx2DvmP7JminWIgbQoE8+MZbWd
 /bSgn5bIQ5y2/zMUuBsYRtoDTW31LfVoVWfgKM0DhhvoTZUC1mw/FXHXM35wtVjxiexr
 2rnA==
X-Gm-Message-State: AOAM5321EtsDAPEJq0T9s35VVCQCgE1o8+d3nEKnRd5rojnooQhNbToB
 78q/6M3GOBP63mRRDOv/a0bgkOWhVXKF/XM62ZI=
X-Google-Smtp-Source: ABdhPJyZWYTkytm3GyM5hxpfoZooN/ycNQDscnLEgRToQfqjyCdFcZ9A9bXyTUGoDAhyNuh4cp0wjFoyZZ5gtAD1x1s=
X-Received: by 2002:a17:902:d64f:: with SMTP id
 y15mr14104486plh.145.1644847861164; 
 Mon, 14 Feb 2022 06:11:01 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
 <87zgmtd0ov.fsf@linaro.org>
In-Reply-To: <87zgmtd0ov.fsf@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 14 Feb 2022 14:10:49 +0000
Message-ID: <CAJSP0QULu-2pppavMHnUn2=Lo8j3b3wteXUiQfkiF49OjHjGMQ@mail.gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=stefanha@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sergio Lopez <slp@redhat.com>, kvm <kvm@vger.kernel.org>,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, Hannes Reinecke <hare@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, "Florescu,
 Andreea" <fandree@amazon.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Alex Agache <aagch@amazon.com>,
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Feb 2022 at 13:42, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Stefan Hajnoczi <stefanha@gmail.com> writes:
>
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
> > - Mentors typically spend at least 5 hours per week during the coding p=
eriod
> >
> > Changes since last year: GSoC now has 175 or 350 hour project sizes
> > instead of 12 week full-time projects. GSoC will accept applicants who
> > are not students, before it was limited to students.
>
> I'm certainly up for mentoring new devices for vhost-device (rust-vmm
> vhost-user backends). Since we've become a code owner we're trying to
> clear the backlog (virto-vsock and virtio-block) but there are plenty of
> others that could be done. Of particular interest to me are:
>
>   - virtio-rpmb (we have a working C implementation I wrote)

Yes, it would be good to have an implementation. I mentioned this
device in my FOSDEM 22 talk about what's coming in VIRTIO 1.2:
https://vmsplice.net/~stefan/stefanha-fosdem-2022.pdf

>   - virtio-snd (in flight virtio spec)

There are QEMU patches in development by Shreyansh Chouhan although
that doesn't rule out a rust-vmm crate.

>   - virtio-video (again we have a working C version against v3)

Want to pick one device and write a project description for it?

> With my other hat on there are numerous TCG plugin projects that could
> be done. Adding basic plugins is fairly straight forward but it would be
> interesting to look at what is required to do a more involved plugin
> like panda-re's taint analysis (following ptrs as they move through the
> system). This will likely need some additional features exposed from the
> plugin interface to achieve.
>
> With that in mind there is also the idea of a central registry for
> register values which is a prerequisite for expanding access to TCG
> plugins but could also bring various quality of life improvements to
> other areas. I've written that up on a page:
>
>   https://wiki.qemu.org/Internships/ProjectIdeas/CentralRegisterRegistry

Thanks for posting that! Can you add links to the -d cpu, gdbstub, and
hmp/qmp register code? The idea is a little fuzzy in my mind, maybe
you could include a sketch of the API to give readers an idea of what
the project should deliver?

Stefan

