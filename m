Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD86F15DE8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 09:10:43 +0200 (CEST)
Received: from localhost ([127.0.0.1]:41267 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNuFN-0004A9-Ao
	for lists+qemu-devel@lfdr.de; Tue, 07 May 2019 03:10:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45396)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hNuEC-0003hQ-3c
	for qemu-devel@nongnu.org; Tue, 07 May 2019 03:09:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hNuEB-0007PE-6e
	for qemu-devel@nongnu.org; Tue, 07 May 2019 03:09:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52590)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hNuEB-0007N1-1V
	for qemu-devel@nongnu.org; Tue, 07 May 2019 03:09:27 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 169EB59441;
	Tue,  7 May 2019 07:09:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
	[10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 50977377F;
	Tue,  7 May 2019 07:09:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 7A1BB11AA3; Tue,  7 May 2019 09:09:20 +0200 (CEST)
Date: Tue, 7 May 2019 09:09:20 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: P J P <ppandit@redhat.com>
Message-ID: <20190507070920.jnf46nw4kbihgvaw@sirius.home.kraxel.org>
References: <20190425063534.32747-1-ppandit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190425063534.32747-1-ppandit@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 07 May 2019 07:09:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] qxl: check release info object
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
Cc: Bugs SysSec <bugs-syssec@rub.de>, QEMU Developers <qemu-devel@nongnu.org>,
	Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 25, 2019 at 12:05:34PM +0530, P J P wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
> 
> When releasing spice resources in release_resource() routine,
> if release info object 'ext.info' is null, it leads to null
> pointer dereference. Add check to avoid it.

Added to vga patch queue.

thanks,
  Gerd


