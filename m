Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB9C5199B7
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 10:28:06 +0200 (CEST)
Received: from localhost ([::1]:48704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmAMf-0003O6-7w
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 04:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmAIK-0001mZ-HJ
 for qemu-devel@nongnu.org; Wed, 04 May 2022 04:23:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmAIH-0007wm-UE
 for qemu-devel@nongnu.org; Wed, 04 May 2022 04:23:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651652613;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BcubAh1Tr4rbHTUWine2rmJUm0toDQ6hPEAsuUKPnlk=;
 b=glvdaT6SpCjDZdoo9gMzpASUDHsOndhaLbKqhnGpaHFEf4RgQJOlIjTl4XAKclzV+ETZxe
 KVQ0Hae30rOl9p81vK4CDmME/R1bDLhoXYyfl8sAtoA4FVWR//RClT4WGTUN2bfkyYGutV
 NWDJ0Q6omRz3NSAPakaPzUYMBAmw5XA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-Kr3sjsZJNLeY38KeTzKbtA-1; Wed, 04 May 2022 04:23:31 -0400
X-MC-Unique: Kr3sjsZJNLeY38KeTzKbtA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95D791014A61
 for <qemu-devel@nongnu.org>; Wed,  4 May 2022 08:23:31 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DD704010E21;
 Wed,  4 May 2022 08:23:30 +0000 (UTC)
Date: Wed, 4 May 2022 09:23:28 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH 2/2] docs: build-platforms: Clarify stance on minor
 releases and backports
Message-ID: <YnI4AEYrkUvjuA4g@redhat.com>
References: <20220420160311.248079-1-abologna@redhat.com>
 <20220420160311.248079-3-abologna@redhat.com>
 <YmAxjNgNWT2FNh8r@redhat.com>
 <CABJz62PnnGYV=6qiFYL2Y0+dg61P+nv0VvRUnP1cJkU6THcMEg@mail.gmail.com>
 <CABJz62NTwytWbStj172jOxe_1_f9=K4iv82Zh78twgQ5jNoAfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABJz62NTwytWbStj172jOxe_1_f9=K4iv82Zh78twgQ5jNoAfw@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, May 04, 2022 at 01:01:03AM -0700, Andrea Bolognani wrote:
> On Wed, Apr 20, 2022 at 09:18:47AM -0700, Andrea Bolognani wrote:
> > On Wed, Apr 20, 2022 at 05:15:08PM +0100, Daniel P. Berrangé wrote:
> > > On Wed, Apr 20, 2022 at 06:03:11PM +0200, Andrea Bolognani wrote:
> > > > These changes match those made in the following libvirt commits:
> > > >
> > > >   2ac78307af docs: Clarify our stance on backported packages
> > > >   78cffd450a docs: Spell out our policy concerning minor releases
> > > >
> > > > Since QEMU's platform support policy is based on libvirt's, it
> > > > makes sense to mirror these recent changes made to the latter.
> > > >
> > > > The policy is not altered significantly - we're simply spelling
> > > > out some rules that were likely already being implicitly
> > > > enforced.
> > >
> > > Indeed, I think that's basically defacto the case already.
> > >
> > > Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> >
> > Thanks! Are you going to bring these in through one of your trees, or
> > do I need to bug someone else so that they will pick them up? :)
> 
> I see these haven't gone in yet. Anything I can/should do to make
> that happen?

The tragedy of QEMU not having a central docs maintainer. I'll queue
this one for my next pull request.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


