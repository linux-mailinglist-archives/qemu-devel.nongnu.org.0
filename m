Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C813C56A752
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 17:58:14 +0200 (CEST)
Received: from localhost ([::1]:53388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9TtN-0007RH-OZ
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 11:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9ToP-0002yK-A5
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 11:53:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9ToM-00025k-Hv
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 11:53:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657209181;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mjOb2av6Ih8CupOdSGuIvSV/rk8OU7JCsZN0iKI3nY0=;
 b=jU4UQvQHn/wUUe5HirvT7TTERnNLA+Xp2IHIX+PfLI5Qkxivxv+L16ixxpWKOXPcLma9LU
 3QSla/H23MyHTuNmEzGwF69ZM54qs3wRxWzvfD4F3ZpO0N1YFzv1af+gjjyI2iMQ+Y2H9M
 vnQLV3/2gsdZclCxFhERpL3rKXKvfGY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-nHLqkSPQOTSGrb3ioW74IA-1; Thu, 07 Jul 2022 11:52:57 -0400
X-MC-Unique: nHLqkSPQOTSGrb3ioW74IA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9FC3E3C0F38D;
 Thu,  7 Jul 2022 15:52:56 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ECB401121315;
 Thu,  7 Jul 2022 15:52:54 +0000 (UTC)
Date: Thu, 7 Jul 2022 16:52:52 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Michael Roth <michael.roth@amd.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 10/13] tests/vm: Remove docker cross-compile test from
 CentOS VM
Message-ID: <YscBVHZ5+yUEl71w@redhat.com>
References: <20220707040310.4163682-1-jsnow@redhat.com>
 <20220707040310.4163682-11-jsnow@redhat.com>
 <YsaaOtLYrbQseDaF@redhat.com>
 <CAFn=p-axeGwhgonZR_OV7HiHqcg8BBNr=dOhY1XvrSV96jvrmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFn=p-axeGwhgonZR_OV7HiHqcg8BBNr=dOhY1XvrSV96jvrmw@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, Jul 07, 2022 at 11:48:35AM -0400, John Snow wrote:
> On Thu, Jul 7, 2022 at 4:33 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Thu, Jul 07, 2022 at 12:03:07AM -0400, John Snow wrote:
> > > The fedora container has since been split apart, so there's no suitable
> > > nearby target that would support "test-mingw" as it requires both x32
> > > and x64 support -- so either fedora-cross-win32 nor fedora-cross-win64
> > > would be truly suitable.
> > >
> > > Just remove this test as superfluous with our current CI infrastructure.
> > >
> > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > ---
> > >  tests/vm/centos | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/tests/vm/centos b/tests/vm/centos
> > > index 3a527c47b3d..097a9ca14d3 100755
> > > --- a/tests/vm/centos
> > > +++ b/tests/vm/centos
> > > @@ -28,7 +28,6 @@ class CentosVM(basevm.BaseVM):
> > >          tar -xf $SRC_ARCHIVE;
> > >          make docker-test-block@centos8 {verbose} J={jobs} NETWORK=1;
> > >          make docker-test-quick@centos8 {verbose} J={jobs} NETWORK=1;
> > > -        make docker-test-mingw@fedora  {verbose} J={jobs} NETWORK=1;
> >
> > Well it could have been replaced with two:
> >
> >       make docker-test-mingw@fedora-cross-win32  {verbose} J={jobs} NETWORK=1;
> >       make docker-test-mingw@fedora-cross-win64  {verbose} J={jobs} NETWORK=1;
> 
> but "test-mingw" expects to see the dependencies from both win32 and
> win64, so I'd have to split the test-mingw target, and I am far off
> course from what I wanted to be doing as-is.

Oh right, so we should really drop the 'test-mingw' bit entirely
as we have nothing it can be used with now. Instead 'test-build'
needs to honour $QEMU_CONFIGURE_OPTS, so we can do

   make docker-test-build@fedora-cross-win32  (or any of the non-x86
                                               Linux cross containers)

Separate pre-existing problem though, not related to your series.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


