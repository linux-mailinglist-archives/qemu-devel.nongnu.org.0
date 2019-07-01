Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2893015FD8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 10:55:01 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42547 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNvsK-0002T4-AC
	for lists+qemu-devel@lfdr.de; Tue, 07 May 2019 04:55:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hNvqU-0001hp-Oo
	for qemu-devel@nongnu.org; Tue, 07 May 2019 04:53:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hNvqT-0003pD-Qr
	for qemu-devel@nongnu.org; Tue, 07 May 2019 04:53:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55496)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hNvqR-0003nf-Qr; Tue, 07 May 2019 04:53:03 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 235E986658;
	Tue,  7 May 2019 08:53:03 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-186.ams2.redhat.com
	[10.36.116.186])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B26BA171C5;
	Tue,  7 May 2019 08:53:01 +0000 (UTC)
Date: Tue, 7 May 2019 10:53:00 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Message-ID: <20190507085300.GC5808@localhost.localdomain>
References: <20190507081256.27599-1-antonkuchin@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190507081256.27599-1-antonkuchin@yandex-team.ru>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 07 May 2019 08:53:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] block: remove bs from lists before closing
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
Cc: yc-core@yandex-team.ru, qemu-devel@nongnu.org, qemu-block@nongnu.org,
	Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.05.2019 um 10:12 hat Anton Kuchin geschrieben:
> Close involves flush that can be performed asynchronously and bs
> must be protected from being referenced before it is deleted.
> 
> Signed-off-by: Anton Kuchin <antonkuchin@yandex-team.ru>

Thanks, applied to the block branch.

Kevin

