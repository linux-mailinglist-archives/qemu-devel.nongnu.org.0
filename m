Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E865F7A00
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 16:54:27 +0200 (CEST)
Received: from localhost ([::1]:56086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogok5-00070a-G0
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 10:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1ognNw-0006eQ-8d
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 09:27:35 -0400
Received: from mga06b.intel.com ([134.134.136.31]:20163 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1ognNt-00040Z-L2
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 09:27:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665149245; x=1696685245;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rzk32TQk/zuJpsh0wz/FSXpA7oGUKDP0ec75h9XyrPU=;
 b=Mskj2yI1Rnq+lCOy59AfPJ3n3KuX6K/wyaayfQ4kTX0DDLl54fc6w07l
 dvWWZYtvKX1AUBCXPqxeCTjLwJdFYh4oY5/EBfPCzB4h9ZOAQuC7/0d+O
 11mZQJZP1ojrjWVy6wloZmm1rbFOIAA4dpGxnfUbFtm6gZije/IQ28LIH
 NJPy6sHLJnhc4ikbS3NlZotXNi2oP01sdalEIc/jfISimUeGkyY5jn9Gf
 HRtEbbT+xxocqNQfcBcyxWIgU+NWGiwyccO6KN3nXZXe5Sv2njwj89nNH
 yfwbftM1Xqm/hvYQEEuHfhd0I9tLH4ejES2PLn7q/Y8jsELcRH02snx4H w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10493"; a="365675724"
X-IronPort-AV: E=Sophos;i="5.95,166,1661842800"; d="scan'208";a="365675724"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2022 06:27:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10493"; a="729608169"
X-IronPort-AV: E=Sophos;i="5.95,166,1661842800"; d="scan'208";a="729608169"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by fmsmga002.fm.intel.com with ESMTP; 07 Oct 2022 06:27:20 -0700
Message-ID: <8e4cf298f32424bd1a18033eba94a8eeb35f2950.camel@linux.intel.com>
Subject: Re: [PATCH v4 5/5] test/acpi/bios-tables-test: SSDT: update golden
 master binaries
From: Robert Hoo <robert.hu@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: mst@redhat.com, xiaoguangrong.eric@gmail.com, ani@anisinha.ca, 
 jingqi.liu@intel.com, qemu-devel@nongnu.org, robert.hu@intel.com
Date: Fri, 07 Oct 2022 21:27:20 +0800
In-Reply-To: <05c1d96492beaa8ec12b8807877903744d97e109.camel@linux.intel.com>
References: <20220922122155.1326543-1-robert.hu@linux.intel.com>
 <20220922122155.1326543-6-robert.hu@linux.intel.com>
 <783af0cd89700c2c3ae9c6b2b1e49dab0a2d3f70.camel@linux.intel.com>
 <20220926152214.05255edf@redhat.com>
 <05c1d96492beaa8ec12b8807877903744d97e109.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=134.134.136.31;
 envelope-from=robert.hu@linux.intel.com; helo=mga06.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Ping...
On Tue, 2022-09-27 at 08:30 +0800, Robert Hoo wrote:
> On Mon, 2022-09-26 at 15:22 +0200, Igor Mammedov wrote:
> > > > 0800200c9a66"), One, 0x05, Local0, One)
> > > > +                    CreateDWordField (Local3, Zero, STTS)
> > > > +                    CreateField (Local3, 0x20, (LEN << 0x03),
> > > > LDAT)
> > > > +                    Name (LSA, Buffer (Zero){})
> > > > +                    ToBuffer (LDAT, LSA) /*
> > > > \_SB_.NVDR.NV00._LSR.LSA_ */
> > > > +                    Local1 = Package (0x02)
> > > > +                        {
> > > > +                            STTS,
> > > > +                            LSA
> > > > +                        }  
> > > 
> > > Hi Igor,
> > > 
> > > Here is a little different from original proposal 
> > > https://lore.kernel.org/qemu-devel/80b09055416c790922c7c3db60d2ba865792d1b0.camel@linux.intel.com/
> > > 
> > >    Local1 = Package (0x2) {STTS, toBuffer(LDAT)}
> > > 
> > > Because in my test, Linux guest complains:
> > > 
> > > [    3.884656] ACPI Error: AE_SUPPORT, Expressions within package
> > > elements are not supported (20220331/dspkginit-172)
> > > [    3.887104] ACPI Error: Aborting method \_SB.NVDR.NV00._LSR
> > > due
> > > to
> > > previous error (AE_SUPPORT) (20220331/psparse-531)
> > > 
> > > 
> > > So I have to move toBuffer() out of Package{} and name LSA to
> > > hold
> > > the
> > > buffer. If you have better idea, pls. let me know.
> > 
> > Would something like following work?
> > 
> > LocalX =  Buffer (Zero){}
> > LocalY = Package (0x01) { LocalX }
> 
> 
> No, Package{} doesn't accept LocalX as elements.
> 
> PackageTerm :=
> Package (
> NumElements // Nothing | ByteConstExpr | TermArg => Integer
> ) {PackageList} => Package
> 
> PackageList :=
> Nothing | <PackageElement PackageListTail>
> 
> PackageElement :=
> DataObject | NameString


