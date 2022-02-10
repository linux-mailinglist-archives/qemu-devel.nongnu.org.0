Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EB64B152C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 19:23:27 +0100 (CET)
Received: from localhost ([::1]:34624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIE6I-0006lB-KU
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 13:23:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nID0w-0004WR-J5
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 12:13:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nID0s-0000NS-AJ
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 12:13:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644513211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L69Fkwlej0CBCqgDSPYbrIfqgUhG0u6eQ+8Ko5Vwc4s=;
 b=E560dV6/un20eGWy2q/uK47nNtW7MPW0Ecu/BWm2mCm+L6R5KOnkNqSCSAHyPGeguuWX+H
 BoVeSO/V+GYmPzGHCvh3WBFPnLHuHDPsouMkaSmhU6CaJOe9U/6tpbbbKyNGJvXk0JHYTb
 RbnQPhP7i2Dhg7LX6TWSWqhuBZDK+gQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-oxsyi-qfOEaBQTinHspJGg-1; Thu, 10 Feb 2022 12:13:23 -0500
X-MC-Unique: oxsyi-qfOEaBQTinHspJGg-1
Received: by mail-wm1-f72.google.com with SMTP id
 j39-20020a05600c1c2700b0037becd18addso1743639wms.4
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 09:13:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=L69Fkwlej0CBCqgDSPYbrIfqgUhG0u6eQ+8Ko5Vwc4s=;
 b=TOV++9s6rL4RtP3rtTM5avvNptT8cd1YFPSzzSPJBnYSzDMtUkNpWJ5TbEvdAfTN+K
 zg7m2wRiQgsOiy2sxFGXdrSIR+s0uoDj6pEId9fPM68w8OxXCD+COMFnPL0FSYzEQGjE
 UD/cOl0lg0H4QCu32ny5AHUkQAbcZi3Sa8JYr/ftn6UKtvDfyXnNxhKb/bMl233v28fN
 uSTf2dO/4Q7/EZGI0mGmyMffwirIfu0osBYF2t95ihfKQpf9k6gO5/aXn6AOppb8ysSn
 /IRvESWVV/NKR6YAry8hCdTPYs6fhcYBEwtZ/Plt6YqUjGBv2FcebHTkrTBnsgZ9qWoT
 Ld9A==
X-Gm-Message-State: AOAM530a0csLhUGsvBbTBvjsPMAaiVvKFTMwU4mINN3IDiN6VtKIw1dC
 sbsknjcZPrDDhnS4b3m8FUUyctXAath2X4pbNiap2f8oqDfH01/S3oGQn0aRAL7vEHA6Ng82kwd
 McoUonxnpN29gy44=
X-Received: by 2002:a05:6000:16c5:: with SMTP id
 h5mr6973940wrf.364.1644513202421; 
 Thu, 10 Feb 2022 09:13:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0I57UveeoRk7szBSKFYohhX0I7G4BDSyWbuB7BA1oFXgcDXmcrxXMpi+MWw7tv7gRH6Bz1w==
X-Received: by 2002:a05:6000:16c5:: with SMTP id
 h5mr6973922wrf.364.1644513202161; 
 Thu, 10 Feb 2022 09:13:22 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id u12sm15862729wrs.2.2022.02.10.09.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 09:13:21 -0800 (PST)
Date: Thu, 10 Feb 2022 17:13:19 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] Deprecate C virtiofsd
Message-ID: <YgVHr2zgTrPHVhez@work-vm>
References: <20220209165040.56062-1-dgilbert@redhat.com>
 <YgTTbAWj1CGlmv/R@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YgTTbAWj1CGlmv/R@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: virtio-fs@redhat.com, slp@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Wed, Feb 09, 2022 at 04:50:40PM +0000, Dr. David Alan Gilbert (git) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > There's a nice new Rust implementation out there; recommend people
> > do new work on that.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > ---
> >  docs/about/deprecated.rst | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> > index 47a594a3b6..3a0e15f8f5 100644
> > --- a/docs/about/deprecated.rst
> > +++ b/docs/about/deprecated.rst
> > @@ -454,3 +454,17 @@ nanoMIPS ISA
> >  
> >  The ``nanoMIPS`` ISA has never been upstreamed to any compiler toolchain.
> >  As it is hard to generate binaries for it, declare it deprecated.
> > +
> > +Tools
> > +-----
> > +
> > +virtiofsd
> > +'''''''''
> > +
> > +There is a new Rust implementation of ``virtiofs`` at
> > +``https://gitlab.com/virtio-fs/virtiofsd``;
> > +since this is now marked stable, new development should be done on that
> > +rather than the existing C version in the QEMU tree.
> > +The C version will still accept fixes and patches that
> > +are already in development for the moment.
> 
> Just to be clear, 'deprecation' is usually expected to turn into
> 'deletion' a minimum of 2 releases later.  We are targetting the
> C virtiofsd to be deleted, right ?  The last sentance here gives
> vibes that we're expecting it to stick around despite deprecation.

I am targeting it to be deleted, but I'm expecting to give it a bit
more time than 2 releases; how do I do that?

> Assuming we're deleting it after deprecation, then I think thue
> message should be more direct in telling people they shold be
> proactively switching to deployment of the rust version. Something
> along lines of
> 
>   "The C implementation is in maintenance mode only and will
>    be deleted once the deprecation period is complete. New
>    deployments of virtiofs are strongly recommended to switch
>    to use of the Rust implementation of virtiofsd, which is
>    a drop in replacement will compatible command line and
>    featureset."

Yeh, I'll rework it in that direction; I was trying to be gentle at
first.

Dave

> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


