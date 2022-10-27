Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C89F60F824
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 14:53:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo2LY-0002hs-S7; Thu, 27 Oct 2022 08:50:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oo2LV-0002dZ-I8
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 08:50:53 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oo2LT-0001eo-Aj
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 08:50:53 -0400
Received: by mail-pg1-x530.google.com with SMTP id g129so1278726pgc.7
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 05:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ezyS6LafP1z4vcfBLq7dU/E63eRkS5pDJFXm2hh6Pnc=;
 b=MGn5HhzTEM3zOhQyR9yMLYn8BLoWC/e+i2Eko393uztIvt4YC2L1j2KvYeOh42Uhos
 SQLgxieX1Fk5IE9apS8X6cv2cfFIqSE0D8t1erdHeNBUHkE0RNP60binz4qBZALyn5VL
 FPYd0Gbi7aYvInkUCrnhO+tEn9PAHJ/YVqs78lnPJQ6EgyISn4jt/g2X45AOUUqs2u+u
 tTOoqt/FfZqmc8aDh6VFmnrPLfmo6qLvw0qvaQHdcSqvbtlGrZb6vxD+NGHi7bj41mYF
 SmarOSAdaaeRMdgB2426wuJXm4TPl4Tfhveq9zal1q7CSIsTXCyemB8T/BGFtznm1CAM
 yXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ezyS6LafP1z4vcfBLq7dU/E63eRkS5pDJFXm2hh6Pnc=;
 b=Ir1dAu7PK64JkjIubOEmUEYv4xvaLQC8FPfa2lR9imJ+Zg37SZ/fXK8WfNFeL0hhOR
 kWiOKQ1TQt0dXvs+XFox1F6cijjLOUT44eU8mMTCd365ZvDuimGWgJDTPsfe0b8n2RKY
 kUWNPsfxnuCkeUC/zCvv9Od1J+pkfG4ScFJef/BmAQk1SH4TiDcWSF+X6gbaxrEJc+b0
 o0DvWVBvoiO7/w/RvZhN1bdFVy8YSjOBsqRWx5jny9NGda/Sw8BS7GKHgNfHR6DbBWxx
 9T/HMjL3RrUx8scaJu8kTIKMqm6ZCKpD6sdg6sniUznRSsgthe8hwB7UXc7DpMMwZK9N
 bhkg==
X-Gm-Message-State: ACrzQf1h7b3np7b2gj1HyYXltf96VzBbRqpISTeA7dAO9oq3HbV08v8O
 /NUSGlAZMrLk9bJb9TcD8jejPN1wdL6g7Eczfzepsxqu7emcTg==
X-Google-Smtp-Source: AMsMyM7Db08X1HH+zLapXGRvDbMjJR8VouzgFrU2x7G1RH+wMblPYuoJMb1HHf/D+1aCldceV9SD1gD3WpZYl8YDq/0=
X-Received: by 2002:a05:6a00:181b:b0:56b:fcbe:2e7f with SMTP id
 y27-20020a056a00181b00b0056bfcbe2e7fmr17694022pfa.3.1666875049365; Thu, 27
 Oct 2022 05:50:49 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Oct 2022 13:50:37 +0100
Message-ID: <CAFEAcA-7oY=988uLFEDgdSS8CjSSmyeZOYKsq9Vm-9vKXLms8A@mail.gmail.com>
Subject: QEMU Summit Minutes
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

As usual, we held a QEMU Summit meeting at KVM Forum.
This is an invite-only meeting for the most active maintainers
and submaintainers in the project, and we discuss various
project-wide issues, usually process stuff. We then post
the minutes of the meeting to the list as a jumping off point
for wider discussion and for those who weren't able to attend.

(Apologies for the somewhat delayed appearance of these
minutes: I was a bit slow about getting them written up
and circulated for additions/corrections.)


Attendees:

"Peter Maydell" <peter.maydell@linaro.org>
"Gerd Hoffmann" <kraxel@redhat.com>
"Alex Graf" <agraf@csgraf.de>
"Richard Henderson" <richard.henderson@linaro.org>
"Thomas Huth" <thuth@redhat.com>
"Alex Benn=C3=A9e" <alex.bennee@linaro.org>
"Alistair Francis" <alistair.francis@wdc.com>
"Kevin Wolf" <kwolf@redhat.com>
"Michael Roth" <michael.roth@amd.com>
"Paolo Bonzini" <pbonzini@redhat.com>
"Michael S. Tsirkin" <mst@redhat.com>
"Mark Cave-Ayland" <mark.cave-ayland@ilande.co.uk>
"Philippe Mathieu-Daud=C3=A9" <f4bug@amsat.org>
"Stefan Hajnoczi" <stefanha@redhat.com>


Infrastructure
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

We had a discussion about various aspects of project infrastructure:

Rackspace used to provide us with a free download quota for qemu.org,
but have recently stopped doing this. We've shifted to Azure, with
OSUOSL as a mirror.

Gitlab are clearly becoming much stricter about the CI time they
allow to both projects and individuals. We should:
 * make efforts to ensure we don't use more CI time than we
   absolutely need to for a run
 * look into increased self-hosting of CI runners and other options

Stefan agreed to ask Software Conservancy what other member projects
are doing.

Follow-ups from Stefan Hajnoczi (not discussed during the summit):

No news on a Conservancy-wide solution for project infrastructure. Samba
uses the GitLab Open Source Program with private runners. LibreHealth
uses a private runner too.

Alex Bennee has successfully signed the QEMU project up for the GitLab
Open Source Program, which grants Ultimate tier features. This includes
50,000 CI minutes per month, 500 GB of transfer per month, and 250 GB of
storage. I have not seen confirmation yet that personal forks of
qemu.git share the CI minutes but Daniel Berrang=C3=A9, Alex Benn=C3=A9e, a=
nd I
believe this should be the case.

There is more infrastructure work to do and I'm unable to find the time
to deal with migrating virtual servers off Rackspace (it costs QEMU
money), to use the FTP mirror that OSUOSL set up for us, etc. If another
regular QEMU contributor wants to help Paolo and me with theses things,
please get in touch!


Mailing List Abuse
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

We had a lessons-learned retrospective about an incident of
abuse on the mailing list, with two main outcomes:


 * for any mailing list users: if you feel something's not right,
   please do reach out and ping somebody. Don't assume that others
   have necessarily seen the thread and are ignoring it.

 * we're going to look at whether we can adjust some of the
   text in our code-of-conduct and similar documentation to make
   it clearer that it's OK to talk to us about an incident even
   if you're not sure whether it's "significant" enough to be
   labelled "abuse".


Leadership Committee
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

QEMU's Leadership Committee has two roles:
 * it is the official point of contact for the project's interactions
   with the Software Freedom Conservancy
 * it is the contact point for handling problems raised via
   the project's conflict resolution policy

We do have a few committee members who are no longer as actively
involved in the project as they were when first appointed, so we
have the option to rotate some new people in if we like.
We discussed some possibilities but did not come to a conclusion.
We don't think there's any urgency to appoint a new committee
member. Input on this point is welcome.


Bug Tracking System
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

We discussed the state of our bug tracker now we've had time
to see how the migration from Launchpad to Gitlab has gone.

At point of conversion we had about ~450 bugs; we're up to
~650 open bugs now. Gitlab doesn't have the same kind of
automated close-stale-bugs machinery that Launchpad did, so
we probably have more stale bugs than we did. There was
no consensus about whether we should be more active/automated
about closing old bugs.


It was noted that it's now harder to CC somebody on a bug
because you can't just cc them on a reply on the mailing list.
We agreed that we should have some way (probably in MAINTAINERS)
for developers to note their gitlab user ID, so it's easier to
find out the right ID to @ to get somebody's attention on a bug.


Security Process
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

As is traditional, we had a somewhat inconclusive discussion
about the project's security process.

The CSV process seems opaque, but no one has really complained or
volunteered to do more point releases, so we're not going to
change anything.

MST raised again the idea that we could help security-issue
raisers identify whether their bug report was in what we
consider to be a security issue or not, with a command line
switch (presumably using "security supported" bit on each
device?). The feedback when this has been raised on the
mailing list in the past was "not the right way to do this";
the mailing list still seems the best venue if more
discussion is required.


KVM Call Slot
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The project has a weekly available conference-call slot
where we could in theory discuss any kind of issue that seems
more productively handled via a video call than on the
mailing list. (For instance, perhaps some issues that we
talked about in this Summit meeting could be handled that way
rather than waiting for the KVM Forum date?) However, we don't
in practice make any use at all of the call.

We've had a few good well-focused uses of the call in the past
to work through things that would have taken much longer on
the mailing list (Avi Kivity's initial presentation of
the MemoryRegion API springs to mind).

Making the call more useful would probably involve:
 * having a standard way of writing up proposed items
   for a call discussion
 * making sure the relevant people are actually going to
   join the call (this probably means a longer notice period
   and some effort in actively flagging who is useful to
   be included)

Practical suggestions welcome.


thanks
-- PMM

