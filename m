Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0AD54CD36
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 17:41:13 +0200 (CEST)
Received: from localhost ([::1]:41460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1V8p-00022D-Tw
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 11:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1V1l-0004O4-Hk
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:33:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1V1j-000662-7V
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:33:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655307229;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=th5iRak7py2awA3WVPEYtYP7WNmoN9jahx5sDV0WN7Y=;
 b=bh+t378RF/BO9aJJHchmlq4rRzT+Jps4d0WwZGNhhm0Cq12iECDGfvyhKmZvl2YYEU7JcH
 k3AfeFmdJRtiJCX6u1gLlrmLDCr+ZsuBRX7sjonQQ3X54w0bzDtBMLklPW55xN3vzTs6N+
 OWZy6dETwLR4ie1dPJCbdniu1113ZiE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-6fawEcBKMGmvgQud9La9Mg-1; Wed, 15 Jun 2022 11:33:48 -0400
X-MC-Unique: 6fawEcBKMGmvgQud9La9Mg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A24E0811E76;
 Wed, 15 Jun 2022 15:33:47 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E74ED492CA5;
 Wed, 15 Jun 2022 15:33:45 +0000 (UTC)
Date: Wed, 15 Jun 2022 16:33:43 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 2/5] tests/qemu-iotests: skip 108 when FUSE is not loaded
Message-ID: <Yqn71w5X97dQXMlj@redhat.com>
References: <20220614015044.2501806-1-jsnow@redhat.com>
 <20220614015044.2501806-3-jsnow@redhat.com>
 <fa6e9152-73a1-d6ca-269a-1b1513472aa8@redhat.com>
 <YqhN50NeY3RIfvmy@redhat.com>
 <CAFn=p-a0hf6tp7NYS73S3OW9N_KA+NQRcLNAxh-UreVF9RkZ2Q@mail.gmail.com>
 <CAFn=p-a2kQcuy6T47dWiFUOR2eWZhMOw9VJNEYT0Y6xau7YqTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFn=p-a2kQcuy6T47dWiFUOR2eWZhMOw9VJNEYT0Y6xau7YqTQ@mail.gmail.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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

On Wed, Jun 15, 2022 at 09:41:32AM -0400, John Snow wrote:
> On Tue, Jun 14, 2022 at 10:30 AM John Snow <jsnow@redhat.com> wrote:
> >
> > On Tue, Jun 14, 2022 at 4:59 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > >
> > > On Tue, Jun 14, 2022 at 06:46:35AM +0200, Thomas Huth wrote:
> > > > On 14/06/2022 03.50, John Snow wrote:
> > > > > In certain container environments we may not have FUSE at all, so skip
> > > > > the test in this circumstance too.
> > > > >
> > > > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > > > ---
> > > > >   tests/qemu-iotests/108 | 6 ++++++
> > > > >   1 file changed, 6 insertions(+)
> > > > >
> > > > > diff --git a/tests/qemu-iotests/108 b/tests/qemu-iotests/108
> > > > > index 9e923d6a59f..e401c5e9933 100755
> > > > > --- a/tests/qemu-iotests/108
> > > > > +++ b/tests/qemu-iotests/108
> > > > > @@ -60,6 +60,12 @@ if sudo -n losetup &>/dev/null; then
> > > > >   else
> > > > >       loopdev=false
> > > > > +    # Check for fuse support in the host environment:
> > > > > +    lsmod | grep fuse &>/dev/null;
> > > >
> > > > That doesn't work if fuse has been linked statically into the kernel. Would
> > > > it make sense to test for /sys/fs/fuse instead?
> > > >
> > > > (OTOH, we likely hardly won't run this on statically linked kernels anyway,
> > > > so it might not matter too much)
> > >
> > > But more importantly 'lsmod' may not be installed in our container
> > > images. So checking /sys/fs/fuse avoids introducing a dep on the
> > > 'kmod' package.
> > >
> > > >
> > > > > +    if [[ $? -ne 0 ]]; then
> > > >
> > > > I'd prefer single "[" instead of "[[" ... but since we're requiring bash
> > > > anyway, it likely doesn't matter.
> > >
> > > Or
> > >
> > >     if  test $? != 0 ; then
> > >
> > > >
> > > > > +        _notrun 'No Passwordless sudo nor FUSE kernel module'
> > > > > +    fi
> > > > > +
> > > > >       # QSD --export fuse will either yield "Parameter 'id' is missing"
> > > > >       # or "Invalid parameter 'fuse'", depending on whether there is
> > > > >       # FUSE support or not.
> > > >
> >
> > Good suggestions, thanks!
> >
> 
> I think I need to test against /dev/fuse instead, because /sys/fs/fuse
> actually exists, but because of docker permissions (etc), FUSE isn't
> actually usable from the child container.
> 
> I wound up with this:
> 
> # Check for usable FUSE in the host environment:
> if test ! -c "/dev/fuse"; then
>     _notrun 'No passwordless sudo nor usable /dev/fuse'
> fi
> 
> Seems to work for my case here, at least, but I don't have a good
> sense for how broadly flexible it might be. It might be nicer to
> concoct some kind of NOP fuse mount instead, but I wasn't able to
> figure out such a command quickly.
> 
> The next problem I have is actually related; test-qga (for the
> Centos.x86_64 run) is failing because the guest agent is reading
> /proc/self/mountinfo -- which contains entries for block devices that
> are not visible in the current container scope. I think when QGA goes
> to read info about these devices to populate a response, it chokes.
> This might be a genuine bug in QGA if we want it to tolerate existing
> inside of a container.

Yes, we should fix this. Even if you don't run QGA in a container,
someone might configure the systemd service to harden it, by
restricting what /dev it is able to see and thus trigger the
same issue.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


