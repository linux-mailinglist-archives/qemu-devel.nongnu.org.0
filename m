Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D647322F1F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 10:43:49 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60119 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSdtc-0004t9-Qn
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 04:43:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48651)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hSds9-0004Kb-Sn
	for qemu-devel@nongnu.org; Mon, 20 May 2019 04:42:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hSds8-0003D1-QW
	for qemu-devel@nongnu.org; Mon, 20 May 2019 04:42:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:21733)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1hSds8-0003CT-L0; Mon, 20 May 2019 04:42:16 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 866C3C058CBD;
	Mon, 20 May 2019 08:42:15 +0000 (UTC)
Received: from gondolin (ovpn-204-110.brq.redhat.com [10.40.204.110])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2699B60BEC;
	Mon, 20 May 2019 08:42:06 +0000 (UTC)
Date: Mon, 20 May 2019 10:42:00 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
	Farhan Ali <alifm@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <20190520104200.391da02a.cohuck@redhat.com>
In-Reply-To: <20190507154733.28604-3-cohuck@redhat.com>
References: <20190507154733.28604-1-cohuck@redhat.com>
	<20190507154733.28604-3-cohuck@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 20 May 2019 08:42:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v4 2/2] vfio-ccw: support async command
 subregion
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
Cc: qemu-s390x@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue,  7 May 2019 17:47:33 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> A vfio-ccw device may provide an async command subregion for
> issuing halt/clear subchannel requests. If it is present, use
> it for sending halt/clear request to the device; if not, fall
> back to emulation (as done today).
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  hw/s390x/css.c              |  27 +++++++--
>  hw/vfio/ccw.c               | 110 +++++++++++++++++++++++++++++++++++-
>  include/hw/s390x/s390-ccw.h |   3 +
>  3 files changed, 134 insertions(+), 6 deletions(-)

Ping. I'd like to include this in my next QEMU pull request; any
comments?

(I already have a headers update queued.)

