Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C538E5A3A0B
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 23:06:21 +0200 (CEST)
Received: from localhost ([::1]:53910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oS30W-0004Gr-S7
	for lists+qemu-devel@lfdr.de; Sat, 27 Aug 2022 17:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oS2yC-0002Ru-UL
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 17:04:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oS2yA-00039b-40
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 17:03:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661634232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=phlet88rE7v9Yl8bfxsef5NsBJeVJy0zpd8p03PWOJ4=;
 b=HOTXbmLIWptDZjRFqv7371meftXoGLsPEx6hvCNN429eKO4jlJkI/iL9zXL87QmrSxeFqJ
 +xZooosgoOOWlbs07s/Y7udjQC4boEinP06k2nyTybfmavdFWTVrocytTsQdltEIKicK7K
 UUi/S0qr7wcAw0LTZmSAh3WTzkgprDs=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-64-J_QFbSpJP4WL8QEQzKjEdQ-1; Sat, 27 Aug 2022 17:03:51 -0400
X-MC-Unique: J_QFbSpJP4WL8QEQzKjEdQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 y12-20020ac8708c000000b00342f1bb8428so3676391qto.5
 for <qemu-devel@nongnu.org>; Sat, 27 Aug 2022 14:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=phlet88rE7v9Yl8bfxsef5NsBJeVJy0zpd8p03PWOJ4=;
 b=Wdguq4hZJMfPxfVE+BAomHIQuNWkSFL0DegxgYgp7ybbBTCJvc4WEx6wEvnNEeYqOE
 uxD+dHRKrjulo1459RTh1pvFbt9pmL91fo3sa+B0JTu+F1OeJPtBw0QH/GcSMB7UiXlz
 dVrNgyjQygqptz7MFj3Y+eQ3GxE7yh+kgudGV6qGjCMDLgCAdXr0lOIX9wRLMQwKGpMa
 5JhoOPKHQ48FE5JpyPtc5HSF4XVEkxQhSuwn7qP0XI4hjRo2ylZpALdr1yFoUAew4oCm
 a4wCtvm7aYJ9QltnjhECcZcedv5FmxeR7sLdqyT3jJjxD4RNlhcksvSl6qMJwTLHyRfU
 PKEQ==
X-Gm-Message-State: ACgBeo0bConhYpt5xybnfxoL3HTrYb3mFmVI4n6oewc3s7m9dW6wrngg
 QqQ9+Y7XYjKz9KSlw7AIJfmNZJYXzoxP3QKwF5X7U9HkGrRI5CITUwQknQdNMFQ8gCbWp4cEVgC
 vid2GEs4J1LoRGIw=
X-Received: by 2002:ac8:5948:0:b0:342:f500:2eb7 with SMTP id
 8-20020ac85948000000b00342f5002eb7mr4689049qtz.483.1661634231162; 
 Sat, 27 Aug 2022 14:03:51 -0700 (PDT)
X-Google-Smtp-Source: AA6agR44WovWocUMSnz9f1IIt6Wrr6vrHyW7DAE1Xhpept1waMtiMhZRfomV9SQ2N5vl/8g5NQ8H1g==
X-Received: by 2002:ac8:5948:0:b0:342:f500:2eb7 with SMTP id
 8-20020ac85948000000b00342f5002eb7mr4689040qtz.483.1661634230961; 
 Sat, 27 Aug 2022 14:03:50 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 d137-20020a37688f000000b006bba46e5eeasm2447691qkc.37.2022.08.27.14.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Aug 2022 14:03:49 -0700 (PDT)
Date: Sat, 27 Aug 2022 17:03:48 -0400
From: Peter Xu <peterx@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] softmmu/memory: add missing begin/commit
 callback calls
Message-ID: <YwqGtHrcsFrgzLzg@xz-m1.local>
References: <20220816101250.1715523-1-eesposit@redhat.com>
 <20220816101250.1715523-2-eesposit@redhat.com>
 <Yv6UVMMX/hHFkGoM@xz-m1.local>
 <e5935ba7-dd60-b914-3b1d-fff4f8c01da3@redhat.com>
 <YwjVG+MR8ORLngjd@xz-m1.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YwjVG+MR8ORLngjd@xz-m1.local>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Fri, Aug 26, 2022 at 10:13:47AM -0400, Peter Xu wrote:
> On Fri, Aug 26, 2022 at 03:53:09PM +0200, Emanuele Giuseppe Esposito wrote:
> > What do you mean "will empty all regions with those listeners"?
> > But yes theoretically vhost-vdpa and physmem have commit callbacks that
> > are independent from whether region_add or other callbacks have been called.
> > For kvm and probably vhost it would be no problem, since there won't be
> > any list to iterate on.
> 
> Right, begin()/commit() is for address space update, so it should be fine
> to have nothing to commit, sorry.

Hold on..

When I was replying to your patch 2 and reading the code around, I fount
that this patch does affect vhost..  see region_nop() hook and also vhost's
version of vhost_region_addnop().  I think vhost will sync its memory
layout for each of the commit(), and any newly created AS could emptify
vhost memory list even if registered on address_space_memory.

The other thing is address_space_update_topology() seems to be only used by
address_space_init().  It means I don't think there should have any
listener registered to this AS anyway.. :) So iiuc this patch (even if
converting to loop over per-as memory listeners) is not needed.

-- 
Peter Xu


