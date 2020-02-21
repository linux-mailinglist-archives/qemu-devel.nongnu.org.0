Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C8A168839
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 21:20:55 +0100 (CET)
Received: from localhost ([::1]:35886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5En6-0008Nu-4d
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 15:20:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50817)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrzej.jakowski@linux.intel.com>)
 id 1j5EmI-0007ok-Uw
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 15:20:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrzej.jakowski@linux.intel.com>)
 id 1j5EmH-00067M-UN
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 15:20:02 -0500
Received: from mga07.intel.com ([134.134.136.100]:24371)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrzej.jakowski@linux.intel.com>)
 id 1j5EmH-00065m-MV; Fri, 21 Feb 2020 15:20:01 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2020 12:19:59 -0800
X-IronPort-AV: E=Sophos;i="5.70,469,1574150400"; d="scan'208";a="229957003"
Received: from ajakowsk-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.78.27.169])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 21 Feb 2020 12:19:59 -0800
Subject: Re: [PATCH v1] block/nvme: introduce PMR support from NVMe 1.4 spec
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>
References: <20200218224811.30050-1-andrzej.jakowski@linux.intel.com>
 <20200221134555.GK1484511@stefanha-x1.localdomain>
 <20200221184501.GL2931@work-vm>
From: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
Message-ID: <c0eb5d70-b67d-ead8-62ca-eebb6d8c2e4d@linux.intel.com>
Date: Fri, 21 Feb 2020 13:19:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200221184501.GL2931@work-vm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.100
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
Cc: kwolf@redhat.com, Haozhong Zhang <haozhong.zhang@intel.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 keith.busch@intel.com, Zhang Yi <yi.z.zhang@linux.intel.com>,
 Junyan He <junyan.he@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/20 11:45 AM, Dr. David Alan Gilbert wrote:
> Isn't there also a requirement that BARs are powers of two? Wouldn't
> you need to ensure the PMR file is a power of 2 in size?
> 
> Dave

Agree, need to make sure it is power of 2.

