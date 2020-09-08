Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6872613AA
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 17:40:21 +0200 (CEST)
Received: from localhost ([::1]:43894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFfjG-0005Vr-JW
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 11:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kFfiG-00050s-5n; Tue, 08 Sep 2020 11:39:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:46624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kFfiE-0001lj-FY; Tue, 08 Sep 2020 11:39:15 -0400
Received: from dhcp-10-100-145-180.wdl.wdc.com (unknown [199.255.45.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9F38C24248;
 Tue,  8 Sep 2020 15:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599579550;
 bh=p2ABlEHWrOqnxEay2hMDM7dhoVCbVZDnYG6abVyYMFI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EZ3KFrKksUnpvZzNGIrJ3CX4vYJQ8gUsHFI44n5oMM9InmO5iIrofo5OfQftS2TTi
 p7xJE5ZlSwKShtwBOwnAfa/dwdh8z/PUbBAhTVWSLlZ3tOjkmdM5+2YVphIGcppLyA
 t9WjBoh0dXFPXSbxJQZuX9XVeV9DL+jh7fexpayU=
Date: Tue, 8 Sep 2020 08:39:07 -0700
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 17/17] hw/block/nvme: change controller pci id
Message-ID: <20200908153907.GB3341002@dhcp-10-100-145-180.wdl.wdc.com>
References: <20200904141956.576630-1-its@irrelevant.dk>
 <20200904141956.576630-18-its@irrelevant.dk>
 <894711e0-7823-5cf0-5b5a-a84f15b458ce@redhat.com>
 <20200907103708.GG2682@work-vm>
 <20200907105024.GA732668@apples.localdomain>
 <20200907105257.GH2682@work-vm>
 <20200907110216.GB732668@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907110216.GB732668@apples.localdomain>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 11:39:10
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 07, 2020 at 01:02:16PM +0200, Klaus Jensen wrote:
> On Sep  7 11:52, Dr. David Alan Gilbert wrote:
>
> > It may be best to turn it into a constant in include/hw/pci/pci_ids.h if
> > it corresponds to some real Intel device.
> > 
> 
> Yes, but that is just the thing - it does not correspond to an
> officially allocated device; which is why I think we should leave it out
> of pci_ids.h.
> 
> The end goal is to get rid of its use in the code by deprecating the
> use-intel-id parameter in the future. I guess the parameter should just
> be deprecated immediately? Then we can get rid of it in, what, 5.4?

It's not a real device yet, but it likely will not be an nvme device
once a product does release with this identifier. There may be trouble
with driver binding when that happens, so deprecating it here sooner
than later is my preference.

