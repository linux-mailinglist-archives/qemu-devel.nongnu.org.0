Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1084C6C44
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 13:24:25 +0100 (CET)
Received: from localhost ([::1]:52168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOf4i-0006nc-Uj
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 07:24:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nOexj-0007mw-1A
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 07:17:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nOexg-0007ul-BW
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 07:17:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646050624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aVLGBfzZ1912AK2aCBeFrOFeg7+19CdJoVfrgkkQ20s=;
 b=LJFWFJ1a8JhLn7b2PZ2/f6B3E590dEbJ+SaMJ2rzxIA1reKpBpXvUAJHrKzofALcV+xG1E
 bJG9VKpIeAKWjgkLlSA+GWOVrJ1eLVBUjmz+J9TN944DiqSz/O0XLpy7PbHgk+ji62RxpP
 gHd08ROw5XX4IQg/SIXAgg0RpBChy+w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-319-9wrqq008MZ-rrCmKjNO5gQ-1; Mon, 28 Feb 2022 07:16:58 -0500
X-MC-Unique: 9wrqq008MZ-rrCmKjNO5gQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 h206-20020a1c21d7000000b003552c13626cso6346308wmh.3
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 04:16:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=aVLGBfzZ1912AK2aCBeFrOFeg7+19CdJoVfrgkkQ20s=;
 b=JMMmfeDax1YoznbOJrOkq2UPrrDBd6O4/FU/WNwkQMXy11776vznicmqogPTM1W+ij
 gSPNJohFBNp06i5U0JpMEmfMYYjl59lW3R2YgwB2tbp51Y/bNC7GHiueqxOd2rGDrk9+
 pQyYScpQv9MC9VV1F+k4bFt0jnus1Jdhr1HcTBZdEEZ7UvvEVn4ICYaQO7JtFiEx23tS
 NQOaMIwYDbq99VoRuDE66kJZ+bzmorcITUbceiJrZ7H80OTrKOKfHNObN/VOJ9aGEXW3
 DATnBYvfeqJxSRLsnpPe58GK/bdbXqCcpXj4cmem0GLs8N5QoijyQJjo/MTHHOJfXW6j
 48Ew==
X-Gm-Message-State: AOAM532G11ksqFa1OJczYpPvMhbUQvDXVglEhmV7ZfOy/wGUt9HSsUDF
 E5jigM8ayZYYNGAJdilJqizYC7BcSuw9W0L1L6Wr6TcJoDRySKn3vrTWVrfIehxxoN2Yjf//yjg
 whJ3YHTiEnNdYyVQ=
X-Received: by 2002:a7b:c14c:0:b0:381:32fb:a128 with SMTP id
 z12-20020a7bc14c000000b0038132fba128mr12728233wmi.116.1646050616783; 
 Mon, 28 Feb 2022 04:16:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjChI+xbeddiShL9bWMnVAkXZVqa2yzp/7pgPSnd68TkHekrHuGpwgOHV1CcI5EXyntKnJxA==
X-Received: by 2002:a7b:c14c:0:b0:381:32fb:a128 with SMTP id
 z12-20020a7bc14c000000b0038132fba128mr12728226wmi.116.1646050616583; 
 Mon, 28 Feb 2022 04:16:56 -0800 (PST)
Received: from redhat.com ([2.53.153.125]) by smtp.gmail.com with ESMTPSA id
 c4-20020adfed84000000b001e5b8d5b8dasm14930635wro.36.2022.02.28.04.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 04:16:55 -0800 (PST)
Date: Mon, 28 Feb 2022 07:16:51 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] qom: assert integer does not overflow
Message-ID: <20220228070913-mutt-send-email-mst@kernel.org>
References: <20220225140955.63949-1-mst@redhat.com>
 <YhjpOHSW9L+RIX5A@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YhjpOHSW9L+RIX5A@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Victor Tom <vv474172261@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 25, 2022 at 02:35:36PM +0000, Daniel P. Berrangé wrote:
> On Fri, Feb 25, 2022 at 09:10:44AM -0500, Michael S. Tsirkin wrote:
> > QOM reference counting is not designed with an infinite amount of
> > references in mind, trying to take a reference in a loop will overflow
> > the integer. We will then eventually assert when dereferencing, but the
> > real problem is in object_ref so let's assert there to make such issues
> > cleaner and easier to debug.
> 
> What is the actual bug / scenario that led you to hit this problem ?

E.g. if during code development I call object_ref but not object_unref,
the counter eventually overflows. If this triggers in an error flow
and not a good path this kind of bug might thinkably make it through QE
into release code.

> I'm surprised you saw an assert in object_unref, as that would
> imply you had exactly  UINT32_MAX calls to object_ref and then
> one to object_unref.

Any imbalance with # of unrefs > # refs
will trigger an existing assert in unref.

However, an imbalance with # of refs > # unrefs does not trigger an
assert at the moment.


> > Some micro-benchmarking shows using fetch and add this is essentially
> > free on x86.
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  qom/object.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/qom/object.c b/qom/object.c
> > index 4f0677cca9..5db3974f04 100644
> > --- a/qom/object.c
> > +++ b/qom/object.c
> > @@ -1167,10 +1167,14 @@ GSList *object_class_get_list_sorted(const char *implements_type,
> >  Object *object_ref(void *objptr)
> >  {
> >      Object *obj = OBJECT(objptr);
> > +    uint32_t ref;
> > +
> >      if (!obj) {
> >          return NULL;
> >      }
> > -    qatomic_inc(&obj->ref);
> > +    ref = qatomic_fetch_inc(&obj->ref);
> > +    /* Assert waaay before the integer overflows */
> > +    g_assert(ref < INT_MAX);
> 
> Not that I expect this to hit, but why choose this lower
> bound instead of g_assert(ref > 0) which is the actual
> failure scenario, matching the existing object_unref
> assert.

The earlier we catch it the better, if we overflowed to 0 some other
thread might already be confused.


> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


