Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 785C869C7CF
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:41:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2en-0002Li-OL; Mon, 20 Feb 2023 04:40:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pU2eX-0002LL-NC
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:40:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pU2eU-0001sz-Ap
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:40:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676886004;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gtn60V4K+tbuw7jQT7DNRfPx7vYZh4SzLC8tUZHQJDA=;
 b=eQ5SOsGlVLtyF8HeLtubMj0zSjzHjKIcjIVCkUxsPgCSW9CFHzF4PYSbEd36RCBmp6PWMJ
 M1ikB9rK7OIrzHQObhncFKk5rlmuuxMYmadCakUnu3fPpxNNpvo7/EcEnGEOeKGKWlPyAD
 xXOcKcVG43W+0kR2Z08Gcvjx/aGcfK8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-He8RkHVTOG2bsaxcp_2d6g-1; Mon, 20 Feb 2023 04:40:03 -0500
X-MC-Unique: He8RkHVTOG2bsaxcp_2d6g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39CBC101A52E;
 Mon, 20 Feb 2023 09:40:03 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BDA54C15BA0;
 Mon, 20 Feb 2023 09:40:01 +0000 (UTC)
Date: Mon, 20 Feb 2023 09:39:59 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC PATCH] docs/about/build-platforms: Refine the distro
 support policy
Message-ID: <Y/M/76OXXcpsxcE2@redhat.com>
References: <20230217132631.403112-1-thuth@redhat.com>
 <87sff470lj.fsf@pond.sub.org> <Y++ka8oPpHrNyonT@redhat.com>
 <fe0de452-86df-ca43-8294-eac3938f72df@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe0de452-86df-ca43-8294-eac3938f72df@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Feb 17, 2023 at 07:47:51PM +0100, Thomas Huth wrote:
> On 17/02/2023 16.59, Daniel P. Berrangé wrote:
> > On Fri, Feb 17, 2023 at 04:55:49PM +0100, Markus Armbruster wrote:
> ....
> > The cost/benefit tradeoff of dropping the platforms entirely
> > is not obviously favourable when we don't have clear demand
> > to bump the min versions of native packages, and the cost to
> > users stuck on these platforms to build their own toolchain
> > or libraries is very high.
> 
> There's another urgent point which I completely forget to mention in my
> patch description (not sure how I managed that, since it's bugging me quite
> badly in the past weeks): We're struggling heavily with CI minutes. If we
> have to support multiple major releases for a long time in parallel, there
> will always be the desire to have all major releases also tested in the CI
> ... and honestly, we're really struggling quite badly there right now - as
> you know, we've already run out of CI minutes in January in the main
> project, and also in my forked repo I'm struggling each month. Additionally,
> it's of course additional effort to keep everything in the "green" state the
> more you have to support.
> 
> We're currently "lucky" in a sense that we're only testing one version of
> CentOS, Debian and Ubuntu right now, but there have been voices in the past
> weeks asking for more already (like we also did in the past already). I'd
> really appreciate if we could have a clearer policy here to support less at
> the same time. It would help with the pressure on the CI and the effort and
> time it takes to maintain all that stuff.

Note, we have never equated CI coverage for a platform with the
technical support for a platform. We have sooooo many combinations
which are not tested and are supported from a technical POV. It
would be nice to have comprehensive testing, but we're unlikely
to ever achieve it. IOW, lack automated CI of testing is not a
reason to delete support for a platform, it just means that we'll
rely on manual testing, and users can't have such high confidence
in the platform.


One thing we've not explored is multiple levels of CI coverage.
We could degrade certain platforms to have periodic post-merge
testing, rather than pre-merge. eg cut down gating platform
combos, but then once a week run a broader CI pipeline. This
would allow regressions to creep in periodically for more obscure
combinations, but still give us an alert so we can fix them before
release.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


