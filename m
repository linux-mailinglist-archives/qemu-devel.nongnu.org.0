Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8D731B8D4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:15:16 +0100 (CET)
Received: from localhost ([::1]:39346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcmZ-0000dw-3q
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:15:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lBcW8-00086D-0c
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:58:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lBcW4-0006PR-KE
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:58:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613390291;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1VA9DUWrtJjjbYgjHJZzBN7y7p7bGtfAUQn2JHZQ6m4=;
 b=VSu78T35dwcnE+GCXKBtRbl0/wOd0P0sjmVAQAjZhOB+hIOshKWPe/tA2jHnTRCrUkZ0tO
 uK5n/NWtpWCcRqumuug9Sl8vcx/Dy+FHd25JX37zsnfhCOfkTNFAxew11Mou2aGk0R9G1U
 RVkMW+XwHsRI+geE3XVSW9iFOqJqjgA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-JlmivbQZOnOHAXCHbUEwhg-1; Mon, 15 Feb 2021 06:58:07 -0500
X-MC-Unique: JlmivbQZOnOHAXCHbUEwhg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 472AC192CC41;
 Mon, 15 Feb 2021 11:58:06 +0000 (UTC)
Received: from redhat.com (ovpn-115-126.ams2.redhat.com [10.36.115.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 34F995C233;
 Mon, 15 Feb 2021 11:58:03 +0000 (UTC)
Date: Mon, 15 Feb 2021 11:58:00 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 34/42] gitlab-ci: Build MIPS R5900 cross-toolchain
 (Gentoo based)
Message-ID: <20210215115800.GF1542881@redhat.com>
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-35-f4bug@amsat.org>
 <f9ad5a4e-a6cf-d8ec-01df-2e2b33851296@amsat.org>
MIME-Version: 1.0
In-Reply-To: <f9ad5a4e-a6cf-d8ec-01df-2e2b33851296@amsat.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, Fredrik Noring <noring@nocrew.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 15, 2021 at 12:42:50PM +0100, Philippe Mathieu-Daudé wrote:
> On 2/14/21 6:59 PM, Philippe Mathieu-Daudé wrote:
> > Add a job to build the Gentoo based MIPS R5900 cross-toolchain image.
> > 
> > Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > ---
> >  .gitlab-ci.d/containers.yml | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
> > index 587bd4ba2e3..f441e608446 100644
> > --- a/.gitlab-ci.d/containers.yml
> > +++ b/.gitlab-ci.d/containers.yml
> > @@ -152,6 +152,13 @@ mipsel-debian-cross-container:
> >    variables:
> >      NAME: debian-mipsel-cross
> >  
> > +mipsr5900el-gentoo-cross-container:
> > +  <<: *container_job_definition
> > +  variables:
> > +    NAME: gentoo-mipsr5900el-cross
> > +    EXTRA_FILES: tests/docker/dockerfiles/gentoo-mipsr5900el-cross.docker.d/crossdev.conf
> > +  timeout: 1h 30m
> 
> Well, depending of the runner hardware / load, this is not
> enough:
> 
> Duration: 132 minutes 17 seconds
> https://gitlab.com/philmd/qemu/-/jobs/1029975495

Yeah that's waaay too long to be part of standard CI.

> I'll use "2h 30" instead. I'm still looking how to make this job
> optional (or manual).

If it is manual who is ever going to run it and be willing to wait
2 hours for it. This just feels too long to be useful.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


