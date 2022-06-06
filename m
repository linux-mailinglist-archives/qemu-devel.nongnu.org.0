Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F8C53E429
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 13:09:38 +0200 (CEST)
Received: from localhost ([::1]:48354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyAc5-0007KG-Lv
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 07:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nyAS9-0002Re-Ur
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 06:59:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nyAS7-00038H-3f
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 06:59:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654513158;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=RCFPrjNc+LW4LrMhjr23R7YVm7ZIpHRp3O4WPTeWDYg=;
 b=di+Dp6lmBubd9FVxlMpJCwR71oTafJnBGbgXomgwkn7Iu6KhY9ZIrftX0zK6QRPskk9PsJ
 nh+GBsjSVi4+Y/PPdaVcy+DCIljLcxO8tmQ416dRM/c1F/0JO0qVNg/T+SfAgRl/kV1a2+
 ZRAiOCsmapr+nv3SqBWkL6rMA2a1u2Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-dU3KSQLbMx-6scpQI6R6QA-1; Mon, 06 Jun 2022 06:59:14 -0400
X-MC-Unique: dU3KSQLbMx-6scpQI6R6QA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 655B280C8EE;
 Mon,  6 Jun 2022 10:59:14 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A20341410DDB;
 Mon,  6 Jun 2022 10:59:12 +0000 (UTC)
Date: Mon, 6 Jun 2022 11:59:10 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Greg Kurz <groug@kaod.org>
Cc: Thomas Huth <thuth@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, mopsfelder@gmail.com,
 Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH] target/ppc/cpu-models: Update max alias to power10
Message-ID: <Yp3d/pdf/8Pwth88@redhat.com>
References: <20220531172711.94564-1-muriloo@linux.ibm.com>
 <475c2f40-8c58-8d51-4cc5-da5b9db814f2@redhat.com>
 <20220601103825.498c378f@bahia>
 <5076ea8a-428d-5aa2-1a8c-cd38bf67c7f9@redhat.com>
 <20220601120324.66c77571@bahia>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220601120324.66c77571@bahia>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 01, 2022 at 12:03:24PM +0200, Greg Kurz wrote:
> On Wed, 1 Jun 2022 11:25:43 +0200
> Thomas Huth <thuth@redhat.com> wrote:
> 
> > On 01/06/2022 10.38, Greg Kurz wrote:
> > > On Wed, 1 Jun 2022 09:27:31 +0200
> > > Thomas Huth <thuth@redhat.com> wrote:
> > > 
> > >> On 31/05/2022 19.27, Murilo Opsfelder Araujo wrote:
> > >>> Update max alias to power10 so users can take advantage of a more
> > >>> recent CPU model when '-cpu max' is provided.
> > ...
> > > We already have the concept of default CPU for the spapr
> > > machine types, that is usually popped up to the newer
> > > CPU model that is going to be supported in production.
> > > This goes with a bump of the machine type version as
> > > well for the sake of migration. This seems a lot more
> > > reliable than the "max" thingy IMHO.
> > > 
> > > Unless there's a very important use case I'm missing,
> > > I'd rather kill the thing instead of trying to resurrect
> > > it.
> > 
> > It's about making ppc similar to other architectures, which
> > have "-cpu max" as well, see:
> > 
> >   https://gitlab.com/qemu-project/qemu/-/issues/1038
> > 
> > It would be nice to get something similar on ppc.
> > 
> 
> Problem is that on ppc, given the variety of models and boards,
> the concept of "max" is quite fuzzy... i.e. a lot of cases to
> consider for a benefit that is unclear to me. Hence my questioning.
> If the idea is just to match what other targets do without a specific
> use case in mind, this looks quite useless to me.

Essentially "max" is a way for a mgmt application to ask for the
most feature rich CPU available for their given configuration.

With KVM this is trivially equiv to '-cpu host'.

With TCG on other archs this has been "all the features that
TCG implements". This implicitly assumes that CPU features are
generally additive and compatible with all historical machine
types. This is fine for x86, but if it doesn't work for PPC
we can come up with an alternative definition.

For example if you have a set of 3 possible CPU models that
work with a given machine board, then expand 'max' to be the
"best" of these 3 possible models.  This still satisfies the
goal of the mgmt app, which is to be able to ask for a good
CPU without having to know its architecture/machine type
specific name.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


