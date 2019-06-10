Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CE33B1E9
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 11:24:59 +0200 (CEST)
Received: from localhost ([::1]:42710 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haGXy-0005BT-Hr
	for lists+qemu-devel@lfdr.de; Mon, 10 Jun 2019 05:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42392)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <quintela@redhat.com>) id 1haGWq-0004Fw-8U
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 05:23:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1haGWp-0006Mc-Be
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 05:23:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43826)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1haGWp-0006Lv-5a
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 05:23:47 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5C8687FDF0;
 Mon, 10 Jun 2019 09:23:30 +0000 (UTC)
Received: from redhat.com (ovpn-116-138.ams2.redhat.com [10.36.116.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E42C260856;
 Mon, 10 Jun 2019 09:23:29 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
In-Reply-To: <20190520064816.GD6718@richard> (Wei Yang's message of "Mon, 20
 May 2019 14:48:16 +0800")
References: <20190515121544.4597-1-quintela@redhat.com>
 <20190515121544.4597-4-quintela@redhat.com>
 <20190520064816.GD6718@richard>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
Date: Mon, 10 Jun 2019 11:23:25 +0200
Message-ID: <874l4xx08i.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Mon, 10 Jun 2019 09:23:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 3/8] tests: Add migration multifd test
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: quintela@redhat.com
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wei Yang <richardw.yang@linux.intel.com> wrote:
> On Wed, May 15, 2019 at 02:15:39PM +0200, Juan Quintela wrote:
>>We set multifd-channels.
>>
>>+    wait_for_serial("dest_serial");
>>+    wait_for_migration_complete(from);
>>+
>>+    test_migrate_end(from, to, true);
>
> Miss free uri here?
>
>     g_free(uri);

You are right.
Fixed.

>
> And
>
> Tested-by: Wei Yang <richardw.yang@linux.intel.com>

Thanks.

