Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 216962343F6
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jul 2020 12:11:13 +0200 (CEST)
Received: from localhost ([::1]:35206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k1S0N-0006Ok-Mp
	for lists+qemu-devel@lfdr.de; Fri, 31 Jul 2020 06:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1k1RzM-0005sZ-I3
 for qemu-devel@nongnu.org; Fri, 31 Jul 2020 06:10:08 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:29530
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1k1RzH-00006e-TQ
 for qemu-devel@nongnu.org; Fri, 31 Jul 2020 06:10:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596190202;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ro4IwO/g8bn78eeqddRCmquPoiWABhXPheM2a+LeRB8=;
 b=X5ItxMH2lc2ofW3TFVN+ADb+fhfmVtIuh7Sk+SrzgHIX5OZMO6ZscaAzJa28/jkXVOHwpa
 7mJdUqNvkweuPCKkPk/NFtceo7Rt66fxXEVIDEQnaUQDGumSgkVA5SRL/YnQaBxalDkc1E
 qyH0lsZl20sd3IobVZQaXnweO/+U+no=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-woxtIGFJPJKbpa1hsl2ZJg-1; Fri, 31 Jul 2020 06:08:36 -0400
X-MC-Unique: woxtIGFJPJKbpa1hsl2ZJg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB6A9100CC88;
 Fri, 31 Jul 2020 10:08:34 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 77D4B277C1;
 Fri, 31 Jul 2020 10:07:45 +0000 (UTC)
Date: Fri, 31 Jul 2020 11:07:42 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V1 12/32] vl: pause option
Message-ID: <20200731100742.GA3641941@redhat.com>
References: <1596122076-341293-1-git-send-email-steven.sistare@oracle.com>
 <1596122076-341293-13-git-send-email-steven.sistare@oracle.com>
 <1dea1698-f8be-519d-e00c-d163b08dca65@redhat.com>
 <36036b5f-4e63-4287-a8e6-499732f54689@oracle.com>
MIME-Version: 1.0
In-Reply-To: <36036b5f-4e63-4287-a8e6-499732f54689@oracle.com>
User-Agent: Mutt/1.14.5 (2020-06-23)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/31 02:46:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 30, 2020 at 02:11:19PM -0400, Steven Sistare wrote:
> On 7/30/2020 12:20 PM, Eric Blake wrote:
> > On 7/30/20 10:14 AM, Steve Sistare wrote:
> >> Provide the -pause command-line parameter and the QEMU_PAUSE environment
> >> variable to briefly pause QEMU in main and allow a developer to attach gdb.
> >> Useful when the developer does not invoke QEMU directly, such as when using
> >> libvirt.
> > 
> > How would you set this option with libvirt?
> 
> Add -pause in the qemu args in the xml.
>  
> > It feels like you are trying to reinvent something that is already well-documented:
> > 
> > https://www.berrange.com/posts/2011/10/12/debugging-early-startup-of-kvm-with-gdb-when-launched-by-libvirtd/
> 
> Too many steps to reach BINGO for my taste.  Easier is better.  Also, in our shop we start qemu 
> in other ways, such as via services.


A "sleep" is a pretty crude & unreliable way to get into debugging
though. It is racy for a start, but also QEMU has a bunch of stuff
that runs via ELF constructors before main() even starts.

So I feel like the thing that starts QEMU is better placed to provide
a way in for debugging.

eg the service launcher can send SIGSTOP to the child process immediately
before the execve(qemu) call.

Now user can attach with the debugger, allow execution to continue,
and has ability to debug *everything* right from the ELF constructors
onwards into main() and all that follows.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


