Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 152FC6060BB
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 14:57:22 +0200 (CEST)
Received: from localhost ([::1]:36396 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olV6t-0004dy-Gn
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:57:20 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olV3K-0000Jk-9I
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1olU2j-000796-2B
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:48:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1olU2g-0005UB-AW
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:48:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666266533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/lQOKujRPFyhQ8gl9Nl2Iy4tc0ORaCS+s6QvRMV5vdo=;
 b=D8eE66L9l3vw+AZN4XjEWn3mZbVstigK6EcfsYIfjHjBu/5+rSzJadSTPEOx6un3t21Xx4
 CKXUIa6tUU93ByZFE+PlmyLpGW2IxeGGrthzpELlQArFeAEqll1rDGfNPe+vO78eMkwokv
 ZLNT4RdcI0bfvFTfc8us4xG/7nh4CW4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-380-5lYP4bQAN_CLtn33ctA0MQ-1; Thu, 20 Oct 2022 07:48:52 -0400
X-MC-Unique: 5lYP4bQAN_CLtn33ctA0MQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 l18-20020a056402255200b0045d2674d1a0so13454425edb.0
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:48:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/lQOKujRPFyhQ8gl9Nl2Iy4tc0ORaCS+s6QvRMV5vdo=;
 b=p/qOjeonx772mPiGqEPpXELBCrHVSaJIbVxyH6qbd14JAtNO+TjsB3YjkV0IPhEeFM
 Xbco7wn9lkOGlPrPR5qKWLeNO3dFr6IJjEPUotMiEfV0Lqmk32zIuthp/XYi3G1LsLjL
 vCLO6I8mD2oxn9U1en4fcw+VnqBtd3Rn2f2Q2GVaBY86pkhbaapMHbY+UVb+4Mtp0zEs
 GRwmNrkGtkah7TOrQdyML9mSY66VWKL8DRHGZ7IWjl4ac5PJSf2Rc/jLJhTmMENNPzdf
 XbyulsWMdl3UNPkPSyGREPZuIQrJOxBqSG/OraOsH/EOuZjD1348wZ5Xs/ws9XIm0zSP
 bPeA==
X-Gm-Message-State: ACrzQf1KliT85rKfq2dIREAsYDg84GBM+BaNjFBKZoxF8+QBBHd++yT2
 ZSSc42iBAsmpH120C6SNBSldmHtchipyX1/jYkn5Qz4Pw2vPfD5IGQzfJha5+ggQmZpQeJ8BQ9v
 g0aR7tlmruL7QFpE=
X-Received: by 2002:a05:6402:2989:b0:44e:90d0:b9ff with SMTP id
 eq9-20020a056402298900b0044e90d0b9ffmr11687295edb.110.1666266531505; 
 Thu, 20 Oct 2022 04:48:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4SYqI/6blQ8HLx1ltAD6/M2fC3MtcIHhJfmq2ivYRoqjbrYTnktQF8Y/O02I5VxXUUffl7QQ==
X-Received: by 2002:a05:6402:2989:b0:44e:90d0:b9ff with SMTP id
 eq9-20020a056402298900b0044e90d0b9ffmr11687277edb.110.1666266531310; 
 Thu, 20 Oct 2022 04:48:51 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 fd13-20020a056402388d00b0045b3853c4b7sm11911439edb.51.2022.10.20.04.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:48:50 -0700 (PDT)
Date: Thu, 20 Oct 2022 13:48:49 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Cc: mst@redhat.com, xiaoguangrong.eric@gmail.com, ani@anisinha.ca,
 jingqi.liu@intel.com, qemu-devel@nongnu.org, robert.hu@intel.com
Subject: Re: [PATCH v4 5/5] test/acpi/bios-tables-test: SSDT: update golden
 master binaries
Message-ID: <20221020134849.168bde67@redhat.com>
In-Reply-To: <ec7978235b1ccea65d589c25b34d36cdb5872d60.camel@linux.intel.com>
References: <20220922122155.1326543-1-robert.hu@linux.intel.com>
 <20220922122155.1326543-6-robert.hu@linux.intel.com>
 <783af0cd89700c2c3ae9c6b2b1e49dab0a2d3f70.camel@linux.intel.com>
 <20220926152214.05255edf@redhat.com>
 <05c1d96492beaa8ec12b8807877903744d97e109.camel@linux.intel.com>
 <8e4cf298f32424bd1a18033eba94a8eeb35f2950.camel@linux.intel.com>
 <ec7978235b1ccea65d589c25b34d36cdb5872d60.camel@linux.intel.com>
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

On Thu, 20 Oct 2022 08:48:36 +0800
Robert Hoo <robert.hu@linux.intel.com> wrote:

> Ping...

sorry, series got lost among the rest.
I've just acked 4/5, but this patch doesn't apply anymore with
 error: corrupt patch at line 172

> On Fri, 2022-10-07 at 21:27 +0800, Robert Hoo wrote:
> > Ping...
> > On Tue, 2022-09-27 at 08:30 +0800, Robert Hoo wrote:  
> > > On Mon, 2022-09-26 at 15:22 +0200, Igor Mammedov wrote:  
> > > > > > 0800200c9a66"), One, 0x05, Local0, One)
> > > > > > +                    CreateDWordField (Local3, Zero, STTS)
> > > > > > +                    CreateField (Local3, 0x20, (LEN <<
> > > > > > 0x03),
> > > > > > LDAT)
> > > > > > +                    Name (LSA, Buffer (Zero){})
> > > > > > +                    ToBuffer (LDAT, LSA) /*
> > > > > > \_SB_.NVDR.NV00._LSR.LSA_ */
> > > > > > +                    Local1 = Package (0x02)
> > > > > > +                        {
> > > > > > +                            STTS,
> > > > > > +                            LSA
> > > > > > +                        }    
> > > > > 
> > > > > Hi Igor,
> > > > > 
> > > > > Here is a little different from original proposal 
> > > > > https://lore.kernel.org/qemu-devel/80b09055416c790922c7c3db60d2ba865792d1b0.camel@linux.intel.com/
> > > > > 
> > > > >    Local1 = Package (0x2) {STTS, toBuffer(LDAT)}
> > > > > 
> > > > > Because in my test, Linux guest complains:
> > > > > 
> > > > > [    3.884656] ACPI Error: AE_SUPPORT, Expressions within
> > > > > package
> > > > > elements are not supported (20220331/dspkginit-172)
> > > > > [    3.887104] ACPI Error: Aborting method \_SB.NVDR.NV00._LSR
> > > > > due
> > > > > to
> > > > > previous error (AE_SUPPORT) (20220331/psparse-531)
> > > > > 
> > > > > 
> > > > > So I have to move toBuffer() out of Package{} and name LSA to
> > > > > hold
> > > > > the
> > > > > buffer. If you have better idea, pls. let me know.  
> > > > 
> > > > Would something like following work?
> > > > 
> > > > LocalX =  Buffer (Zero){}
> > > > LocalY = Package (0x01) { LocalX }  
> > > 
> > > 
> > > No, Package{} doesn't accept LocalX as elements.
> > > 
> > > PackageTerm :=
> > > Package (
> > > NumElements // Nothing | ByteConstExpr | TermArg => Integer
> > > ) {PackageList} => Package
> > > 
> > > PackageList :=
> > > Nothing | <PackageElement PackageListTail>
> > > 
> > > PackageElement :=
> > > DataObject | NameString  
> 


