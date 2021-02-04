Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A5F30FB9B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:36:02 +0100 (CET)
Received: from localhost ([::1]:43920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jU1-0001N8-Bw
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:36:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iZh-0002CA-RN
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:37:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iZg-0005Bq-7i
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:37:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612460267;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wJ+xVshd4jD+n8vy5nOFsPoNOeCR5pL5aWyN3A+cG00=;
 b=TZ2qEOPosxOprPK4bpTW8C4lzhXqMZ5CRvDqO9GOAi7yk+hBh5ffZ1sb5KqrUXoZlagOgA
 mcUbLVzTjy0K+94FPfP/mMLngp9A2Ld6oxuSenq8s6jSlt5Qx/0QcmUGZhLSbTXwpcDQ6s
 LEMkFlwgEKl3+SW3l6aFJw/cc3K8oe0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-dzPWuXh6Ma6Nge_k-X_1yA-1; Thu, 04 Feb 2021 12:37:42 -0500
X-MC-Unique: dzPWuXh6Ma6Nge_k-X_1yA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC7F73E74B;
 Thu,  4 Feb 2021 17:37:40 +0000 (UTC)
Received: from redhat.com (ovpn-112-221.ams2.redhat.com [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75F8B60937;
 Thu,  4 Feb 2021 17:37:39 +0000 (UTC)
Date: Thu, 4 Feb 2021 17:37:36 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: gitlab containers are broken
Message-ID: <20210204173736.GV549438@redhat.com>
References: <567366a0-0e5a-3ab6-8e8e-ad66b46264b2@linaro.org>
 <756e4707-b0ae-f26c-6e09-67fe205ec098@redhat.com>
 <8238fe1d-c7c0-ab72-fa2f-c4cf9ce018bc@linaro.org>
 <6ec7bebe-587d-df2d-0221-e12cb6f4c775@redhat.com>
 <20210204100009.GE549438@redhat.com>
 <9e716df9-3be3-4c79-dff3-e6475b13fdc5@linaro.org>
MIME-Version: 1.0
In-Reply-To: <9e716df9-3be3-4c79-dff3-e6475b13fdc5@linaro.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 04, 2021 at 07:36:19AM -1000, Richard Henderson wrote:
> On 2/4/21 12:00 AM, Daniel P. Berrangé wrote:
> >>> Hmm.  Is there any way to get the full output of the container build?  At
> >>> present it's being truncated:
> >>>
> >>> #7 [4/5] RUN yum install -y bzip2     bzip2-devel     ccache     csnappy-de...
> >>>
> >>>
> >>> In particular, I'm trying to add a new test, and I have added libffi-devel.i686
> >>> to the fedora-i386-cross.docker file, but then the actual build fails because
> >>> the libffi header file is missing.
> ...
> > Alternatively just make your changes to the dockerfiles and thne push
> > the branch to gitlab. Gitlab will run the build and you can pull down
> > the docker image from your fork's docker registry
> 
> That's what I did, with the results as described above.

Ah, if you can point me to the gitlab pipeline / branch I can have a
look at diagnosing it.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


