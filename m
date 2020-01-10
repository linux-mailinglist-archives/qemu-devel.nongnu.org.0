Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CAA13655A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 03:32:05 +0100 (CET)
Received: from localhost ([::1]:39606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipk5j-0007Hx-SP
	for lists+qemu-devel@lfdr.de; Thu, 09 Jan 2020 21:32:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51363)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1ipk4s-0006qU-4C
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 21:31:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1ipk4r-0006k4-0k
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 21:31:09 -0500
Received: from mga02.intel.com ([134.134.136.20]:50619)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1ipk4q-0006KE-NH
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 21:31:08 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2020 18:31:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,414,1571727600"; d="scan'208";a="304041271"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga001.jf.intel.com with ESMTP; 09 Jan 2020 18:31:02 -0800
Date: Fri, 10 Jan 2020 10:31:01 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH 0/2] not use multifd during postcopy
Message-ID: <20200110023101.GC16823@richard>
References: <20191025232000.25857-1-richardw.yang@linux.intel.com>
 <20191216023539.GB21865@richard> <20200106012640.GA15834@richard>
 <87v9plyn4u.fsf@secure.laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v9plyn4u.fsf@secure.laptop>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.20
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
Cc: qemu-devel@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 09, 2020 at 10:50:25AM +0100, Juan Quintela wrote:
>Wei Yang <richardw.yang@linux.intel.com> wrote:
>> On Mon, Dec 16, 2019 at 10:35:39AM +0800, Wei Yang wrote:
>>>Would this one be picked up this time?
>>
>> Happy new year to all.
>>
>> Can I ask the plan for this patch set?
>
>queued
>

Thanks :-)

-- 
Wei Yang
Help you, Help me

