Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D964B4E5F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 12:34:09 +0100 (CET)
Received: from localhost ([::1]:50784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJZcO-000333-5s
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 06:34:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nJZYh-0001rK-4Y
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 06:30:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nJZYd-00015P-0h
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 06:30:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644838213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8RTbklJt9LZsD5nqMKmI5wgJTUpHyJ7e61rtTyG4Sg0=;
 b=UKXGWFxGEyG35NuRCD3jQF4J+z/G3cNqEu6WSmYMQ6c/WZlZDygWNqeZ7PGoIvDmArHBgv
 biSa/nixRi9gDqAMtFfmjtAUpHswhwHnahUXyaNDDu3/viXlW289fnJMger6sMaE5/OO8L
 9uvjYgevD5zEYe5E7ZwmXuZU3j/vos4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-KBxqyX0oNpWGStt_GyEHZQ-1; Mon, 14 Feb 2022 06:30:07 -0500
X-MC-Unique: KBxqyX0oNpWGStt_GyEHZQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 q8-20020adfb188000000b001e33a8cdbf4so6783737wra.16
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 03:30:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8RTbklJt9LZsD5nqMKmI5wgJTUpHyJ7e61rtTyG4Sg0=;
 b=6+dCMijrsq50ylaP4+qAIvp8mS/TO/pSu+12DGp5hHPKV9Mur4QnwvwXesfwm+G4Fb
 28bUb6YItghmKBjA/JmPqB6OiEsqjYkPSbk+sKFE1gdr+Qtmbfgayr5aryaSDRbz9jLb
 SHr0mR5Ykk/V8bqv4iXj7eQhE+P3J700ZLVD2O32UrXk7gUTkYHW4xwfZvUMxenzNxHl
 tpi5MoNh5hZXpnjLvEiAjZx4MZs1W8GYJr3i7g4YVKb+trHydwNTBbgPHWRWH6dGeVEy
 qzYyoV1AMjJYEbZ8JPGVXSe+ywyUoXO1gTXArih9Sy/o5mqohYlBlXDT0NE7iBRnHp/+
 J01A==
X-Gm-Message-State: AOAM53116r3o1q+zlO8fg7+aYhMUBc4xTWnyZ2kWwOZOBh/s6j5lSZPq
 yGltUcxNQcFDCSE5pQRIUY13kwc8HhMwUw0MNndnODdCjj9J4plmUlAj/5/jxbWFNYT60ULsmDW
 iJUXtbtKiGUKUaL4=
X-Received: by 2002:a05:600c:a47:: with SMTP id
 c7mr10618747wmq.25.1644838206359; 
 Mon, 14 Feb 2022 03:30:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIvlOjXKtQNuLf7wGFBPWSsWvtVBnWT0sRlwjdR5JjSAjakjpJkkqMKEk/jqKMnG3asPZSRQ==
X-Received: by 2002:a05:600c:a47:: with SMTP id
 c7mr10618729wmq.25.1644838206179; 
 Mon, 14 Feb 2022 03:30:06 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id f7sm22750239wrz.40.2022.02.14.03.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 03:30:05 -0800 (PST)
Date: Mon, 14 Feb 2022 11:30:03 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: [PATCH v2] Deprecate C virtiofsd
Message-ID: <Ygo9O7oWsImstSJu@work-vm>
References: <20220210174714.19843-1-dgilbert@redhat.com>
 <20220210204404.GA22879@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220210204404.GA22879@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
Cc: berrange@redhat.com, slp@redhat.com, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, stefanha@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Richard W.M. Jones (rjones@redhat.com) wrote:
> On Thu, Feb 10, 2022 at 05:47:14PM +0000, Dr. David Alan Gilbert (git) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > There's a nice new Rust implementation out there; recommend people
> > do new work on that.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > ---
> >  docs/about/deprecated.rst | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> > diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> > index 47a594a3b6..3c73d22729 100644
> > --- a/docs/about/deprecated.rst
> > +++ b/docs/about/deprecated.rst
> > @@ -454,3 +454,20 @@ nanoMIPS ISA
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
> > +There is a new Rust implementation of ``virtiofsd`` at
> > +``https://gitlab.com/virtio-fs/virtiofsd``;
> > +since this is now marked stable, new development should be done on that
> > +rather than the existing C version in the QEMU tree.
> > +The C version will still accept fixes and patches that
> > +are already in development for the moment, but will eventually
> > +be deleted from this tree.
> > +New deployments should use the Rust version, and existing systems
> > +should consider moving to it.  The command line and feature set
> > +is very close and moving should be simple.
> 
> I'm not qualified to say if the Rust impl is complete enough
> to replace the C version, so I won't add a reviewed tag.

We believe it is a complete replacement at this point, with compatible
command line.

Dave

> However I want to say that from the point of view of downstream
> packagers of qemu -- especially Fedora -- it would be helpful if we
> could direct both upstream development effort and downstream packaging
> into just the one virtiofsd.  So I agree in principle with this.
> 
> Rich.
> 
> -- 
> Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
> Read my programming and virtualization blog: http://rwmj.wordpress.com
> virt-p2v converts physical machines to virtual machines.  Boot with a
> live CD or over the network (PXE) and turn machines into KVM guests.
> http://libguestfs.org/virt-v2v
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


