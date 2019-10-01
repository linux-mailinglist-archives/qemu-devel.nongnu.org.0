Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BE4C2B40
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 02:21:26 +0200 (CEST)
Received: from localhost ([::1]:58190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iF5uv-0005us-KR
	for lists+qemu-devel@lfdr.de; Mon, 30 Sep 2019 20:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43521)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1iF5tJ-0005O7-DJ
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 20:19:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1iF5tI-0002dH-02
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 20:19:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54408)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>) id 1iF5tH-0002d1-Pw
 for qemu-devel@nongnu.org; Mon, 30 Sep 2019 20:19:43 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id ADD1C83F42
 for <qemu-devel@nongnu.org>; Tue,  1 Oct 2019 00:19:42 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4AD06012A;
 Tue,  1 Oct 2019 00:19:41 +0000 (UTC)
Message-ID: <61a62a82212ac52ab80ef7732892d6cc5a1214af.camel@redhat.com>
Subject: Re: Minor regression with ramfb+gvt-g+edk2 with qemu 4.1
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 01 Oct 2019 03:19:40 +0300
In-Reply-To: <a7333a681f4e163ee72167e3739e5176f1d5ae7c.camel@redhat.com>
References: <a7333a681f4e163ee72167e3739e5176f1d5ae7c.camel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Tue, 01 Oct 2019 00:19:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Gerd Hoffmann <ghoffman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2019-09-26 at 13:51 +0300, Maxim Levitsky wrote:
> Hi!
> 
> I noticed that with qemu 4.1, when I try to open the
> UEFI bios screen, the screen output is garbaged.
> 
> Basicaly what happens is this:
> 
> ramfb driver inside the uefi bios is hardcoded to initialize
> the resolution to 800x600
> 
> Then when you enter the BIOS screen, it switches the resolution
> to the 'preferred resolution' which by default is 640x480
> 
> However since commit a9e0cb67b7f4c485755659f9b764c38b5f970de4,
> ramfb resolution is locked once it is set once, thus,
> the switch to 640x480 is ignored.
> 
> Best regards,
> 	Maxim Levitsky
Ping!

Best regards,	
	Maxim Levitsky


