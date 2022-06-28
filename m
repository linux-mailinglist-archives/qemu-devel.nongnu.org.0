Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B9755E5E5
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 18:18:13 +0200 (CEST)
Received: from localhost ([::1]:36858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Dul-0002JK-V8
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 12:18:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o6Ds7-0000JK-7J
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 12:15:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o6Dru-0006sq-EV
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 12:15:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656432913;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Bj62BhbvIVmzA7fOqS2JIIvkvAai7I95GV6cO8E7eQ=;
 b=Hf/bSKWa+79EYm7Hol0rM7KofXxr4ubdcjsgVXawIhPdxXcMrgN978LLBWrFzRnxnjrH59
 w3161UWfr7wExw6Taenqyp0CoNeZD2+7cGkZgv9b9qGpXdSH05GYy0IExt5XD33DmBrWK5
 c6J2tmOWVBKA52t/lsXFbOW09CsXadI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-KoRNth9XPXSEst4aEfnv1Q-1; Tue, 28 Jun 2022 12:15:09 -0400
X-MC-Unique: KoRNth9XPXSEst4aEfnv1Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8EE181019C88;
 Tue, 28 Jun 2022 16:15:09 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 580E5492C3B;
 Tue, 28 Jun 2022 16:15:08 +0000 (UTC)
Date: Tue, 28 Jun 2022 17:15:05 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: Why we should avoid new submodules if possible
Message-ID: <YrspCYpLwFDHkaRv@redhat.com>
References: <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
 <20220628060210-mutt-send-email-mst@kernel.org>
 <d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com>
 <20220628062551-mutt-send-email-mst@kernel.org>
 <1182d647-bef1-0a8a-a379-86f029af7ac6@redhat.com>
 <20220628070151-mutt-send-email-mst@kernel.org>
 <2c3bb7f4-45cb-9c13-4ecd-22de75eaa7d3@redhat.com>
 <CAARzgwx2x5UBvb9ihbvLRzUFNJ3reqDsU2EqL8aUjkjo8yvZGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAARzgwx2x5UBvb9ihbvLRzUFNJ3reqDsU2EqL8aUjkjo8yvZGQ@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Tue, Jun 28, 2022 at 09:24:34PM +0530, Ani Sinha wrote:
> On Tue, Jun 28, 2022 at 6:09 PM Thomas Huth <thuth@redhat.com> wrote:
> >
> > On 28/06/2022 13.14, Michael S. Tsirkin wrote:
> > > On Tue, Jun 28, 2022 at 12:50:06PM +0200, Thomas Huth wrote:
> > [...]
> > >>> Come on, this is just a test. We *really* don't care if an ISO
> > >>> we use to test ACPI is using an exploitable version of grub.
> > >>
> > >> Wait, I thought we were only talking about tappy here? The ISO binaries
> > >> should certainly *not* be bundled in the QEMU tarballs (they are too big
> > >> already anyway, we should rather think of moving the firmware binaries out
> > >> of the tarball instead).
> > >>
> > >>   Thomas
> > >
> > > IIUC there are three things we are discussing
> > > - biosbits source
> > > - biosbits image
> > > - tappy
> >
> > Oh well, I missed that part of the discussion so far since the corresponding
> > patches did not make it to the mailing list ¯\_(ツ)_/¯
> >
> > Anyway, that's just another indication that it might not be the right fit
> > for inclusion into the QEMU source tree. So either download it similar to
> > (or included in) the avocado tests, or maybe another solution would be to
> > have a separate "qemu-ci" or "qemu-testing" repository for stuff like this ... ?
> 
> Yes, I think we should have a separate repo for all testing related
> stuff like blobs, guest images etc. Curently, some of them are in
> personal github accounts which is not idea IMHo.
> 
> Bits stuff can reside in the same place.

FYI, the reason much of this is intentionally NOT under the /qemu-project
gitlab namespace is that we did not want to be responsible for distributing
arbitrary binary blobs/images. That in turn makes the QEMU project responsible
for license compliance, which is non-trivial todo correctly for much of this
stuff. As such it is highly desirable to delegate both the hosting the
binaries and source to the third party who builds it.

I agree the use of personal github accounts is not nice, but it was the
least worst solution identified.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


