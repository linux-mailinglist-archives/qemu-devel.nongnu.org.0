Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8011129F640
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 21:35:11 +0100 (CET)
Received: from localhost ([::1]:40734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYEda-0006mR-KB
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 16:35:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kYEcT-0005ye-F1
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 16:34:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kYEcR-00041w-J6
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 16:34:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604003638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xMM07s/XzQOr9AckEe5RbTIbT88JZzQ4ldqH5S7flC4=;
 b=DT4cIav9kLiLmPb2zFB5rS5sRxBS+4WRNR1jQgvJ6XIjBDqID4nKkSpWdE1nY4qWS7YrGU
 tTy0Y1IE6eQKHawWg55eDsczDRv7zvlnwVPYAaPbL4HKTmD0/EgMNN+9HIMo+PecNn9OxX
 jCWexu68n/coKBgZRF/ZDV/mRzIPBg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-Qz-q0MqHNMONb8Jx3YWwAA-1; Thu, 29 Oct 2020 16:33:55 -0400
X-MC-Unique: Qz-q0MqHNMONb8Jx3YWwAA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C38FF8015F8
 for <qemu-devel@nongnu.org>; Thu, 29 Oct 2020 20:33:54 +0000 (UTC)
Received: from gondolin (ovpn-112-55.ams2.redhat.com [10.36.112.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0452455764;
 Thu, 29 Oct 2020 20:33:53 +0000 (UTC)
Date: Thu, 29 Oct 2020 21:33:43 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: Migrating to the gitlab issue tracker
Message-ID: <20201029213343.2a2f063e.cohuck@redhat.com>
In-Reply-To: <2fecc4a0-7aec-16db-1150-50fc0463d6ac@redhat.com>
References: <bda4f471-8ed6-3832-29ac-279a6d3bb7cc@redhat.com>
 <20201029174114.47e2b351.cohuck@redhat.com>
 <2fecc4a0-7aec-16db-1150-50fc0463d6ac@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 01:47:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Oct 2020 14:04:04 -0400
John Snow <jsnow@redhat.com> wrote:

> On 10/29/20 12:41 PM, Cornelia Huck wrote:
> > On Thu, 29 Oct 2020 12:01:27 -0400
> > John Snow <jsnow@redhat.com> wrote:
> >   
> >> If you're in the CC list, it's because you are listed in MAINTAINERS.  
> > 
> > <cleared the cc: list except for qemu-devel :)>
> >   
> >>
> >> Paolo's QEMU keynote this morning mentioned the possible use of the
> >> Gitlab issue tracker instead of using Launchpad.
> >>
> >> I'm quite fond of the gitlab issue tracker, I think it works quite well
> >> and it has pretty good and uncomplicated API access to it in order to
> >> customize your workflow if you'd really like to.
> >>
> >> In experimenting with my mirror on gitlab though, I was unable to find a
> >> way to configure it to send issue tracker notifications to the email
> >> list. A move to gitlab would likely mean, then:
> >>
> >> 1. The cessation of (automatic) issue tracker mails to the list
> >> 2. The loss of the ability to update the issue tracker by replying to
> >> said emails
> >> 3. Anyone listed in MAINTAINERS would be expected to have a gitlab
> >> account in order to interact with the issue tracker.  
> > 
> > The gitlab issue tracker is almost certainly is an improvement over
> > launchpad (and I do have a gitlab account); but not being able to
> > interact via email is at least annoying. I expect that not only
> > maintainers will want to interact with bug reports?
> >   
> 
> Nothing stopping reviewers or contributors from signing up and 
> subscribing to labels or issues they care about... It will just be more 
> opaque to the ebb and flow of the list.
> 
> There are still perhaps things we could do; a bot that generates weekly 
> bug report summaries might be a solution.

That might be useful. TBH, I'm not sure how many random people that are
not either the reporter or a maintainer anyway typically interact with
launchpad bugs, so requiring a gitlab account might not be that bad on
the whole (especially since people can still write an email to the
list).

> 
> >>
> >> However, once you have a gitlab account, you DO gain the ability to
> >> receive emails for issues; possibly only those tagged with labels that
> >> you cared about -- giving a nice filtering mechanism to receive only
> >> bugs you care about.
> >>
> >> Gitlab also does support individual accounts updating issues using a
> >> generated personalized email address, so if the email workflow is
> >> crucial to you, it is still available.  
> > 
> > You mean that I can update via email, provided it's an address
> > associated with my account?
> >   
> 
> https://gitlab.com/qemu-project/qemu
> 
> Click the "bell" icon, choose "custom", and you can subscribe to issues 
> project-wide if you'd like. (Reopen, New, Closed, Reassigned).
> 
> I started experimenting with using the gitlab issue tracker for my 
> Python library project, I'll use it as an example here:

[nice instructions stripped]

Thanks, that is helpful; I'll play with it a bit when I find some time.


