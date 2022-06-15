Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8B254CEEA
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 18:42:51 +0200 (CEST)
Received: from localhost ([::1]:38358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1W6U-00056Z-A6
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 12:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1Vn7-0006rA-UC
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 12:22:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1Vmy-0000jv-Bo
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 12:22:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655310159;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0KbSr9tlgrnkFefo2XMsWhb4fkrBWFJbk9/ky+3k0c0=;
 b=D8IH2Vw5M93SFhBuPeEWVN9amGmaq2yOMNu4ZDsjphvMZnh5mOSzy/tOYf6KcX13Y53PKx
 ZQNNUa9VCj6RdKRLPxs5l4hbjds1BTwygNQc/o2MSYSLuOmK41Ovb3IfB4kdY1rkWyUbO7
 uMLlB40hSUr1Z9f4zGVTXJJgye5FuTE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-cPGbbvbgOrev2bzgthc7Ug-1; Wed, 15 Jun 2022 12:22:36 -0400
X-MC-Unique: cPGbbvbgOrev2bzgthc7Ug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8E6B802804;
 Wed, 15 Jun 2022 16:22:35 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AF07C2810D;
 Wed, 15 Jun 2022 16:22:33 +0000 (UTC)
Date: Wed, 15 Jun 2022 17:22:30 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 2/5] tests/qemu-iotests: skip 108 when FUSE is not loaded
Message-ID: <YqoHRniXxukVEfYA@redhat.com>
References: <20220614015044.2501806-1-jsnow@redhat.com>
 <20220614015044.2501806-3-jsnow@redhat.com>
 <fa6e9152-73a1-d6ca-269a-1b1513472aa8@redhat.com>
 <YqhN50NeY3RIfvmy@redhat.com>
 <CAFn=p-a0hf6tp7NYS73S3OW9N_KA+NQRcLNAxh-UreVF9RkZ2Q@mail.gmail.com>
 <CAFn=p-a2kQcuy6T47dWiFUOR2eWZhMOw9VJNEYT0Y6xau7YqTQ@mail.gmail.com>
 <Yqn71w5X97dQXMlj@redhat.com>
 <CAFn=p-bTHWV9Env2HePNciFYwvb_+71jiK7NwDtzeZKVr_F8xA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFn=p-bTHWV9Env2HePNciFYwvb_+71jiK7NwDtzeZKVr_F8xA@mail.gmail.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Wed, Jun 15, 2022 at 11:48:02AM -0400, John Snow wrote:
> On Wed, Jun 15, 2022 at 11:33 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Wed, Jun 15, 2022 at 09:41:32AM -0400, John Snow wrote:
> > > On Tue, Jun 14, 2022 at 10:30 AM John Snow <jsnow@redhat.com> wrote:
> > > >
> > > > On Tue, Jun 14, 2022 at 4:59 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > > >
> > > > > On Tue, Jun 14, 2022 at 06:46:35AM +0200, Thomas Huth wrote:
> > > > > > On 14/06/2022 03.50, John Snow wrote:
> > > > > > > In certain container environments we may not have FUSE at all, so skip
> > > > > > > the test in this circumstance too.
> > > > > > >
> > > > > > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > > > > > ---
> > > > > > >   tests/qemu-iotests/108 | 6 ++++++
> > > > > > >   1 file changed, 6 insertions(+)
> > > > > > >
> > > > > > > diff --git a/tests/qemu-iotests/108 b/tests/qemu-iotests/108
> > > > > > > index 9e923d6a59f..e401c5e9933 100755
> > > > > > > --- a/tests/qemu-iotests/108
> > > > > > > +++ b/tests/qemu-iotests/108
> > > > > > > @@ -60,6 +60,12 @@ if sudo -n losetup &>/dev/null; then
> > > > > > >   else
> > > > > > >       loopdev=false
> > > > > > > +    # Check for fuse support in the host environment:
> > > > > > > +    lsmod | grep fuse &>/dev/null;
> > > > > >
> > > > > > That doesn't work if fuse has been linked statically into the kernel. Would
> > > > > > it make sense to test for /sys/fs/fuse instead?
> > > > > >
> > > > > > (OTOH, we likely hardly won't run this on statically linked kernels anyway,
> > > > > > so it might not matter too much)
> > > > >
> > > > > But more importantly 'lsmod' may not be installed in our container
> > > > > images. So checking /sys/fs/fuse avoids introducing a dep on the
> > > > > 'kmod' package.
> > > > >
> > > > > >
> > > > > > > +    if [[ $? -ne 0 ]]; then
> > > > > >
> > > > > > I'd prefer single "[" instead of "[[" ... but since we're requiring bash
> > > > > > anyway, it likely doesn't matter.
> > > > >
> > > > > Or
> > > > >
> > > > >     if  test $? != 0 ; then
> > > > >
> > > > > >
> > > > > > > +        _notrun 'No Passwordless sudo nor FUSE kernel module'
> > > > > > > +    fi
> > > > > > > +
> > > > > > >       # QSD --export fuse will either yield "Parameter 'id' is missing"
> > > > > > >       # or "Invalid parameter 'fuse'", depending on whether there is
> > > > > > >       # FUSE support or not.
> > > > > >
> > > >
> > > > Good suggestions, thanks!
> > > >
> > >
> > > I think I need to test against /dev/fuse instead, because /sys/fs/fuse
> > > actually exists, but because of docker permissions (etc), FUSE isn't
> > > actually usable from the child container.
> > >
> > > I wound up with this:
> > >
> > > # Check for usable FUSE in the host environment:
> > > if test ! -c "/dev/fuse"; then
> > >     _notrun 'No passwordless sudo nor usable /dev/fuse'
> > > fi
> > >
> > > Seems to work for my case here, at least, but I don't have a good
> > > sense for how broadly flexible it might be. It might be nicer to
> > > concoct some kind of NOP fuse mount instead, but I wasn't able to
> > > figure out such a command quickly.
> > >
> > > The next problem I have is actually related; test-qga (for the
> > > Centos.x86_64 run) is failing because the guest agent is reading
> > > /proc/self/mountinfo -- which contains entries for block devices that
> > > are not visible in the current container scope. I think when QGA goes
> > > to read info about these devices to populate a response, it chokes.
> > > This might be a genuine bug in QGA if we want it to tolerate existing
> > > inside of a container.
> >
> > Yes, we should fix this. Even if you don't run QGA in a container,
> > someone might configure the systemd service to harden it, by
> > restricting what /dev it is able to see and thus trigger the
> > same issue.
> 
> Naive solution: if we try to look in /sys/dev/block/%u:%u and find
> that we are unable to do so for whatever reason (ENOENT et al), just
> skip that entry for the fsinfo returned to the caller.
> 
> Does it need to be fancier than that?

/sys stuff maybe unfiltered, while /dev is restricted.

I've not looked at the QGA code for this, but conceptually I think
I would just identify where in the code errors hit, and ignore the
appropriate error conditions. The goal is to return as much info
as we reasonably can offer, given our execution environment
constraints.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


