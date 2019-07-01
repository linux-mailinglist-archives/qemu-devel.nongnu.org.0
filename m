Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1F130EAC
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 15:13:53 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43351 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWhM0-0004PR-KP
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 09:13:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1hWhJu-0003EX-NX
	for qemu-devel@nongnu.org; Fri, 31 May 2019 09:11:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1hWhAA-0008Kg-28
	for qemu-devel@nongnu.org; Fri, 31 May 2019 09:01:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49990)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <quintela@redhat.com>) id 1hWhA9-0008J8-Sw
	for qemu-devel@nongnu.org; Fri, 31 May 2019 09:01:37 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B6AAE30C1328
	for <qemu-devel@nongnu.org>; Fri, 31 May 2019 13:01:35 +0000 (UTC)
Received: from redhat.com (ovpn-116-135.ams2.redhat.com [10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4254C2F2A9;
	Fri, 31 May 2019 13:01:31 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
In-Reply-To: <20190530092919.26059-5-peterx@redhat.com> (Peter Xu's message of
	"Thu, 30 May 2019 17:29:11 +0800")
References: <20190530092919.26059-1-peterx@redhat.com>
	<20190530092919.26059-5-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
Date: Fri, 31 May 2019 15:01:29 +0200
Message-ID: <87a7f2ok0m.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Fri, 31 May 2019 13:01:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 04/12] memory: Don't set migration
 bitmap when without migration
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Xu <peterx@redhat.com> wrote:
> Similar to 9460dee4b2 ("memory: do not touch code dirty bitmap unless
> TCG is enabled", 2015-06-05) but for the migration bitmap - we can
> skip the MIGRATION bitmap update if migration not enabled.
>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

But if we ever decide to _not_ dirty all the bitmap at start (only used
pages) we need to fix this.

