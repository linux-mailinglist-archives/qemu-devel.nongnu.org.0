Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9590589E8E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 17:22:11 +0200 (CEST)
Received: from localhost ([::1]:33942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJcfq-0006WL-81
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 11:22:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJcc2-0001se-93
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 11:18:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJcby-0006Fk-I4
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 11:18:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659626289;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wrHFLP4UagrNY/sN+cUTXX68z4eieZAxwehEA6ugLO0=;
 b=XhAuKCgcZ8B3f+paZP3Jy58xigljeo2d9wvrhwUusfGyUA0KgOS5SISIoZsOOqCpaZaU5V
 tHWO8Vvxvh+2GNh9a/8R7dv0YshUSjpMUm/RKwNHQJ2xJaJfaGuiN4x+N9UJTZaxO+ee3z
 SaGoZVZ1NYgPwpsa/8kwkvo2i5irytY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-4qvWvm8xMkWmRLZTIJXFDA-1; Thu, 04 Aug 2022 11:18:06 -0400
X-MC-Unique: 4qvWvm8xMkWmRLZTIJXFDA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98F7C3C0D870;
 Thu,  4 Aug 2022 15:18:05 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D981140CF8EA;
 Thu,  4 Aug 2022 15:18:01 +0000 (UTC)
Date: Thu, 4 Aug 2022 16:17:59 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Hao Wu <wuhaotsh@google.com>, richard.henderson@linaro.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com,
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com,
 f4bug@amsat.org, bin.meng@windriver.com, qemu-block@nongnu.org,
 thuth@redhat.com, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v5 5/8] blockdev: Add a new IF type IF_OTHER
Message-ID: <YuvjJ7+B61UCLDrK@redhat.com>
References: <20220714182836.89602-1-wuhaotsh@google.com>
 <20220714182836.89602-6-wuhaotsh@google.com>
 <87ilnuda33.fsf@pond.sub.org> <YuGMFRDj3tLOIJK7@redhat.com>
 <CAFEAcA-_TkDW4tPxvmwEt-Rr6VAr_7aWNX2++CE+1G5cBPtiBg@mail.gmail.com>
 <YuvY8/WL0Jojv1Uj@redhat.com> <877d3odpm8.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877d3odpm8.fsf@pond.sub.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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

On Thu, Aug 04, 2022 at 04:56:15PM +0200, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Thu, Jul 28, 2022 at 10:46:35AM +0100, Peter Maydell wrote:
> >> On Wed, 27 Jul 2022 at 20:03, Kevin Wolf <kwolf@redhat.com> wrote:
> >> >
> >> > Am 18.07.2022 um 11:49 hat Markus Armbruster geschrieben:
> >> > > An OTP device isn't really a parallel flash, and neither are eFuses.
> >> > > More fast-and-lose use of IF_PFLASH may exist in the tree, and maybe of
> >> > > other interface types, too.
> >> > >
> >> > > This patch introduces IF_OTHER.  The patch after next uses it for an
> >> > > EEPROM device.
> >> > >
> >> > > Do we want IF_OTHER?
> >> >
> >> > What would the semantics even be? Any block device that doesn't pick up
> >> > a different category may pick up IF_OTHER backends?
> >> >
> >> > It certainly feels like a strange interface to ask for "other" disk and
> >> > then getting as surprise what this other thing might be. It's
> >> > essentially the same as having an explicit '-device other', and I
> >> > suppose most people would find that strange.
> >> >
> >> > > If no, I guess we get to abuse IF_PFLASH some more.
> >> > >
> >> > > If yes, I guess we should use IF_PFLASH only for actual parallel flash
> >> > > memory going forward.  Cleaning up existing abuse of IF_PFLASH may not
> >> > > be worth the trouble, though.
> >> > >
> >> > > Thoughts?
> >> >
> >> > If the existing types aren't good enough (I don't have an opinion on
> >> > whether IF_PFLASH is a good match), let's add a new one. But a specific
> >> > new one, not just "other".
> >> 
> >> I think the common thread is "this isn't what anybody actually thinks
> >> of as being a 'disk', but we would like to back it with a block device
> >> anyway". That can cover a fair range of possibilities...
> >
> > Given that, do we even want/have to use -drive for this ?    We can use
> > -blockdev for the backend and reference that from any -device we want
> > to create, and leave -drive out of the picture entirely
> 
> -drive is our only means to configure onboard devices.
> 
> We've talked about better means a few times, but no conclusions.  I can
> dig up pointers, if you're interested.

For onboard pflash with x86, we've just got properties against the
machine that we can point to a blockdev.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


