Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F9C17938
	for <lists+qemu-devel@lfdr.de>; Wed,  8 May 2019 14:16:47 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36125 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOLV8-0000J1-11
	for lists+qemu-devel@lfdr.de; Wed, 08 May 2019 08:16:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48260)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hOLTl-0007yI-9T
	for qemu-devel@nongnu.org; Wed, 08 May 2019 08:15:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hOLTk-0006c3-GI
	for qemu-devel@nongnu.org; Wed, 08 May 2019 08:15:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38986)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hOLTc-0006Uk-FS; Wed, 08 May 2019 08:15:14 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1EDAD5D61E;
	Wed,  8 May 2019 12:15:11 +0000 (UTC)
Received: from dhcp-200-226.str.redhat.com (dhcp-200-226.str.redhat.com
	[10.33.200.226])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51F275D717;
	Wed,  8 May 2019 12:15:10 +0000 (UTC)
Date: Wed, 8 May 2019 14:15:08 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Message-ID: <20190508121508.GA15525@dhcp-200-226.str.redhat.com>
References: <20190503171744.21589-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190503171744.21589-1-kwolf@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 08 May 2019 12:15:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 0/2] blockjob: Fix coroutine thread after
 AioContext change
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

Am 03.05.2019 um 19:17 hat Kevin Wolf geschrieben:
> Kevin Wolf (2):
>   blockjob: Fix coroutine thread after AioContext change
>   test-block-iothread: Job coroutine thread after AioContext switch

Applied to the block branch.

Kevin

