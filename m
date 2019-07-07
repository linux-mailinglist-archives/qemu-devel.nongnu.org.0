Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B9D61594
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Jul 2019 18:42:19 +0200 (CEST)
Received: from localhost ([::1]:36250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkAEz-0006Ms-PV
	for lists+qemu-devel@lfdr.de; Sun, 07 Jul 2019 12:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42217)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tytso@mit.edu>) id 1hkAEP-0005uo-AA
 for qemu-devel@nongnu.org; Sun, 07 Jul 2019 12:41:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tytso@mit.edu>) id 1hkAEO-0004bo-Af
 for qemu-devel@nongnu.org; Sun, 07 Jul 2019 12:41:41 -0400
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:44001
 helo=outgoing.mit.edu)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tytso@mit.edu>) id 1hkAEN-0004b2-PD
 for qemu-devel@nongnu.org; Sun, 07 Jul 2019 12:41:40 -0400
Received: from callcc.thunk.org (75-104-86-74.mobility.exede.net
 [75.104.86.74] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x67GYGms007613
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 7 Jul 2019 12:34:23 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 26D6A42002E; Sun,  7 Jul 2019 12:34:15 -0400 (EDT)
Date: Sun, 7 Jul 2019 12:34:15 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Pankaj Gupta <pagupta@redhat.com>
Message-ID: <20190707163415.GA19775@mit.edu>
Mail-Followup-To: Theodore Ts'o <tytso@mit.edu>,
 Pankaj Gupta <pagupta@redhat.com>, dm-devel@redhat.com,
 linux-nvdimm@lists.01.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-acpi@vger.kernel.org,
 qemu-devel@nongnu.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, dan.j.williams@intel.com,
 zwisler@kernel.org, vishal.l.verma@intel.com, dave.jiang@intel.com,
 mst@redhat.com, jasowang@redhat.com, willy@infradead.org,
 rjw@rjwysocki.net, hch@infradead.org, lenb@kernel.org, jack@suse.cz,
 adilger.kernel@dilger.ca, darrick.wong@oracle.com,
 lcapitulino@redhat.com, kwolf@redhat.com, imammedo@redhat.com,
 jmoyer@redhat.com, nilal@redhat.com, riel@surriel.com,
 stefanha@redhat.com, aarcange@redhat.com, david@redhat.com,
 david@fromorbit.com, cohuck@redhat.com,
 xiaoguangrong.eric@gmail.com, pbonzini@redhat.com,
 yuval.shaia@oracle.com, kilobyte@angband.pl, jstaron@google.com,
 rdunlap@infradead.org, snitzer@redhat.com
References: <20190705140328.20190-1-pagupta@redhat.com>
 <20190705140328.20190-7-pagupta@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190705140328.20190-7-pagupta@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Windows 7 (Websense crawler)
X-Received-From: 18.9.28.11
Subject: Re: [Qemu-devel] [PATCH v15 6/7] ext4: disable map_sync for async
 flush
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
Cc: cohuck@redhat.com, jack@suse.cz, kvm@vger.kernel.org, mst@redhat.com,
 jasowang@redhat.com, david@fromorbit.com, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org, dm-devel@redhat.com,
 adilger.kernel@dilger.ca, zwisler@kernel.org, aarcange@redhat.com,
 dave.jiang@intel.com, jstaron@google.com, linux-nvdimm@lists.01.org,
 vishal.l.verma@intel.com, david@redhat.com, willy@infradead.org,
 hch@infradead.org, linux-acpi@vger.kernel.org, jmoyer@redhat.com,
 linux-ext4@vger.kernel.org, lenb@kernel.org, kilobyte@angband.pl,
 rdunlap@infradead.org, riel@surriel.com, yuval.shaia@oracle.com,
 stefanha@redhat.com, pbonzini@redhat.com, dan.j.williams@intel.com,
 lcapitulino@redhat.com, kwolf@redhat.com, nilal@redhat.com,
 xiaoguangrong.eric@gmail.com, snitzer@redhat.com, darrick.wong@oracle.com,
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 05, 2019 at 07:33:27PM +0530, Pankaj Gupta wrote:
> Dont support 'MAP_SYNC' with non-DAX files and DAX files
> with asynchronous dax_device. Virtio pmem provides
> asynchronous host page cache flush mechanism. We don't
> support 'MAP_SYNC' with virtio pmem and ext4.
> 
> Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
> Reviewed-by: Jan Kara <jack@suse.cz>

Acked-by: Theodore Ts'o <tytso@mit.edu>


