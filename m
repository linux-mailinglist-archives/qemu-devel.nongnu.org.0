Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EDB4B151F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 19:19:08 +0100 (CET)
Received: from localhost ([::1]:54196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIE27-0000Th-WD
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 13:19:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nICvR-0006Uj-Ex
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 12:08:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nICv9-0006wy-Qe
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 12:07:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644512869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o+MJNYzPNx8lrv9bw+O0pVb0XW/LsdsppeYTD+dURBU=;
 b=JjkvRAq7vgDR6MPMMDHNShwFuxCn9FpBRR1tXb9lhVicRepS6M4oizD0MdDazc6elTqHVj
 rt/sF14cH+f7nrxgUlKfVwA3qoSEGXdYgibftfG7wvIvMWDn0K+CapBf+VYng+B2oCRhhn
 mHs/p9D/tILnExn8A2ezrsAOJD7M4RU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-Ziu8f85aODerknUQVgEPyw-1; Thu, 10 Feb 2022 12:07:48 -0500
X-MC-Unique: Ziu8f85aODerknUQVgEPyw-1
Received: by mail-wr1-f70.google.com with SMTP id
 p9-20020adf9589000000b001e333885ac1so2770069wrp.10
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 09:07:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=o+MJNYzPNx8lrv9bw+O0pVb0XW/LsdsppeYTD+dURBU=;
 b=wD1N+jN6+EPsqMJNqOm2JAEtjL82DFvxlslCnERfag6JRBpFlp5ZmiNDR7gF39w34P
 mNCsX2yIR2gA58pw1msg4PRbOl+7kTPb1tiDqvIznLhGQA1PqSBClLcAOYIsuHGJulye
 CBOIbO5h3DvIY25VCZAWQAG+/RQQTVRK42Dx8poescaaBfPFlDQjeR4fZRc+4Y3MVQ7A
 m1pagxQvJAgPPrJq9kfTWOOqo5riSWYaIlcfcvESLbyLUtgmJ2h/LOfAJRpprpGLcN3Z
 iZegChIWGvtMz46OZ2Eykm9XENHdZSCHQJ123riJ9WBt/1fIWbK36CszKz7Te6j+oUTC
 Z3RQ==
X-Gm-Message-State: AOAM531LE76Tf8gYv/bpGOrXPPNoitumSSL8lpL1ZEjxwg4TD+3t9lob
 GK3iihLe/5k5Ls8kHCDzRsOBF10P3YRuUoMafL+7YQJLqJk0sOCCizlPUPzDm4UWxZeJTsjvRPE
 rK9+j/u11d7IvxJk=
X-Received: by 2002:a05:600c:1ca8:: with SMTP id
 k40mr2897908wms.168.1644512865729; 
 Thu, 10 Feb 2022 09:07:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnA+G8Kt1ZH6XjMTr0cZb4nEjhUx/BEYfGi8lwS/l4vw037dPGiEJUD2pd5NdmHLyGuSaPow==
X-Received: by 2002:a05:600c:1ca8:: with SMTP id
 k40mr2897897wms.168.1644512865528; 
 Thu, 10 Feb 2022 09:07:45 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id t18sm1984456wmi.30.2022.02.10.09.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 09:07:45 -0800 (PST)
Date: Thu, 10 Feb 2022 17:07:43 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] Deprecate C virtiofsd
Message-ID: <YgVGX7DIctqQiwVY@work-vm>
References: <20220209165040.56062-1-dgilbert@redhat.com>
 <CAFEAcA-JwQDQWQcY7tNSOb5LS8FNBjFi-msTyxUyV_q=OymXaw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-JwQDQWQcY7tNSOb5LS8FNBjFi-msTyxUyV_q=OymXaw@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Wed, 9 Feb 2022 at 16:57, Dr. David Alan Gilbert (git)
> <dgilbert@redhat.com> wrote:
> >
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
> 
> I guess there's a missing "d" here ?

Oops yes, can add that.

Dave

> > +``https://gitlab.com/virtio-fs/virtiofsd``;
> > +since this is now marked stable, new development should be done on that
> > +rather than the existing C version in the QEMU tree.
> > +The C version will still accept fixes and patches that
> > +are already in development for the moment.
> 
> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


