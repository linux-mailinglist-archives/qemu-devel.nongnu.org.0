Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC30B35E445
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 18:42:48 +0200 (CEST)
Received: from localhost ([::1]:59882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWM7j-0005es-VA
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 12:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lWLqv-0002B3-CG
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:25:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lWLqs-0006rn-CQ
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:25:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618331120;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=3wjSEo/H/vHeHaqTPCA0WrZKPg1ymei90TtQiwNv+SM=;
 b=Ft9CtuU6+Hs2p9NqQwvXpirlo7eVQHDKRoSiQS4JCE5wXu3GEPrs81sZtcCe8O7di67BPj
 BYXVbWDVCuLQ/ZG8LPEVXYV7ILOSNses4kdPaX0P1vUe2dMO/R1dLQtmtIJ7Hyps+G44RM
 kLbQGRL9UBrqNc66qo71o2LQEANdrFk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-DAECD4SGMnGvTsig7X0Ncg-1; Tue, 13 Apr 2021 12:25:10 -0400
X-MC-Unique: DAECD4SGMnGvTsig7X0Ncg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 743B010053ED;
 Tue, 13 Apr 2021 16:25:09 +0000 (UTC)
Received: from redhat.com (ovpn-114-58.ams2.redhat.com [10.36.114.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE5FE14106;
 Tue, 13 Apr 2021 16:25:02 +0000 (UTC)
Date: Tue, 13 Apr 2021 17:25:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] docs: Add a QEMU Code of Conduct and Conflict Resolution
 Policy document
Message-ID: <YHXF3A/Nd2AcpazN@redhat.com>
References: <20210331150527.14857-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210331150527.14857-1-pbonzini@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, agraf@csgraf.de, stefanha@redhat.com,
 alex.bennee@linaro.org, afaerber@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 31, 2021 at 05:05:27PM +0200, Paolo Bonzini wrote:
> In an ideal world, we would all get along together very well, always be
> polite and never end up in huge conflicts. And even if there are conflicts,
> we would always handle each other fair and respectfully. Unfortunately,
> this is not an ideal world and sometimes people forget how to interact with
> each other in a professional and respectful way. Fortunately, this seldom
> happens in the QEMU community, but for such rare cases it is preferrable
> to have a basic code of conduct document available to show to people
> who are misbehaving.  In case that does not help yet, we should also have
> a conflict resolution policy ready that can be applied in the worst case.
> 
> The Code of Conduct document tries to be short and to the point while
> trying to remain friendly and welcoming; it is based on the Fedora Code
> of Conduct[1] with extra detail added based on the Contributor Covenant
> 1.3.0[2].  Other proposals included the Contributor Covenant 1.3.0 itself
> or the Django Code of Conduct[3] (which is also a derivative of Fedora's)
> but, in any case, there was agreement on keeping the conflict resolution
> policy separate from the CoC itself.
> 
> An important point is whether to apply the code of conduct to violations
> that occur outside public spaces.  The text herein restricts that to
> individuals acting as a representative or a member of the project or
> its community.  This is intermediate between the Contributor Covenant
> (which only mentions representatives of the community, for example using
> an official project e-mail address or posting via an official social media
> account), and the Django Code of Conduct, which says that violations of
> this code outside these spaces "may" be considered but does not limit
> this further.

Since this was derived from the Fedora CoC, you might be interested to
know that Fedora is currently revisiting its CoC:

  https://communityblog.fedoraproject.org/policy-proposal-new-code-of-conduct/

The first comment on that post from mattdm gives clarity as to why they
feel the need to revisit it

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


