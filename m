Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF912CA862
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 17:41:43 +0100 (CET)
Received: from localhost ([::1]:52688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk8ii-00067O-7J
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 11:41:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kk8gk-0004xH-QZ
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 11:39:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kk8gi-0007T7-UX
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 11:39:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606840776;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=des2iJRegdoI/WZ5jIEZ8/xjRd7Gn7jPnch6KDV3ueQ=;
 b=GReJAmLJZfpRXHmoQCGZz/XpjL0czOjsSzMIQccIK+gTE3USVm+iSXblH7WNvAeeki0Sv/
 dSvrgDYbiNgJbbUoN9LG+ovyWsAsZ6SGVlpX0j/zznPaK+QeaCgNWBeY4zZ9wBaJJIqX+d
 2H6t4IT9333Poexzqn4Y2iTlVsEOX18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-8fHtIe5FN72IA1rPFra17Q-1; Tue, 01 Dec 2020 11:39:30 -0500
X-MC-Unique: 8fHtIe5FN72IA1rPFra17Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3EAD805BF4;
 Tue,  1 Dec 2020 16:39:28 +0000 (UTC)
Received: from redhat.com (ovpn-115-4.ams2.redhat.com [10.36.115.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E95145D6AD;
 Tue,  1 Dec 2020 16:39:27 +0000 (UTC)
Date: Tue, 1 Dec 2020 16:39:24 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH] python 3.5 compatibility
Message-ID: <20201201163924.GF2139284@redhat.com>
References: <20201127183619.8958-1-info@metux.net>
 <CAFEAcA_KQ3q-=AG=b77WDbtrBRXCUKDoMkn9en12Bz48B-GjgQ@mail.gmail.com>
 <b04a421d-9844-70b7-9c5e-3a302ca94da9@metux.net>
 <87r1oa9gsx.fsf@dusky.pond.sub.org>
 <20f78421-28b7-93d1-a691-05d6e98da5dc@metux.net>
MIME-Version: 1.0
In-Reply-To: <20f78421-28b7-93d1-a691-05d6e98da5dc@metux.net>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 01, 2020 at 04:59:23PM +0100, Enrico Weigelt, metux IT consult wrote:
> On 01.12.20 07:33, Markus Armbruster wrote:
> 
> > Which has oldstable status.  Good for running the old and stable
> > software packaged by it (such as QEMU 2.8), and old (and hopefully
> > stable) software of similar vintage.
> 
> It's still heavily used out in the field, and officially supported.
> But that's just one example.
> 
> Perhaps I should add some more details on the situation: I'm using
> (specially built) qemu with ptxdist/dkit - not the distro package.
> The idea w/ ptxdist is that you just pull the trigger and it builds
> everything needed for some project. Qemu is built specifically for
> the configured target. Perhaps you've noticed I'm also doing development
> of new qemu features - something that one doesn't want to do on old
> versions.
> 
> > Have you considered upgrading to stable?
> 
> This would solve the problem just for me alone, not for others out
> there, who're working w/ the BSP. And asking everybody (especially in
> enterprise environments) to do a full release upgrade just for one
> single tool (qemu) isn't someting that works easily.
> 
> If you insist in having python3.6 a hard requirement for qemu, you're
> putting me into the situation of having to do lots of backport work
> for quite long time (until everybody really did the upgrade). :(

python3.6 is just the one problem you've currently hit. In order to keep
the burden of maintaining support for old software under control we have
a well defined set of platforms that we target. When a particular version
of a distro drops off our list, we will bump the minimum versions of any
software we depend on. In this case you've hit python3.6 so far, but we
are liable to bump other minimum versions too which will also impact
this old distro. So I'm afraid it will be a loosing battle to stay on
this old distro, while building cutting edge QEMU.

I appreciate this isn't the answer you want to hear, but we've defined
our support platform matrix to try to balance multiple competing factors
and unfortunately this means distros are going to periodically get dropped
by new QEMU as they get older.

One possible way you can mitigate this is to make use of containers for
your development and deployment. eg even tough you're using an old
Devuan, you can use docker/podman to build and deploy QEMU inside a
stable Devuan container.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


