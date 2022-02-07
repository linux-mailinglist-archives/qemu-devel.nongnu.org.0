Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE944AC1E4
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 15:54:11 +0100 (CET)
Received: from localhost ([::1]:34528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH5P7-0003ZY-TI
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 09:54:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nH5Ix-0005xI-7K
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:47:47 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:42511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nH5Iv-00026X-1n
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 09:47:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=XHwZTDxhOM8sBauV61Keb5jgCSq3ErV9D5cFWSqa3dw=; b=g/gVakh0owYEkuw0mPUDpm3Kx6
 D7NWkvQ/pS1hMoSQQK2Ud01/M6E/3K3X2bhrkOH5oxyy2cwgpb6NQTrrO+fnmslF0vLxyjTj3E5w3
 MsyNaWFDldo1QRCPjP0BhhT523YvZlhSkqvN2wsolQ1hTXWglrS1bX32i5XW6OI5IMAuWiqUFKvoG
 2DD04q4OBSxgc07EStHd+09RvF0S97faWQ2iTPF9Vif5BWkM7FcvnJSJraCDfmMG3JsZoQOjX2oE8
 AfCn3gyCFTfqbS8cxWOY0NE3/niqCMZhG8Xf5WF9cwyx/kaWh7smqJsln+Tu5gwXM4PwXHpR9Avwk
 cDFJpt8Ed83yLt3px+LRuT/UvqxHR/LBCH1CFTgImNukWNCNAOy49h6zq9pYJbw28w/SWuGH4X1iq
 wl1VEsgb63PQnMrXhoBxPnFDuP53wT5w4aRbvP9/zJ/UmX4zmjSPFXgH7XoTUlUT2vMwAYl+Q334b
 PCypEuW8Kiw10O/oXGihSWJpfhH5SBjmnYWN+JN0dlCohRD8iuKcWYTXNavl9S5w8z8Lh6V32maO6
 z2tALFA2lnIu4bnvCkXlpA3LYdOlDIru7p+8xxOJbuOtgsO05Cm192vDGF86zsV50M4SVOawhdO+P
 UqjzTOop8N0yecJpba121K64VWTgZifHVtdAG+w5c=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Will Cohen <wwcohen@gmail.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, hi@alyssa.is,
 Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v4 00/11] 9p: Add support for darwin
Date: Mon, 07 Feb 2022 15:47:36 +0100
Message-ID: <2607115.euRFimgOtO@silver>
In-Reply-To: <20220206200719.74464-1-wwcohen@gmail.com>
References: <20220206200719.74464-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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

On Sonntag, 6. Februar 2022 21:07:08 CET Will Cohen wrote:
> This is a followup to
> https://lists.nongnu.org/archive/html/qemu-devel/2022-01/msg05993.html,
> adding 9p server support for Darwin.
>=20
> Since v3, the following changes have been made:
>=20
> - Move XATTR_SIZE_MAX to P9_XATTR_SIZE MAX in 9p.h, and provide explanato=
ry
> context as preliminary solution - Add explanatory note surrounding
> virtio-9p-test with output of pre-patch failing test - Remove superfluous
> header guards from file-opt-9p
> - Add note about virtfs-proxy-helper being disabled on non-linux for this
> patch series - Note radar filed with Apple for missing mknodat syscall
> - Replace direct syscall to pthread_fchdir with pthread_fchdir_np, and add
> check for this function=E2=80=99s presence in meson - Ensure that d_seeko=
ff is
> filled using telldir on darwin, and create qemu_dirent_off helper to deci=
de
> which to access. - Ensure that [amc]tim.tv_sec are all initialized
> alongside [amc]tim.tv_nsec in 9p-proxy - Ensure that all patch email
> addresses are valid
> - Add telldir error handling for dirent on darwin

As this series already has seen some revisions and is on a good way to beco=
me=20
queued soon: it is helpful to immediately see here which patches exactly go=
t=20
changed, because some of the patches already look fine.

=46or already reviewed patches that you won't change: you can take over peo=
ple's=20
reviewed-by tags in the next revision.

Best regards,
Christian Schoenebeck

> Keno Fischer (10):
>   9p: linux: Fix a couple Linux assumptions
>   9p: Rename 9p-util -> 9p-util-linux
>   9p: darwin: Handle struct stat(fs) differences
>   9p: darwin: Handle struct dirent differences
>   9p: darwin: Ignore O_{NOATIME, DIRECT}
>   9p: darwin: Move XATTR_SIZE_MAX->P9_XATTR_SIZE_MAX
>   9p: darwin: *xattr_nofollow implementations
>   9p: darwin: Compatibility for f/l*xattr
>   9p: darwin: Implement compatibility for mknodat
>   9p: darwin: meson: Allow VirtFS on Darwin
>=20
> Will Cohen (1):
>   9p: darwin: Adjust assumption on virtio-9p-test
>=20
>  fsdev/file-op-9p.h                     |  9 ++-
>  fsdev/meson.build                      |  1 +
>  hw/9pfs/9p-local.c                     | 28 ++++++--
>  hw/9pfs/9p-proxy.c                     | 38 ++++++++++-
>  hw/9pfs/9p-synth.c                     |  6 ++
>  hw/9pfs/9p-util-darwin.c               | 91 ++++++++++++++++++++++++++
>  hw/9pfs/{9p-util.c =3D> 9p-util-linux.c} |  7 +-
>  hw/9pfs/9p-util.h                      | 38 +++++++++++
>  hw/9pfs/9p.c                           | 50 ++++++++++++--
>  hw/9pfs/9p.h                           | 11 ++++
>  hw/9pfs/codir.c                        |  7 ++
>  hw/9pfs/meson.build                    |  3 +-
>  include/qemu/xattr.h                   |  4 +-
>  meson.build                            | 14 ++--
>  tests/qtest/virtio-9p-test.c           |  2 +-
>  15 files changed, 285 insertions(+), 24 deletions(-)
>  create mode 100644 hw/9pfs/9p-util-darwin.c
>  rename hw/9pfs/{9p-util.c =3D> 9p-util-linux.c} (90%)



