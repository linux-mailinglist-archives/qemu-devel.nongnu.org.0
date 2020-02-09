Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE63157039
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Feb 2020 09:07:53 +0100 (CET)
Received: from localhost ([::1]:58100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j146i-0002DN-4T
	for lists+qemu-devel@lfdr.de; Mon, 10 Feb 2020 03:07:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36040)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1j145c-0001oT-2j
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 03:06:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1j145a-0004XW-MG
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 03:06:43 -0500
Received: from [192.146.154.1] (port=43911 helo=mcp01.nutanix.com)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1j145a-0004X9-HU
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 03:06:42 -0500
Received: from localhost.localdomain (unknown [10.40.36.165])
 by mcp01.nutanix.com (Postfix) with ESMTP id B1EC01007A33;
 Mon, 10 Feb 2020 08:06:41 +0000 (UTC)
Date: Sun, 9 Feb 2020 12:21:51 -0500
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 2/3] Refactor vhost_user_set_mem_table functions
Message-ID: <20200209172151.GA14982@localhost.localdomain>
References: <1579143426-18305-1-git-send-email-raphael.norwitz@nutanix.com>
 <1579143426-18305-3-git-send-email-raphael.norwitz@nutanix.com>
 <20200206032007-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200206032007-mutt-send-email-mst@kernel.org>
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

Sounds good

On Thu, Feb 06, 2020 at 03:21:42AM -0500, Michael S. Tsirkin wrote:
> 
> On Wed, Jan 15, 2020 at 09:57:05PM -0500, Raphael Norwitz wrote:
> > vhost_user_set_mem_table() and vhost_user_set_mem_table_postcopy() have
> > gotten convoluted, and have some identical code.
> > 
> > This change moves the logic populating the VhostUserMemory struct and
> > fds array from vhost_user_set_mem_table() and
> > vhost_user_set_mem_table_postcopy() to a new function,
> > vhost_user_fill_set_mem_table_msg().
> > 
> > No functionality is impacted.
> > 
> > Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> > Signed-off-by: Peter Turschmid <peter.turschm@nutanix.com>
> 
> 
> Looks ok, but just cosmetics: let's have the flag say what
> it does, not who uses it.
> 
> So s/postcopy/track_ramblocks/ ?
> 


