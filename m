Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8D9B15FE
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 23:46:39 +0200 (CEST)
Received: from localhost ([::1]:38998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8WvG-0005wp-4Z
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 17:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34027)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1i8Wt9-00050U-TG
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 17:44:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1i8Wt8-0005mf-Hf
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 17:44:27 -0400
Received: from mga06.intel.com ([134.134.136.31]:27577)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1i8Wt8-0005mE-8g
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 17:44:26 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Sep 2019 14:44:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="179489626"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga008.jf.intel.com with ESMTP; 12 Sep 2019 14:44:23 -0700
Date: Fri, 13 Sep 2019 05:44:03 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Message-ID: <20190912214403.GB18279@richard>
References: <20190801004053.7021-1-richardw.yang@linux.intel.com>
 <20190912121600.GG23174@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190912121600.GG23174@stefanha-x1.localdomain>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.31
Subject: Re: [Qemu-devel] [PATCH v2] docs/nvdimm: add example on persistent
 backend setup
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
Cc: pagupta@redhat.com, xiaoguangrong.eric@gmail.com, mst@redhat.com,
 qemu-devel@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 12, 2019 at 02:16:00PM +0200, Stefan Hajnoczi wrote:
>On Thu, Aug 01, 2019 at 08:40:53AM +0800, Wei Yang wrote:
>> Persistent backend setup requires some knowledge about nvdimm and ndctl
>> tool. Some users report they may struggle to gather these knowledge and
>> have difficulty to setup it properly.
>> 
>> Here we provide two examples for persistent backend and gives the link
>> to ndctl. By doing so, user could try it directly and do more
>> investigation on persistent backend setup with ndctl.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> Reviewed-by: Pankaj Gupta <pagupta@redhat.com>
>> 
>> ---
>> v2: rephrase the doc based on Stefan Hajnoczi's suggestion
>> ---
>>  docs/nvdimm.txt | 31 +++++++++++++++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>
>Sorry, I was expecting someone else to pick this patch up.  But since
>there have been no takers...
>
>Thanks, applied to my block-next tree:
>https://github.com/stefanha/qemu/commits/block-next
>

Thanks :-)

>Stefan



-- 
Wei Yang
Help you, Help me

