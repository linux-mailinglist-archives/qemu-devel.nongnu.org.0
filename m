Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D67E3B3323
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Sep 2019 04:04:14 +0200 (CEST)
Received: from localhost ([::1]:58280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9gNB-0004DB-N5
	for lists+qemu-devel@lfdr.de; Sun, 15 Sep 2019 22:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47960)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1i9gLt-0003kg-8F
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 22:02:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1i9gLs-0002YM-2z
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 22:02:52 -0400
Received: from mga11.intel.com ([192.55.52.93]:23742)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1i9gLr-0002Xz-RS
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 22:02:52 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Sep 2019 19:02:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,489,1559545200"; d="scan'208";a="387052032"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga006.fm.intel.com with ESMTP; 15 Sep 2019 19:02:48 -0700
Date: Mon, 16 Sep 2019 10:02:28 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190916020228.GA8247@richard>
References: <20190321082555.21118-1-richardw.yang@linux.intel.com>
 <20190321082555.21118-3-richardw.yang@linux.intel.com>
 <d5fb9e01-acb9-06ab-edf9-57e2b80bd880@redhat.com>
 <20190823010750.GA21179@richard> <20190912025150.GA25169@richard>
 <c9f18d8e-b7cc-b9d1-1e10-ddbbb4cfd43a@redhat.com>
 <20190912230244.6puc4hwfxxwejx6m@master>
 <20793db8-7cfc-2a9d-aa60-5020e84a5950@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20793db8-7cfc-2a9d-aa60-5020e84a5950@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.93
Subject: Re: [Qemu-devel] [PATCH 2/6] exec.c: remove an unnecessary assert
 on PHYS_MAP_NODE_NIL in phys_map_node_alloc()
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
Cc: qemu-devel@nongnu.org, rth@twiddle.net, mst@redhat.com,
 Wei Yang <richardw.yang@linux.intel.com>, Wei Yang <richard.weiyang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 13, 2019 at 11:12:05AM +0200, Paolo Bonzini wrote:
>On 13/09/19 01:02, Wei Yang wrote:
>> It shows PHYS_MAP_NODE_NIL may represents more node the tree could hold.
>
>Which is good, it means the assert can trigger.
>

Per my understanding, it means the assert can't trigger.

>> The assert here is not harmful, while maybe we can have a better way to handle
>> it?
>
>I don't know... The assert just says "careful, someone treats
>PHYS_MAP_NODE_NIL specially!".  It's documentation too.
>
>Paolo

-- 
Wei Yang
Help you, Help me

