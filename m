Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CC019724F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Mar 2020 04:10:47 +0200 (CEST)
Received: from localhost ([::1]:43434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIjt0-0005dD-0J
	for lists+qemu-devel@lfdr.de; Sun, 29 Mar 2020 22:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51916)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1jIjs9-00058M-9V
 for qemu-devel@nongnu.org; Sun, 29 Mar 2020 22:09:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1jIjs7-0004LZ-Ac
 for qemu-devel@nongnu.org; Sun, 29 Mar 2020 22:09:52 -0400
Received: from [192.146.154.243] (port=21189 helo=mcp01.nutanix.com)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1jIjs7-0004L1-5p
 for qemu-devel@nongnu.org; Sun, 29 Mar 2020 22:09:51 -0400
Received: from localhost.localdomain (unknown [10.40.36.165])
 by mcp01.nutanix.com (Postfix) with ESMTP id 00904100AD9D;
 Mon, 30 Mar 2020 02:09:48 +0000 (UTC)
Date: Wed, 25 Mar 2020 18:30:08 -0400
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] fix vhost_user_blk_watch crash
Message-ID: <20200325222930.GA14456@localhost.localdomain>
References: <20200323052924.29286-1-fengli@smartx.com>
 <20200329084911-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200329084911-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 192.146.154.243
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Mar 29, 2020 at 09:30:24AM -0400, Michael S. Tsirkin wrote:
> 
> On Mon, Mar 23, 2020 at 01:29:24PM +0800, Li Feng wrote:
> > the G_IO_HUP is watched in tcp_chr_connect, and the callback
> > vhost_user_blk_watch is not needed, because tcp_chr_hup is registered as
> > callback. And it will close the tcp link.
> > 
> > Signed-off-by: Li Feng <fengli@smartx.com>
> 
> Raphael would you like to review this?

Sure - I'll review it now.

> Also, I think at this point
> nutanix is the biggest contributor to vhost user blk.
> So if you want to be added to MAINTAINERS on this
> one so people Cc you on patcches, that'd be great.
> 

Yes, please add me to MAINTAINERS.

 

