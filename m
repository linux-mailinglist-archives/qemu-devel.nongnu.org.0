Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58597158F66
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Feb 2020 14:02:37 +0100 (CET)
Received: from localhost ([::1]:49264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1VBT-0000qZ-S0
	for lists+qemu-devel@lfdr.de; Tue, 11 Feb 2020 08:02:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33179)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j1VAB-0000Cx-Qf
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 08:01:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j1VA9-00082O-CQ
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 08:01:14 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:44048
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j1VA9-00081c-8U
 for qemu-devel@nongnu.org; Tue, 11 Feb 2020 08:01:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581426071;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=yMx0wfndLZ3BlELhFXb+wE62oliA7zn7P9LYNwJxlxI=;
 b=escM1JinMTpEvcmoNMdQDTNdBgIvTBQmxQKxtaWyiGSD8NFW4z2gLgOa3d1eAuJiOcwecc
 tkJr9AftPW0wzn3g5uHWa9hgkacMjdKkm95da+L8ci1sr6xuoKOHYEtt5b8NITI5U1PSjn
 D8XrxHPef8LWD18jxep6eVlS/MU/BpM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-h8LJk98vPfSSEud7R1tY7Q-1; Tue, 11 Feb 2020 08:00:54 -0500
X-MC-Unique: h8LJk98vPfSSEud7R1tY7Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CED91800D5E;
 Tue, 11 Feb 2020 13:00:53 +0000 (UTC)
Received: from redhat.com (ovpn-117-143.ams2.redhat.com [10.36.117.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3056126FB0;
 Tue, 11 Feb 2020 13:00:52 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: kvm-devel <kvm@vger.kernel.org>
Subject: Re: KVM call for agenda for 2020-02-11
In-Reply-To: <87zhe7zqog.fsf@secure.laptop> (Juan Quintela's message of "Tue, 
 28 Jan 2020 13:55:11 +0100")
References: <87zhe7zqog.fsf@secure.laptop>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Tue, 11 Feb 2020 14:00:50 +0100
Message-ID: <87mu9pffct.fsf@secure.laptop>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Juan Quintela <quintela@redhat.com> wrote:
> Hi

As there are no topics, call gets cancelled.

Have a good week.

>
> Please, send any topic that you are interested in covering.
>
> At the end of Monday I will send an email with the agenda or the
> cancellation of the call, so hurry up.
>
> After discussions on the QEMU Summit, we are going to have always open a
> KVM call where you can add topics.
>
>  Call details:
>
> By popular demand, a google calendar public entry with it
>
>   https://www.google.com/calendar/embed?src=dG9iMXRqcXAzN3Y4ZXZwNzRoMHE4a3BqcXNAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ
>
> (Let me know if you have any problems with the calendar entry.  I just
> gave up about getting right at the same time CEST, CET, EDT and DST).
>
> If you need phone number details,  contact me privately
>
> Thanks, Juan.


