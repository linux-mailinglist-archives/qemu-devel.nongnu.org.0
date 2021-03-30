Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BFC34E887
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 15:11:17 +0200 (CEST)
Received: from localhost ([::1]:44052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRE9M-0000CD-Um
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 09:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lRE88-00080j-Nq
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 09:10:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lRE85-00034d-TT
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 09:10:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617109797;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=dpkrFDmPXjSQsf7vE3PU/iJ1d5yMhD8/Rc/MSfuIt7c=;
 b=GjksDlNrcLDc63K1wsGo6jYkaJr12O0szqba03IkSDStlhlAe7PAzrjhwjBhrAv/8IC0bl
 BQ+Avmj5ZD3PM/3iHcDaFFe15ROdH1Pqdq+q9q5qDCqVQjV0ZuSawzTn6I3jByCTFt6NLC
 HdPDAtTXyiqj/D+Sf3t3TlZIKIz0m30=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-x0-gZPDtNJmnr3sYAXg-DA-1; Tue, 30 Mar 2021 09:09:53 -0400
X-MC-Unique: x0-gZPDtNJmnr3sYAXg-DA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6A94A40C1;
 Tue, 30 Mar 2021 13:09:52 +0000 (UTC)
Received: from redhat.com (ovpn-114-2.ams2.redhat.com [10.36.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C9D210016DB;
 Tue, 30 Mar 2021 13:09:43 +0000 (UTC)
Date: Tue, 30 Mar 2021 14:09:40 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Serious doubts about Gitlab CI
Message-ID: <YGMjAvbwfQtD1Vts@redhat.com>
References: <2d1e40c6-5fa4-271f-5ecc-74da7c04ffea@redhat.com>
 <YFRv9zMvBXtpfN3t@stefanha-x1.localdomain>
 <20210319101848.ebdwkfttay73jajr@kamzik.brq.redhat.com>
 <cad173cb-7715-1286-eba2-75e9816e6177@redhat.com>
 <b351f107-a9fd-f7cf-1f27-2d435cea612a@amsat.org>
 <d05a40b2-ff80-d9c8-8dfe-5dfce2e57d3d@redhat.com>
 <YGHf3HjYTRJwktbf@stefanha-x1.localdomain>
 <YGMJSoIGa5VoVDB1@redhat.com>
 <04e5e251-7a09-dcf6-82ad-31bf696bc248@redhat.com>
 <902a93ca-bd71-504b-fcf5-fec2480f9ec0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <902a93ca-bd71-504b-fcf5-fec2480f9ec0@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jones <drjones@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 30, 2021 at 02:09:38PM +0200, Paolo Bonzini wrote:
> On 30/03/21 13:55, Thomas Huth wrote:
> > 
> > Since the build system has been converted to meson, I think the
> > configure script prefers to use the submodules instead of the distro
> > packages. I've tried to remedy this a little bit here:
> > 
> > https://gitlab.com/qemu-project/qemu/-/commit/db0108d5d846e9a8
> > 
> > ... but new jobs of course will use the submodules again if the author
> > is not careful.
> 
> Hmm... it should be the same (or if not it's a bug).
> 
> > Also I wonder whether we could maybe even get rid of the capstone and slirp submodules in QEMU now
> 
> At least for slirp, we probably want to stay more on the bleeding edge which
> implies having to keep the submodule.  Capstone and libfdt probably can go.

I don't think we need to stay on the bleeding edge per-se in terms of
what we build against

We have a declared minimum version of libslirp that we absolutely must
have in order to get the API we need for core featureset. If new APIs
are introduced, it is quite reasonable for us to make their usage in
QEMU conditional, just as we would for any other 3rd party library we
use.

The reason to have slirp as a submodule is just to avoid a functional
regression on distros which don't have slirp available at all, and
which we don't expect to introduce it.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


