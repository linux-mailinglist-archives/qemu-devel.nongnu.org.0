Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EED62C104
	for <lists+qemu-devel@lfdr.de>; Tue, 28 May 2019 10:17:13 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58927 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVXIG-0004DJ-S7
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 04:17:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52226)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1hVXHG-0003pQ-K1
	for qemu-devel@nongnu.org; Tue, 28 May 2019 04:16:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1hVXHF-0005fb-QT
	for qemu-devel@nongnu.org; Tue, 28 May 2019 04:16:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:23325)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <quintela@redhat.com>) id 1hVXHF-0005fI-Lt
	for qemu-devel@nongnu.org; Tue, 28 May 2019 04:16:09 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F17883082B15;
	Tue, 28 May 2019 08:16:08 +0000 (UTC)
Received: from redhat.com (unknown [10.36.118.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8792B5C8B4;
	Tue, 28 May 2019 08:16:08 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
In-Reply-To: <20190528014703.21030-4-richardw.yang@linux.intel.com> (Wei
	Yang's message of "Tue, 28 May 2019 09:47:02 +0800")
References: <20190528014703.21030-1-richardw.yang@linux.intel.com>
	<20190528014703.21030-4-richardw.yang@linux.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
Date: Tue, 28 May 2019 10:16:06 +0200
Message-ID: <87ef4j8055.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Tue, 28 May 2019 08:16:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 3/4] migration/ram.c:
 MultiFDSendParams.sem_sync is not really used
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
> Besides init and destroy, MultiFDSendParams.sem_sync is not really used.
>
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

I mad SendParamas and RecvParams identical, but they are different.  You
are right.

