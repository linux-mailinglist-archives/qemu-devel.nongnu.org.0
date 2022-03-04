Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BBD4CD2B1
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 11:45:03 +0100 (CET)
Received: from localhost ([::1]:50874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ5Qk-0004S1-JM
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 05:45:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nQ5K0-0003R0-01
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:38:04 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:37975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nQ5Jy-0002XV-2Y
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:38:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=7rMSmOuSos6jNRlmpA73mDXyNwl1f2ViBT5xeAdZK00=; b=T6zhgaYGQXpj8YPWFSFc5ual+Z
 vFvypVRsg6y0urPWnc/AwaerXgnBfuTIsHByOVd4gCfzZbmCk7wC3H8eLdQg/vyQXMUTmpUboptOW
 9B9iwhEoWVy7QbUKYGkIyyAvhTdFzix2gxKZ0l6KWZ7DEdv6lcdkLqtkgH9QKRA5lAksOfftnYg9P
 UfFPxLssFmdNobE0oXwvJuaEYyGi/QdrlnUX0z3xbSGZRoFHo+bQpkGX4Lyd2dCsdGhA/u7eSeAuz
 C4s7xOCB8XvIyVLGo3FF9qzW9I93Iv9zr/RFounAPnqDeuScpiDfH0ln6YAOAifLKFFEoExpKjzPl
 y+lBDKcmS8HRJCrB7KwYumllFk+oLqsCN9LyePkJF3w5jb2w7UbifjP4/9cztKkdRb4LFA9LwVJNg
 uMnxK6IReutSMTUjDeEl9eWzMn0GFX2ZUa4e7P9Roe4OJQDSPv5w0CKPl0jzHnogF7QqH5l28deUB
 PsH0h4vprJY6mMJkKTfeDF2F7iU+old+pxvD9pKm518q0kQZ61cLZmcDfSy4v0tOSsi+cN1yL8f0Q
 4JI+BNpU4UlSgusy12SrgOvruCAuUA8yO498IDiqPXhbNSdXhmiynqOHjEeRl3387xOXIZquizfOj
 iT5aJSufMEukiehXsUS0RHgzKToYUtsYZ7OTp2hvM=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 0/6] 9pfs: convert Doxygen -> kerneldoc format
Date: Fri, 04 Mar 2022 11:37:59 +0100
Message-ID: <3242673.3tbDvF02Ey@silver>
In-Reply-To: <20220304083936.2e0ceb02@bahia>
References: <cover.1646314856.git.qemu_oss@crudebyte.com>
 <20220304083936.2e0ceb02@bahia>
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

On Freitag, 4. M=E4rz 2022 08:39:36 CET Greg Kurz wrote:
> On Thu, 3 Mar 2022 14:40:56 +0100
>=20
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > This patch set converts occurrences of API doc comments from Doxygen
> > format
> > into kerneldoc format. No behaviour change whatsoever.
> >=20
> > Christian Schoenebeck (6):
> >   9pfs/9p.h: convert Doxygen -> kerneldoc format
> >   9pfs/codir.c: convert Doxygen -> kerneldoc format
> >   9pfs/9p.c: convert Doxygen -> kerneldoc format
> >   9pfs/9p-util.h: convert Doxygen -> kerneldoc format
> >   9pfs/coth.h: drop Doxygen format on v9fs_co_run_in_worker()
> >   fsdev/p9array.h: convert Doxygen -> kerneldoc format
> > =20
> >  fsdev/p9array.h   | 38 ++++++++++++++++-------------
> >  hw/9pfs/9p-util.h | 10 ++++----
> >  hw/9pfs/9p.c      | 62 ++++++++++++++++++++++++++---------------------
> >  hw/9pfs/9p.h      | 12 ++++-----
> >  hw/9pfs/codir.c   | 30 +++++++++++------------
> >  hw/9pfs/coth.h    |  4 +--
> >  6 files changed, 84 insertions(+), 72 deletions(-)
>=20
> LGTM.
>=20
> Reviewed-by: Greg Kurz <groug@kaod.org>

Great, then I can take this into today's PR as well.

Thanks!

Best regards,
Christian Schoenebeck



