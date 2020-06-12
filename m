Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1604A1F7934
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jun 2020 15:59:30 +0200 (CEST)
Received: from localhost ([::1]:38750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjkDQ-0004ZE-Cr
	for lists+qemu-devel@lfdr.de; Fri, 12 Jun 2020 09:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lorenzo.pieralisi@arm.com>)
 id 1jjk97-0002yL-8v
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 09:55:01 -0400
Received: from foss.arm.com ([217.140.110.172]:57452)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lorenzo.pieralisi@arm.com>) id 1jjk94-0007c9-Ai
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 09:55:00 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41E5F31B;
 Fri, 12 Jun 2020 06:54:55 -0700 (PDT)
Received: from e121166-lin.cambridge.arm.com (e121166-lin.cambridge.arm.com
 [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEF303F6CF;
 Fri, 12 Jun 2020 06:54:53 -0700 (PDT)
Date: Fri, 12 Jun 2020 14:54:43 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: "Derrick, Jonathan" <jonathan.derrick@intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v3 1/2] PCI: vmd: Filter resource type bits from shadow
 register
Message-ID: <20200612135443.GA25653@e121166-lin.cambridge.arm.com>
References: <20200528030240.16024-1-jonathan.derrick@intel.com>
 <20200528030240.16024-3-jonathan.derrick@intel.com>
 <20200529103315.GC12270@e121166-lin.cambridge.arm.com>
 <163e8cb37ece0c8daa6d6e5fd7fcae47ba4fa437.camel@intel.com>
 <20200529161824.GA17642@e121166-lin.cambridge.arm.com>
 <f1d36b8fc4ab7aacf6efca19303b04a5b4f8189c.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1d36b8fc4ab7aacf6efca19303b04a5b4f8189c.camel@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=lorenzo.pieralisi@arm.com; helo=foss.arm.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/12 09:54:55
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "andrzej.jakowski@linux.intel.com" <andrzej.jakowski@linux.intel.com>,
 "helgaas@kernel.org" <helgaas@kernel.org>, "hch@lst.de" <hch@lst.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 11, 2020 at 09:16:48PM +0000, Derrick, Jonathan wrote:

[...]

> > > > Hi Jon,
> > > > 
> > > > it looks like I can take this patch for v5.8 whereas patch 2 depends
> > > > on the QEMU changes acceptance and should probably wait.
> > > > 
> > > > Please let me know your thoughts asap and I will try to at least
> > > > squeeze this patch in.
> > > > 
> > > > Lorenzo
> > > 
> > > Hi Lorenzo,
> > > 
> > > This is fine. Please take Patch 1.
> > > Patch 2 is harmless without the QEMU changes, but may always need a
> > > different approach.
> > 
> > Pulled patch 1 into pci/vmd, thanks.
> > 
> > Lorenzo
> 
> Hi Lorenzo,
> 
> Alex has pr-ed the QEMU patch [1]
> Is it too late to pull patch 2/2 for v5.8?

I think it is - I don't know if Bjorn planned a second PR for this
merge window, if not it is v5.9 material I am afraid.

Thanks,
Lorenzo

> [1] 
> https://github.com/awilliam/qemu-vfio/releases/tag/vfio-update-20200611.0

