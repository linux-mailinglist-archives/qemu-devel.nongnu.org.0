Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B794AE20
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 00:49:15 +0200 (CEST)
Received: from localhost ([::1]:33980 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdMug-0002Hx-CK
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 18:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55631)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <brogers@suse.com>) id 1hdMta-0001na-2A
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 18:48:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <brogers@suse.com>) id 1hdMtZ-0005NQ-34
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 18:48:06 -0400
Received: from prv-mh.provo.novell.com ([137.65.248.74]:45095)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <brogers@suse.com>) id 1hdMtY-0005JM-Pt
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 18:48:05 -0400
Received: from INET-PRV-MTA by prv-mh.provo.novell.com
 with Novell_GroupWise; Tue, 18 Jun 2019 16:48:00 -0600
Message-Id: <5D096A9302000048000A1D8C@prv-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 18 Jun 2019 16:49:55 -0600
From: "Bruce Rogers" <brogers@suse.com>
To: <peter.maydell@linaro.org>,<qemu-devel@nongnu.org>,
 <jsnow@redhat.org>
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 137.65.248.74
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: [Qemu-devel] Recent python-sphinx errors out building doc
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I build recent upstream qemu in the openSUSE Build Service, and for
the Factory repository there, python-sphinx was recently updated to
version 2.1.1. This caused the build to fail as follows:
/home/abuild/rpmbuild/BUILD/qemu-4.0.50/docs/interop/bitmaps.rst:202:Could =
not lex literal_block as "json". Highlighting skipped.

The python-sphinx tools is called with warnings are treated as errors
it looks like. I don't know much at all about this tool, and hopefully
 someone knows what to fix here. If you want to give me a pointer
on what needs to change, I could give a go at doing a fix however.

Thanks,

Bruce


