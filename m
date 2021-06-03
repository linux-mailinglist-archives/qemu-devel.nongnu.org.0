Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CCB39ABE0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 22:37:08 +0200 (CEST)
Received: from localhost ([::1]:51946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lou5S-0007Ae-TI
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 16:37:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lou4Z-0006EV-2t
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 16:36:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lou4T-0005wO-Oq
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 16:36:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622752564;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VFTYniu2czzRyi3OBuuk8a+IebZL4TW3G33qZP87ds8=;
 b=JFQstr2ZwuZ1cbejj/Iee2jDQ0/ooPPG8OnBl2JUhEdDZEDn24MOKBXH4QyENzhqWk/P9R
 q8p4XEgCXbUeHdFb9splUZo+GshQMPM2IwCpjh8/ft+oG4Jf4A/Dd/lDdPW/ArO9lZRUhC
 cG0K5mEmWNbwMiNV+ZVC8x3OxImglRk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-tqDU2zDMOS2MAKjxKEL5Gw-1; Thu, 03 Jun 2021 16:35:56 -0400
X-MC-Unique: tqDU2zDMOS2MAKjxKEL5Gw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AAC7801B18;
 Thu,  3 Jun 2021 20:35:55 +0000 (UTC)
Received: from redhat.com (ovpn-112-32.ams2.redhat.com [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F3E15C277;
 Thu,  3 Jun 2021 20:35:49 +0000 (UTC)
Date: Thu, 3 Jun 2021 21:35:47 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 1/2] GitLab: Add "Bug" issue reporting template
Message-ID: <YLk9C3Nbod2Xj1qK@redhat.com>
References: <20210603001129.1319515-1-jsnow@redhat.com>
 <20210603001129.1319515-2-jsnow@redhat.com>
 <b9166bbc-0201-af02-d54b-af4638525ceb@redhat.com>
 <ae5c5066-cefc-1a29-9729-d0bafae5c8f5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ae5c5066-cefc-1a29-9729-d0bafae5c8f5@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 03, 2021 at 03:11:28PM -0400, John Snow wrote:
> On 6/3/21 3:26 AM, Philippe Mathieu-Daudé wrote:
> > I haven't reviewed earlier version, but I wonder about the "build from
> > sources" use case (this is not a template for distributions but for the
> > mainstream project), so maybe add:
> > 
> >    ## Build environment (in case you built QEMU from source)
> >    - configure script command line: (e.g. ./configure --enable-nettle
> > --disable-glusterfs --disable-user)
> >    - configure script summary output
> 
> Maybe just a little bit too much information. Even though I am pushing
> people to build from source, I actually think more reports are likely not to
> have done so.

We need to bear in mind what % of bug reports do we actually need
this information for.  We don't want to be asking for information
that we know is going to be irrelevant for (say) 60% of bug reports,
because that wastes time of users.

My gut feeling is that while configure args are useful to know in
many cases, I doubt it genuinely needed for more than a relatively
small percentage of bug reports.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


