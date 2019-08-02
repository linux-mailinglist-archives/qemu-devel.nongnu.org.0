Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCF77E74A
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Aug 2019 02:52:01 +0200 (CEST)
Received: from localhost ([::1]:59976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htLnc-00071Z-Dy
	for lists+qemu-devel@lfdr.de; Thu, 01 Aug 2019 20:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60101)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1htLml-0006VD-SU
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 20:51:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1htLmk-0006Gw-3G
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 20:51:07 -0400
Received: from mga09.intel.com ([134.134.136.24]:15236)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1htLmj-0006CK-L8
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 20:51:05 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Aug 2019 17:51:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,336,1559545200"; d="scan'208";a="184424226"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga002.jf.intel.com with ESMTP; 01 Aug 2019 17:51:02 -0700
Date: Fri, 2 Aug 2019 08:50:40 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Ivan Ren <renyime@gmail.com>
Message-ID: <20190802005040.GB20638@richard>
References: <1563115879-2715-1-git-send-email-ivanren@tencent.com>
 <20190801025535.GB21992@richard>
 <CA+6E1=nmUtP9B4veF-wwSObuu_vM8byB=ub9E77h3Y5xwca6Hw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+6E1=nmUtP9B4veF-wwSObuu_vM8byB=ub9E77h3Y5xwca6Hw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.24
Subject: Re: [Qemu-devel] [PATCH] migration: always initial RAMBlock.bmap to
 1 for new migration
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
Cc: quintela@redhat.com, Wei Yang <richardw.yang@linux.intel.com>,
 dgilbert@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 01, 2019 at 03:58:54PM +0800, Ivan Ren wrote:
>>>-             * Here we didn't set RAMBlock.bmap simply because it is
>already
>>>-             * set in ram_list.dirty_memory[DIRTY_MEMORY_MIGRATION] in
>>>-             * ram_block_add, and that's where we'll sync the dirty
>bitmaps.
>>>-             * Here setting RAMBlock.bmap would be fine too but not
>necessary.
>>>+             * Here we set RAMBlock.bmap all to 1 because when rebegin a
>>>+             * new migration after a failed migration, ram_list.
>>
>>It is after failure or cancel?
>
>Here we can treat cancel as a special fail.
>

Well, I am not sure this is officially documented. Would this lead to
confusion?

>Thanks.
>

-- 
Wei Yang
Help you, Help me

