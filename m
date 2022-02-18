Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8AB4BBE9F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 18:47:39 +0100 (CET)
Received: from localhost ([::1]:60534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL7M3-0001l4-3K
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 12:47:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nL7KH-0000qt-3L
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 12:45:49 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:42295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nL7KE-0007pK-TE
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 12:45:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=EfRXdfxg3iCZS7vKTY29vgznSSYkl6yvEWqQGd+gXQw=; b=SkTW/yhvp0m0armpYIrD42k9D2
 5E8RhPKMZd0aFqi/ef/JZMRvwHFweZFr/L5kILlM13trWyxlQZsFIPQQyZTrU0ooiyH4HTqKSu4Sb
 gvxupQAMz4rkod2wse+qiKXU4kdkBtyCIeHxPE3PpfiHKovMbA9OqTqQ/KuqmWPFfvQwzuXrdMu69
 aaYZpYdXw+Inkx9/szPlN1akqd3/290CPlTASqj0eoUicmG66m/hY3JLsE4K2QZ/SXmhO89mrTDC3
 0ap+ZIry5/auzQE6O92nJJvTmK1vVW9xEPkdlv/QhXFb5bYVn0/qlJB/yx9c9AdXAZ9TdnEibob5W
 +jbnNyK2vTquyf7r6s77x4Ap61TGpAEJz2olBbqBS2VoCZgSVxIfLs7ryxd48mi01Vk5kK8ZRe2Zo
 XwvEonKJVF+D/8jNiahbvd8SwdsAZ+lda3bxwu3Xg/SiZ8PK3673yAUMHyiABQ73J41C+DpCEWvna
 f0gMxbFRU0SG+2s4U5u5AP+81uBD4vVjqYK0fvQ88960F1UROPRtCVfN287aWsCdIIK7XG/kg+J8Q
 b5PdK34vqFHmDe0TN3qoHYiAmowPNNlHv81DdHIdXu8cpcRBpBzft/ArJQpY3fAbno5DJbVfRtunb
 nzX9WsSwPRqCGHWbuqyPMcDqJRwhMdTxDwAujFfuc=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v7 00/11] 9p: Add support for darwin
Date: Fri, 18 Feb 2022 18:45:41 +0100
Message-ID: <24928693.zZ8iTCSeN7@silver>
In-Reply-To: <CAB26zV1v+bL4FskfRbpU5kWqRBxg4wKJBVXXsWnNzJo31_9O_A@mail.gmail.com>
References: <20220215190426.56130-1-wwcohen@gmail.com>
 <CAB26zV1v+bL4FskfRbpU5kWqRBxg4wKJBVXXsWnNzJo31_9O_A@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Freitag, 18. Februar 2022 18:04:24 CET Will Cohen wrote:
> On Tue, Feb 15, 2022 at 2:04 PM Will Cohen <wwcohen@gmail.com> wrote:
> > This is a followup to
> > https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg02313.html,
> > adding 9p server support for Darwin.
> > 
> > Since v6, the following changes have been made to the following patches:
> > 
> > Patch 9/11: 9p: darwin: Implement compatibility for mknodat
> > - Add CONFIG_PTHREAD_FCHDIR_NP to meson and check for
> > 
> >   presence in osdep.h and os-posix.c
> > 
> > Keno Fischer (10):
> >   9p: linux: Fix a couple Linux assumptions
> >   9p: Rename 9p-util -> 9p-util-linux
> >   9p: darwin: Handle struct stat(fs) differences
> >   9p: darwin: Handle struct dirent differences
> >   9p: darwin: Ignore O_{NOATIME, DIRECT}
> >   9p: darwin: Move XATTR_SIZE_MAX->P9_XATTR_SIZE_MAX
> >   9p: darwin: *xattr_nofollow implementations
> >   9p: darwin: Compatibility for f/l*xattr
> >   9p: darwin: Implement compatibility for mknodat
> >   9p: darwin: meson: Allow VirtFS on Darwin
> > 
> > Will Cohen (1):
> >   9p: darwin: Adjust assumption on virtio-9p-test
> >  
> >  fsdev/file-op-9p.h                     |  9 +++-
> >  fsdev/meson.build                      |  1 +
> >  hw/9pfs/9p-local.c                     | 27 ++++++++---
> >  hw/9pfs/9p-proxy.c                     | 38 +++++++++++++--
> >  hw/9pfs/9p-synth.c                     |  6 +++
> >  hw/9pfs/9p-util-darwin.c               | 64 ++++++++++++++++++++++++++
> >  hw/9pfs/{9p-util.c => 9p-util-linux.c} |  2 +-
> >  hw/9pfs/9p-util.h                      | 35 ++++++++++++++
> >  hw/9pfs/9p.c                           | 42 ++++++++++++++---
> >  hw/9pfs/9p.h                           | 18 ++++++++
> >  hw/9pfs/codir.c                        |  4 +-
> >  hw/9pfs/meson.build                    |  3 +-
> >  include/qemu/osdep.h                   | 12 +++++
> >  include/qemu/xattr.h                   |  4 +-
> >  meson.build                            | 15 ++++--
> >  os-posix.c                             | 35 ++++++++++++++
> >  tests/qtest/virtio-9p-test.c           |  2 +-
> >  17 files changed, 292 insertions(+), 25 deletions(-)
> >  create mode 100644 hw/9pfs/9p-util-darwin.c
> >  rename hw/9pfs/{9p-util.c => 9p-util-linux.c} (97%)
> > 
> > --
> > 2.34.1
> 
> As a brief additional note, this patch set has gotten a moderate amount of
> performance testing downstream by various end users of podman, with
> favorable results:
> https://github.com/containers/podman/issues/8016#issuecomment-1044843948

Thanks for sharing!

Additionally you might be interested to know what's pending in the pipeline on
Linux kernel side which brings a huge performance improvement with 9p:
https://lore.kernel.org/netdev/cover.1640870037.git.linux_oss@crudebyte.com/

As for the status on this macOS series here: I will get back on it next week.
From my PoV it looks fine now. So for the other gentlemen here: please raise
your hand if you still find something.

Will, one more thing though: I just sent a PR with one particular patch that I
would ask you to test in conjunction with this series:

https://github.com/cschoenebeck/qemu/commit/e64e27d5cb103b7764f1a05b6eda7e7fedd517c5

You might simply wait for the PR being merged (maybe monday?) and then rebase
this series to master and test if this patch is not breaking anything for
macOS. Theoretically the new qemu_dirent_dup() function should fallback on
macOS to its portable branch, but it should be tested before merging this
series, just to be sure.

Best regards,
Christian Schoenebeck



