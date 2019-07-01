Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F172F9A2
	for <lists+qemu-devel@lfdr.de>; Thu, 30 May 2019 11:43:00 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50103 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWHaN-0002HO-Hf
	for lists+qemu-devel@lfdr.de; Thu, 30 May 2019 05:42:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47648)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hWHYE-0000vG-Ps
	for qemu-devel@nongnu.org; Thu, 30 May 2019 05:40:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hWHYD-0008Im-VG
	for qemu-devel@nongnu.org; Thu, 30 May 2019 05:40:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39058)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hWHYB-0008Fs-Ts; Thu, 30 May 2019 05:40:44 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0AF7030ADC78;
	Thu, 30 May 2019 09:40:43 +0000 (UTC)
Received: from linux.fritz.box (ovpn-116-119.ams2.redhat.com [10.36.116.119])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2734F6F921;
	Thu, 30 May 2019 09:40:41 +0000 (UTC)
Date: Thu, 30 May 2019 11:40:40 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Message-ID: <20190530094040.GC4890@linux.fritz.box>
References: <20190528195338.12376-1-mreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190528195338.12376-1-mreitz@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Thu, 30 May 2019 09:40:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] qemu-img: Fix options leakage in
 img_rebase()
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 28.05.2019 um 21:53 hat Max Reitz geschrieben:
> img_rebase() can leak a QDict in two occasions.  Fix it.
> 
> Coverity: CID 1401416
> Fixes: d16699b64671466b42079c45b89127aeea1ca565
> Fixes: 330c72957196e0ae382abcaa97ebf4eb9bc8574f
> Signed-off-by: Max Reitz <mreitz@redhat.com>

Is this based on some other patch? The second hunk doesn't apply.

Kevin

