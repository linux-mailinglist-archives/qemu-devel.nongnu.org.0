Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B82C534E8E2
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 15:21:56 +0200 (CEST)
Received: from localhost ([::1]:54342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lREJf-0004ym-OH
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 09:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lREHJ-00043k-WC
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 09:19:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lREHF-00007T-8A
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 09:19:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617110364;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=unGHEf+8eyX5Rt/PZWhU7p87tM4OK09+hkycZACRYlo=;
 b=Q59WVH0IFk+dtaV8zXHhd9vleciafJx1wmftsiYiHNulN11ypivhcBe/nKNKmIJipITyvf
 d0qFDXDr+OS+HdQxhbr+gwpZNEp9gZwXIkGxcYw2RrSpcWgzK55xZksf6ZGTSXEqFuvx8H
 t3Cc3d2kdUQLMaJeRGi2+SISgyqHgZE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-MZ8QjfzWMva_pWnMcvh2Cg-1; Tue, 30 Mar 2021 09:19:15 -0400
X-MC-Unique: MZ8QjfzWMva_pWnMcvh2Cg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 769921927824;
 Tue, 30 Mar 2021 13:19:09 +0000 (UTC)
Received: from redhat.com (ovpn-114-2.ams2.redhat.com [10.36.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A97D27A3B0;
 Tue, 30 Mar 2021 13:19:06 +0000 (UTC)
Date: Tue, 30 Mar 2021 14:19:03 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: Serious doubts about Gitlab CI
Message-ID: <YGMlR9gXwPqLdhr0@redhat.com>
References: <YFOt+R77HfpNEYFc@stefanha-x1.localdomain>
 <2d1e40c6-5fa4-271f-5ecc-74da7c04ffea@redhat.com>
 <YFRv9zMvBXtpfN3t@stefanha-x1.localdomain>
 <20210319101848.ebdwkfttay73jajr@kamzik.brq.redhat.com>
 <cad173cb-7715-1286-eba2-75e9816e6177@redhat.com>
 <b351f107-a9fd-f7cf-1f27-2d435cea612a@amsat.org>
 <d05a40b2-ff80-d9c8-8dfe-5dfce2e57d3d@redhat.com>
 <YGHf3HjYTRJwktbf@stefanha-x1.localdomain>
 <YGMJSoIGa5VoVDB1@redhat.com>
 <04e5e251-7a09-dcf6-82ad-31bf696bc248@redhat.com>
MIME-Version: 1.0
In-Reply-To: <04e5e251-7a09-dcf6-82ad-31bf696bc248@redhat.com>
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
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL_A=0.1 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 30, 2021 at 01:55:48PM +0200, Thomas Huth wrote:
> On 30/03/2021 13.19, Daniel P. Berrangé wrote:

> > Another example, is that we test builds on centos7 with
> > three different combos of crypto backend settings. This was
> > to exercise bugs we've seen in old crypto packages in RHEL-7
> > but in reality, it is probably overkill, because downstream
> > RHEL-7 only cares about one specific combination.
> 
> Care to send a patch? Or shall we just wait one more months and then remove
> these jobs (since we won't support RHEL7 after QEMU 6.0 anymore)?

Yeah, we'll be able to cull this entirely very soon, including
both the C backcompat code and CI jobs at the same time, so I'll
just wait.


> > Our docker containers install ccache already and I could have sworn
> > that we use that in gitlab, but now I'm not so sure. We're only
> > saving the "build/" directory as an artifact between jobs, and I'm
> > not sure that directory holds the ccache cache.
> 
> AFAIK we never really enabled ccache in the gitlab-CI, only in Travis.
> 
> > > This is as far as I've gotten with thinking about CI efficiency. Do you
> > > think these optimizations are worth investigating or should we keep it
> > > simple and just disable many builds by default?
> > 
> > ccache is a no-brainer and assuming it isn't already working with
> > our gitlab jobs, we must fix that asap.
> 
> I've found some nice instructions here:
> 
> https://gould.cx/ted/blog/2017/06/10/ccache-for-Gitlab-CI/
> 
> ... and just kicked off a build with these modifications, let's see how it
> goes...

Yep, that looks similar to what we do in libvirt, though we don't override
the compiler at the job level. Instead we just ensure the dir containing
ccache symlinks appears first in $PATH.

So in containers we have this:

https://gitlab.com/libvirt/libvirt/-/blob/master/ci/containers/centos-8.Dockerfile

and in gitlab-ci.yml we have env vars set

  export CCACHE_BASEDIR="$(pwd)"
  export CCACHE_DIR="$CCACHE_BASEDIR/ccache"
  export CCACHE_MAXSIZE="500M"
  export PATH="$CCACHE_WRAPPERSDIR:$PATH"

And per-job caches:

  cache:
    paths:
      - ccache/
    key: "$CI_JOB_NAME"

note the "key" is important to avoid clashing caches from different
envs.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


