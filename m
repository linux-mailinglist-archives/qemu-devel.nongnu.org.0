Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3091445C783
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 15:35:08 +0100 (CET)
Received: from localhost ([::1]:38816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mptMY-0006hv-Qa
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 09:35:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mptKu-0005Jv-F6
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 09:33:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mptKs-0006wY-PZ
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 09:33:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637764402;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=MaN1qxL+3f/H3PEChXNaV0yb36Wv9NfnQpLI52Wt7h0=;
 b=SUXHdAEiWq4T4Rm/XbyRGlAI0GNHVn0Altvzd02840HoivXheD6Ga3nEkNQHK3W/xgm/tS
 WVFJuy+kecAopshPPIoJ6/HNMpkRGKctUH1q4c0VqokYdqU9OFNIwO8ZxjWNWoOL8FwW6/
 b14EYeUmi4ydZIcHJu1Sqxc+S4nPfCs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-284-yIQHAqSWN5KYa3Z_TlFwiw-1; Wed, 24 Nov 2021 09:33:16 -0500
X-MC-Unique: yIQHAqSWN5KYa3Z_TlFwiw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91D4F1023F5F;
 Wed, 24 Nov 2021 14:33:15 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8854950E11;
 Wed, 24 Nov 2021 14:33:08 +0000 (UTC)
Date: Wed, 24 Nov 2021 14:33:06 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: Give the fosshost.org VM a purpose or a retirement
Message-ID: <YZ5NIo3XKLm1pRL2@redhat.com>
References: <CA+bd_6JS0t_COHiw2Y3Ej1gAeOGVTScNoS-=Seo+7udAe5wqZw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+bd_6JS0t_COHiw2Y3Ej1gAeOGVTScNoS-=Seo+7udAe5wqZw@mail.gmail.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 24, 2021 at 09:16:05AM -0500, Cleber Rosa wrote:
> Hi,
> 
> Fosshost.org was kind enough to supply the QEMU project with a public
> VM hosted by them.  The original use case we anticipated was to set up
> a GitLab CI runner, because we assumed the VM was KVM capable, but
> that turned out not to be the case.

Setting up a GitLab CI runner doesn't require KVM per se, it is
more about what you want to use the runner for.

I presume what you mean here is that the intended usage was to
run functional/integration tests that require KVM ?

> So, at this point, adding it as a GitLab CI runner would not add any
> significant improvement over the shared runners already provided, and
> it would require more maintenance effort.

The elephant in the room is GitLab's stated plan to switch gitlab.com
share runners onto a quota, instead of allowing unlimited usage.

Their original timescale is out of the window, because it is blocked
by RFE work they're doing first

  - Backend track CI minute usage for projects where the CI
    cost is $0

  - Frontend to report CI minute usage for projects where the
    CI cost is $0

They promised that they'd roll out those improvements and then
give several more months to let projects understand their
typical CI usage, before they enforce the quotas.

This is a long winded way of saying

 - We don't currently know how much CI time we use for qemu.git
   pipelines. Guesstimates based on number of pipelines/jos
   we create give *very* high monthly counts.
   
 - Once we do know, this may or may not be within the allowance
   we can acquire from signing up to their open source program
   I'm betting we are going to significantly exceed what even
   the OSS program offers for CI minutes.

 - We might be left with a choice of cutting down our CI
   jobs or adding more private runners.

> If there are any ideas for making use of this resource, and volunteers
> to configure and maintain it, please let me know.
> 
> Otherwise, it seems fair to relinquish the resource back to Fosshost.org.

The fosshost may yet be important once gitlab enforce CI minute quotas,
but the timeframe for when we'll discover this has pushed out significantly
since gitlab first announced their plan.

We've since got access to Azure credits too. Maybe we'll be better off
using Azure instead, or maybe we'll need both Azure and Fosshost. Hard
to predict.

I dont like that we're sitting on fosshost resources that could be used
by other projects, so if we can have a strong confidence that we will
not use it, then we should give it back. I don't think we've got that
confidence right now though due to gitlab's changed timeframes.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


