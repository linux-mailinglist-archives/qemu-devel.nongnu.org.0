Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98ACC5825CA
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 13:41:35 +0200 (CEST)
Received: from localhost ([::1]:37174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGfPy-0003Yc-8b
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 07:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGfMI-00013M-V6
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 07:37:46 -0400
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:33675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGfMH-0000Hn-9H
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 07:37:46 -0400
Received: by mail-qv1-xf32.google.com with SMTP id cx10so542807qvb.0
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 04:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=a1UwHJj1k1EZCeTM/rjAIEUZUvzMU3SPOnisLuEcHO0=;
 b=QFrBAWANiW+bYUNAPivvJNdhWLD7APIYk2aEU1PSYA5QAnngNTq624yGxE7/5Jj7u0
 TRJuc74UgPeAwg6NZ7/kH8f9VzXPRVCk1b9pvvWdAfQDjH/RgAOr7h1ExFYL7t2SVlMm
 nw4JUXqwsyYJ5m3NcuDbKGwK0hHBZjxbmcRXf1YA5aCiQ10rJLJSqALH4ozvQneeHjba
 D2n1jsq8WdloqiHaMLsobFjgumcNZO+nYJkbuK7bnCKtKbCle6Majz6+YQwDmmAhHBvg
 9HkIWpo93rWQ9lMqLl96ccBG8Ec5yDnJbKujlCnd312uPk2sd4EH8toSLUrTXEZbJC/G
 3MEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=a1UwHJj1k1EZCeTM/rjAIEUZUvzMU3SPOnisLuEcHO0=;
 b=gWbMNyPulceQ+ubCWZ08rypOc3o0FDjq86ZBnwk/duF1GzUu4m4l8d8AzWNjhD610T
 CfVBcP/aCymnvCLBLcVNZ+jceGkKSNUmk19oRPf4B6BCDk0PIC+pAM8Ijgs07nRVsq/l
 S9YJBkogU8c4NGo0QxVYEwy2Mr2TWvWPvgbAfoZ11o1jEXVI+jq7v+BgCnZDOTFVdUEQ
 4n7/1fk9XNA59hwrb9p18wVPkW3J8yDOutY4qDd/D2IawoIc4+SXC0Szqu5RXpWtMzoD
 6LDkrK7jCqxc5O/Ad1/j04hl9FwSps5py54DlGXegJyYHb3h4XFkLID5EqCBFA6lKP8L
 enZA==
X-Gm-Message-State: AJIora/WrWR2KMHLJzCIfYKlZ4TgjqBDKOiwl+xbJEGCEwXZX3jYTntu
 vSwutlPylaQm8EV0xubgc99UcNMfrGwrnyE7JIE=
X-Google-Smtp-Source: AGRyM1t/UhymoAxYmuWNB5SB5yqjFwR0d2wpfdhbDRSh/De2IWplgRcUhz3s6NH1svzvQCuHbYnUYxnq5Ur/WndmZ1o=
X-Received: by 2002:a05:6214:1bca:b0:474:4a5:6ba8 with SMTP id
 m10-20020a0562141bca00b0047404a56ba8mr18627409qvc.114.1658921864221; Wed, 27
 Jul 2022 04:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220727073542.811420-1-bmeng.cn@gmail.com>
 <YuD/+ehoLlwvzopk@redhat.com>
 <CAEUhbmXR95LDOvPS6bRn5K4qeGLNXVVC0rtVAvGQsN7F8+VYQw@mail.gmail.com>
 <YuESQP8hEzJiDc7D@redhat.com>
In-Reply-To: <YuESQP8hEzJiDc7D@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 27 Jul 2022 19:37:33 +0800
Message-ID: <CAEUhbmUW2nDnwFRfhCxNot3io7m3LRBAjk3xSbo7rok5977JXw@mail.gmail.com>
Subject: Re: [PATCH 0/5] Enable unix socket support on Windows
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Jul 27, 2022 at 6:24 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Wed, Jul 27, 2022 at 06:15:50PM +0800, Bin Meng wrote:
> > On Wed, Jul 27, 2022 at 5:06 PM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com> wrote:
> > >
> > > On Wed, Jul 27, 2022 at 03:35:37PM +0800, Bin Meng wrote:
> > > > Support for the unix socket has existed both in BSD and Linux for t=
he
> > > > longest time, but not on Windows. Since Windows 10 build 17063 [1],
> > > > the native support for the unix socket has came to Windows. Startin=
g
> > > > this build, two Win32 processes can use the AF_UNIX address family
> > > > over Winsock API to communicate with each other.
> > > >
> > > > Introduce a new build time config option CONFIG_AF_UNIX when the bu=
ild
> > > > host has such a capability, and a run-time check afunix_available()=
 for
> > > > Windows host in the QEMU sockets util codes.
> > > >
> > > > [1] https://devblogs.microsoft.com/commandline/af_unix-comes-to-win=
dows/
> > > >
> > > >
> > > > Bin Meng (5):
> > > >   util/qemu-sockets: Replace the call to close a socket with
> > > >     closesocket()
> > > >   util/oslib-win32: Add a helper to get the Windows version
> > > >   qga/commands-win32: Use os_get_win_version()
> > > >   util/qemu-sockets: Enable unix socket support on Windows
> > > >   chardev/char-socket: Update AF_UNIX for Windows
> > > >
> > > >  meson.build               |  6 +++++
> > > >  include/sysemu/os-win32.h |  2 ++
> > > >  chardev/char-socket.c     |  8 +++++-
> > > >  qga/commands-win32.c      | 27 +-------------------
> > > >  util/oslib-win32.c        | 15 +++++++++++
> > > >  util/qemu-sockets.c       | 52 ++++++++++++++++++++++++++++++++---=
----
> > > >  6 files changed, 74 insertions(+), 36 deletions(-)
> > >
> > > What about net/socket.c ?
> >
> > It looks net/socket.c does not need to adapt.
> >
> > > Also there are many tests using AF_UNIX and this doesn't appear to
> > > have enablede any of them.  I'd at least exepct to see  the sockets
> > > tests-io-channel-socket.c test enabled to prove this functionality
> > > is working.
> > >
> >
> > Enabling qtest to run on Windows is underway but that's a separate
> > topic. The qtest itself is using unix socket so as long as we can run
> > qtest on Windows, we should be fine.
> > I feel this series is independent enough of being a standalone one.
>
> That isn't qtest, that is basic unit tests. I would expect those to
> be able to work with this series
>

Ah, I see. Agreed, will do in v2.

Regards,
Bin

