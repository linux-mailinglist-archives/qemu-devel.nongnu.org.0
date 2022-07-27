Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8E058240D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 12:20:11 +0200 (CEST)
Received: from localhost ([::1]:40074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGe9C-0003PR-8w
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 06:20:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGe5D-0000kG-Ec
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 06:16:03 -0400
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:44889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGe5B-0002fU-Nf
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 06:16:03 -0400
Received: by mail-qv1-xf32.google.com with SMTP id b11so8017465qvo.11
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 03:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/38pYSz5HWc7EArFd+LOz4D0bCzQF5Q2aBqWNBc5KY0=;
 b=kJ25yFju6m3A35mPZ5/anMKIm/5SZwSraiZfjCWrsaYAQA3jlKUwgNiM7OMSIoevVx
 e7+lFua50/ABywEKYpRYLoc2C8HKALbdtm3rzhodn+uKqseCc4KbAHEw/iJgaM+1DTMp
 2FKNlwO4GlaF5rvHF8xEv4e6evd+mv0C3pczrVkwGfIxZjDuAjEbF7C8l9lLq9h+qsxX
 yIL3zav5c28TTznjrZZruUS2e8thOKknJO+Co0GlY2DRGqW3ewaHow4NjlUp6xhSVcB2
 dKc2WCf4SdYHmv0gJhtNwVdLwS/wgLXuoJL0Ehs7nifmx1uMw7dDfKDoc2xRCg54FQS7
 NeOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/38pYSz5HWc7EArFd+LOz4D0bCzQF5Q2aBqWNBc5KY0=;
 b=CF6BrmsOTSr8Nq5ey8k3ONVZYazRhjksv4mxyjP2nSHkjBHeP8Pby873MgD+w/Ah1J
 xvLyOqD7hTuApH0PsNeTCGKKlDrqwd3RIlXfMBBXemyshvI0/7Xk0dGTOBbG7Bt+kPi3
 xIxjixfpo0ts6Tfc1pDTqXKkBb7MgSkajZXPg1h7LuI/dwSbSplKjLsKtaLbbMw7nYgK
 5u618lmILnFGREcZdtvre8D6GLUS8D+AlLp+VThMbkVaofgUQsyI/ejtvVVlH6QCNH2a
 9MTK4H9WKhPkFF4xlTiqOOXarcyj9lv0ubjYApqDQanc0MLEgCdE5hSkG86fEFwYsAMf
 3CfA==
X-Gm-Message-State: AJIora8ekrNJfJDBmB1oQx+eoaHVDJ5j/uhhmCSgUc+yCrE7YiJqAV+y
 dBuR543J7OisxvKr7uLePb8fKDsseJbV6iQ3ly0=
X-Google-Smtp-Source: AGRyM1s2JGigfUyjixC2jcllQTN09UvDsQjehUE2we2RHFx42wZDnJNSny4h/u2OnU76zdb+yoRmBHdXupe6yLMxFGw=
X-Received: by 2002:a05:6214:242d:b0:473:7c45:635e with SMTP id
 gy13-20020a056214242d00b004737c45635emr18094771qvb.12.1658916960954; Wed, 27
 Jul 2022 03:16:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220727073542.811420-1-bmeng.cn@gmail.com>
 <YuD/+ehoLlwvzopk@redhat.com>
In-Reply-To: <YuD/+ehoLlwvzopk@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 27 Jul 2022 18:15:50 +0800
Message-ID: <CAEUhbmXR95LDOvPS6bRn5K4qeGLNXVVC0rtVAvGQsN7F8+VYQw@mail.gmail.com>
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

On Wed, Jul 27, 2022 at 5:06 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Wed, Jul 27, 2022 at 03:35:37PM +0800, Bin Meng wrote:
> > Support for the unix socket has existed both in BSD and Linux for the
> > longest time, but not on Windows. Since Windows 10 build 17063 [1],
> > the native support for the unix socket has came to Windows. Starting
> > this build, two Win32 processes can use the AF_UNIX address family
> > over Winsock API to communicate with each other.
> >
> > Introduce a new build time config option CONFIG_AF_UNIX when the build
> > host has such a capability, and a run-time check afunix_available() for
> > Windows host in the QEMU sockets util codes.
> >
> > [1] https://devblogs.microsoft.com/commandline/af_unix-comes-to-windows=
/
> >
> >
> > Bin Meng (5):
> >   util/qemu-sockets: Replace the call to close a socket with
> >     closesocket()
> >   util/oslib-win32: Add a helper to get the Windows version
> >   qga/commands-win32: Use os_get_win_version()
> >   util/qemu-sockets: Enable unix socket support on Windows
> >   chardev/char-socket: Update AF_UNIX for Windows
> >
> >  meson.build               |  6 +++++
> >  include/sysemu/os-win32.h |  2 ++
> >  chardev/char-socket.c     |  8 +++++-
> >  qga/commands-win32.c      | 27 +-------------------
> >  util/oslib-win32.c        | 15 +++++++++++
> >  util/qemu-sockets.c       | 52 ++++++++++++++++++++++++++++++++-------
> >  6 files changed, 74 insertions(+), 36 deletions(-)
>
> What about net/socket.c ?

It looks net/socket.c does not need to adapt.

> Also there are many tests using AF_UNIX and this doesn't appear to
> have enablede any of them.  I'd at least exepct to see  the sockets
> tests-io-channel-socket.c test enabled to prove this functionality
> is working.
>

Enabling qtest to run on Windows is underway but that's a separate
topic. The qtest itself is using unix socket so as long as we can run
qtest on Windows, we should be fine.
I feel this series is independent enough of being a standalone one.

> There are a few other AF_UNIX references in teh code, though many
> seems to be Linux specific.

Regards,
Bin

