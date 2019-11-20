Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 865B31030CC
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 01:36:23 +0100 (CET)
Received: from localhost ([::1]:52636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXDyo-0002Zp-7e
	for lists+qemu-devel@lfdr.de; Tue, 19 Nov 2019 19:36:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39326)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iXDxj-00023d-So
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 19:35:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iXDxi-0004ZY-Qy
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 19:35:15 -0500
Received: from mga12.intel.com ([192.55.52.136]:2632)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iXDxi-0004UT-J2
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 19:35:14 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Nov 2019 16:35:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,219,1571727600"; d="scan'208";a="200540395"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga008.jf.intel.com with ESMTP; 19 Nov 2019 16:35:10 -0800
Date: Wed, 20 Nov 2019 08:35:00 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH 2/2] migration/multifd: not use multifd during postcopy
Message-ID: <20191120003500.GA11061@richard>
References: <20191025232000.25857-1-richardw.yang@linux.intel.com>
 <20191025232000.25857-3-richardw.yang@linux.intel.com>
 <87d0dogmo7.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87d0dogmo7.fsf@trasno.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.136
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

On Tue, Nov 19, 2019 at 11:55:52AM +0100, Juan Quintela wrote:
>Wei Yang <richardw.yang@linux.intel.com> wrote:
>> We don't support multifd during postcopy, but user still could enable
>> both multifd and postcopy. This leads to migration failure.
>>
>> Skip multifd during postcopy.
>>
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>
>Reviewed-by: Juan Quintela <quintela@redhat.com>
>
>I was working in a different implementation, but I agree with the idea.
>
>My patch series try to decide during negotiation if multifd + everything
>else is setup or not.
>

Look forward your approach :-)

>Thanks, Juan.

-- 
Wei Yang
Help you, Help me

