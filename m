Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D76662A99
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 16:55:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEuTp-0003Az-Sq; Mon, 09 Jan 2023 10:54:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pEuTn-0003AK-Ah
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 10:54:31 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pEuTl-0003eU-8U
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 10:54:30 -0500
Received: by mail-pf1-x42e.google.com with SMTP id h7so2247261pfq.4
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 07:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=385/ZAYYmMLF+f7ZEIUOFxU8VYzhpcH+D2A7SN1hROI=;
 b=VsjB/XLoPObCRGtciBZBmNbc31+SwZVQd+hdLgX89L39H6AIUhKwKecAkEyWwm8sBd
 ZUvcLraO/gfQDrmVA4fHJj3frAEZVoVvn58PkBjMta24KMI8up6Rmtj5gTjNTQapYORD
 musOzLCSUKA1RDsjbljkR8y28F0ozE3NRnu+y6pZlE19DBpWyVyg03yF90CrZH6Ghva7
 YHev2XsDC9q4FFEEtQEVHVurICsN6l+HKTK+ixlZHmOdXy7ns+KgdH9q45qOS/7zTfX2
 Owsf+0p9e84+rw128BWoWWINOFVz9FktcPFBseGi5MM6OJ8Isq20ccz4FBHVzKoC5mqF
 LMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=385/ZAYYmMLF+f7ZEIUOFxU8VYzhpcH+D2A7SN1hROI=;
 b=Codr/4SMNIUMIsEXOmL2UaYPdzk9SQHUWUIcBoRmordoz7r7flz/JShlsUeJ+kyOZ4
 KY831oq23pZiqga3zlKzJVURbyEQ6U7XXNSTOkk3BlAr2t62+bzZfPY6CpZjAdlp9maU
 7hcqtyjYtdcKBcfUMMr+0X3fOCXOecw1exSMv1UVgSwZjyEPUIgWdGotsPC41L3Bnd0S
 QM0glaJHjE8vPqHcp/lA3jgS3v/FBxR/urANPAWM2aiMPTpg7RZt2G1A7zw+j44cHorM
 YfCrKsQ2zDTuzYQ9s0Qe0O7MITuXLmsnliqR2wZ8yvxH8jk78RbUncTuElnMNqcBicJ5
 FxGw==
X-Gm-Message-State: AFqh2koMS4fI8IaWHivGDlPmLo2hvxdrUDeXses7kCOy/yHaW2+DSgAh
 a6HeQD6X+mwqGwiyhv2C0Y1+TBrbmG4ZXmTmUi3s+Q==
X-Google-Smtp-Source: AMrXdXu5cnMO4VHWq3i4jjZ6kOCF04vxTt0gNtekYVVHNn3hGhzRIsOJjYrAs+UOhhNHd34fylFSwlOjiuAc6n3tBuo=
X-Received: by 2002:aa7:999c:0:b0:582:74a2:1e4e with SMTP id
 k28-20020aa7999c000000b0058274a21e4emr2228600pfh.26.1673279667531; Mon, 09
 Jan 2023 07:54:27 -0800 (PST)
MIME-Version: 1.0
References: <20230105091310.263867-1-mst@redhat.com>
 <20230105045619-mutt-send-email-mst@kernel.org>
 <20230105113111-mutt-send-email-mst@kernel.org>
 <CAFEAcA8Dr_vT2YrrrapL5vAtL5baGxPpk0busNPU-vutJcA10A@mail.gmail.com>
 <20230105165242-mutt-send-email-mst@kernel.org>
 <CAFEAcA8C5cfBc6qU1bZ_U0PusAAemOD6TYGhgxtQbwP-YA3yVQ@mail.gmail.com>
 <20230108015336-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230108015336-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Jan 2023 15:54:16 +0000
Message-ID: <CAFEAcA94Dpq6M9gtexWXL+gBvWciuBgFAkx9jz8ZjQP8szastg@mail.gmail.com>
Subject: Re: [PULL 00/51] virtio,pc,pci: features, cleanups, fixes
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, 8 Jan 2023 at 13:58, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Jan 06, 2023 at 03:29:01PM +0000, Peter Maydell wrote:
> > On Thu, 5 Jan 2023 at 21:53, Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Thu, Jan 05, 2023 at 09:04:37PM +0000, Peter Maydell wrote:
> > > > On Thu, 5 Jan 2023 at 16:32, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > >
> > > > > On Thu, Jan 05, 2023 at 04:56:39AM -0500, Michael S. Tsirkin wrote:
> > > > > > On Thu, Jan 05, 2023 at 04:14:20AM -0500, Michael S. Tsirkin wrote:
> > > > > > > The following changes since commit cb9c6a8e5ad6a1f0ce164d352e3102df46986e22:
> > > > > > >
> > > > > > >   .gitlab-ci.d/windows: Work-around timeout and OpenGL problems of the MSYS2 jobs (2023-01-04 18:58:33 +0000)
> > > > > > >
> > > > > > > are available in the Git repository at:
> > > > > > >
> > > > > > >   https://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> > > > > > >
> > > > > > > for you to fetch changes up to 6529cb46fa76bb4b4f217d6fcc68b61b543062c4:
> > > > > >
> > > > > > 7c77271205339d3b161bdf925f5ead799b582e47 now - I dropped one patch
> > > > > > as v2 is forthcoming.
> > > > >
> > > > > And now it's c46dcec9f699508e811cb6a140250d07486b0e41 as I replaced that
> > > > > patch with it's v2. Sorry about the back and forth, but it seemed
> > > > > important :(
> > > > >
> > > > > >
> > > > > > >   vhost-scsi: fix memleak of vsc->inflight (2023-01-05 04:07:39 -0500)
> > > > > > >
> > > > > > > ----------------------------------------------------------------
> > > > > > > virtio,pc,pci: features, cleanups, fixes
> > > > > > >
> > > > > > > mostly vhost-vdpa:
> > > > > > >     guest announce feature emulation when using shadow virtqueue
> > > > > > >     support for configure interrupt
> > > > > > >     startup speed ups
> > > > > > >
> > > > > > > an acpi change to only generate cluster node in PPTT when specified for arm
> > > > > > >
> > > > > > > misc fixes, cleanups
> > > > > > >
> > > > > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > > > >
> > > > > > > ----------------------------------------------------------------
> > > > > > >
> > > > > > > Note: linux-user build is failing for me on master, I just
> > > > > > > disabled it for now as nothing I'm doing should affect linux-user.
> > > > > > > Didn't debug yet.
> > > >
> > > > Compile failures on freebsd in the bsd-user build:
> > > >
> > > > https://gitlab.com/qemu-project/qemu/-/jobs/3561556072
> > > > https://gitlab.com/qemu-project/qemu/-/jobs/3561556071
> > > >
> > > > Probably something in Markus' include-file cleanup, I suspect
> > > > some file is missing its osdep.h include.
> > > >
> > > > thanks
> > > > -- PMM
> > >
> > >
> > > Pushed a fixup, commit 1df76fab679e9a673b71531925fe12ceb89eaecb now.
> > > Pls let me know, thanks!
> >
> > Still failing on FreeBSD, for a different reason:
> > https://gitlab.com/qemu-project/qemu/-/jobs/3565200188
> >
> > thanks
> > -- PMM
>
> Dropped the offending patch, commit aba0d042b1c1be38818cec16af3f34e9e9e2aed2
> now.  Pls let me know, thanks!
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

