Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE214072A1
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 22:35:01 +0200 (CEST)
Received: from localhost ([::1]:42284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOnEi-0003QT-B0
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 16:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mOnC7-0001vD-15
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 16:32:19 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c]:35487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mOnBx-0005Ou-0e
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 16:32:15 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id p14so2724802vsm.2
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 13:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LBJJWLd2rmI50zbfFt8tdlE3Tg/G5acmvDbc80eEYnM=;
 b=TFFazTGuBsn09DpToyYtLNELUmqBxJKpQG6dZ3YgVbvcokDCPbRizAP4Nx97fYCK7V
 ZlGAUdLeaXZgG5kSRtBQIOp/Zq5yUUZjK1AZj6zIQHxbtMsg/ybtQM502jEoMgQWL4Qz
 YNAKjzgbpkEGpOjllZNoBp+ju6oTd+kRtUfJu1wBMxniOIX6+sPeH2QMs9gQ18pey/ya
 qJHTCuMOsxPKcs35tB+js+w9e6gJUo3kroGV3R3V3YI3TEdeIFgCunzVjjeQkz+vfdJT
 xxQ+foeg7KKoJ/9R1ZQUNMSZ+Q7cr4bwzv628EnqEKFw+zqFCImvN3Jf+bt2v9zypbKg
 V7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LBJJWLd2rmI50zbfFt8tdlE3Tg/G5acmvDbc80eEYnM=;
 b=ILyIOFu1CjKDLL6DDidan8Xlnf7B4Ra2hyo7XydhzMG5QCDgC7iQyenokCLX8g7mpE
 2lrupBINekuam9Yme6Em/YLb5CM0vNWB2Q1gl2gplQO+lM4JwLq5z1Bw0ffuttYB2M39
 5nWAOHGk+c3JMszsellVmZ3eU4mGXGD79nd34kbfhuO2InRKpqg6LRBiYmNR0CdDmv6N
 hjKuw3eC/RbEJHl5jqSXmDPYCxa5xnGpKMnDG1knCCWB33xzHZ6FCcRxJobTHw9IF+YL
 4KA2Sj0Jh8TtvNxAGFKKdgbqu8xP5nQ4E0WN7F7vtTJ+H+SWBi+FhaRGe2/uldvPcKfg
 Vnqg==
X-Gm-Message-State: AOAM531CA4s7+lOYZXOlHC7kpOfXxNC+/I6pj7SEYnfVK9ArrsJTxsXj
 4sSZvVQ2yW7JCTI0ncAgjFTZfnPcCgFLC9PIl4r7EQ==
X-Google-Smtp-Source: ABdhPJyT85d+DS1SKs6VeJSUswuFpoIADNtGNfJPhG31hFS2zYaG/5nOzhEzIMzXR8LQS9VQJ2FHlEPQFd+SqvcXmXM=
X-Received: by 2002:a05:6102:1175:: with SMTP id
 k21mr7360094vsg.42.1631305927373; 
 Fri, 10 Sep 2021 13:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210907215332.30737-1-imp@bsdimp.com>
 <c2a517a1-07f1-4fb8-abf1-6a564e4dbec3@amsat.org>
In-Reply-To: <c2a517a1-07f1-4fb8-abf1-6a564e4dbec3@amsat.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 10 Sep 2021 14:31:56 -0600
Message-ID: <CANCZdfp=u0r=e4F8RfrsXqQ1zLLEeQbhfT3rckZePtYj6bhH9A@mail.gmail.com>
Subject: Re: [PULL 00/42] bsd-user updates to run hello world
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="00000000000052497d05cbaa0299"
Received-SPF: none client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000052497d05cbaa0299
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 9, 2021 at 10:29 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> On 9/7/21 11:52 PM, imp@bsdimp.com wrote:
> > From: Warner Losh <imp@bsdimp.com>
> >
> > The following changes since commit
> f214d8e0150766c31172e16ef4b17674f549d852:
> >
> >   Merge remote-tracking branch
> 'remotes/pmaydell/tags/pull-target-arm-20210826' into staging (2021-08-26
> 18:03:57 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/bsdimp/qemu.git tags/bsd-user-pull-20210907-tag
> >
> > for you to fetch changes up to dc96376e46a52ac63a27ea185c3f0a6fd54e3c82=
:
> >
> >   bsd-user: Update mapping to handle reserved and starting conditions
> (2021-09-07 08:26:53 -0600)
> >
> > ----------------------------------------------------------------
> >
> > This series of patches gets me to the point that I can run "Hello World=
"
> on i386
> > and x86_64. This is for static binaries only, that are relatively small=
,
> but
> > it's better than the 100% instant mmap failre that is the current state
> of all
> > things bsd-user in upstream qemu. Future patch sets will refine this, a=
dd
> > the missing system calls, fix bugs preventing more sophisticated
> programms
> > from running and add a bunch of new architecture support.
> >
> > There's three large themes in these patches, though the changes that
> > represent them are interrelated making it hard to separate out further.
> > 1. Reorganization to support multiple OS and architectures (though I've
> only
> >    tested FreeBSD, other BSDs might not even compile yet).
> > 2. Diff reduction with the bsd-user fork for several files. These diffs
> include
> >    changes that borrowed from linux-user as well as changes to make
> things work
> >    on FreeBSD. The records keeping when this was done, however, was poo=
r
> at
> >    best, so many of the specific borrowings are going unacknowledged
> here, apart
> >    from this general ack. These diffs also include some minor code
> shuffling.
> >    Some of the changes are done specifically to make it easier to rebas=
e
> >    the bsd-user fork's changes when these land in the tree (a number of
> changes
> >    have been pushed there to make this more possible).
> > 3. Filling in the missing pieces to make things work. There's many
> changes to
> >    elfload to make it load things in the right places, to find the
> interpreter
> >    better, etc. There's changes to mmap.c to make the mappings work
> better and
> >    there's changes to main.c that were inspired, at least, by
> now-ancient changes
> >    to linux-user's main.c.
> >
> > I ran checkpatch.pl on this, and there's 350-odd errors it identifies
> (the vast
> > majoirty come from BSD's fetish for tabs), so there will need to be a V=
2
> to fix
> > this at the very least. In addition, the change set is big (about
> +~4.5k/-~2.5k
> > lines), so I anticipate some iteration as well just based on its sheer
> > size. I've tried to keep each set small to make it easy to review in
> isolation,
> > but I've also allowed some interrelated ones to get a little bigger tha=
n
> I'd
> > normally like. I've not done the customary documentation of the expecte=
d
> > checkpatch.pl output because it is large, and because I wanted to get
> review
> > of the other parts rolling to get this project unstuck. Future versions
> of the
> > patch will document the expected output.
> >
> > In addition, I noticed a number of places where I could modernize to
> make the
> > code match things like linux-user better. I've resisted the urge to do
> these at
> > this time, since it would complicate merging the other ~30k lines of
> diff that
> > remains after this batch. Future batches should generally be smaller
> once this
> > one has landed since they are, by and large, either a bunch of new file=
s
> to
> > support armv7, aarch64, riscv64, mips, mipsel, mips64, ppc, ppc64 and
> ppc64le,
> > or are adding system calls, which can be done individually or small
> groups. I've
> > removed sparc and sparc64 support as they've been removed from FreeBSD
> and
> > have been near totally busted for years.
> >
> > Stacey Son did the bulk of this work originally, but since I had to mov=
e
> things
> > around so much and/or retool that work in non-trivial ways, I've kept
> myself as
> > author, and added his signed-off-by line. I'm unsure of the qemu standa=
rd
> > practice for this, but am happy to learn if this is too far outside its
> current
> > mainstream. For a while Sean Bruno did the merges from upstream, and he=
's
> > credited using his signed-off-by in appropriate places, though for this
> patch
> > set there's only a few. I've tried to ensure that others who have work =
in
> > individual patches that I've aggregated together also are reflected in
> their
> > signed-off-by. Given the chaotic stat of the upstream repo for its earl=
y
> > history, this may be the best that can be reconstructed at this late
> date. Most
> > of these files are 'foundational' so have existed from the earliest day=
s
> when
> > record keeping wasn't quite what I'd wish for in hindsight. There was
> only
> > really one change that I could easily cherry-pick (Colin's), so I did
> that.
>
> ---
>
> Something got wrong with the signed tag, it should probably end here,
> but all the cover letter is included.
>

Just a slight case of PEBEK I think :)


> FYI git-publish eases the process:
> https://github.com/stefanha/git-publish


I'll have to give this a try next time... The first couple of rounds were
easy enough to
do by hand, but this last round has been quite a bit more difficult.

Warner


>
> > v2: rejected patches dropped
> >     Use suggested glibc routines
> >     Updated to be closer to qemu style
> >     Disable bsd-user on netbsd and openbsd since they don't compile
> >     fold together a couple of related changes
> >     [[ tagged the review-by and acked-by from last series, but by hand.=
..
> >       I think I got them all... ]]
> >
> > v3: Fix a bug in refactoring load_elf_sections and is_target_elf_binary
> >     Fix spelling errors in commit messages
> >     drop copy_cpu() patch until we use that function
> >     reword a few commit messages to make them clearer
> >     fix return value of setup_sigtramp to be 0 after #ifdef elimination
> >     Add patch to initialize random state and implement --seed
> >     Fix a boatload of style issues.
> >     Rebase to tip of master
> >
> > NOTE: checkpatch.pl will have several warning about line length > 80 an=
d
> > admonishment to not use architecture specific defines. The slightly lon=
g
> lines
> > look a lot better than wrapping and the arch specific defines are
> basically
> > required (one could wrap them, and I plan to in the future once I've
> pruned the
> > obsolete ones in a future patch set: there's so many that errors would
> crop up
> > if I were to do it now).
> >
> > Warner
> >
> > Colin Percival (1):
> >   bsd-user: Add '-0 argv0' option to bsd-user/main.c
> >
> > Warner Losh (41):
> >   bsd-user: remove sparc and sparc64
> >   bsd-user: add copyright header to elfload.c
> >   bsd-user: Add Stacey's copyright to main.c
> >   bsd-user: add license to bsdload.c
> >   bsd-user: style nits: bsdload.c whitespace to qemu standard
> >   bsd-user: Remove all non-x86 code from elfload.c
> >   bsd-user: move arch specific defines out of elfload.c
> >   bsd-user: pass the bsd_param into loader_exec
> >   bsd-user: Fix calculation of size to allocate
> >   bsd-user: implement path searching
> >   bsd-user: Eliminate elf personality
> >   bsd-user: remove a.out support
> >   bsd-user: TARGET_NGROUPS unused in this file, remove
> >   bsd-user: elfload: simplify bswap a bit.
> >   bsd-user: assume pthreads and support of __thread
> >   bsd-user: add host-os.h
> >   bsd-user: Include host-os.h from main
> >   bsd-user: save the path to the qemu emulator
> >   bsd-user: start to move target CPU functions to target_arch*
> >   bsd-user: Move per-cpu code into target_arch_cpu.h
> >   bsd-user: pull in target_arch_thread.h update target_arch_elf.h
> >   bsd-user: Include more things in qemu.h
> >   bsd-user: define max args in terms of pages
> >   bsd-user: Create target specific vmparam.h
> >   bsd-user: Add system independent stack, data and text limiting
> >   bsd-user: *BSD specific siginfo defintions
> >   bsd-user: Implement --seed and initialize random state
> >   bsd-user: Move stack initializtion into a per-os file.
> >   bsd-user: Add architecture specific signal tramp code
> >   bsd-user: elf cleanup
> >   bsd-user: Remove dead #ifdefs from elfload.c
> >   bsd-user: Rewrite target system call definintion glue
> >   bsd-user: update debugging in mmap.c
> >   bsd-user: Add target_arch_reg to describe a target's register set
> >   bsd-user: Add target_os_user.h to capture the user/kernel structures
> >   bsd-user: add stubbed out core dump support
> >   bsd-user: elfload.c style catch up patch
> >   bsd-user: Refactor load_elf_sections and is_target_elf_binary
> >   bsd-user: move gemu_log to later in the file
> >   bsd-user: Implement interlock for atomic operations
> >   bsd-user: Update mapping to handle reserved and starting conditions
> >
> >  bsd-user/bsd-mman.h                           |  121 --
> >  bsd-user/bsdload.c                            |  104 +-
> >  bsd-user/elfcore.c                            |   10 +
> >  bsd-user/elfload.c                            | 1469 +++++------------
> >  bsd-user/freebsd/host-os.h                    |   25 +
> >  bsd-user/freebsd/target_os_elf.h              |  137 ++
> >  bsd-user/freebsd/target_os_siginfo.h          |  145 ++
> >  bsd-user/freebsd/target_os_signal.h           |   78 +
> >  bsd-user/freebsd/target_os_stack.h            |  181 ++
> >  bsd-user/freebsd/target_os_thread.h           |   25 +
> >  bsd-user/freebsd/target_os_user.h             |  427 +++++
> >  bsd-user/freebsd/target_os_vmparam.h          |   38 +
> >  .../target_syscall.h =3D> i386/target_arch.h}   |   27 +-
> >  bsd-user/i386/target_arch_cpu.c               |   76 +
> >  bsd-user/i386/target_arch_cpu.h               |  209 +++
> >  bsd-user/i386/target_arch_elf.h               |   35 +
> >  bsd-user/i386/target_arch_reg.h               |   82 +
> >  bsd-user/i386/target_arch_signal.h            |   94 ++
> >  bsd-user/i386/target_arch_sigtramp.h          |   29 +
> >  bsd-user/i386/target_arch_thread.h            |   47 +
> >  bsd-user/i386/target_arch_vmparam.h           |   46 +
> >  bsd-user/main.c                               |  832 ++--------
> >  bsd-user/mmap.c                               |  472 +++++-
> >  bsd-user/netbsd/host-os.h                     |   25 +
> >  bsd-user/netbsd/target_os_elf.h               |  146 ++
> >  bsd-user/netbsd/target_os_siginfo.h           |   82 +
> >  bsd-user/netbsd/target_os_signal.h            |   69 +
> >  bsd-user/netbsd/target_os_stack.h             |   56 +
> >  bsd-user/netbsd/target_os_thread.h            |   25 +
> >  bsd-user/openbsd/host-os.h                    |   25 +
> >  bsd-user/openbsd/target_os_elf.h              |  146 ++
> >  bsd-user/openbsd/target_os_siginfo.h          |   82 +
> >  bsd-user/openbsd/target_os_signal.h           |   69 +
> >  bsd-user/openbsd/target_os_stack.h            |   56 +
> >  bsd-user/openbsd/target_os_thread.h           |   25 +
> >  bsd-user/qemu.h                               |   63 +-
> >  bsd-user/sparc/target_arch_sysarch.h          |   52 -
> >  bsd-user/sparc64/target_arch_sysarch.h        |   52 -
> >  bsd-user/syscall.c                            |   11 -
> >  bsd-user/syscall_defs.h                       |  255 +--
> >  .../target_syscall.h =3D> x86_64/target_arch.h} |   28 +-
> >  bsd-user/x86_64/target_arch_cpu.c             |   76 +
> >  bsd-user/x86_64/target_arch_cpu.h             |  247 +++
> >  bsd-user/x86_64/target_arch_elf.h             |   35 +
> >  bsd-user/x86_64/target_arch_reg.h             |   92 ++
> >  bsd-user/x86_64/target_arch_signal.h          |   94 ++
> >  bsd-user/x86_64/target_arch_sigtramp.h        |   29 +
> >  bsd-user/x86_64/target_arch_thread.h          |   40 +
> >  bsd-user/x86_64/target_arch_vmparam.h         |   46 +
> >  configure                                     |    7 +-
> >  meson.build                                   |    7 +-
> >  slirp                                         |    2 +-
> >  52 files changed, 4387 insertions(+), 2264 deletions(-)
> >  delete mode 100644 bsd-user/bsd-mman.h
> >  create mode 100644 bsd-user/elfcore.c
> >  create mode 100644 bsd-user/freebsd/host-os.h
> >  create mode 100644 bsd-user/freebsd/target_os_elf.h
> >  create mode 100644 bsd-user/freebsd/target_os_siginfo.h
> >  create mode 100644 bsd-user/freebsd/target_os_signal.h
> >  create mode 100644 bsd-user/freebsd/target_os_stack.h
> >  create mode 100644 bsd-user/freebsd/target_os_thread.h
> >  create mode 100644 bsd-user/freebsd/target_os_user.h
> >  create mode 100644 bsd-user/freebsd/target_os_vmparam.h
> >  rename bsd-user/{sparc/target_syscall.h =3D> i386/target_arch.h} (60%)
> >  create mode 100644 bsd-user/i386/target_arch_cpu.c
> >  create mode 100644 bsd-user/i386/target_arch_cpu.h
> >  create mode 100644 bsd-user/i386/target_arch_elf.h
> >  create mode 100644 bsd-user/i386/target_arch_reg.h
> >  create mode 100644 bsd-user/i386/target_arch_signal.h
> >  create mode 100644 bsd-user/i386/target_arch_sigtramp.h
> >  create mode 100644 bsd-user/i386/target_arch_thread.h
> >  create mode 100644 bsd-user/i386/target_arch_vmparam.h
> >  create mode 100644 bsd-user/netbsd/host-os.h
> >  create mode 100644 bsd-user/netbsd/target_os_elf.h
> >  create mode 100644 bsd-user/netbsd/target_os_siginfo.h
> >  create mode 100644 bsd-user/netbsd/target_os_signal.h
> >  create mode 100644 bsd-user/netbsd/target_os_stack.h
> >  create mode 100644 bsd-user/netbsd/target_os_thread.h
> >  create mode 100644 bsd-user/openbsd/host-os.h
> >  create mode 100644 bsd-user/openbsd/target_os_elf.h
> >  create mode 100644 bsd-user/openbsd/target_os_siginfo.h
> >  create mode 100644 bsd-user/openbsd/target_os_signal.h
> >  create mode 100644 bsd-user/openbsd/target_os_stack.h
> >  create mode 100644 bsd-user/openbsd/target_os_thread.h
> >  delete mode 100644 bsd-user/sparc/target_arch_sysarch.h
> >  delete mode 100644 bsd-user/sparc64/target_arch_sysarch.h
> >  rename bsd-user/{sparc64/target_syscall.h =3D> x86_64/target_arch.h} (=
59%)
> >  create mode 100644 bsd-user/x86_64/target_arch_cpu.c
> >  create mode 100644 bsd-user/x86_64/target_arch_cpu.h
> >  create mode 100644 bsd-user/x86_64/target_arch_elf.h
> >  create mode 100644 bsd-user/x86_64/target_arch_reg.h
> >  create mode 100644 bsd-user/x86_64/target_arch_signal.h
> >  create mode 100644 bsd-user/x86_64/target_arch_sigtramp.h
> >  create mode 100644 bsd-user/x86_64/target_arch_thread.h
> >  create mode 100644 bsd-user/x86_64/target_arch_vmparam.h
> >
>
>

--00000000000052497d05cbaa0299
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 9, 2021 at 10:29 AM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On 9/7/21 11:52 PM, <a href=3D"mailto:imp@bsdimp.com" target=3D"_blank">i=
mp@bsdimp.com</a> wrote:<br>
&gt; From: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"_bla=
nk">imp@bsdimp.com</a>&gt;<br>
&gt; <br>
&gt; The following changes since commit f214d8e0150766c31172e16ef4b17674f54=
9d852:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0Merge remote-tracking branch &#39;remotes/pmaydell/tags/pu=
ll-target-arm-20210826&#39; into staging (2021-08-26 18:03:57 +0100)<br>
&gt; <br>
&gt; are available in the Git repository at:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.com/bsdimp/qemu.git" rel=3D"nore=
ferrer" target=3D"_blank">https://gitlab.com/bsdimp/qemu.git</a> tags/bsd-u=
ser-pull-20210907-tag<br>
&gt; <br>
&gt; for you to fetch changes up to dc96376e46a52ac63a27ea185c3f0a6fd54e3c8=
2:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0bsd-user: Update mapping to handle reserved and starting c=
onditions (2021-09-07 08:26:53 -0600)<br>
&gt; <br>
&gt; ----------------------------------------------------------------<br>
&gt; <br>
&gt; This series of patches gets me to the point that I can run &quot;Hello=
 World&quot; on i386<br>
&gt; and x86_64. This is for static binaries only, that are relatively smal=
l, but<br>
&gt; it&#39;s better than the 100% instant mmap failre that is the current =
state of all<br>
&gt; things bsd-user in upstream qemu. Future patch sets will refine this, =
add<br>
&gt; the missing system calls, fix bugs preventing more sophisticated progr=
amms<br>
&gt; from running and add a bunch of new architecture support.<br>
&gt; <br>
&gt; There&#39;s three large themes in these patches, though the changes th=
at<br>
&gt; represent them are interrelated making it hard to separate out further=
.<br>
&gt; 1. Reorganization to support multiple OS and architectures (though I&#=
39;ve only<br>
&gt;=C2=A0 =C2=A0 tested FreeBSD, other BSDs might not even compile yet).<b=
r>
&gt; 2. Diff reduction with the bsd-user fork for several files. These diff=
s include<br>
&gt;=C2=A0 =C2=A0 changes that borrowed from linux-user as well as changes =
to make things work<br>
&gt;=C2=A0 =C2=A0 on FreeBSD. The records keeping when this was done, howev=
er, was poor at<br>
&gt;=C2=A0 =C2=A0 best, so many of the specific borrowings are going unackn=
owledged here, apart<br>
&gt;=C2=A0 =C2=A0 from this general ack. These diffs also include some mino=
r code shuffling.<br>
&gt;=C2=A0 =C2=A0 Some of the changes are done specifically to make it easi=
er to rebase<br>
&gt;=C2=A0 =C2=A0 the bsd-user fork&#39;s changes when these land in the tr=
ee (a number of changes<br>
&gt;=C2=A0 =C2=A0 have been pushed there to make this more possible).<br>
&gt; 3. Filling in the missing pieces to make things work. There&#39;s many=
 changes to<br>
&gt;=C2=A0 =C2=A0 elfload to make it load things in the right places, to fi=
nd the interpreter<br>
&gt;=C2=A0 =C2=A0 better, etc. There&#39;s changes to mmap.c to make the ma=
ppings work better and<br>
&gt;=C2=A0 =C2=A0 there&#39;s changes to main.c that were inspired, at leas=
t, by now-ancient changes<br>
&gt;=C2=A0 =C2=A0 to linux-user&#39;s main.c.<br>
&gt; <br>
&gt; I ran <a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_b=
lank">checkpatch.pl</a> on this, and there&#39;s 350-odd errors it identifi=
es (the vast<br>
&gt; majoirty come from BSD&#39;s fetish for tabs), so there will need to b=
e a V2 to fix<br>
&gt; this at the very least. In addition, the change set is big (about +~4.=
5k/-~2.5k<br>
&gt; lines), so I anticipate some iteration as well just based on its sheer=
<br>
&gt; size. I&#39;ve tried to keep each set small to make it easy to review =
in isolation,<br>
&gt; but I&#39;ve also allowed some interrelated ones to get a little bigge=
r than I&#39;d<br>
&gt; normally like. I&#39;ve not done the customary documentation of the ex=
pected<br>
&gt; <a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_blank">=
checkpatch.pl</a> output because it is large, and because I wanted to get r=
eview<br>
&gt; of the other parts rolling to get this project unstuck. Future version=
s of the<br>
&gt; patch will document the expected output.<br>
&gt; <br>
&gt; In addition, I noticed a number of places where I could modernize to m=
ake the<br>
&gt; code match things like linux-user better. I&#39;ve resisted the urge t=
o do these at<br>
&gt; this time, since it would complicate merging the other ~30k lines of d=
iff that<br>
&gt; remains after this batch. Future batches should generally be smaller o=
nce this<br>
&gt; one has landed since they are, by and large, either a bunch of new fil=
es to<br>
&gt; support armv7, aarch64, riscv64, mips, mipsel, mips64, ppc, ppc64 and =
ppc64le,<br>
&gt; or are adding system calls, which can be done individually or small gr=
oups. I&#39;ve<br>
&gt; removed sparc and sparc64 support as they&#39;ve been removed from Fre=
eBSD and<br>
&gt; have been near totally busted for years.<br>
&gt; <br>
&gt; Stacey Son did the bulk of this work originally, but since I had to mo=
ve things<br>
&gt; around so much and/or retool that work in non-trivial ways, I&#39;ve k=
ept myself as<br>
&gt; author, and added his signed-off-by line. I&#39;m unsure of the qemu s=
tandard<br>
&gt; practice for this, but am happy to learn if this is too far outside it=
s current<br>
&gt; mainstream. For a while Sean Bruno did the merges from upstream, and h=
e&#39;s<br>
&gt; credited using his signed-off-by in appropriate places, though for thi=
s patch<br>
&gt; set there&#39;s only a few. I&#39;ve tried to ensure that others who h=
ave work in<br>
&gt; individual patches that I&#39;ve aggregated together also are reflecte=
d in their<br>
&gt; signed-off-by. Given the chaotic stat of the upstream repo for its ear=
ly<br>
&gt; history, this may be the best that can be reconstructed at this late d=
ate. Most<br>
&gt; of these files are &#39;foundational&#39; so have existed from the ear=
liest days when<br>
&gt; record keeping wasn&#39;t quite what I&#39;d wish for in hindsight. Th=
ere was only<br>
&gt; really one change that I could easily cherry-pick (Colin&#39;s), so I =
did that.<br>
<br>
---<br>
<br>
Something got wrong with the signed tag, it should probably end here,<br>
but all the cover letter is included.<br></blockquote><div><br></div><div>J=
ust a slight case of PEBEK I think :)</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
FYI git-publish eases the process:<br>
<a href=3D"https://github.com/stefanha/git-publish" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/stefanha/git-publish</a></blockquote><div>=
<br></div><div>I&#39;ll have to give this a try next time... The first coup=
le of rounds were easy enough to</div><div>do by hand, but this last round =
has been quite a bit more difficult.</div><div><br></div><div>Warner</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
&gt; v2: rejected patches dropped<br>
&gt;=C2=A0 =C2=A0 =C2=A0Use suggested glibc routines<br>
&gt;=C2=A0 =C2=A0 =C2=A0Updated to be closer to qemu style<br>
&gt;=C2=A0 =C2=A0 =C2=A0Disable bsd-user on netbsd and openbsd since they d=
on&#39;t compile<br>
&gt;=C2=A0 =C2=A0 =C2=A0fold together a couple of related changes<br>
&gt;=C2=A0 =C2=A0 =C2=A0[[ tagged the review-by and acked-by from last seri=
es, but by hand...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0I think I got them all... ]]<br>
&gt; <br>
&gt; v3: Fix a bug in refactoring load_elf_sections and is_target_elf_binar=
y<br>
&gt;=C2=A0 =C2=A0 =C2=A0Fix spelling errors in commit messages<br>
&gt;=C2=A0 =C2=A0 =C2=A0drop copy_cpu() patch until we use that function<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0reword a few commit messages to make them clearer<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0fix return value of setup_sigtramp to be 0 after #i=
fdef elimination<br>
&gt;=C2=A0 =C2=A0 =C2=A0Add patch to initialize random state and implement =
--seed<br>
&gt;=C2=A0 =C2=A0 =C2=A0Fix a boatload of style issues.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Rebase to tip of master<br>
&gt; <br>
&gt; NOTE: <a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D"_b=
lank">checkpatch.pl</a> will have several warning about line length &gt; 80=
 and<br>
&gt; admonishment to not use architecture specific defines. The slightly lo=
ng lines<br>
&gt; look a lot better than wrapping and the arch specific defines are basi=
cally<br>
&gt; required (one could wrap them, and I plan to in the future once I&#39;=
ve pruned the<br>
&gt; obsolete ones in a future patch set: there&#39;s so many that errors w=
ould crop up<br>
&gt; if I were to do it now).<br>
&gt; <br>
&gt; Warner<br>
&gt; <br>
&gt; Colin Percival (1):<br>
&gt;=C2=A0 =C2=A0bsd-user: Add &#39;-0 argv0&#39; option to bsd-user/main.c=
<br>
&gt; <br>
&gt; Warner Losh (41):<br>
&gt;=C2=A0 =C2=A0bsd-user: remove sparc and sparc64<br>
&gt;=C2=A0 =C2=A0bsd-user: add copyright header to elfload.c<br>
&gt;=C2=A0 =C2=A0bsd-user: Add Stacey&#39;s copyright to main.c<br>
&gt;=C2=A0 =C2=A0bsd-user: add license to bsdload.c<br>
&gt;=C2=A0 =C2=A0bsd-user: style nits: bsdload.c whitespace to qemu standar=
d<br>
&gt;=C2=A0 =C2=A0bsd-user: Remove all non-x86 code from elfload.c<br>
&gt;=C2=A0 =C2=A0bsd-user: move arch specific defines out of elfload.c<br>
&gt;=C2=A0 =C2=A0bsd-user: pass the bsd_param into loader_exec<br>
&gt;=C2=A0 =C2=A0bsd-user: Fix calculation of size to allocate<br>
&gt;=C2=A0 =C2=A0bsd-user: implement path searching<br>
&gt;=C2=A0 =C2=A0bsd-user: Eliminate elf personality<br>
&gt;=C2=A0 =C2=A0bsd-user: remove a.out support<br>
&gt;=C2=A0 =C2=A0bsd-user: TARGET_NGROUPS unused in this file, remove<br>
&gt;=C2=A0 =C2=A0bsd-user: elfload: simplify bswap a bit.<br>
&gt;=C2=A0 =C2=A0bsd-user: assume pthreads and support of __thread<br>
&gt;=C2=A0 =C2=A0bsd-user: add host-os.h<br>
&gt;=C2=A0 =C2=A0bsd-user: Include host-os.h from main<br>
&gt;=C2=A0 =C2=A0bsd-user: save the path to the qemu emulator<br>
&gt;=C2=A0 =C2=A0bsd-user: start to move target CPU functions to target_arc=
h*<br>
&gt;=C2=A0 =C2=A0bsd-user: Move per-cpu code into target_arch_cpu.h<br>
&gt;=C2=A0 =C2=A0bsd-user: pull in target_arch_thread.h update target_arch_=
elf.h<br>
&gt;=C2=A0 =C2=A0bsd-user: Include more things in qemu.h<br>
&gt;=C2=A0 =C2=A0bsd-user: define max args in terms of pages<br>
&gt;=C2=A0 =C2=A0bsd-user: Create target specific vmparam.h<br>
&gt;=C2=A0 =C2=A0bsd-user: Add system independent stack, data and text limi=
ting<br>
&gt;=C2=A0 =C2=A0bsd-user: *BSD specific siginfo defintions<br>
&gt;=C2=A0 =C2=A0bsd-user: Implement --seed and initialize random state<br>
&gt;=C2=A0 =C2=A0bsd-user: Move stack initializtion into a per-os file.<br>
&gt;=C2=A0 =C2=A0bsd-user: Add architecture specific signal tramp code<br>
&gt;=C2=A0 =C2=A0bsd-user: elf cleanup<br>
&gt;=C2=A0 =C2=A0bsd-user: Remove dead #ifdefs from elfload.c<br>
&gt;=C2=A0 =C2=A0bsd-user: Rewrite target system call definintion glue<br>
&gt;=C2=A0 =C2=A0bsd-user: update debugging in mmap.c<br>
&gt;=C2=A0 =C2=A0bsd-user: Add target_arch_reg to describe a target&#39;s r=
egister set<br>
&gt;=C2=A0 =C2=A0bsd-user: Add target_os_user.h to capture the user/kernel =
structures<br>
&gt;=C2=A0 =C2=A0bsd-user: add stubbed out core dump support<br>
&gt;=C2=A0 =C2=A0bsd-user: elfload.c style catch up patch<br>
&gt;=C2=A0 =C2=A0bsd-user: Refactor load_elf_sections and is_target_elf_bin=
ary<br>
&gt;=C2=A0 =C2=A0bsd-user: move gemu_log to later in the file<br>
&gt;=C2=A0 =C2=A0bsd-user: Implement interlock for atomic operations<br>
&gt;=C2=A0 =C2=A0bsd-user: Update mapping to handle reserved and starting c=
onditions<br>
&gt; <br>
&gt;=C2=A0 bsd-user/bsd-mman.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 121 --<br>
&gt;=C2=A0 bsd-user/bsdload.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 104 +-<br>
&gt;=C2=A0 bsd-user/elfcore.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A010 +<br>
&gt;=C2=A0 bsd-user/elfload.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1469 +++++----------=
--<br>
&gt;=C2=A0 bsd-user/freebsd/host-os.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A025 +<br>
&gt;=C2=A0 bsd-user/freebsd/target_os_elf.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 137 ++<br>
&gt;=C2=A0 bsd-user/freebsd/target_os_siginfo.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 145 ++<br>
&gt;=C2=A0 bsd-user/freebsd/target_os_signal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A078 +<br>
&gt;=C2=A0 bsd-user/freebsd/target_os_stack.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 181 ++<br>
&gt;=C2=A0 bsd-user/freebsd/target_os_thread.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A025 +<br>
&gt;=C2=A0 bsd-user/freebsd/target_os_user.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 427 +++++<br>
&gt;=C2=A0 bsd-user/freebsd/target_os_vmparam.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A038 +<br>
&gt;=C2=A0 .../target_syscall.h =3D&gt; i386/target_arch.h}=C2=A0 =C2=A0|=
=C2=A0 =C2=A027 +-<br>
&gt;=C2=A0 bsd-user/i386/target_arch_cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A076 +<br>
&gt;=C2=A0 bsd-user/i386/target_arch_cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 209 +++<br>
&gt;=C2=A0 bsd-user/i386/target_arch_elf.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A035 +<br>
&gt;=C2=A0 bsd-user/i386/target_arch_reg.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A082 +<br>
&gt;=C2=A0 bsd-user/i386/target_arch_signal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A094 ++<br>
&gt;=C2=A0 bsd-user/i386/target_arch_sigtramp.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A029 +<br>
&gt;=C2=A0 bsd-user/i386/target_arch_thread.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A047 +<br>
&gt;=C2=A0 bsd-user/i386/target_arch_vmparam.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A046 +<br>
&gt;=C2=A0 bsd-user/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 832 +=
+--------<br>
&gt;=C2=A0 bsd-user/mmap.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 472 +=
++++-<br>
&gt;=C2=A0 bsd-user/netbsd/host-os.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A025 +<br>
&gt;=C2=A0 bsd-user/netbsd/target_os_elf.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 146 ++<br>
&gt;=C2=A0 bsd-user/netbsd/target_os_siginfo.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A082 +<br>
&gt;=C2=A0 bsd-user/netbsd/target_os_signal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A069 +<br>
&gt;=C2=A0 bsd-user/netbsd/target_os_stack.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A056 +<br>
&gt;=C2=A0 bsd-user/netbsd/target_os_thread.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A025 +<br>
&gt;=C2=A0 bsd-user/openbsd/host-os.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A025 +<br>
&gt;=C2=A0 bsd-user/openbsd/target_os_elf.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 146 ++<br>
&gt;=C2=A0 bsd-user/openbsd/target_os_siginfo.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A082 +<br>
&gt;=C2=A0 bsd-user/openbsd/target_os_signal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A069 +<br>
&gt;=C2=A0 bsd-user/openbsd/target_os_stack.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A056 +<br>
&gt;=C2=A0 bsd-user/openbsd/target_os_thread.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A025 +<br>
&gt;=C2=A0 bsd-user/qemu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A063 +-<br>
&gt;=C2=A0 bsd-user/sparc/target_arch_sysarch.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A052 -<br>
&gt;=C2=A0 bsd-user/sparc64/target_arch_sysarch.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A052 -<br>
&gt;=C2=A0 bsd-user/syscall.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A011 -<br>
&gt;=C2=A0 bsd-user/syscall_defs.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 255 +--<br>
&gt;=C2=A0 .../target_syscall.h =3D&gt; x86_64/target_arch.h} |=C2=A0 =C2=
=A028 +-<br>
&gt;=C2=A0 bsd-user/x86_64/target_arch_cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A076 +<br>
&gt;=C2=A0 bsd-user/x86_64/target_arch_cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 247 +++<br>
&gt;=C2=A0 bsd-user/x86_64/target_arch_elf.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A035 +<br>
&gt;=C2=A0 bsd-user/x86_64/target_arch_reg.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A092 ++<br>
&gt;=C2=A0 bsd-user/x86_64/target_arch_signal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A094 ++<br>
&gt;=C2=A0 bsd-user/x86_64/target_arch_sigtramp.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A029 +<br>
&gt;=C2=A0 bsd-user/x86_64/target_arch_thread.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A040 +<br>
&gt;=C2=A0 bsd-user/x86_64/target_arch_vmparam.h=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A046 +<br>
&gt;=C2=A0 configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 7 +-<br>
&gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 7 +-<br>
&gt;=C2=A0 slirp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
&gt;=C2=A0 52 files changed, 4387 insertions(+), 2264 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 bsd-user/bsd-mman.h<br>
&gt;=C2=A0 create mode 100644 bsd-user/elfcore.c<br>
&gt;=C2=A0 create mode 100644 bsd-user/freebsd/host-os.h<br>
&gt;=C2=A0 create mode 100644 bsd-user/freebsd/target_os_elf.h<br>
&gt;=C2=A0 create mode 100644 bsd-user/freebsd/target_os_siginfo.h<br>
&gt;=C2=A0 create mode 100644 bsd-user/freebsd/target_os_signal.h<br>
&gt;=C2=A0 create mode 100644 bsd-user/freebsd/target_os_stack.h<br>
&gt;=C2=A0 create mode 100644 bsd-user/freebsd/target_os_thread.h<br>
&gt;=C2=A0 create mode 100644 bsd-user/freebsd/target_os_user.h<br>
&gt;=C2=A0 create mode 100644 bsd-user/freebsd/target_os_vmparam.h<br>
&gt;=C2=A0 rename bsd-user/{sparc/target_syscall.h =3D&gt; i386/target_arch=
.h} (60%)<br>
&gt;=C2=A0 create mode 100644 bsd-user/i386/target_arch_cpu.c<br>
&gt;=C2=A0 create mode 100644 bsd-user/i386/target_arch_cpu.h<br>
&gt;=C2=A0 create mode 100644 bsd-user/i386/target_arch_elf.h<br>
&gt;=C2=A0 create mode 100644 bsd-user/i386/target_arch_reg.h<br>
&gt;=C2=A0 create mode 100644 bsd-user/i386/target_arch_signal.h<br>
&gt;=C2=A0 create mode 100644 bsd-user/i386/target_arch_sigtramp.h<br>
&gt;=C2=A0 create mode 100644 bsd-user/i386/target_arch_thread.h<br>
&gt;=C2=A0 create mode 100644 bsd-user/i386/target_arch_vmparam.h<br>
&gt;=C2=A0 create mode 100644 bsd-user/netbsd/host-os.h<br>
&gt;=C2=A0 create mode 100644 bsd-user/netbsd/target_os_elf.h<br>
&gt;=C2=A0 create mode 100644 bsd-user/netbsd/target_os_siginfo.h<br>
&gt;=C2=A0 create mode 100644 bsd-user/netbsd/target_os_signal.h<br>
&gt;=C2=A0 create mode 100644 bsd-user/netbsd/target_os_stack.h<br>
&gt;=C2=A0 create mode 100644 bsd-user/netbsd/target_os_thread.h<br>
&gt;=C2=A0 create mode 100644 bsd-user/openbsd/host-os.h<br>
&gt;=C2=A0 create mode 100644 bsd-user/openbsd/target_os_elf.h<br>
&gt;=C2=A0 create mode 100644 bsd-user/openbsd/target_os_siginfo.h<br>
&gt;=C2=A0 create mode 100644 bsd-user/openbsd/target_os_signal.h<br>
&gt;=C2=A0 create mode 100644 bsd-user/openbsd/target_os_stack.h<br>
&gt;=C2=A0 create mode 100644 bsd-user/openbsd/target_os_thread.h<br>
&gt;=C2=A0 delete mode 100644 bsd-user/sparc/target_arch_sysarch.h<br>
&gt;=C2=A0 delete mode 100644 bsd-user/sparc64/target_arch_sysarch.h<br>
&gt;=C2=A0 rename bsd-user/{sparc64/target_syscall.h =3D&gt; x86_64/target_=
arch.h} (59%)<br>
&gt;=C2=A0 create mode 100644 bsd-user/x86_64/target_arch_cpu.c<br>
&gt;=C2=A0 create mode 100644 bsd-user/x86_64/target_arch_cpu.h<br>
&gt;=C2=A0 create mode 100644 bsd-user/x86_64/target_arch_elf.h<br>
&gt;=C2=A0 create mode 100644 bsd-user/x86_64/target_arch_reg.h<br>
&gt;=C2=A0 create mode 100644 bsd-user/x86_64/target_arch_signal.h<br>
&gt;=C2=A0 create mode 100644 bsd-user/x86_64/target_arch_sigtramp.h<br>
&gt;=C2=A0 create mode 100644 bsd-user/x86_64/target_arch_thread.h<br>
&gt;=C2=A0 create mode 100644 bsd-user/x86_64/target_arch_vmparam.h<br>
&gt; <br>
<br>
</blockquote></div></div>

--00000000000052497d05cbaa0299--

