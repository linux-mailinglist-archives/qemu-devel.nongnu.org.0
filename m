Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E6330F5E3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 16:12:58 +0100 (CET)
Received: from localhost ([::1]:46006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7gJV-0005Ut-UQ
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 10:12:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7gD6-0007aE-SK
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:06:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7gD4-000440-Sp
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:06:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612451178;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VrZ8HBAgTvxJfylQ4tscyV0QpNsDc1DQAgzIcAIeUNI=;
 b=Tz6wFyax+fuZfFUwDuELyEdP6chNsSmBbBNXcbWowzOuEqTqtxz3ejgkWmsV2R5DO0JrCD
 lFrnPohEl0UK6H6Gh0hysf4ImQ0/hq6Gwltre3+kV/JuiZXxjdnf/RFM3Yt+scssn3zrMW
 ZDArszqfJsp64ixrgz4/ipRUe4n5mkA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-SZfP6bqxMGmjSBTlKJznsw-1; Thu, 04 Feb 2021 10:06:14 -0500
X-MC-Unique: SZfP6bqxMGmjSBTlKJznsw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C66F107ACE3;
 Thu,  4 Feb 2021 15:06:13 +0000 (UTC)
Received: from redhat.com (ovpn-115-169.ams2.redhat.com [10.36.115.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0CCF17CD6;
 Thu,  4 Feb 2021 15:06:04 +0000 (UTC)
Date: Thu, 4 Feb 2021 15:06:01 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC] Move tools sources to the tools directory (was Re: [PATCH
 v2] MAINTAINERS: Fix the location of tools manuals)
Message-ID: <20210204150601.GQ549438@redhat.com>
References: <20210204135425.1380280-1-wainersm@redhat.com>
 <516694bd-42fe-7929-811b-545f257c58bf@redhat.com>
 <0e0f9745-fe21-0bc6-2d02-431d67a6b57e@redhat.com>
 <CAFEAcA9nwnii1geGFpwEg8CFfST8B21y0BRL5ci=4ykiwqJywQ@mail.gmail.com>
 <20210204144006.GI6496@merkur.fritz.box>
 <20210204144700.GN549438@redhat.com>
 <CAFEAcA_=ANGKcy7QNfEdxUft9qGyCHttHo9hfvjQHC_ZfYeo1g@mail.gmail.com>
 <6339c78f-e77c-85e7-8e3f-6c2c514f3206@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6339c78f-e77c-85e7-8e3f-6c2c514f3206@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Greg Kurz <groug@kaod.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 04, 2021 at 04:02:01PM +0100, Paolo Bonzini wrote:
> On 04/02/21 15:50, Peter Maydell wrote:
> > On Thu, 4 Feb 2021 at 14:47, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > The distinction of contrib/ vs tools/ is supposed to be more a
> > > reflection on the quality of the program.
> > > 
> > > contrib/ should be considered demo-ware, no back compat guaranteed,
> > > may or may not work, no testing guaranteed, no man pages.
> > 
> > On this definition, why do we have any of it in our source tree?
> > Interesting but unmaintained side things can live quite happily
> > elsewhere (other peoples' git forks, blog posts, whatever).
> > If we care about a bit of code enough to keep it in our source
> > tree we ought to care about it enough to properly document
> > and test it and give it a suitable place to live.
> 
> That's indeed what happened with libvhost-user; it has graduated to a
> separate project since it is okay for use in other (production-ready)
> vhost-user backends.
> 
> Most of the software in contrib/ is essentially a reference implementations.
> They are "perfect" for that task, but not meant to grow more features or to
> be used in production (compare vhost-user-blk with qemu-storage-daemon for
> example).
> 
> The other four can be classified as follows:
> 
> - elf2dmp and rdmacm-mux should be in tools/, probably it's in contrib/
> because nobody uses it and there's no tests so it might bitrot.
> 
> - systemd is just a couple files meant for distros to pick up, possibly with
> customizations.  gitdm is just for people who want to get QEMU development
> stats, so I suppose these two are in the same group as well.

gitdm ought to be in scripts/ really

The systemd files ought to be in the same directory as the tool they
are associated with.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


