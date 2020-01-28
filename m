Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8E814B482
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 13:55:40 +0100 (CET)
Received: from localhost ([::1]:58504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwQP5-00056d-3f
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 07:55:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53797)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1iwQO0-0004F9-Nr
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 07:54:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1iwQNz-0001jW-T0
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 07:54:32 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35408
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1iwQNz-0001it-Q8
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 07:54:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580216071;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=kOtgx0Zrg1HkTOxU3gO90d+CXrAaBKxdXD5mpB2xX/4=;
 b=Y7D5NeyVNmtb17XK5qDUc1JGf3Y0bYJtyZwGU1Rjds5jM1PRy5/59isidbdjQlZxOr1NHM
 ouxvCIvF4Huhuz8iPnVE5IJ0bzZGuJ8T3nqAE1VVMc7w/7oqdQo9EYbaKkQQscrfoyy1UG
 552dnjYhcyV+VX861hh7K0DVdT2BkyE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-X1ddIzg5NsCfDsrafhg43A-1; Tue, 28 Jan 2020 07:54:28 -0500
X-MC-Unique: X1ddIzg5NsCfDsrafhg43A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54DAC1937FC1;
 Tue, 28 Jan 2020 12:54:27 +0000 (UTC)
Received: from redhat.com (ovpn-117-159.ams2.redhat.com [10.36.117.159])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E247C60C05;
 Tue, 28 Jan 2020 12:54:26 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: kvm-devel <kvm@vger.kernel.org>
Subject: Re: KVM call for agenda for 2020-01-28
In-Reply-To: <87y2u21d5r.fsf@secure.laptop> (Juan Quintela's message of "Mon, 
 20 Jan 2020 14:16:16 +0100")
References: <87y2u21d5r.fsf@secure.laptop>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Tue, 28 Jan 2020 13:54:24 +0100
Message-ID: <874kwf2133.fsf@secure.laptop>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.120
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
>
> Please, send any topic that you are interested in covering.

Hi

As there is no topics on the agenda, call gets cancelled.

Happy hacking, Juan.

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


