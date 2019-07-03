Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 735A05DC9A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 04:43:47 +0200 (CEST)
Received: from localhost ([::1]:58852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiVFK-00021E-NC
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 22:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58584)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hiVEP-0001cS-8V
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 22:42:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hiVEO-0003WW-Cm
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 22:42:49 -0400
Received: from mga05.intel.com ([192.55.52.43]:64616)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hiVEO-0003Tj-4H
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 22:42:48 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jul 2019 19:42:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,445,1557212400"; d="scan'208";a="247480765"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga001.jf.intel.com with ESMTP; 02 Jul 2019 19:42:40 -0700
Date: Wed, 3 Jul 2019 10:42:19 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Pankaj Gupta <pagupta@redhat.com>
Message-ID: <20190703024219.GA4444@richard>
References: <20190619094907.10131-1-pagupta@redhat.com>
 <20190702084934.GA25987@richard>
 <1872807933.38582516.1562062064161.JavaMail.zimbra@redhat.com>
 <20190703005836.GA18621@richard>
 <1866293380.38744564.1562117503276.JavaMail.zimbra@redhat.com>
 <20190703015718.GA3752@richard>
 <1195441475.38747365.1562121061024.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1195441475.38747365.1562121061024.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.43
Subject: Re: [Qemu-devel] [PATCH v2 0/7] Qemu virtio pmem device
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
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Cc: kwolf@redhat.com, aarcange@redhat.com,
 xiaoguangrong eric <xiaoguangrong.eric@gmail.com>, mst@redhat.com,
 cohuck@redhat.com, david@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com, armbru@redhat.com,
 Wei Yang <richardw.yang@linux.intel.com>, stefanha@redhat.com,
 pbonzini@redhat.com, lcapitulino@redhat.com, imammedo@redhat.com,
 riel@surriel.com, nilal@redhat.com, dan j williams <dan.j.williams@intel.com>,
 dgilbert@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 02, 2019 at 10:31:01PM -0400, Pankaj Gupta wrote:
>
>
>> 
>> Ok, if it works, we could list those regions? and change pmem0 mode to dax
>> mode, right?
>
>You mean fs dax?
>I don't think currently we support this because raw image wont have any metadata. 
>Will have to think if this is at all possible or how we can achieve such behavior.
>

Ok, I got it.

>Also, there is requirement to support host backing file on real NVDIMM and
>virtio. Once we have have first version of virtio pmem series merged upstream
>we will continue to work on advance features depending upon feasibility.
>

One curiosity, what difference make NVDIMM backend doesn't work now?

The /dev/dax0.0 is a char file. The nvdimm device use mmap to map HVA to HPA.
It looks a normal file to me. Would appreciated it if you would share some
light on it.

>Thanks,
>Pankaj 
>
>

-- 
Wei Yang
Help you, Help me

