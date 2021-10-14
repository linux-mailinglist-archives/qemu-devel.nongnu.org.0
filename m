Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA4342D33C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 09:06:42 +0200 (CEST)
Received: from localhost ([::1]:47662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maup7-0007Q2-VW
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 03:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1maumm-0005RI-12
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 03:04:16 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:51324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1maumk-0000xQ-79
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 03:04:15 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-0EgssNTSOxGBd8DYUdrd9A-1; Thu, 14 Oct 2021 03:04:02 -0400
X-MC-Unique: 0EgssNTSOxGBd8DYUdrd9A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C25D71922963;
 Thu, 14 Oct 2021 07:04:01 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5FCD60CC4;
 Thu, 14 Oct 2021 07:04:00 +0000 (UTC)
Date: Thu, 14 Oct 2021 09:03:59 +0200
From: Greg Kurz <groug@kaod.org>
To: Will Cohen <wwcohen@gmail.com>
Subject: Re: [PATCH 00/11] 9p: Add support for Darwin
Message-ID: <20211014090359.0c0f7b4f@bahia.huguette>
In-Reply-To: <20211013230405.32170-1-wwcohen@gmail.com>
References: <20211013230405.32170-1-wwcohen@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Will,

It is strongly recommended that you Cc maintainers to increase the odds
they notice your patches in the flood of qemu-devel. FYI I only noticed
them because git-send-email Cc'd me thanks to the Reviewed-by: tags and
my address didn't change in the meantime. I'm thus Cc'ing Christian
who is the primary maintainer now (i.e. the person that can merge
your patches and send a PR for upstream inclusion).

FWIW git-publish [1] can Cc the relevant people for free.

[1] https://github.com/stefanha/git-publish

On Wed, 13 Oct 2021 19:03:54 -0400
Will Cohen <wwcohen@gmail.com> wrote:

> This is a continuation of a patch series adding 9p server support for Dar=
win,
> originally submitted by Keno Fischer in mid-2018
> (https://lists.nongnu.org/archive/html/qemu-devel/2018-06/msg04643.html).=
 In
> some sense, this could be considered [PATCH v4] of that process, but I as=
sume
> that the multi-year gap merits a fresh start..
>=20

This makes sense. For consistency with that assumption, it would also
make sense to clear all preexisting Reviewed-by: tags.

> It has since been updated and rebased for NixOS by Michael Roitzsch
> (https://github.com/NixOS/nixpkgs/pull/122420) with a goal of resubmittin=
g
> upstream. I am submitting his patch set as suggested, as developed by Mic=
hael,
> with his Signed-off-by headers included in full.
>=20

QEMU cares about tracking of who did what and follows a policy inspired
from the linux kernel [2] [3].

Michael's Signed-off-by: should then appear on all patches, with a
mention of the extra changes that he made, e.g.

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
[Michael Roitzsch: - rebased for NixOS
                   - some other change]
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>

If no changes were made, you still need to add a Signed-off-by: tag.

[2] https://wiki.qemu.org/Contribute/SubmitAPatch
[3] http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/SubmittingPatches?id=3Df6f94e2ab1b33f0082ac22d71f66385a60d8157f#=
n297

> Additionally, I have run the patches through checkpatch.pl and adjusted c=
oding
> style accordingly (with the exception of ignoring warnings about avoid

Good ! If you have an account on gitlab, you can also push a branch there.
It will be submitted to gitlab CI and maybe give you the opportunity to
polish the patches some more before submission.

> architecture specific defines in hw/9pfs/9p-util-darwin.c, where they see=
m
> unavoidable), and have signed off on those modified commits.
>=20

As explained above, your Signed-off-by: is also needed in all patches,
even if you didn't change them.

Cheers,

--
Greg

>=20
>=20


