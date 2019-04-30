Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B53D8F569
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 13:22:14 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43458 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLQpx-0001ly-4i
	for lists+qemu-devel@lfdr.de; Tue, 30 Apr 2019 07:22:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hLQoq-0001QH-Go
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 07:21:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hLQop-0002KO-5P
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 07:21:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36506)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hLQom-0002G0-N4; Tue, 30 Apr 2019 07:21:00 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 595C230715CA;
	Tue, 30 Apr 2019 11:20:59 +0000 (UTC)
Received: from linux.fritz.box (unknown [10.36.118.15])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04B096C21E;
	Tue, 30 Apr 2019 11:20:57 +0000 (UTC)
Date: Tue, 30 Apr 2019 13:20:56 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Alberto Garcia <berto@igalia.com>
Message-ID: <20190430112056.GG5607@linux.fritz.box>
References: <cover.1556540297.git.berto@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1556540297.git.berto@igalia.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 30 Apr 2019 11:20:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 0/2] commit: Make base read-only if
 there is an early failure
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 29.04.2019 um 15:51 hat Alberto Garcia geschrieben:
> Hi,
> 
> Here's v3 of this series, the only changes are the corrections in the
> iotest suggested by Max.

Thanks, applied to the block branch.

Kevin

