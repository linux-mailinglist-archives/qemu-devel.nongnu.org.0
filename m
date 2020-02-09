Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A18B15702E
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Feb 2020 09:04:06 +0100 (CET)
Received: from localhost ([::1]:58076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1433-0000Wu-8P
	for lists+qemu-devel@lfdr.de; Mon, 10 Feb 2020 03:04:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35723)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1j141w-0008D7-0W
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 03:02:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1j141v-0001my-09
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 03:02:55 -0500
Received: from [192.146.154.1] (port=47900 helo=mcp01.nutanix.com)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1j141u-0001mP-Pk
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 03:02:54 -0500
Received: from localhost.localdomain (unknown [10.40.36.165])
 by mcp01.nutanix.com (Postfix) with ESMTP id 30D701005D9D;
 Mon, 10 Feb 2020 08:02:54 +0000 (UTC)
Date: Sun, 9 Feb 2020 12:17:44 -0500
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 1/3] Fixed assert in vhost_user_set_mem_table_postcopy
Message-ID: <20200209171744.GA14921@localhost.localdomain>
References: <1579143426-18305-1-git-send-email-raphael.norwitz@nutanix.com>
 <1579143426-18305-2-git-send-email-raphael.norwitz@nutanix.com>
 <20200206031645-mutt-send-email-mst@kernel.org>
 <20200206031922-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200206031922-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 192.146.154.1
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yes - it's just a cleanup.

On Thu, Feb 06, 2020 at 03:20:01AM -0500, Michael S. Tsirkin wrote:
> 
> On Thu, Feb 06, 2020 at 03:17:04AM -0500, Michael S. Tsirkin wrote:
> > On Wed, Jan 15, 2020 at 09:57:04PM -0500, Raphael Norwitz wrote:
> > > The current vhost_user_set_mem_table_postcopy() implementation
> > > populates each region of the VHOST_USER_SET_MEM_TABLE message without
> > > first checking if there are more than VHOST_MEMORY_MAX_NREGIONS already
> > > populated. This can cause memory corruption if too many regions are
> > > added to the message during the postcopy step.
> > > 
> > > This change moves an existing assert up such that attempting to
> > > construct a VHOST_USER_SET_MEM_TABLE message with too many memory
> > > regions will gracefully bring down qemu instead of corrupting memory.
> > > 
> > > Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> > > Signed-off-by: Peter Turschmid <peter.turschm@nutanix.com>
> > 
> > 
> > Could you pls add Fixes: and stable tags?
> 
> oh wait no, this is just a theoretical thing, right?
> it doesn't actually trigger, it's just a cleanup.
> 
> no fixes/stable needed then, sorry
> 

