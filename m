Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3077D4CAEE1
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 20:41:53 +0100 (CET)
Received: from localhost ([::1]:59144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPUr9-0001MB-Op
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 14:41:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPUoe-0000VN-Mw
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 14:39:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPUob-0005MH-5I
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 14:39:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646249951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T3OVJlYzwLwhkOzI34kJGe88HXVthfSn7Fjo4pBVOJk=;
 b=EseXNNASyzjdLezfLAAUPRyvMmvW8vbOGNms+sghMJLDMT3rUt2rD+KXSYAhTmPaZrSxS4
 7YYkOarf3aIfIfcfrnH22ozDXYHCpQaLwG2/VsD6PtKNxLMBgcRroNEnmM1zFQDNUaKhH4
 asdSuDArXggkEtSKk+0RrXWTFNpEFIE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-8nZjN2YROeGPXL6otFKAfA-1; Wed, 02 Mar 2022 14:38:56 -0500
X-MC-Unique: 8nZjN2YROeGPXL6otFKAfA-1
Received: by mail-wm1-f72.google.com with SMTP id
 10-20020a1c020a000000b0037fae68fcc2so2283592wmc.8
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 11:38:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=T3OVJlYzwLwhkOzI34kJGe88HXVthfSn7Fjo4pBVOJk=;
 b=sRaEDzvvQYtN/y1EiMFZbzivJc2/j/Zx7JhaUxGnqzlFcWdyV/U8ghW890JVg7uQU+
 iDz0JI3IBb4eAq5H/gbdXC9T/r2QM80b8j+Jq0fMHWQKERQVV7+pLSnGf2ZOqtSas82r
 c5JJlKiz44vP6TOJcAQh5LEJwo5UvVrCZ808LbagEeC3qmwLLVw3HkPQi3GlDf65FbGb
 AmCjeeGHs30Zt+u5mglDnwICkCHHGUxUhEXNRTSt5+4Lig5oE+IYDkxoSr4oIFRwSqT5
 WUphQdoGgBElp6N7IbcA97IkBVY0Kj+NKNK0/ck7LKg3nIPLdgAQnoduOvdrVB6CUJ8R
 ponw==
X-Gm-Message-State: AOAM531WS7e7rGjmI/MWuF0ENMTHM6SBoWkt3i1zMjGG8/dirGRL72me
 4gRPeDJwk1YccASkctVMlP9bMWkRE3/zwlmMS06dAKNr1/LR51ZCtIXapFvuJDyI/n+MP76q6bP
 uGIBzCtPD4iZFNAY=
X-Received: by 2002:a5d:6d06:0:b0:1f0:35c4:79d0 with SMTP id
 e6-20020a5d6d06000000b001f035c479d0mr2947830wrq.204.1646249935637; 
 Wed, 02 Mar 2022 11:38:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1Ppyzhe5lsH9Rvx1exHxw0BQw6KPwSKjXbgt6rs9iZgSl8gu9/RoPNlb/8icU5jij9UDzIw==
X-Received: by 2002:a5d:6d06:0:b0:1f0:35c4:79d0 with SMTP id
 e6-20020a5d6d06000000b001f035c479d0mr2947817wrq.204.1646249935392; 
 Wed, 02 Mar 2022 11:38:55 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 2-20020a1c1902000000b00380d3873d6asm6779642wmz.43.2022.03.02.11.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 11:38:54 -0800 (PST)
Date: Wed, 2 Mar 2022 19:38:52 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] deprecation: x86 default machine types
Message-ID: <Yh/HzPymVWPZpVaf@work-vm>
References: <20220301195432.114252-1-dgilbert@redhat.com>
 <Yh+sbYC5n4DsZWWg@redhat.com>
MIME-Version: 1.0
In-Reply-To: <Yh+sbYC5n4DsZWWg@redhat.com>
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
Cc: eduardo@habkost.net, libvir-list@redhat.com, thuth@redhat.com,
 qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Tue, Mar 01, 2022 at 07:54:32PM +0000, Dr. David Alan Gilbert (git) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > Declare the intent to require a machine type to be specified on x86
> > system emulation.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > ---
> >  docs/about/deprecated.rst | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> > index 85773db631..143c60d105 100644
> > --- a/docs/about/deprecated.rst
> > +++ b/docs/about/deprecated.rst
> > @@ -324,6 +324,14 @@ machine is hardly emulated at all (e.g. neither the LCD nor the USB part had
> >  been implemented), so there is not much value added by this board. Use the
> >  ``ref405ep`` machine instead.
> >  
> > +x86 default machine type
> > +''''''''''''''''''''''''
> > +
> > +x86 currently defaults to the ```pc``` machine type which is based on the very
> > +old ```i440fx``` chipset.  This default will be removed and the user will be
> > +required to specify a machine type explicitly using -M; users are encouraged to
> > +switch to the not quite as old ```q35``` machine types.
> 
> This will have no impact on anyone using libvirt as a mgmt app,
> because it will explicitly set 'pc' if the user doesn't request
> a machine type.
> 
> It will, however, break a huge number of users who don't use
> libvirt or a similar mgmt app.
> 
> 'q35' is not a drop in replacement for 'pc', and even though
> it is slightly newer, the features it brings are not likely
> to be important enough for most users who aren't using a mgmt
> app to care about switching.

I can see it having advantages for those who do things like PCIe pass
through of graphics cards.
However, my main concern is that there's a split happening where
downstream we're working primarily on q35 but a lot of people still use
i440fx; eventually that split will mean the i440fx users will have a
pretty bad experience instability/features.
So I'd like to encourage them onto a35.

Ideally I'd like to make that easy; e.g. auto creating some of the PCIe
busses.

> In the ongoing work to introduce a completely new system
> emulator binary that is exclusively runtime QMP configured,
> the machine type will almost certainly be mandatory, without
> affecting existing users. That would also apply consistently
> across all target arches.

I'm assuming that will also cause the disruption to those end users.

Dave

> Overall I'm just not seeing enough benefit to justify the
> disruption we'll cause by making this change to existing
> system emulator binaries.
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


