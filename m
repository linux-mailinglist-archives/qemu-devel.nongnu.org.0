Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D586991B5D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 05:08:15 +0200 (CEST)
Received: from localhost ([::1]:44232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzY1m-0003JL-GA
	for lists+qemu-devel@lfdr.de; Sun, 18 Aug 2019 23:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47397)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hzY0x-0002sn-Gi
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 23:07:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hzY0v-0003rV-JB
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 23:07:23 -0400
Received: from mga07.intel.com ([134.134.136.100]:52628)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hzY0v-0003qO-Br
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 23:07:21 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Aug 2019 20:07:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,403,1559545200"; d="scan'208";a="182747806"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga006.jf.intel.com with ESMTP; 18 Aug 2019 20:07:17 -0700
Date: Mon, 19 Aug 2019 11:06:54 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190819030654.GA18468@richard>
References: <20190321082555.21118-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190321082555.21118-1-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.100
Subject: Re: [Qemu-devel] [PATCH 0/6] Refine exec
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
Cc: pbonzini@redhat.com, mst@redhat.com, qemu-devel@nongnu.org, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 21, 2019 at 04:25:49PM +0800, Wei Yang wrote:
>This serial refine exec a little.
>

Ping again.

>Wei Yang (6):
>  exec.c: replace hwaddr with uint64_t for better understanding
>  exec.c: remove an unnecessary assert on PHYS_MAP_NODE_NIL in
>    phys_map_node_alloc()
>  exec.c: get nodes_nb_alloc with one MAX calculation
>  exec.c: subpage->sub_section is already initialized to 0
>  exec.c: correct the maximum skip value during compact
>  exec.c: add a check between constants to see whether we could skip
>
> exec.c | 21 ++++++++++-----------
> 1 file changed, 10 insertions(+), 11 deletions(-)
>
>-- 
>2.19.1

-- 
Wei Yang
Help you, Help me

