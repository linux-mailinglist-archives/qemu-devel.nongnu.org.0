Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE096170AFE
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 23:01:23 +0100 (CET)
Received: from localhost ([::1]:50694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j74k6-0008RH-6y
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 17:01:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48779)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrzej.jakowski@linux.intel.com>)
 id 1j74iz-0007aE-Vd
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 17:00:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrzej.jakowski@linux.intel.com>)
 id 1j74iz-00049L-2F
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 17:00:13 -0500
Received: from mga06.intel.com ([134.134.136.31]:9997)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrzej.jakowski@linux.intel.com>)
 id 1j74iw-00043s-NB; Wed, 26 Feb 2020 17:00:10 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Feb 2020 14:00:03 -0800
X-IronPort-AV: E=Sophos;i="5.70,489,1574150400"; d="scan'208";a="231561023"
Received: from ajakowsk-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.78.27.169])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 26 Feb 2020 14:00:03 -0800
Subject: Re: [PATCH v2 1/1] block/nvme: introduce PMR support from NVMe 1.4
 spec
To: keith.busch@intel.com, kwolf@redhat.com, mreitz@redhat.com
References: <20200221212327.24616-1-andrzej.jakowski@linux.intel.com>
 <20200221212327.24616-2-andrzej.jakowski@linux.intel.com>
From: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
Message-ID: <7a21628e-9b14-7674-d73b-11c3fa5f5c71@linux.intel.com>
Date: Wed, 26 Feb 2020 15:00:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221212327.24616-2-andrzej.jakowski@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.31
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
Cc: haozhong.zhang@intel.com, qemu-block@nongnu.org, stefanha@gmail.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com, yi.z.zhang@linux.intel.com,
 junyan.he@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/20 2:23 PM, Andrzej Jakowski wrote:
> This patch introduces support for PMR that has been defined as part of NVMe 1.4
> spec. User can now specify a pmr_file which will be mmap'ed into qemu address
> space and subsequently in PCI BAR 2. Guest OS can perform mmio read and writes
> to the PMR region that will stay persistent accross system reboot.
> 
> Signed-off-by: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>

Hi,

v2 addresses feedback received in v1 and so far I haven't seen any other comments.
Is there anything else needed for inclusion of this patch in tree?

Thank you,
Andrzej

