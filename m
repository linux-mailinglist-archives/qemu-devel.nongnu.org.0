Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5953323D8E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 18:34:12 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38284 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSlEp-0006mR-FH
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 12:34:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38888)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hSkxG-0000FM-8l
	for qemu-devel@nongnu.org; Mon, 20 May 2019 12:16:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hSkxE-0003ne-MC
	for qemu-devel@nongnu.org; Mon, 20 May 2019 12:16:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:7635)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hSkx4-0003hr-PJ; Mon, 20 May 2019 12:15:52 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E2ECEC04BE32;
	Mon, 20 May 2019 16:15:42 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-208.ams2.redhat.com
	[10.36.117.208])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 03DC3601A0;
	Mon, 20 May 2019 16:15:41 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 20 May 2019 18:14:48 +0200
Message-Id: <20190520161453.30723-20-kwolf@redhat.com>
In-Reply-To: <20190520161453.30723-1-kwolf@redhat.com>
References: <20190520161453.30723-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 20 May 2019 16:15:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 19/24] qemu-img.texi: Be specific about JSON
 object types
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

Just writing that --output=3Djson outputs JSON information does not reall=
y
help; we should also make a note of what QAPI type the result object
has.  (The map subcommand does not emit a QAPI-typed object, but its
section already describes the object structure well enough.)

Signed-off-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qemu-img.texi | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/qemu-img.texi b/qemu-img.texi
index 724f244ba1..39562317ee 100644
--- a/qemu-img.texi
+++ b/qemu-img.texi
@@ -230,6 +230,7 @@ overridden with a pattern byte specified by @var{patt=
ern}.
=20
 Perform a consistency check on the disk image @var{filename}. The comman=
d can
 output in the format @var{ofmt} which is either @code{human} or @code{js=
on}.
+The JSON output is an object of QAPI type @code{ImageCheck}.
=20
 If @code{-r} is specified, qemu-img tries to repair any inconsistencies =
found
 during the check. @code{-r leaks} repairs only cluster leaks, whereas
@@ -406,8 +407,7 @@ The size syntax is similar to dd(1)'s size syntax.
 Give information about the disk image @var{filename}. Use it in
 particular to know the size reserved on disk which can be different
 from the displayed size. If VM snapshots are stored in the disk image,
-they are displayed too. The command can output in the format @var{ofmt}
-which is either @code{human} or @code{json}.
+they are displayed too.
=20
 If a disk image has a backing file chain, information about each disk im=
age in
 the chain can be recursively enumerated by using the option @code{--back=
ing-chain}.
@@ -424,6 +424,10 @@ To enumerate information about each disk image in th=
e above chain, starting from
 qemu-img info --backing-chain snap2.qcow2
 @end example
=20
+The command can output in the format @var{ofmt} which is either @code{hu=
man} or
+@code{json}.  The JSON output is an object of QAPI type @code{ImageInfo}=
; with
+@code{--backing-chain}, it is an array of @code{ImageInfo} objects.
+
 @item map [--object @var{objectdef}] [--image-opts] [-f @var{fmt}] [--ou=
tput=3D@var{ofmt}] [-U] @var{filename}
=20
 Dump the metadata of image @var{filename} and its backing file chain.
@@ -485,7 +489,8 @@ Calculate the file size required for a new image.  Th=
is information can be used
 to size logical volumes or SAN LUNs appropriately for the image that wil=
l be
 placed in them.  The values reported are guaranteed to be large enough t=
o fit
 the image.  The command can output in the format @var{ofmt} which is eit=
her
-@code{human} or @code{json}.
+@code{human} or @code{json}.  The JSON output is an object of QAPI type
+@code{BlockMeasureInfo}.
=20
 If the size @var{N} is given then act as if creating a new empty image f=
ile
 using @command{qemu-img create}.  If @var{filename} is given then act as=
 if
--=20
2.20.1


