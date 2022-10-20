Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 369F76064BD
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:37:05 +0200 (CEST)
Received: from localhost ([::1]:39438 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXbI-0006cn-Mo
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:36:53 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXQS-0007QX-KW
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1olUFQ-0002pr-2E
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:02:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1olUFK-0005VM-C7
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:02:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666267317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DpRjDL2E6KYljSOm8FOFm+pWiUg/6kwWXikuPEUDzMg=;
 b=XEPlx+LGBvAPdUfDD1iXvu21MDz3Oo9Ieez6rGrryFminyuprNwQNtR8PQ9/Tvdp7Dr8kz
 wD6vgoayD2jEMeXd1QrHY4A3j1Y8bX5PxeSXRGMU/ZM+kM1G7Pi4YW3rNkWV8O7ixAZbQk
 4ZNPm7cU9zVPnT5P7LktBFlXYJZajIw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-48-DlrYifApN8ifrJv-O3m4ZA-1; Thu, 20 Oct 2022 08:01:53 -0400
X-MC-Unique: DlrYifApN8ifrJv-O3m4ZA-1
Received: by mail-wr1-f72.google.com with SMTP id
 s30-20020adfa29e000000b002302b9671feso6677489wra.20
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:01:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DpRjDL2E6KYljSOm8FOFm+pWiUg/6kwWXikuPEUDzMg=;
 b=RSCXc8ih1WisT0N06YN/rmxRYeQ/+cIh+/FcIQc/r+Z/H3U9HpMDQC2QNZZZ7YfeWN
 ZPElKp7q3nyfNXAvp2n8rurd6tx4xZNX+N+hRwDDMqORIibr7gYAjlhODHwffFgCTa8/
 trI9lKofgs3OtyQwu27OOZ7Mvs9GEJQCwtfpVo0JCa4D6qOoVQCV+7wTT4vYX8eCzkJn
 6qneO6gSG1px5JmuB3RdQCYLo/8Fe97fE2yYtVCq5I0bfk3AJpVKCn3RWKr08zEEE3S1
 xoYhHtEsKnEXJTc4fn4JTzBZEVmK2aEWvIl6321f3ohr/ojPzs91iwLBRS6sarhnAWEp
 oWeQ==
X-Gm-Message-State: ACrzQf2hiu4WkbwvnX/GW0XqeeIUYvEBqNpyzixrSfIgxNi7xmdYFRhh
 K2CWq2akjheP5LHCUXh1bYQa4GIMT8LxdG/wCjJhI6TfBQ3p00wxVlPCxhAFpRFrtqH8/YexUst
 pUKpo+q0Cybjy6BQ=
X-Received: by 2002:adf:df8b:0:b0:230:5212:d364 with SMTP id
 z11-20020adfdf8b000000b002305212d364mr8104597wrl.124.1666267312664; 
 Thu, 20 Oct 2022 05:01:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7wSduaXA9ACNCGZw6DoEexlxfMC6+trioN/5r/2QtcW8wrfM91hMO0ezwUztDhIi7Qy04YdA==
X-Received: by 2002:adf:df8b:0:b0:230:5212:d364 with SMTP id
 z11-20020adfdf8b000000b002305212d364mr8104582wrl.124.1666267312441; 
 Thu, 20 Oct 2022 05:01:52 -0700 (PDT)
Received: from redhat.com ([2.54.191.184]) by smtp.gmail.com with ESMTPSA id
 bv20-20020a0560001f1400b00231a5fa1ae2sm15980884wrb.20.2022.10.20.05.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:01:51 -0700 (PDT)
Date: Thu, 20 Oct 2022 08:01:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Robert Hoo <robert.hu@linux.intel.com>, xiaoguangrong.eric@gmail.com,
 ani@anisinha.ca, jingqi.liu@intel.com, qemu-devel@nongnu.org,
 robert.hu@intel.com
Subject: Re: [PATCH v4 5/5] test/acpi/bios-tables-test: SSDT: update golden
 master binaries
Message-ID: <20221020080048-mutt-send-email-mst@kernel.org>
References: <20220922122155.1326543-1-robert.hu@linux.intel.com>
 <20220922122155.1326543-6-robert.hu@linux.intel.com>
 <783af0cd89700c2c3ae9c6b2b1e49dab0a2d3f70.camel@linux.intel.com>
 <20220926152214.05255edf@redhat.com>
 <05c1d96492beaa8ec12b8807877903744d97e109.camel@linux.intel.com>
 <8e4cf298f32424bd1a18033eba94a8eeb35f2950.camel@linux.intel.com>
 <ec7978235b1ccea65d589c25b34d36cdb5872d60.camel@linux.intel.com>
 <20221020134849.168bde67@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020134849.168bde67@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Thu, Oct 20, 2022 at 01:48:49PM +0200, Igor Mammedov wrote:
> On Thu, 20 Oct 2022 08:48:36 +0800
> Robert Hoo <robert.hu@linux.intel.com> wrote:
> 
> > Ping...
> 
> sorry, series got lost among the rest.
> I've just acked 4/5, but this patch doesn't apply anymore with
>  error: corrupt patch at line 172


updating binaries can be done when applying, this is why
we have the process of splitting these patches out.

If the diff looks good to you - then just ack this, and I will
check it's the diff when applying.


> > On Fri, 2022-10-07 at 21:27 +0800, Robert Hoo wrote:
> > > Ping...
> > > On Tue, 2022-09-27 at 08:30 +0800, Robert Hoo wrote:  
> > > > On Mon, 2022-09-26 at 15:22 +0200, Igor Mammedov wrote:  
> > > > > > > 0800200c9a66"), One, 0x05, Local0, One)
> > > > > > > +                    CreateDWordField (Local3, Zero, STTS)
> > > > > > > +                    CreateField (Local3, 0x20, (LEN <<
> > > > > > > 0x03),
> > > > > > > LDAT)
> > > > > > > +                    Name (LSA, Buffer (Zero){})
> > > > > > > +                    ToBuffer (LDAT, LSA) /*
> > > > > > > \_SB_.NVDR.NV00._LSR.LSA_ */
> > > > > > > +                    Local1 = Package (0x02)
> > > > > > > +                        {
> > > > > > > +                            STTS,
> > > > > > > +                            LSA
> > > > > > > +                        }    
> > > > > > 
> > > > > > Hi Igor,
> > > > > > 
> > > > > > Here is a little different from original proposal 
> > > > > > https://lore.kernel.org/qemu-devel/80b09055416c790922c7c3db60d2ba865792d1b0.camel@linux.intel.com/
> > > > > > 
> > > > > >    Local1 = Package (0x2) {STTS, toBuffer(LDAT)}
> > > > > > 
> > > > > > Because in my test, Linux guest complains:
> > > > > > 
> > > > > > [    3.884656] ACPI Error: AE_SUPPORT, Expressions within
> > > > > > package
> > > > > > elements are not supported (20220331/dspkginit-172)
> > > > > > [    3.887104] ACPI Error: Aborting method \_SB.NVDR.NV00._LSR
> > > > > > due
> > > > > > to
> > > > > > previous error (AE_SUPPORT) (20220331/psparse-531)
> > > > > > 
> > > > > > 
> > > > > > So I have to move toBuffer() out of Package{} and name LSA to
> > > > > > hold
> > > > > > the
> > > > > > buffer. If you have better idea, pls. let me know.  
> > > > > 
> > > > > Would something like following work?
> > > > > 
> > > > > LocalX =  Buffer (Zero){}
> > > > > LocalY = Package (0x01) { LocalX }  
> > > > 
> > > > 
> > > > No, Package{} doesn't accept LocalX as elements.
> > > > 
> > > > PackageTerm :=
> > > > Package (
> > > > NumElements // Nothing | ByteConstExpr | TermArg => Integer
> > > > ) {PackageList} => Package
> > > > 
> > > > PackageList :=
> > > > Nothing | <PackageElement PackageListTail>
> > > > 
> > > > PackageElement :=
> > > > DataObject | NameString  
> > 


