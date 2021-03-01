Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25763281DA
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 16:10:31 +0100 (CET)
Received: from localhost ([::1]:52160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGkBq-0007sZ-JQ
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 10:10:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lGkAH-0006y9-54
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 10:08:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lGkAB-0008SV-2X
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 10:08:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614611326;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+WZeNv6gjW8WpL9rPFE5ac1YDsPYEMZlhptA8ikKw+Q=;
 b=gVEsm+oLCDIq21MJDOpqfFiZ3wSlXxaEad7qhGxwmXa9K+FedGAT8iRItQM1bRgUUQvsH5
 X+5FkJVVyRrhQ12byE9Sv3MTitdGHekRIh2y5IqvxMaC3ixH94zbytRg5Wdw4CTJwFVD9B
 3vaXgcZdOiiCah8yCj29C9Mk1uZujmE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-v0rCe96MOJmu5Ff6Bgkh_w-1; Mon, 01 Mar 2021 10:08:32 -0500
X-MC-Unique: v0rCe96MOJmu5Ff6Bgkh_w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69B7E107ACED;
 Mon,  1 Mar 2021 15:08:31 +0000 (UTC)
Received: from redhat.com (ovpn-113-132.ams2.redhat.com [10.36.113.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 73B925D735;
 Mon,  1 Mar 2021 15:08:30 +0000 (UTC)
Date: Mon, 1 Mar 2021 15:08:27 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Daniele Buono <dbuono@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 0/2] gitlab-ci.yml: Add jobs to test CFI
Message-ID: <YD0Day/wGawuWdpi@redhat.com>
References: <20210226152108.7848-1-dbuono@linux.vnet.ibm.com>
 <YDy8qsRRR3FmWr1D@redhat.com>
 <56d3d1a6-00af-1cc9-e980-748548191202@linux.vnet.ibm.com>
MIME-Version: 1.0
In-Reply-To: <56d3d1a6-00af-1cc9-e980-748548191202@linux.vnet.ibm.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 01, 2021 at 09:59:22AM -0500, Daniele Buono wrote:
> Hi Daniel,
> 
> On 3/1/2021 5:06 AM, Daniel P. Berrangé wrote:
> > On Fri, Feb 26, 2021 at 10:21:06AM -0500, Daniele Buono wrote:
> > > Build jobs are on the longer side (about 2h and 20m), but I thought it
> > > would be better to just have 6 large jobs than tens of smaller ones.
> > 
> > IMHO that is a not viable.
> > 
> > Our longest job today is approx 60 minutes, and that is already
> > painfully long when developers are repeatedly testing their
> > patch series to find and fix bugs before posting them for review.
> > I can perhaps get through 5-6 test cycles in a day. If we have a
> > 2 hour 20 min job, then I'll get 2-3 test cycles a day.
> > 
> > I don't want to see any new jobs added which increase the longest
> > job execution time. We want to reduce our max job time if anything.
> > 
> > 
> 
> I totally understand the argument.
> 
> We could build two targets per job. That would create build jobs that
> take 40 to 60-ish minutes. If that's the case, however, I would not
> recommend testing all the possible targets but limit them to what
> is considered a set of most common targets. I have an example of the
> resulting pipeline here:
> 
> https://gitlab.com/dbuono/qemu/-/pipelines/258983262
> 
> I selected intel, power, arm and s390 as "common" targets. Would
> something like this be a viable alternative? Perhaps after
> due thinking of what targets should be tested?

What are the unique failure scenarios for CFI that these jobs are
likely to expose ? Is it likely that we'll have cases where
CFI succeeds in say, x86_64 target, but fails in aarch64 target ?

If not, then it would be sufficient to just test a single target
to smoke out CFI specific bugs, and assume it covers other
targets implicitly.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


