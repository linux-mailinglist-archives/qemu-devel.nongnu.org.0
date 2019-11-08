Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0274CF3CFE
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 01:42:35 +0100 (CET)
Received: from localhost ([::1]:48968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSsMD-0007oA-Dj
	for lists+qemu-devel@lfdr.de; Thu, 07 Nov 2019 19:42:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50230)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iSsKg-0007Mt-4d
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 19:40:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iSsKe-00059i-3n
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 19:40:57 -0500
Received: from mga03.intel.com ([134.134.136.65]:1952)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iSsKb-00057M-SY
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 19:40:54 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Nov 2019 16:40:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,279,1569308400"; d="scan'208";a="286154384"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga001.jf.intel.com with ESMTP; 07 Nov 2019 16:40:48 -0800
Date: Fri, 8 Nov 2019 08:40:36 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [Patch v2 5/6] migration/postcopy: enable random order target
 page arrival
Message-ID: <20191108004036.GA921@richard>
References: <20191107123907.29791-1-richardw.yang@linux.intel.com>
 <20191107123907.29791-6-richardw.yang@linux.intel.com>
 <20191107143025.GK2816@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191107143025.GK2816@work-vm>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.65
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
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 07, 2019 at 02:30:25PM +0000, Dr. David Alan Gilbert wrote:
>* Wei Yang (richardw.yang@linux.intel.com) wrote:
>> After using number of target page received to track one host page, we
>> could have the capability to handle random order target page arrival in
>> one host page.
>> 
>> This is a preparation for enabling compress during postcopy.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>
>Yep, that's better
>
>Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>

Thanks for your suggestion :-)

-- 
Wei Yang
Help you, Help me

