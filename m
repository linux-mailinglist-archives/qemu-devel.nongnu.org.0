Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C516E5F2F55
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 13:10:07 +0200 (CEST)
Received: from localhost ([::1]:40424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofJKo-0006Qo-SR
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 07:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofJE8-00018K-TB
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 07:03:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofJE5-0006UD-DJ
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 07:03:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664794988;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J7WISi+HWSdHB8ZaCedJlqXDQoRrbkFriz9ztlyATNw=;
 b=iAa2/5AJ77mugL2YsLpwzhImPpih/0ALB+et5KGwtoE0/vP+gCPqJCnomaye5ixITKoCmJ
 xiAdYpmxi4lG7p+7pjDvGlfmvuGkCig/DRy9dpqiy2wJVVCdzqKFB4eI3xgbSFzYf8nOHF
 RQc5qHdgToLk6xsC2h+5y1YrS38BtbE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-5UtcRHrnN1iZNQu8FldQxg-1; Mon, 03 Oct 2022 07:03:07 -0400
X-MC-Unique: 5UtcRHrnN1iZNQu8FldQxg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88F8F800B30;
 Mon,  3 Oct 2022 11:03:06 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A9271121314;
 Mon,  3 Oct 2022 11:03:04 +0000 (UTC)
Date: Mon, 3 Oct 2022 12:03:01 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-discuss@nongnu.org
Subject: Re: If your networking is failing after updating to the latest git
 version of QEMU...
Message-ID: <YzrBZfSbmLJX3XVu@redhat.com>
References: <a7da7e40-6f7b-79a4-709b-da0e71def650@redhat.com>
 <93033078-221d-23d2-23e7-13eab59cd439@amsat.org>
 <CACGkMEsQSn_GOBcs64JEDUHt3T7XOBL3LLM7yvqwwR5xvvD2dg@mail.gmail.com>
 <a25c238b-dabd-bf20-9aee-7cda4e422536@redhat.com>
 <87o7utnuzp.fsf@linaro.org>
 <CAFEAcA9YyN802x43+K27Hv1-rvkBbxE2r5sfxxahwmJtFAEP=Q@mail.gmail.com>
 <87k05hnr0f.fsf@linaro.org>
 <CAFEAcA9ks8Hv3N9gp3BgVm+Nu7AM2KnHrbik9uE+MMvvgmX=rA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA9ks8Hv3N9gp3BgVm+Nu7AM2KnHrbik9uE+MMvvgmX=rA@mail.gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 03, 2022 at 11:36:36AM +0100, Peter Maydell wrote:
> On Mon, 3 Oct 2022 at 11:25, Alex Bennée <alex.bennee@linaro.org> wrote:
> >
> >
> > Peter Maydell <peter.maydell@linaro.org> writes:
> >
> > > On Mon, 3 Oct 2022 at 10:09, Alex Bennée <alex.bennee@linaro.org> wrote:
> > >>
> > >>
> > >> Thomas Huth <thuth@redhat.com> writes:
> > >>
> > >> > On 29/09/2022 04.32, Jason Wang wrote:
> > >> >> On Thu, Sep 29, 2022 at 1:06 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> > >> >>> Jason, Marc-André, could we improve the buildsys check or display
> > >> >>> a more helpful information from the code instead?
> > >> >> It looks to me we need to improve the build.
> > >> >
> > >> > I'm not sure there is anything to improve in the build system -
> > >> > configure/meson.build are just doing what they should: Pick the
> > >> > default value for "slirp" if the user did not explicitly specify
> > >> > "--enable-slirp".
> > >>
> > >> Shouldn't it be the other way round and fail to configure unless the
> > >> user explicitly calls --disable-slirp?
> > >
> > > Our standard pattern for configure options is:
> > >  --enable-foo : check for foo; if it can't be enabled, fail configure
> > >  --disable-foo : don't even check for foo, and don't build it in
> > >  no option given : check for foo, decide whether to build in support if
> > >                    it's present
> >
> > Don't we make a distinction between libs that are truly optional and
> > those you probably need.
> 
> Yes. If something is truly mandatory then configure will always
> fail. This is true for zlib and glib, for instance...
> 
> > It seems missing working networking is one of
> > those things we should be telling the user about unless explicitly
> > disabled. It is after all how we worked before, we would silently
> > checkout libslirp and build it for you.
> 
> ...but building without libslirp is perfectly reasonable for some
> configurations, eg where you know you're going to be using QEMU
> in a TAP network config, and you don't want to have libslirp in
> your binary so you don't have to think about whether you need to
> act on security advisories relating to it. "no slirp" isn't like
> "no zlib", where you can't build a QEMU at all. I think it's more
> like gtk support, where we will happily configure without gtk/sdl/etc
> and only build in the VNC frontend -- that's a working configuration
> in some sense, but for the inexperienced user a QEMU which doesn't
> produce a GUI window is almost certainly not what they wanted.
> 
> So we could:
>  * say that we will opt for consistency, and have the slirp
>    detection behave like every other optional library
>  * say that slirp is a special case purely because we used to
>    ship it as a submodule and so users are used to it being present
>  * say that slirp is a special case because it's "optional but
>    only experts will want to disable it", and think about what
>    other configure options (like GUI support) we might want to
>    move into this category
> 
> I don't think there's an obvious right answer here...

What I find particularly wierd about slirp, is how we have conditionalized
the behaviour of a bare 'qemu-system-XXX' invokation. In a fully featured
build, a no-args QEMU will be equiv to "-net nic,model=MODEL -net user",
but in a non-SLIRP build a no-args QEMU is merely "-net nic,model=MODEL".

If you specified "-net nic,model=MODEL" normally, you would get a message
printed:

   warning: hub 0 is not connected to host network

but we squelch this warning for the built-in default network, even though
the defaults are useless because of the missing backend.

I'm surprised we didn't just entirely remove the default NIC when no slirp
is present, given it can't do anything useful with the traffic. The
complete absence of a NIC would give a stronger sign to users that
something is different.

Ultimately it is only this 'no args' default case that is a significant
problem, as the explicit slirp args case we can report a clear error
message that explains the missing feature. Is 'no args' default important
enough that we need to make slirp diverge from normal configure/meson
practice for detecting libs ?

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


