Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C4DDE66
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 10:53:11 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54226 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hL22A-0007pZ-L8
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 04:53:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58832)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hL21A-0007XK-2I
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 04:52:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hL217-0004Rn-QY
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 04:52:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38260)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hL215-0004QQ-54; Mon, 29 Apr 2019 04:52:03 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 087C45946E;
	Mon, 29 Apr 2019 08:52:01 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-63.ams2.redhat.com
	[10.36.116.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE7795D6A9;
	Mon, 29 Apr 2019 08:51:59 +0000 (UTC)
Date: Mon, 29 Apr 2019 10:51:57 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Message-ID: <20190429085157.GA8492@localhost.localdomain>
References: <20190415155452.5115-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190415155452.5115-1-kwolf@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 29 Apr 2019 08:52:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 0/4] qcow2: Preallocation fixes
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
Cc: qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 15.04.2019 um 17:54 hat Kevin Wolf geschrieben:
> Kevin Wolf (4):
>   qcow2: Avoid COW during metadata preallocation
>   qcow2: Fix preallocation bdrv_pwrite to wrong file
>   qcow2: Add errp to preallocate_co()
>   qcow2: Fix full preallocation with external data file

Applied the remaining patches to the block branch.

Kevin

