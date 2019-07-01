Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA6235A98
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 12:40:15 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38935 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYTL4-00085h-L8
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 06:40:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47967)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1hYTK7-0007lt-87
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 06:39:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1hYTK5-0007W8-Re
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 06:39:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45348)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <quintela@redhat.com>) id 1hYTK5-0007V5-0d
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 06:39:13 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D436B308FBB4;
	Wed,  5 Jun 2019 10:39:11 +0000 (UTC)
Received: from redhat.com (ovpn-117-164.ams2.redhat.com [10.36.117.164])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3F645F7C0;
	Wed,  5 Jun 2019 10:39:08 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
In-Reply-To: <20190604023540.26532-1-richardw.yang@linux.intel.com> (Wei
	Yang's message of "Tue, 4 Jun 2019 10:35:40 +0800")
References: <20190604023540.26532-1-richardw.yang@linux.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
Date: Wed, 05 Jun 2019 12:39:06 +0200
Message-ID: <875zpk5nat.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Wed, 05 Jun 2019 10:39:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] migration/multifd: sync packet_num after
 all thread are done
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
Reply-To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wei Yang <richardw.yang@linux.intel.com> wrote:
> Notification from recv thread is not ordered, which means we may be
> notified by one MultiFDRecvParams but adjust packet_num for another.
>
> Move the adjustment after we are sure each recv thread are sync-ed.
>
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>


Reviewed-by: Juan Quintela <quintela@redhat.com>

It shouldn't matter a lot in real life, but I agree that it is better.

