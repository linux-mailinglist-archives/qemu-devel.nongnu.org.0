Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 670ED5BFF73
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 16:02:30 +0200 (CEST)
Received: from localhost ([::1]:60888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob0J1-0006ip-CY
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 10:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oaznL-0005MY-41
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 09:29:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oaznI-0005YD-Gy
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 09:29:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663766979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4viXSoPX4odma717Ac2JZ9bpw/fVejS24HPnGvybxj4=;
 b=UqfheQMFEgTHb4ZBHLGYRtbdeu5OouTswHrHW0m+n0Lkkbq0vp2F/1yZhs9hwO6Ft7PcVJ
 Ip3UcmCBuOIecD3ZcvnNJymWU/BCefC7YejZb5cWj3oqsTDJMoKJ8t9nfakApq9e5VRHPS
 7aHhBJuV/1P+z0/k7tUNIE93VJBV+Zc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-154-lnC37vZnM26D0Csb9Q8qVQ-1; Wed, 21 Sep 2022 09:29:30 -0400
X-MC-Unique: lnC37vZnM26D0Csb9Q8qVQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 gv43-20020a1709072beb00b0077c3f58a03eso3105181ejc.4
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 06:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=4viXSoPX4odma717Ac2JZ9bpw/fVejS24HPnGvybxj4=;
 b=V4vD5g5mb5QvqDuhGzKWNjUQOI0e+dUxVJNFPPkwirSAd1W+OA/9G41EaHeF1hkH72
 ujr0DZeju8BQ63Zc4OamfgZ85qifEGmQ8S4tQdRvotTRw5/rLCZQTr4ppjr6kSQo/gcv
 vC8Cm5ZuX/f5EU5YaKBF9TWSPazrPqRp32v+c7NXQCBv1+R2goYIqYUzSFWjBUy8Jnmr
 ty3AOZRundmW8W+ONvZtRgrD3t9ZCQDy1TgeWbvGcLeG/mao1EwoAGUYwgvIy6yg6END
 yEaBVolcnflV6WhCrHAv3CCbN1mPIMyV2AGXUKu5stkFpTjP/75BIqDzr/cEfnzELbq3
 zvWw==
X-Gm-Message-State: ACrzQf2iFszMR5jomoljDAM1vKygpXUxgZGLFm3+gZHYbtJ2MRigr9Pw
 2CSN9GLtGgC0hHrI1NDopXJhoqWCZOmR17xcaxrqPAU60CC+BraTjA+yyTlAKYGg4Xx1UNjoMCz
 NniXBOy69zkZQaNU=
X-Received: by 2002:a05:6402:4402:b0:453:6a9:ef8a with SMTP id
 y2-20020a056402440200b0045306a9ef8amr24177321eda.85.1663766969669; 
 Wed, 21 Sep 2022 06:29:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5HhBZcxR0obLofgr8VLjF6cMnk0FbuX/g2p9JZMwM+Y8p9i1YMsb7JnV3ti+VVnB1qrKufTQ==
X-Received: by 2002:a05:6402:4402:b0:453:6a9:ef8a with SMTP id
 y2-20020a056402440200b0045306a9ef8amr24177296eda.85.1663766969398; 
 Wed, 21 Sep 2022 06:29:29 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 ks23-20020a170906f85700b0073dbaeb50f6sm1263551ejb.169.2022.09.21.06.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 06:29:28 -0700 (PDT)
Date: Wed, 21 Sep 2022 15:29:27 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Cc: mst@redhat.com, xiaoguangrong.eric@gmail.com, ani@anisinha.ca,
 dan.j.williams@intel.com, jingqi.liu@intel.com, qemu-devel@nongnu.org,
 robert.hu@intel.com
Subject: Re: [PATCH v3 4/5] acpi/nvdimm: Implement ACPI NVDIMM Label Methods
Message-ID: <20220921152927.03973518@redhat.com>
In-Reply-To: <79e4c6a123e5b1edfaaa88f6ea12facedbaf5711.camel@linux.intel.com>
References: <20220901032721.1392482-1-robert.hu@linux.intel.com>
 <20220901032721.1392482-5-robert.hu@linux.intel.com>
 <20220909153910.557fdbe7@redhat.com>
 <78f021195335f1cc9d01071db58a51539f29c597.camel@linux.intel.com>
 <20220916093757.689a939f@redhat.com>
 <80b09055416c790922c7c3db60d2ba865792d1b0.camel@linux.intel.com>
 <20220920111302.0c1716af@redhat.com>
 <79e4c6a123e5b1edfaaa88f6ea12facedbaf5711.camel@linux.intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Tue, 20 Sep 2022 20:28:31 +0800
Robert Hoo <robert.hu@linux.intel.com> wrote:

> On Tue, 2022-09-20 at 11:13 +0200, Igor Mammedov wrote:
> > On Fri, 16 Sep 2022 21:15:35 +0800
> > Robert Hoo <robert.hu@linux.intel.com> wrote:
> >   
> > > On Fri, 2022-09-16 at 09:37 +0200, Igor Mammedov wrote:
> > >   
> > > > > Fine, get your point now.
> > > > > In ASL it will look like this:
> > > > >                     Local1 = Package (0x3) {STTS, SLSA, MAXT}
> > > > >                     Return (Local1)    
> > > > 
> > > >     
> > > > > 
> > > > > But as for 
> > > > >                     CreateDWordField (Local0, Zero, STTS)  //
> > > > > Status
> > > > >                     CreateDWordField (Local0, 0x04, SLSA)  //
> > > > > SizeofLSA
> > > > >                     CreateDWordField (Local0, 0x08, MAXT)  //
> > > > > Max
> > > > > Trans
> > > > > 
> > > > > I cannot figure out how to substitute with LocalX. Can you shed
> > > > > more
> > > > > light?    
> > > > 
> > > > Leave this as is, there is no way to make it anonymous/local with
> > > > FooField.
> > > > 
> > > > (well one might try to use Index and copy field's bytes into a
> > > > buffer
> > > > and
> > > > then explicitly convert to Integer, but that's a rather
> > > > convoluted
> > > > way
> > > > around limitation so I'd not go this route)
> > > >     
> > > 
> > > OK, pls. take a look, how about this?
> > > 
> > > Method (_LSI, 0, Serialized)  // _LSI: Label Storage Information
> > > {   
> > >     Local0 = NCAL (ToUUID("4309ac30-0d11-11e4-9191-0800200c9a66"),
> > > 0x02, 0x04, Zero, One)    // Buffer
> > >     CreateDWordField (Local0, Zero, STTS)  // Status
> > >     CreateDWordField (Local0, 0x04, SLSA)  // Size of LSA
> > >     CreateDWordField (Local0, 0x08, MAXT)  // Max Transfer Size
> > >     Local1 = Package (0x3) {STTS, SLSA, MAXT}
> > >     Return (Local1)
> > > }
> > > 
> > > Method (_LSR, 2, Serialized)  // _LSR: Label Storage Read
> > > {
> > >     Name (INPT, Buffer(8) {})
> > >     CreateDWordField (INPT, Zero, OFST);
> > >     CreateDWordField (INPT, 4, LEN);  
> > 
> > why do you have to create and use INPT, wouldn't local be enough to
> > keep the buffer?  
> 
> If substitute INPT with LocalX, then later
> Local0 = Package (0x01) {LocalX} isn't accepted.
> 
> PackageElement :=
> DataObject | NameString

ok, then respin series and lets get it some testing.

BTW:
it looks like Windows Server starting from v2019 has support for
NVDIMM-P devices which came with 'Optane DC Persistent Memory Modules'
but it fails to recognize NVDIMMs in QEMU (complaining something about
wrong target). Perhaps you can reach someone with Optane/ACPI
expertise within your org and try to fix QEMU side.

> >   
> > >     OFST = Arg0
> > >     LEN = Arg1
> > >     Local0 = Package (0x01) {INPT}
> > >     Local3 = NCAL (ToUUID("4309ac30-0d11-11e4-9191-0800200c9a66"),
> > > 0x02, 0x05, Local0, One)
> > >     CreateDWordField (Local3, Zero, STTS)
> > >     CreateField (Local3, 32, LEN << 3, LDAT)
> > >     Local1 = Package (0x2) {STTS, toBuffer(LDAT)}
> > >     Return (Local1)
> > > }
> > > 
> > > Method (_LSW, 3, Serialized)  // _LSW: Label Storage Write
> > > {
> > >     Local2 = Arg2
> > >     Name (INPT, Buffer(8) {})  
> > 
> > ditto
> >   
> > >     CreateDWordField (INPT, Zero, OFST);
> > >     CreateDWordField (INPT, 4, TLEN);
> > >     OFST = Arg0
> > >     TLEN = Arg1
> > >     Concatenate(INPT, Local2, INPT)
> > >     Local0 = Package (0x01)
> > >     {
> > >         INPT
> > >     }
> > >     Local3 = NCAL (ToUUID ("4309ac30-0d11-11e4-9191-0800200c9a66"),
> > > 0x02, 0x06, Local0, One)
> > >     CreateDWordField (Local3, 0, STTS)
> > >     Return (STTS)
> > > }  
> 
> 


