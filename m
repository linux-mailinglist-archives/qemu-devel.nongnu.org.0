Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CA16064D7
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:42:48 +0200 (CEST)
Received: from localhost ([::1]:56564 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXh0-0006BG-6h
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:42:47 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXes-0002Ue-Fm
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1olVL6-0002t7-Hf
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 09:12:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1olVKY-0005am-0V
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 09:11:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666271483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gpMTVRNlaCmezxzkYldNtorn3sAQOON/GRBcwZC7kw4=;
 b=AeVItW8g2In5AmnIbxtdIPn8XgOEtSJd6+GQ8phBbZnkDOpeF4X9cvpny8MeBOaYT37c/V
 cYhPVeKRqgDEilmGplIeNBvaOW4SweqRFF6sWap9DL+jUWJEZrjlhXxPmyjeK1y+gB6zDz
 58U6ME5lt5qdJFK/n54tqkVPIDA6eps=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-HgpJ6NN0M3aatnN2fASTnQ-1; Thu, 20 Oct 2022 09:11:21 -0400
X-MC-Unique: HgpJ6NN0M3aatnN2fASTnQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 jg38-20020a170907972600b007919b3ad75aso4426616ejc.10
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 06:11:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gpMTVRNlaCmezxzkYldNtorn3sAQOON/GRBcwZC7kw4=;
 b=F/5Ln34dvWvcm4shjcF1Cu3P/WwHU823NYQemvg6embVgcz8y9iXEJVIOS6DCKiARR
 V2iKJmT9OMnA2FsILMgnO1zS9OzT8SVDAsVIAzEkb4gYivCkmEJWANuwPwrbgFuw3GmR
 Awy8VCsxRGZUUP2d8keFZW9NaOETDZp8iJ9kZOlGxY+svVvqJJnjMSeHLNAz0u74aKXJ
 4oY/j9ONB+kQ3G+C7FUV0IafcgNjCD62WX+Van08+ZqTn9wVdwvbf/NJic6ewdl0q5C1
 76z9BuP4wxJL5ksiQmbWubxgilzO0xQWxhIxMqyW0jlNwEpxBq3BS1zEu7Rc6RLeMFou
 HaMQ==
X-Gm-Message-State: ACrzQf0c+DfQJalcmFvRzDvUQQHn00TJTd/hiI5sZbuqsnGp3zNhF11b
 hsfzlNQNZX+qiJIB+a6JcoL2ORG0rcvQTCKws6Y7sJJwvccZiMsZbkFyEtiwU5LsftMdG1m4si/
 /tB/NbTWZ7xCoiss=
X-Received: by 2002:a17:907:2d89:b0:78d:9c30:452b with SMTP id
 gt9-20020a1709072d8900b0078d9c30452bmr10215222ejc.533.1666271479833; 
 Thu, 20 Oct 2022 06:11:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5tz9rp/Zm1x5u2SxPU/5U3LyOYaKzCJUUP5aRG8BAi/gB8ydwyfNeDYypJJb/yF7HKq0pzmQ==
X-Received: by 2002:a17:907:2d89:b0:78d:9c30:452b with SMTP id
 gt9-20020a1709072d8900b0078d9c30452bmr10215184ejc.533.1666271479264; 
 Thu, 20 Oct 2022 06:11:19 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 b19-20020a17090630d300b0073c0b87ba34sm10293254ejb.198.2022.10.20.06.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 06:11:18 -0700 (PDT)
Date: Thu, 20 Oct 2022 15:11:17 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Robert Hoo <robert.hu@linux.intel.com>, xiaoguangrong.eric@gmail.com,
 ani@anisinha.ca, jingqi.liu@intel.com, qemu-devel@nongnu.org,
 robert.hu@intel.com
Subject: Re: [PATCH v4 5/5] test/acpi/bios-tables-test: SSDT: update golden
 master binaries
Message-ID: <20221020151117.31556ac0@redhat.com>
In-Reply-To: <20221020080048-mutt-send-email-mst@kernel.org>
References: <20220922122155.1326543-1-robert.hu@linux.intel.com>
 <20220922122155.1326543-6-robert.hu@linux.intel.com>
 <783af0cd89700c2c3ae9c6b2b1e49dab0a2d3f70.camel@linux.intel.com>
 <20220926152214.05255edf@redhat.com>
 <05c1d96492beaa8ec12b8807877903744d97e109.camel@linux.intel.com>
 <8e4cf298f32424bd1a18033eba94a8eeb35f2950.camel@linux.intel.com>
 <ec7978235b1ccea65d589c25b34d36cdb5872d60.camel@linux.intel.com>
 <20221020134849.168bde67@redhat.com>
 <20221020080048-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 20 Oct 2022 08:01:48 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, Oct 20, 2022 at 01:48:49PM +0200, Igor Mammedov wrote:
> > On Thu, 20 Oct 2022 08:48:36 +0800
> > Robert Hoo <robert.hu@linux.intel.com> wrote:
> >   
> > > Ping...  
> > 
> > sorry, series got lost among the rest.
> > I've just acked 4/5, but this patch doesn't apply anymore with
> >  error: corrupt patch at line 172  
> 
> 
> updating binaries can be done when applying, this is why
> we have the process of splitting these patches out.
> 
> If the diff looks good to you - then just ack this, and I will
> check it's the diff when applying.


Acked-by: Igor Mammedov <imammedo@redhat.com>

> 
> 
> > > On Fri, 2022-10-07 at 21:27 +0800, Robert Hoo wrote:  
> > > > Ping...
> > > > On Tue, 2022-09-27 at 08:30 +0800, Robert Hoo wrote:    
> > > > > On Mon, 2022-09-26 at 15:22 +0200, Igor Mammedov wrote:    
> > > > > > > > 0800200c9a66"), One, 0x05, Local0, One)
> > > > > > > > +                    CreateDWordField (Local3, Zero, STTS)
> > > > > > > > +                    CreateField (Local3, 0x20, (LEN <<
> > > > > > > > 0x03),
> > > > > > > > LDAT)
> > > > > > > > +                    Name (LSA, Buffer (Zero){})
> > > > > > > > +                    ToBuffer (LDAT, LSA) /*
> > > > > > > > \_SB_.NVDR.NV00._LSR.LSA_ */
> > > > > > > > +                    Local1 = Package (0x02)
> > > > > > > > +                        {
> > > > > > > > +                            STTS,
> > > > > > > > +                            LSA
> > > > > > > > +                        }      
> > > > > > > 
> > > > > > > Hi Igor,
> > > > > > > 
> > > > > > > Here is a little different from original proposal 
> > > > > > > https://lore.kernel.org/qemu-devel/80b09055416c790922c7c3db60d2ba865792d1b0.camel@linux.intel.com/
> > > > > > > 
> > > > > > >    Local1 = Package (0x2) {STTS, toBuffer(LDAT)}
> > > > > > > 
> > > > > > > Because in my test, Linux guest complains:
> > > > > > > 
> > > > > > > [    3.884656] ACPI Error: AE_SUPPORT, Expressions within
> > > > > > > package
> > > > > > > elements are not supported (20220331/dspkginit-172)
> > > > > > > [    3.887104] ACPI Error: Aborting method \_SB.NVDR.NV00._LSR
> > > > > > > due
> > > > > > > to
> > > > > > > previous error (AE_SUPPORT) (20220331/psparse-531)
> > > > > > > 
> > > > > > > 
> > > > > > > So I have to move toBuffer() out of Package{} and name LSA to
> > > > > > > hold
> > > > > > > the
> > > > > > > buffer. If you have better idea, pls. let me know.    
> > > > > > 
> > > > > > Would something like following work?
> > > > > > 
> > > > > > LocalX =  Buffer (Zero){}
> > > > > > LocalY = Package (0x01) { LocalX }    
> > > > > 
> > > > > 
> > > > > No, Package{} doesn't accept LocalX as elements.
> > > > > 
> > > > > PackageTerm :=
> > > > > Package (
> > > > > NumElements // Nothing | ByteConstExpr | TermArg => Integer
> > > > > ) {PackageList} => Package
> > > > > 
> > > > > PackageList :=
> > > > > Nothing | <PackageElement PackageListTail>
> > > > > 
> > > > > PackageElement :=
> > > > > DataObject | NameString    
> > >   
> 


