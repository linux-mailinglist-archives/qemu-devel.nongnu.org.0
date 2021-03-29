Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 128A134CF59
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 13:49:59 +0200 (CEST)
Received: from localhost ([::1]:33806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQqP8-0001nr-5s
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 07:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lQqO9-0001N2-3V
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 07:48:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lQqO6-0005ZU-Pt
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 07:48:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617018533;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=viZm1vFFQvuS7NlOMt88/xG9iPSxgDFpA/iGBgp7EKo=;
 b=GX78U125R4zuQOCzUyZQJgrjVyMJXOqZ3yZ0sgCLYuDAU7q3vLcMLe/JJwvlVjhs187kfq
 CP3BS2ADNnCBFAj+dqgTcKxytW+0BWnMrK+P0ae6Zof3Xu4JLHR9td44iaD0NE0tR7cWIo
 K6nr7BvzuUKo/szzvMJrmet2l/rDsCE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-z3rKANoHM0uYKyp9rsL-mA-1; Mon, 29 Mar 2021 07:48:42 -0400
X-MC-Unique: z3rKANoHM0uYKyp9rsL-mA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43593501FD;
 Mon, 29 Mar 2021 11:48:41 +0000 (UTC)
Received: from redhat.com (ovpn-114-228.ams2.redhat.com [10.36.114.228])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64D2D19D9F;
 Mon, 29 Mar 2021 11:48:38 +0000 (UTC)
Date: Mon, 29 Mar 2021 12:48:35 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>
Subject: Re: [PATCH v3] qapi: introduce 'query-cpu-model-cpuid' action
Message-ID: <YGG+k2PMJjc2yX2g@redhat.com>
References: <20210326173000.18750-1-valeriy.vdovin@virtuozzo.com>
 <YGGb9ohT/EztzFbr@redhat.com>
 <20210329112153.GA413337@dhcp-172-16-24-191.sw.ru>
MIME-Version: 1.0
In-Reply-To: <20210329112153.GA413337@dhcp-172-16-24-191.sw.ru>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Denis Lunev <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 29, 2021 at 02:21:53PM +0300, Valeriy Vdovin wrote:
> On Mon, Mar 29, 2021 at 10:20:54AM +0100, Daniel P. Berrang?? wrote:
> > On Fri, Mar 26, 2021 at 08:30:00PM +0300, Valeriy Vdovin wrote:
> > > Other than debug, the method is useful in cases when we would like to
> > > utilize QEMU's virtual cpu initialization routines and put the retrieved
> > > values into kernel CPUID overriding mechanics for more precise control
> > > over how various processes perceive its underlying hardware with
> > > container processes as a good example.
> > 
> > When I read this, my impression is that QEMU's CPU handling doesn't do
> > what you need, and you're trying to work around it outside of QEMU.
> > Can you give more detailed information about what situations QEMU's
> > CPUID handling doesn't work, and why we can't simply enhance QEMU
> > to do what you need ?
> > 
> We want to override CPUID for container processes to support live
> migration. For that we want to base on a reliable cpu model, which is
> present in libvirt and QEMU. We will communicate cpu models information
> between physical nodes to decide the baseline cpu model and then we could
> use the new method to get all CPUID value leaves that we would return to
> containers during CPUID override. In our case the QAPI-way of getting the
> values is a clean solution, because we can just query it from the outside
> (not as guest system).

IIUC, you seem to be saying that you're not actually going to run a
real QEMU VM at all ?  You're just using QEMU / QMP as a convenient
way expand a named CPI model into CPUID leaves, so you can then use
this data in a completely separate container based mgmt application.
Essentially treating QMP as a general purpose API for handling CPU
models.

> > > virsh qemu-monitor-command VM --pretty '{ "execute": "query-cpu-model-cpuid" }'
> > > {
> > >   "return": {
> > >     "cpuid": {
> > >       "leafs": [
> > >         {
> > >           "leaf": 0,
> > >           "subleafs": [
> > >             {
> > >               "eax": 13,
> > >               "edx": 1231384169,
> > >               "ecx": 1818588270,
> > >               "ebx": 1970169159,
> > >               "subleaf": 0
> > >             }
> > >           ]
> > >         },
> > >         {
> > >           "leaf": 1,
> > >           "subleafs": [
> > >             {
> > >               "eax": 329443,
> > >               "edx": 529267711,
> > >               "ecx": 4160369187,
> > >               "ebx": 133120,
> > >               "subleaf": 0
> > >             }
> > >           ]
> > >         },
> > >         {
> > >           "leaf": 2,
> > >           "subleafs": [
> > >             {
> > >               "eax": 1,
> > >               "edx": 2895997,
> > >               "ecx": 0,
> > >               "ebx": 0,
> > >               "subleaf": 0
> > >             }
> > >           ]
> > >         },
> > >       ]
> > >     },
> > >     "vendor": "GenuineIntel",
> > >     "class-name": "Skylake-Client-IBRS-x86_64-cpu",
> > >     "model-id": "Intel Core Processor (Skylake, IBRS)"
> > >   },
> > >   "id": "libvirt-40"
> > > }
> > 
> > There's feels like there's a lot of conceptual overlap with the
> > query-cpu-model-expansion command. That reports in a arch independant
> > format, but IIUC the property data it returns can be mapped into
> > CPUID leaf values. Is it not possible for you to use this existing
> > command and maintain a mapping of property names -> CPUID leaves ?
> As already stated in the use-case description above, having this method
> around, helps us in a way that we can just take values and return them
> to containers. QEMU code already does a great job, generating CPUID
> responses, we don't want to do the same in our own code.

This is asking QEMU to maintain a new QAPI command which does not appear
to have a use case / benefit for QEMU mgmt. It isn't clear to me that
this should be considered in scope for QMP.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


