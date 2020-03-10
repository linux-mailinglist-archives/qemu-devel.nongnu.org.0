Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D53F917F629
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 12:22:19 +0100 (CET)
Received: from localhost ([::1]:58128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBcxm-0006Oj-TD
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 07:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52780)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1jBcwI-00052i-Av
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 07:20:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1jBcwH-0004rH-3X
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 07:20:46 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:38769
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1jBcwG-0004p8-Vk
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 07:20:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583839244;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type; bh=arw5L5YsoJ87khZVMFIrLcsKvVPIlQcfxYIOv80kSBg=;
 b=USeLbF6syXUtDxWjfJUhraMfZJpa1S3RQbwQD2wxB2bs+mQHP/su5WgvFJuDIp2YdTjTCq
 qEyBI4g8j/UvmspDahhioQFOCPRStviEHKEtg8il9YFdO4HPVaJeFc8slqgPZHNQZdepsz
 qwNQkQvoLjjaids+cZv3HJiBIGU7Kos=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-jfRFySz4PDiWwTidYnC3Bg-1; Tue, 10 Mar 2020 07:20:40 -0400
X-MC-Unique: jfRFySz4PDiWwTidYnC3Bg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2EAA18FF686;
 Tue, 10 Mar 2020 11:20:39 +0000 (UTC)
Received: from redhat.com (ovpn-116-72.ams2.redhat.com [10.36.116.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4652360BF3;
 Tue, 10 Mar 2020 11:20:39 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: kvm-devel <kvm@vger.kernel.org>, qemu-devel@nongnu.org
Subject: KVM call today 2020-03-10
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Tue, 10 Mar 2020 12:20:33 +0100
Message-ID: <87a74ozcam.fsf@secure.laptop>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Hi

Today is a call becasue there are topics, in case you missed.
Notice that this call is in USA time, so if you are not there, it is
inside possiblity that it is one hour sooner that you are used to. See
the calendar.

 * Clarify the feedback on the latest revision of multi-process QEMU
   patches concerning:
   - Command-line: It's not clear what's the preferred approach to pass
     command-line parameters for the remote process. We are wondering if
     it's OK to accept the command-line parameters for the remote as a
     single string, or if it should be on multiple lines?
   - Refactoring migration related code: We realize that some of the
     modules we have built into the remote process (such as block and
     migration) compile more code than is required by the remote process.
     Ideally, we could refactor them to utilize just the pieces of code
     needed. However, this problem of refactoring has a larger scope.
     Could this be addressed in later projects?



 Call details:

By popular demand, a google calendar public entry with it

  https://www.google.com/calendar/embed?src=dG9iMXRqcXAzN3Y4ZXZwNzRoMHE4a3BqcXNAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ

(Let me know if you have any problems with the calendar entry.  I just
gave up about getting right at the same time CEST, CET, EDT and DST).

If you need phone number details,  contact me privately

Thanks, Juan.


