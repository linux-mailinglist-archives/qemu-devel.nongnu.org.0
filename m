Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E34332E99
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 13:26:58 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33353 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXl7B-0005rW-9L
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 07:26:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48945)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hXl37-0002jP-0a
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 07:22:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hXkqz-0002R2-LQ
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 07:10:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32609)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hXkqy-0002MT-FH; Mon, 03 Jun 2019 07:10:12 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DCEDD1796;
	Mon,  3 Jun 2019 11:10:05 +0000 (UTC)
Received: from linux.fritz.box (ovpn-116-129.ams2.redhat.com [10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A55F5C296;
	Mon,  3 Jun 2019 11:09:58 +0000 (UTC)
Date: Mon, 3 Jun 2019 13:09:56 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Kenneth Heitke <kenneth.heitke@intel.com>
Message-ID: <20190603110956.GC6523@linux.fritz.box>
References: <20190520174030.1647-1-kenneth.heitke@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190520174030.1647-1-kenneth.heitke@intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 03 Jun 2019 11:10:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2] nvme: add Get/Set Feature Timestamp
 support
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
Cc: klaus@birkelund.eu, qemu-block@nongnu.org, qemu-devel@nongnu.org,
	mreitz@redhat.com, keith.busch@intel.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 20.05.2019 um 19:40 hat Kenneth Heitke geschrieben:
> Signed-off-by: Kenneth Heitke <kenneth.heitke@intel.com>

Thanks, applied to the block branch.

Kevin

