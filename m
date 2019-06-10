Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C787C3B26C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 11:49:42 +0200 (CEST)
Received: from localhost ([::1]:43016 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haGvu-0005JO-1L
	for lists+qemu-devel@lfdr.de; Mon, 10 Jun 2019 05:49:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48267)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <quintela@redhat.com>) id 1haGsw-0003Rb-6w
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 05:46:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1haGss-0006dA-9K
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 05:46:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54118)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1haGsq-0006Na-DT
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 05:46:33 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 876183087BB4;
 Mon, 10 Jun 2019 09:46:01 +0000 (UTC)
Received: from redhat.com (ovpn-116-138.ams2.redhat.com [10.36.116.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BFCE1001B07;
 Mon, 10 Jun 2019 09:46:00 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Wei Yang <richard.weiyang@gmail.com>
In-Reply-To: <20190520213233.6px3cuws2hq3p5tj@master> (Wei Yang's message of
 "Mon, 20 May 2019 21:32:33 +0000")
References: <20190515121544.4597-1-quintela@redhat.com>
 <20190515121544.4597-6-quintela@redhat.com>
 <20190520213233.6px3cuws2hq3p5tj@master>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
Date: Mon, 10 Jun 2019 11:45:58 +0200
Message-ID: <87ef41vkmh.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Mon, 10 Jun 2019 09:46:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 5/8] migration: Add multifd-compress
 parameter
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

Wei Yang <richard.weiyang@gmail.com> wrote:
> On Wed, May 15, 2019 at 02:15:41PM +0200, Juan Quintela wrote:
>>diff --git a/qapi/migration.json b/qapi/migration.json
>>index 9cfbaf8c6c..8ec1944b7a 100644
>>--- a/qapi/migration.json
>>+++ b/qapi/migration.json
>>@@ -482,6 +482,19 @@
>> # TODO either fuse back into MigrationParameters, or make
>>@@ -707,7 +726,8 @@
>>             '*multifd-channels': 'int',
>>             '*xbzrle-cache-size': 'size',
>>             '*max-postcopy-bandwidth': 'size',
>>-	    '*max-cpu-throttle': 'int' } }
>>+	    '*max-cpu-throttle': 'int',
>
> A tab at the beginning, it would be better to fix this :-)

The wonders of magit+emacs, I didn't saw this one.

Fixed.

Thanks, Juan.

