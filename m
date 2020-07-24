Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC38322C27D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jul 2020 11:42:27 +0200 (CEST)
Received: from localhost ([::1]:38060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyuDj-00068M-0H
	for lists+qemu-devel@lfdr.de; Fri, 24 Jul 2020 05:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jyuCq-0005hc-Ca
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 05:41:32 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:36151
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jyuCo-0000el-CB
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 05:41:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595583688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GrqphZLvqWgfZRdNTSnHOKX81Z6vK3R5KHL3SGLV2fI=;
 b=YlPbBWtlm9fzW14o2mijKwdzuYOx1SJE5L5iP4MplOsD4zOTMo+rGA59Y8H9TKfmba1VY+
 OlW18y2l5sSnoruodFemb43RLHRcNndsMm3vrhB06uVgtr6QmLXswQN7CBT3WoMt34OXF+
 cbMRZ/iTgCRHB8eunuML7PaS0KTZVd4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-QdVRS6GdPOen_H7nLtQ5LA-1; Fri, 24 Jul 2020 05:41:26 -0400
X-MC-Unique: QdVRS6GdPOen_H7nLtQ5LA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8176F8017FB;
 Fri, 24 Jul 2020 09:41:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-89.ams2.redhat.com
 [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC5C887B0A;
 Fri, 24 Jul 2020 09:41:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A1C1317444; Fri, 24 Jul 2020 11:41:20 +0200 (CEST)
Date: Fri, 24 Jul 2020 11:41:20 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Aaron Lauterer <a.lauterer@proxmox.com>
Subject: Re: Possible regression with VGA and resolutions in Windows 10?
Message-ID: <20200724094120.dptmucij4phzd3od@sirius.home.kraxel.org>
References: <24909a16-be74-7516-b5c5-08bdc743a553@proxmox.com>
MIME-Version: 1.0
In-Reply-To: <24909a16-be74-7516-b5c5-08bdc743a553@proxmox.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/24 00:00:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 23, 2020 at 04:24:06PM +0200, Aaron Lauterer wrote:
> Hi all,
> 
> I think we have a regression introduced in commit 0221d73ce6.
> 
> Once I start a Windows 10 VM (build 18363) with `-device VGA` I have only the following resolutions to choose from instead of the much longer list:
> 
> 1920x1080
> 1024x768
> 800x600

That is probably vgabios gaining edid support.

The list should be longer though, the qemu edid block has more
resolutions included.  The qemu-edid tool is a command line
interface to the edid generator, for testing purposes.

Try "qemu-edid | edid-decode" to see the decoded edid data.

Linux guests have the raw edid block in sysfs, see
/sys/class/drm/card0/card0-Virtual-1/edid.

>   -device 'VGA,id=vga,vgamem_mb=32,bus=pci.0,addr=0x2' \

Try adding "xres=<width>,yres=<height>" of you want a specific
display resolution.

Try adding "edid=off" to return to previous behavior.

HTH & take care,
  Gerd


