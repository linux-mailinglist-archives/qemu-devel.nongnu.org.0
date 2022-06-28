Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BDC55EA65
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 18:58:58 +0200 (CEST)
Received: from localhost ([::1]:52228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6EYC-0000OE-QY
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 12:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o6EWO-0007UL-VI
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 12:57:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o6EWM-0004Qs-Oc
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 12:57:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656435422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dk2sHWxmkrBfl0B82eDGHHzLBNSH5YSQJiez2El1Ou0=;
 b=e8WAmZJK+DlwtQnD9EvGM6TO6NTfmWopj/E73Gpid6Wn9/w6Zus0y5RJu6eR0E4m/Fmt3v
 XxK15TAtugqtPUK194Z8KMlZHQJbZuiDNn4NQsrIMnx2mwVBEtVDqa8m0G7yyhDyX8Sz54
 X+uro3sS2wtzLT3achnCWB7WEGEond4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-e01UHPeSNyGlqrXdNjjJog-1; Tue, 28 Jun 2022 12:57:00 -0400
X-MC-Unique: e01UHPeSNyGlqrXdNjjJog-1
Received: by mail-wm1-f71.google.com with SMTP id
 v184-20020a1cacc1000000b0039c7efa3e95so5331015wme.3
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 09:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=dk2sHWxmkrBfl0B82eDGHHzLBNSH5YSQJiez2El1Ou0=;
 b=vNafedXOpiIq+zAM9mKMlzEWuoLJL4Q09UXR8jUC+S81LtBKnCUG+U3whbWkfhl9DK
 NQxIhLSIDyt1MH/VoE+7LqSSS93x+bnlXy0lI+TxVgDC9sj95eWX1SzT1lxYu6XZZ1KN
 Jvj6n3+2VV5b9BvA+fr9KTA4itC1fMGd/4Ng+mAT4khQgYtZ7hxaqIu9kySoypOU3GLC
 h6bNx0u0KwwjfgUWt6N7BfrAA6x+7WovZuzR3NzAFtOe3bRY2a6HakjHnAHg1HjN/mti
 iPq9oZUj/H/OAXml89L3GHl9eY0CiqCDuCiZb2UGRnDMagbvkMO4ZENQzud+RBZNCis7
 Z43Q==
X-Gm-Message-State: AJIora9nhZwgbFgdbvU/6tg5rWXA0J2b9wDTHB9ukdipFDUKoVXQOxST
 sYnU941p+zPc13BZCDzjTwlZXIxzT09SAwtAv/ev44yws46khX7YJjq10BmSMk+rLqxLWeCVjVC
 1l6kVJwMuRXyEY7o=
X-Received: by 2002:a05:600c:22d0:b0:3a0:3bb9:3936 with SMTP id
 16-20020a05600c22d000b003a03bb93936mr620993wmg.137.1656435419536; 
 Tue, 28 Jun 2022 09:56:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s1lIEuYQICysMdKIzy4m1MG46yG93c2YvC1qcVpvsDDvVwlc17yjvJ/ksw49vbLdRY3i2Fxg==
X-Received: by 2002:a05:600c:22d0:b0:3a0:3bb9:3936 with SMTP id
 16-20020a05600c22d000b003a03bb93936mr620970wmg.137.1656435419283; 
 Tue, 28 Jun 2022 09:56:59 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 az39-20020a05600c602700b003974cb37a94sm126930wmb.22.2022.06.28.09.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 09:56:58 -0700 (PDT)
Date: Tue, 28 Jun 2022 17:56:56 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH v1 2/2] migration/multifd: Warn user when zerocopy not
 working
Message-ID: <Yrsy2MzluKDvc5xK@work-vm>
References: <20220628010908.390564-1-leobras@redhat.com>
 <20220628010908.390564-3-leobras@redhat.com>
 <YrqzhFAePnnEl8A8@redhat.com>
 <CAJ6HWG5UGpgBqK-7OTA6Gxu0LKMfGq5gVvYffOaSMWO1bfyjVw@mail.gmail.com>
 <Yrr77NfKtKcXTVCr@redhat.com> <YrsHgWbhifokl6yL@work-vm>
 <CAJ6HWG7hXNzuJ8rKc0NzLC_GguEOtVxGGUz8gDqizyZUy=Yieg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ6HWG7hXNzuJ8rKc0NzLC_GguEOtVxGGUz8gDqizyZUy=Yieg@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Leonardo Bras Soares Passos (leobras@redhat.com) wrote:
> On Tue, Jun 28, 2022 at 10:52 AM Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > > On Tue, Jun 28, 2022 at 09:32:04AM -0300, Leonardo Bras Soares Passos wrote:
> > > > On Tue, Jun 28, 2022 at 4:53 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > > >
> > > > > On Mon, Jun 27, 2022 at 10:09:09PM -0300, Leonardo Bras wrote:
> > > > > > Some errors, like the lack of Scatter-Gather support by the network
> > > > > > interface(NETIF_F_SG) may cause sendmsg(...,MSG_ZEROCOPY) to fail on using
> > > > > > zero-copy, which causes it to fall back to the default copying mechanism.
> > > > >
> > > > > How common is this lack of SG support ? What NICs did you have that
> > > > > were affected ?
> > > >
> > > > I am not aware of any NIC without SG available for testing, nor have
> > > > any idea on how common they are.
> > > > But since we can detect sendmsg() falling back to copying we should
> > > > warn the user if this ever happens.
> > > >
> > > > There is also a case in IPv6 related to fragmentation that may cause
> > > > MSG_ZEROCOPY to fall back to the copying mechanism, so it's also
> > > > covered.
> > > >
> > > > >
> > > > > > After each full dirty-bitmap scan there should be a zero-copy flush
> > > > > > happening, which checks for errors each of the previous calls to
> > > > > > sendmsg(...,MSG_ZEROCOPY). If all of them failed to use zero-copy, then
> > > > > > warn the user about it.
> > > > > >
> > > > > > Since it happens once each full dirty-bitmap scan, even in worst case
> > > > > > scenario it should not print a lot of warnings, and will allow tracking
> > > > > > how many dirty-bitmap iterations were not able to use zero-copy send.
> > > > >
> > > > > For long running migrations which are not converging, or converging
> > > > > very slowly there could be 100's of passes.
> > > > >
> > > >
> > > > I could change it so it only warns once, if that is too much output.
> > >
> > > Well I'm mostly wondering what we're expecting the user todo with this
> > > information.
> 
> 
> My rationale on that:
> - zero-copy-send is a feature that is supposed to improve send
> throughput by reducing cpu usage.
> - there is a chance the sendmsg(MSG_ZEROCOPY) fails to use zero-copy
> - if this happens, there will be a potential throughput decrease on sendmsg()
> - the user (or management app) need to know when zero-copy-send is
> degrading throughput, so it can be disabled
> - this is also important for performance testing, given it can be
> confusing having zero-copy-send improving throughput in some cases,
> and degrading in others, without any apparent reason why.
> 
> > > Generally a log file containing warnings ends up turning
> > > into a bug report. If we think it is important for users and/or mgmt
> > > apps to be aware of this info, then it might be better to actually
> > > put a field in the query-migrate stats to report if zero-copy is
> > > being honoured or not,
> >
> > Yeh just a counter would work there I think.
> 
> The warning idea was totally due to my inexperience on this mgmt app
> interface, since I had no other idea on how to deal with that.

Yeh it's not too silly an idea!
The way some of these warning or stats get to us can be a bit random,
but sometimes can confuse things.

> I think having it in query-migrate is a much better idea than a
> warning, since it should be much easier to parse and disable
> zero-copy-send if desired.
> Even in my current qemu test script, it's much better having it in
> query-migrate.
> 
> >
> > > and just have a trace point in this location
> > > instead.
> >
> > Yeh.
> >
> 
> Yeap, the counter idea seems great!
> Will it be always printed there, or only when zero-copy-send is enabled?

You could make it either if it's enabled or if it's none zero.
(I guess you want it to reset to 0 at the start of a new migration).

Dave

> 
> Best regards,
> Leo
> 
> > Dave
> >
> > > With regards,
> > > Daniel
> > > --
> > > |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> > > |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> > > |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> > >
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> >
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


