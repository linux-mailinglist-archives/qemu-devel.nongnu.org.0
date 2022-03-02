Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B75A84CAD6F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:23:40 +0100 (CET)
Received: from localhost ([::1]:45988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTdT-0004DO-OX
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:23:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nPTVX-0004PL-1N
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:15:35 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:57115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nPTVV-0000dG-2b
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:15:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=zrj+ZQAp2AshdZtiSOXk8QFP8OYod77IjopjlhEwr6Q=; b=YTsKvoeIHGRkztDU/WfnPSsWf0
 1Kl2w4US5KQ3YPri/f9XdY/oIWCpMN67do3sdBSFGFObLQKu/QSKFfBKHqukQtiUnkMPE3ZlL/azw
 45gFN8rp44v/lSa2n3AA1HgTEpOtei/d6aMVb+jUqtJxYiWFtGq4VtHZRXY0pYLdL1bv2441+lQEe
 ziuCyKRlYxmNXXvzkteB4zAPDLSHvhmmYYvNjv2K8vqCzXoOfNIIhzCPiQXf0QYIXJQUhmo3j+b/0
 S0G/CIfjDZECjyGysibEzL5ubFqeQRkmO06H32Ma1T9buh6YxHX7co8MbkhMxOjbrehTRgkZI9LUR
 yOW2WdGGPDDKZ8kMFPtsd6y9yP0NPq5KZtI0dsGjljL03a0QwqSLxQVXmTRrB8ndpZRFmwKm548u7
 3ZjBiPzglJo9cD8qeEG6UN46xZHGnaAalU+225mgnP0i6xB3T5iJHTxQLmYh34ax74cg+vJsaCncm
 Aa2HWeqyhiOoTd0j6tIh9lai7m8pVF3WnfCAJvtRo2GjCBlOx4vHRMqqucxBNcwTiNIdb8RKEqZJe
 P7akrHbq9Yhkq4Zk3D7SnxUF8wrkVbY5dRz9oO1k/XZe8WWdnwhoybyAVEUj5fAw0uQp2IMvwXrbq
 9XqmJycfSaUD3Ya/6fWj+waH6IW+rYUDmkFB7wur8=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>, hi@alyssa.is,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v9 00/11] 9p: Add support for darwin
Date: Wed, 02 Mar 2022 19:15:15 +0100
Message-ID: <2972890.YtAkxDjzbR@silver>
In-Reply-To: <CAB26zV12OjbDv7uUHqar6-j4cLqD2Mz3yR28qy-N3v2pu96Nyg@mail.gmail.com>
References: <20220227223522.91937-1-wwcohen@gmail.com>
 <3049778.kzlV3qucMN@silver>
 <CAB26zV12OjbDv7uUHqar6-j4cLqD2Mz3yR28qy-N3v2pu96Nyg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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

On Dienstag, 1. M=E4rz 2022 21:09:27 CET Will Cohen wrote:
> On Tue, Mar 1, 2022 at 2:25 PM Christian Schoenebeck
> <qemu_oss@crudebyte.com>
> wrote:
> > On Sonntag, 27. Februar 2022 23:35:11 CET Will Cohen wrote:
> > > This is a followup to
> > > https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg04391.html,
> >=20
> > adding
> >=20
> > > 9p server support for Darwin.
> > >=20
> > > Since v8, the following changes have been made:
> > >=20
> > > Patch 4/11 (9p: darwin: Handle struct dirent differences)
> > > - Declare qemu_dirent_off as static to prevent linker error
> > > - Move qemu_dirent_off above the end-of-file endif to fix compilation
> > >=20
> > > Patch 9/11 (9p: darwin: Implement compatibility for mknodat)
> > > - Fix line over 90 characters formatting error
> > > - Move qemu_mknodat back from osdep to 9p-util and adjust patch notes
> > > accordingly
> > >=20
> > > Patch 11/11 (9p: darwin: meson: Allow VirtFS on Darwin)
> > > - Rebase to master
> > >=20
> > > With these changes, this patch set builds and passes 9p synth tests on
> >=20
> > both
> >=20
> > > linux and darwin.
> > >=20
> > > Keno Fischer (10):
> > >   9p: linux: Fix a couple Linux assumptions
> > >   9p: Rename 9p-util -> 9p-util-linux
> > >   9p: darwin: Handle struct stat(fs) differences
> > >   9p: darwin: Handle struct dirent differences
> > >   9p: darwin: Ignore O_{NOATIME, DIRECT}
> > >   9p: darwin: Move XATTR_SIZE_MAX->P9_XATTR_SIZE_MAX
> > >   9p: darwin: *xattr_nofollow implementations
> > >   9p: darwin: Compatibility for f/l*xattr
> > >   9p: darwin: Implement compatibility for mknodat
> > >   9p: darwin: meson: Allow VirtFS on Darwin
> > >=20
> > > Will Cohen (1):
> > >   9p: darwin: Adjust assumption on virtio-9p-test
> > > =20
> > >  fsdev/file-op-9p.h                     |  9 ++-
> > >  fsdev/meson.build                      |  1 +
> > >  hw/9pfs/9p-local.c                     | 27 +++++--
> > >  hw/9pfs/9p-proxy.c                     | 38 +++++++++-
> > >  hw/9pfs/9p-synth.c                     |  6 ++
> > >  hw/9pfs/9p-util-darwin.c               | 97 ++++++++++++++++++++++++=
++
> > >  hw/9pfs/{9p-util.c =3D> 9p-util-linux.c} |  8 ++-
> > >  hw/9pfs/9p-util.h                      | 46 ++++++++++++
> > >  hw/9pfs/9p.c                           | 42 +++++++++--
> > >  hw/9pfs/9p.h                           | 18 +++++
> > >  hw/9pfs/codir.c                        |  4 +-
> > >  hw/9pfs/meson.build                    |  3 +-
> > >  include/qemu/xattr.h                   |  4 +-
> > >  meson.build                            | 13 ++--
> > >  tests/qtest/virtio-9p-test.c           |  2 +-
> > >  15 files changed, 292 insertions(+), 26 deletions(-)
> > >  create mode 100644 hw/9pfs/9p-util-darwin.c
> > >  rename hw/9pfs/{9p-util.c =3D> 9p-util-linux.c} (90%)
> >=20
> > Queued on 9p.next:
> > https://github.com/cschoenebeck/qemu/commits/9p.next
> >=20
> > Thanks!
>=20
> This is very exciting. Many, many thanks for helping guide this through t=
he
> process!

Thanks for not giving up. ;-)

I plan to send a PR on Friday to avoid the deadline traffic next week.

Best regards,
Christian Schoenebeck



