Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E71C373163
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 22:27:19 +0200 (CEST)
Received: from localhost ([::1]:44798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le1dV-0000Mv-Qe
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 16:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1le1cL-0008Oz-EY
 for qemu-devel@nongnu.org; Tue, 04 May 2021 16:26:05 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:41940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1le1cJ-0007u9-FF
 for qemu-devel@nongnu.org; Tue, 04 May 2021 16:26:05 -0400
Received: by mail-ej1-x62a.google.com with SMTP id zg3so15159385ejb.8
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 13:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZnN4/9cyzV+6iO2yayEo9uTH3kXburLYZySCIowbao8=;
 b=tfcv7IOyo/wenD6qK60Atq9/7sjPuhhavxaP3OZ4NgjYb9UunkKNgwAMHC43BcpskL
 AeuXnnlMPtnlsutfNnp2l1zg11/rsOK0itBxR7Ex5ue6SbhE32tUEBfxsUzg9pN9ezMQ
 6WDKs4IabxU2UrKuMyWOJ5+9uXxXLODdLmmHPDLMXkAxTXCiFOaGUbqj+CD1fdw4RNLq
 j1k9YPL/tZalEfHsR1Q4hVwXw9mOQ4XZPebOwabMSyeIzpYYaBsoxETbwJ9LVbFfgFGm
 YCa97js4nN2X3Lx6tKj2YQ84MDIjiJG1kY1M68HXIVjq/6g72MFlJtaYZmYyyKLz4uj5
 g1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZnN4/9cyzV+6iO2yayEo9uTH3kXburLYZySCIowbao8=;
 b=omwi3AlH0BlZldNWHFXtmgy+e36dacYLJRvqXlGJ1WnNYHx9fckrj1+tLI9qg21H2u
 SgW6s8Ny32oumJ2uq9KhoZx9a7xMdiPmw7VdarNtfnFjpTauKpERmGaKg6r6LR6Khf99
 k8bHx8ZIvdCreZ0kWSPbQSQo0+BQRZ231hO7+va1/SZrI6eBl5Fg8QrJASVHdq1u0+XK
 0XXmBhhIq4xkcWU9aRp1oEPdSdXvzsaaXX8rIptihxACjmB66LkNtUoBpBi3AtNrDm00
 0BaTDBAHdnrE5I5PJNcKNgIixqs7eQJWgoSuADzQ/ZTKVPakVA9NqQqj0AAfNTDFWNE2
 DFlw==
X-Gm-Message-State: AOAM531bOjh51QhNKsLbjtsRl+pyA5GksPoBD1E7Q+5uYpYzV6v0mAIC
 vs3g9H8y8hlDH7hSDGACdjGfRd+N1deHbZqKv3ojeA==
X-Google-Smtp-Source: ABdhPJz1EbaNH9xS0Yhgon8QxrUEZOBX2UXWf+6bwCD/UvsxqAOVm555oD8TpHRneDvlDJ9S+A4E8s1iYNcHZScNnfI=
X-Received: by 2002:a17:906:364d:: with SMTP id
 r13mr24634222ejb.250.1620159961847; 
 Tue, 04 May 2021 13:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <166fe72a-c209-fd08-5f31-db15e4f3a8b9@redhat.com>
In-Reply-To: <166fe72a-c209-fd08-5f31-db15e4f3a8b9@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 May 2021 21:24:55 +0100
Message-ID: <CAFEAcA_zB8OGfdCNgwXiEmUc0_rTnkFwbmyLv1TKwZndBZwn6g@mail.gmail.com>
Subject: Re: Gitlab Issue Tracker - Proposed Workflow
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 4 May 2021 at 19:34, John Snow <jsnow@redhat.com> wrote:
> # Some concerns on the above scheme:
>
> - "In Progress" is not likely to be used faithfully and will fall out of
> sync often. It's not clear if there should be a difference between a bug
> having an assignee and a bug labeled "In Progress". I don't want to get
> in the business of managing people's time and forcing them to track
> their work.
>
> At the same time, for bugs being actively fixed by a contributor on-list
> who is not [known to be] present on gitlab, it's still possibly a nice
> courtesy to mark a bug as not 'free for the taking'.
>
> Meanwhile, there are several bugs I "own" but I am not actually actively
> working on. These are the sorts of things that I wouldn't mind someone
> taking from me if they wanted to, so the "In Progress" label provides
> some useful distinction there if someone wished to use it.
>
> I think I am inclined to keep it for now, at least until gitlab adoption
> rate is higher and bugs can be assigned more faithfully.

I like "In Progress" because I use it largely to track "I wrote a
patch for this and submitted it to the list, but it hasn't gone in
yet". This means that later on when a release is more imminent I
can easily scan through a list of "in progress" bug reports to find
the "we just forgot to update the bug state when the patch was
committed" ones and the "somebody submitted a patch but it fell
through the cracks" ones. That's a lot harder if you have to look
through the whole pile of "new" bugs.

> - Gitlab will automatically close issues that reference the gitlab issue
> tracker from the commit message, but it won't apply the "Merged" label,
> so it's at risk of falling out of sync.
>
> Closed issues retain their "Workflow::" labels, but won't show up in the
> issue search by default unless you ask to include closed issues as well.
>
> I think we can likely just drop this label, and have bugs go directly
> from whatever state they're in to "Closed". The issue board will look
> cleaner and there's less custodial work for maintainers.

> - Similarly to the above concern, "Released" is extra paperwork for us
> to maintain. I recommend instead we drop the label and begin using
> "Milestones" for each release, and attaching issues we have fixed or
> want to fix to specific Milestones. This will give us a way to track
> pending issues for release candidates as well as a convenient list, in
> the end, of which bugs were fixed in which specific release, which is
> far more useful than a "Released" tag anyway.

I guess so. I dunno how much our old fixed/released distinction
was helping users anyway. I do think that using Milestones both
for "I want to fix this bug for release X" and "this bug is fixed
in release X" is going to mean that it's not reliable for the latter
because we're going to have bugs where somebody optimistically set
the milestone and then the patches didn't land in time for the release.
But unless we care enough to write a bot that auto-updates milestones
we'll just have to live with that.

-- PMM

