Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 004A75EB649
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 02:33:08 +0200 (CEST)
Received: from localhost ([::1]:33142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocyX5-0000VP-GD
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 20:33:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1ocyUT-0007Kb-N4
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 20:30:25 -0400
Received: from mga11.intel.com ([192.55.52.93]:23261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.hu@linux.intel.com>)
 id 1ocyUP-0004Km-An
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 20:30:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664238621; x=1695774621;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6NLQKWlHtCBDw0dfy6pJ5bYnZZlPD9MvjJU2iFSWEwA=;
 b=do1ZJh5STTTYVmf3N8olGqszSg9XZAvL5iJGwtQlSxvj8Hai4JTsarXR
 zz9G/so6RJbnZHhyd7uoOAIXHLhslI0wRCwqbB/02Yl0oGi8+D+JL2XNK
 ygCvj/TW+Nri+jYshrnt4SnJN+4excoLBkrsZ9vfbIpdSytfGPSLREzpi
 VifQIbw0XjywD6JnIcAhvSuHzTE3M4G2lZRomOUPGoOq/IU57j3m4NZNC
 v/u9MvKgYlquqfs+HQU607666Ui181E82hupQfVLe5TriA/ASNtFvZJEq
 cJeRO25OHU/IaP/df+Szcxk2B6M9WjuAeW8EFHegRJNfJf1W5IdB7KLng A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="298775240"
X-IronPort-AV: E=Sophos;i="5.93,347,1654585200"; d="scan'208";a="298775240"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 17:30:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="689784468"
X-IronPort-AV: E=Sophos;i="5.93,347,1654585200"; d="scan'208";a="689784468"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by fmsmga004.fm.intel.com with ESMTP; 26 Sep 2022 17:30:16 -0700
Message-ID: <05c1d96492beaa8ec12b8807877903744d97e109.camel@linux.intel.com>
Subject: Re: [PATCH v4 5/5] test/acpi/bios-tables-test: SSDT: update golden
 master binaries
From: Robert Hoo <robert.hu@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: mst@redhat.com, xiaoguangrong.eric@gmail.com, ani@anisinha.ca, 
 jingqi.liu@intel.com, qemu-devel@nongnu.org, robert.hu@intel.com
Date: Tue, 27 Sep 2022 08:30:16 +0800
In-Reply-To: <20220926152214.05255edf@redhat.com>
References: <20220922122155.1326543-1-robert.hu@linux.intel.com>
 <20220922122155.1326543-6-robert.hu@linux.intel.com>
 <783af0cd89700c2c3ae9c6b2b1e49dab0a2d3f70.camel@linux.intel.com>
 <20220926152214.05255edf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=robert.hu@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
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

On Mon, 2022-09-26 at 15:22 +0200, Igor Mammedov wrote:
> > > 0800200c9a66"), One, 0x05, Local0, One)
> > > +                    CreateDWordField (Local3, Zero, STTS)
> > > +                    CreateField (Local3, 0x20, (LEN << 0x03),
> > > LDAT)
> > > +                    Name (LSA, Buffer (Zero){})
> > > +                    ToBuffer (LDAT, LSA) /*
> > > \_SB_.NVDR.NV00._LSR.LSA_ */
> > > +                    Local1 = Package (0x02)
> > > +                        {
> > > +                            STTS,
> > > +                            LSA
> > > +                        }  
> > 
> > Hi Igor,
> > 
> > Here is a little different from original proposal 
> > https://lore.kernel.org/qemu-devel/80b09055416c790922c7c3db60d2ba865792d1b0.camel@linux.intel.com/
> > 
> >    Local1 = Package (0x2) {STTS, toBuffer(LDAT)}
> > 
> > Because in my test, Linux guest complains:
> > 
> > [    3.884656] ACPI Error: AE_SUPPORT, Expressions within package
> > elements are not supported (20220331/dspkginit-172)
> > [    3.887104] ACPI Error: Aborting method \_SB.NVDR.NV00._LSR due
> > to
> > previous error (AE_SUPPORT) (20220331/psparse-531)
> > 
> > 
> > So I have to move toBuffer() out of Package{} and name LSA to hold
> > the
> > buffer. If you have better idea, pls. let me know.
> 
> Would something like following work?
> 
> LocalX =  Buffer (Zero){}
> LocalY = Package (0x01) { LocalX }


No, Package{} doesn't accept LocalX as elements.

PackageTerm :=
Package (
NumElements // Nothing | ByteConstExpr | TermArg => Integer
) {PackageList} => Package

PackageList :=
Nothing | <PackageElement PackageListTail>

PackageElement :=
DataObject | NameString


