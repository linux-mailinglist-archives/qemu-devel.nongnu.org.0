Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DE13CB520
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 11:20:05 +0200 (CEST)
Received: from localhost ([::1]:48440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4K0q-0005Ep-Ta
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 05:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m4Jzu-0004Vb-Qj
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 05:19:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m4Jzt-00055t-77
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 05:19:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626427144;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Zu6UufBa95B3QiU3fszNhl7aHJ9bzRM8jVvcV0lBCUQ=;
 b=eeX+/5mtwuP9wdaI7ArDJYTUfzvuVd9cncIEJ6ucG/ylOIe1jhJY2tEE0Ik4fb41ELKayJ
 xMYqVPw0C/IOnDCZcyx9qcdYvE+GT87r3scsiVKG8wuLhkMb+CuUsj+QQOuYsn6WntgyJT
 d7ssUQE6UBMmvPfkgo5rAf69B826rpY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-uGWoGBnXN2-ZHtXhS-zbIQ-1; Fri, 16 Jul 2021 05:19:03 -0400
X-MC-Unique: uGWoGBnXN2-ZHtXhS-zbIQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF62F804141;
 Fri, 16 Jul 2021 09:19:01 +0000 (UTC)
Received: from redhat.com (ovpn-115-37.ams2.redhat.com [10.36.115.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 006545C1A1;
 Fri, 16 Jul 2021 09:18:54 +0000 (UTC)
Date: Fri, 16 Jul 2021 10:18:52 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v1 2/9] s390x: toplogy: adding drawers and books to smp
 parsing
Message-ID: <YPFO/NPdyHjf1Cyu@redhat.com>
References: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
 <1626281596-31061-3-git-send-email-pmorel@linux.ibm.com>
 <87y2a8cda7.fsf@dusky.pond.sub.org>
 <0801e122-0e9c-e266-42e8-d5cddb16c237@linux.ibm.com>
 <87bl73df9y.fsf@dusky.pond.sub.org> <87y2a6bp5f.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87y2a6bp5f.fsf@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: thuth@redhat.com, ehabkost@redhat.com, Pierre Morel <pmorel@linux.ibm.com>,
 david@redhat.com, richard.henderson@linaro.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 16, 2021 at 11:10:04AM +0200, Cornelia Huck wrote:
> On Thu, Jul 15 2021, Markus Armbruster <armbru@redhat.com> wrote:
> 
> > Pierre Morel <pmorel@linux.ibm.com> writes:
> >
> >> On 7/15/21 8:16 AM, Markus Armbruster wrote:
> >>> Pierre Morel <pmorel@linux.ibm.com> writes:
> >>> 
> >>>> Drawers and Books are levels 4 and 3 of the S390 CPU
> >>>> topology.
> >>>> We allow the user to define these levels and we will
> >>>> store the values inside the S390CcwMachineState.
> >>> 
> >>> Double-checking: are these members specific to S390?
> >>
> >> Yes AFAIK
> >
> > Makes me wonder whether they should be conditional on TARGET_S390X.
> >
> > What happens when you specify them for another target?  Silently
> > ignored, or error?
> 
> I'm wondering whether we should include them in the base machine state
> and treat them as we treat 'dies' (i.e. the standard parser errors out
> if they are set, and only the s390x parser supports them.)

To repeat what i just wrote in my reply to patch 1, I think we ought to
think  about a different approach to handling the usage constraints,
which doesn't require full re-implementation of the smp_parse method
each time.  There should be a way for each target to report topology
constraints, such the the single smp_parse method can do the right
thing, especially wrt error reporting for unsupported values.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


