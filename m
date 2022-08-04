Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E93AD589DA1
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 16:38:43 +0200 (CEST)
Received: from localhost ([::1]:39050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJbzm-0008I0-4y
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 10:38:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJbvr-0004oq-PX
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 10:34:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJbvp-0007bQ-4g
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 10:34:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659623675;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=mR3p0b4dslVSWqNTeQ/ZeeZy0imlU8uigWlA4gCYvJU=;
 b=TImrZoGl33YH2DtCaRkR7WCPcGGIBKtmJtUPT4NEWN76lmTlHsRIUbjzmrYoGdxAA8519A
 W7+AJNkj0Mi56khWA7HyhXFbb3DNwbKYpAL3JgpqjPboSAbWKslG8Oyh29k5oS9tLrbxyp
 yBEDJlCYVKmjYRjb6zWOISbBoe4Djqw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-fu0u8EACPn2LFRN8n4NIqQ-1; Thu, 04 Aug 2022 10:34:32 -0400
X-MC-Unique: fu0u8EACPn2LFRN8n4NIqQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22B473833285;
 Thu,  4 Aug 2022 14:34:32 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A41531121314;
 Thu,  4 Aug 2022 14:34:29 +0000 (UTC)
Date: Thu, 4 Aug 2022 15:34:27 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Hao Wu <wuhaotsh@google.com>, richard.henderson@linaro.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com,
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com,
 f4bug@amsat.org, bin.meng@windriver.com, qemu-block@nongnu.org,
 thuth@redhat.com, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v5 5/8] blockdev: Add a new IF type IF_OTHER
Message-ID: <YuvY8/WL0Jojv1Uj@redhat.com>
References: <20220714182836.89602-1-wuhaotsh@google.com>
 <20220714182836.89602-6-wuhaotsh@google.com>
 <87ilnuda33.fsf@pond.sub.org> <YuGMFRDj3tLOIJK7@redhat.com>
 <CAFEAcA-_TkDW4tPxvmwEt-Rr6VAr_7aWNX2++CE+1G5cBPtiBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA-_TkDW4tPxvmwEt-Rr6VAr_7aWNX2++CE+1G5cBPtiBg@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Jul 28, 2022 at 10:46:35AM +0100, Peter Maydell wrote:
> On Wed, 27 Jul 2022 at 20:03, Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > Am 18.07.2022 um 11:49 hat Markus Armbruster geschrieben:
> > > An OTP device isn't really a parallel flash, and neither are eFuses.
> > > More fast-and-lose use of IF_PFLASH may exist in the tree, and maybe of
> > > other interface types, too.
> > >
> > > This patch introduces IF_OTHER.  The patch after next uses it for an
> > > EEPROM device.
> > >
> > > Do we want IF_OTHER?
> >
> > What would the semantics even be? Any block device that doesn't pick up
> > a different category may pick up IF_OTHER backends?
> >
> > It certainly feels like a strange interface to ask for "other" disk and
> > then getting as surprise what this other thing might be. It's
> > essentially the same as having an explicit '-device other', and I
> > suppose most people would find that strange.
> >
> > > If no, I guess we get to abuse IF_PFLASH some more.
> > >
> > > If yes, I guess we should use IF_PFLASH only for actual parallel flash
> > > memory going forward.  Cleaning up existing abuse of IF_PFLASH may not
> > > be worth the trouble, though.
> > >
> > > Thoughts?
> >
> > If the existing types aren't good enough (I don't have an opinion on
> > whether IF_PFLASH is a good match), let's add a new one. But a specific
> > new one, not just "other".
> 
> I think the common thread is "this isn't what anybody actually thinks
> of as being a 'disk', but we would like to back it with a block device
> anyway". That can cover a fair range of possibilities...

Given that, do we even want/have to use -drive for this ?    We can use
-blockdev for the backend and reference that from any -device we want
to create, and leave -drive out of the picture entirely

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


