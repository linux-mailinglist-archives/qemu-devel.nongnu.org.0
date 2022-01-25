Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 036F949B304
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 12:38:36 +0100 (CET)
Received: from localhost ([::1]:39050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCK9i-00010l-PK
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 06:38:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nCK7e-0000G8-VE
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 06:36:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nCK7a-0003Wk-NW
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 06:36:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643110574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HdAh07n39LkLkBs/H9oheuevBjaeT4FvPn+TzmQfVY8=;
 b=WkbYV/+UAmEzUHyYomfMXQEMpKadE154C5V9Qs2q/G6IBfUlUBFAkDBBm1xMG0sZjgbe15
 cPmJez09yIivhtyJ30MD9RoOow6TVrkWrxWHXtIX5WHkOFVeyzEq8fIMQ64/UAmT2d+5ot
 38IIEZkfjIEnSmvymhM+HpX6huvoVKA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-A4R6AmTLN2yXGDSH9ZebpQ-1; Tue, 25 Jan 2022 06:36:10 -0500
X-MC-Unique: A4R6AmTLN2yXGDSH9ZebpQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D27D100C661;
 Tue, 25 Jan 2022 11:36:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-10.ams2.redhat.com
 [10.36.112.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FB34106C064;
 Tue, 25 Jan 2022 11:36:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F3A9E113864A; Tue, 25 Jan 2022 12:36:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: KVM call for agenda for 2022-01-25
References: <87y2355xe8.fsf@secure.mitica>
Date: Tue, 25 Jan 2022 12:36:07 +0100
In-Reply-To: <87y2355xe8.fsf@secure.mitica> (Juan Quintela's message of "Mon, 
 24 Jan 2022 09:51:59 +0100")
Message-ID: <87mtjk2gk8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, kvm-devel <kvm@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Juan Quintela <quintela@redhat.com> writes:

> Hi
>
> Please, send any topic that you are interested in covering.
>
> This week we have a continuation of 2 weeks ago call to discuss how to
> enable creation of machines from QMP sooner on the boot.
>
> There was already a call about this 2 weeks ago where we didn't finished
> everything.
> I have been on vacation last week and I haven't been able to send a
> "kind of resume" of the call.
>
> Basically what we need is:
> - being able to create machines sooner that we are today
> - being able to change the devices that are in the boards, in
>   particular, we need to be able to create a board deciding what devices
>   it has and how they are connected without recompiling qemu.
>   This means to launch QMP sooner that we do today.
> - Several options was proposed:
>   - create a new binary that only allows QMP machine creation.
>     and continue having the old command line
>   - create a new binary, and change current HMP/command line to just
>     call this new binary.  This way we make sure that everything can be
>     done through QMP.
>   - stay with only one binary but change it so we can call QMP sooner.
> - There is agreement that we need to be able to call QMP sooner.
> - There is NO agreement about how the best way to proceed:
>   * We don't want this to be a multiyear effort, i.e. we want something
>     that can be used relatively soon (this means that using only one
>     binary can be tricky).
>   * If we start with a new binary that only allows qmp and we wait until
>     everything has been ported to QMP, it can take forever, and during
>     that time we have to maintain two binaries.
>   * Getting a new binary lets us to be more agreessive about what we can
>     remove/change. i.e. easier experimentation.
>   * Management Apps will only use QMP, not the command line, or they
>     even use libvirt and don't care at all about qemu.  So it appears
>     that HMP is only used for developers, so we can be loose about
>     backwards compatibility. I.e. if we allow the same functionality,
>     but the syntax is different, we don't care.
>
> Discussion was longer, but it was difficult to take notes and as I said,
> the only thing that appears that everybody agrees is that we need an
> agreement about what is the plan to go there.
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

https://wiki.qemu.org/Contribute claims the call is at

    $ date -d 'TZ="America/New_York" Tuesday 10:00 am'
    Tue Jan 25 16:00:00 CET 2022

Is that correct?

> If you need phone number details,  contact me privately
>
> Thanks, Juan.


