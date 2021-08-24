Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5073F6198
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 17:27:34 +0200 (CEST)
Received: from localhost ([::1]:54514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIYKr-0001Ra-7t
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 11:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIYK6-0000jv-Ie
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:26:46 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:37583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIYK4-0006FL-AN
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:26:46 -0400
Received: by mail-ed1-x532.google.com with SMTP id g21so32298448edw.4
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 08:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=M1nJVB6wPjUM3f0E/rsldqpI7lqUfeRri0d5q0DqkIA=;
 b=R0d+4NiGlzptIs+4PKkSNnz8c8QDNWhgtW8MOrG9RyJ9A0klN9ezoxpEACpzk/GOqO
 XOMgDnxaYr0rEK/VXNnzZ2u3XNKHlmF0mmmcCVXWdr1NkUrPN4rxZp43tnyJfGApf1Aj
 LdFAa9hYJFXuDDWb78VX9bxLkwYwpyFzXM7EyBI68FzhKxBZpre+wjNn9AGsEv3UjrC0
 s1cmtdtCQ47HPOute+Hbuukkin9LgBPs25m27jjQOAGmzpzSqK/ZlZ5EPkBKxAKTd+SW
 +diZcX8tUlk268lZEeN8bo3SPSA/Hxquh8lc7ob4fZGYizNWW3GFQZSDimT1pg2vix60
 Wisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=M1nJVB6wPjUM3f0E/rsldqpI7lqUfeRri0d5q0DqkIA=;
 b=K7raFdTnV/g6p5bVemglfgRIpet0Iu+nZiRUrV1hlCIOhdBqog9vEDSvMnW+YmiHIS
 9EyRZRZLJ4/kFZin5F9HxaM4oGGBgfE2jF+WsHNuNLCOAybrgPs5+MNgHWf0qMTg6pO5
 +R24HiCgDGUuT88ZmBfv6quDR5q6PYrdGdqYV1WJJ2a2IHpB81EZMU6AknXdqVJlk996
 2bpi7pRHGqqB8egtY6JjBWBaDVjggPJRumgSDlYjdiO3cm9Fx04mfbyxKB72QGJGP4hH
 /GGfusVik6XD88tnxXpYc7TVYZUJdj92YQaj+fXUlE4k00APPY2uTIc2uTw/WHt3yYuw
 GyDw==
X-Gm-Message-State: AOAM530ODr3wjMqOJAzJ3Ifd7jOnK2/HfVRDuE1mVNdFQ7K/1f9ESMWZ
 9HsL+Wk8RPu3FX99e1SIo8g6d2ZMCzY9Qk+2DYhfIg==
X-Google-Smtp-Source: ABdhPJzw3pgatItPakEpgHOJDjjXIh6GKfgTb3/pOurC6barpnE5QhydabSJD6RP0h7mOqQpKnjlODrFDWwi+qJdxcU=
X-Received: by 2002:a05:6402:3099:: with SMTP id
 de25mr43303266edb.36.1629818801869; 
 Tue, 24 Aug 2021 08:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <BY5PR02MB7028431FD055B48DAD3841F7F7F99@BY5PR02MB7028.namprd02.prod.outlook.com>
 <YRvjHiZmPkSuv//z@work-vm>
 <CAFEAcA_h_WWf=0rU1yTqOA4AH5kYfLNqdbqHokdtoBP7bmepUw@mail.gmail.com>
 <YSUOVqyjJ4xqsMgK@redhat.com>
In-Reply-To: <YSUOVqyjJ4xqsMgK@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 16:25:54 +0100
Message-ID: <CAFEAcA_eQp7zt8WzTee=n-F5SJ-cGKdxxQYrg1_iFQq62O+0SA@mail.gmail.com>
Subject: Re: Using loadvm with snapshot
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gabriel Southern <gsouther@qti.qualcomm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Aug 2021 at 16:21, Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 17.08.2021 um 20:48 hat Peter Maydell geschrieben:
> > On Tue, 17 Aug 2021 at 17:27, Dr. David Alan Gilbert
> > <dgilbert@redhat.com> wrote:
> > >
> > > * Gabriel Southern (gsouther@qti.qualcomm.com) wrote:
> > > > Hi,
> > > >
> > > > Are there plans to support using -loadvm with -snapshot?
> > > >
> > > > I saw some past discussion on mailing list including bug that was c=
losed earlier this year but no recent activity:
> > > >
> > > > https://lore.kernel.org/qemu-devel/162424905685.11837.7303570061857=
383641.malone@loganberry.canonical.com/
> > > >
> > > > Testing with latest qemu it looks like -loadvm still does not work =
when combined with -snapshot.
> > > >
> > > > I'm curious how complex it would be to implement this feature and i=
f it may show up on QEMU roadmap in the future. Or if there is alterative c=
ommand that can be used to save the state of a running VM and then use the =
same qcow to run multiple QEMU instances loading this VM state running in s=
napshot mode.
> >
> > Do you know why -loadvm and -snapshot don't work together?
> > It doesn't on the face of it seem like they would be incompatible...
>
> Probably because -snapshot first adds a temporary qcow2 overlay to the
> image, and then -loadvm fails because the newly created temporary
> overlay doesn't contain the requested snapshot.

That sounds like the bug could be fixed by having "find the
snapshot" look not just in the overlay but also down into
the underlying image?

-- PMM

