Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3A014C13D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 20:49:38 +0100 (CET)
Received: from localhost ([::1]:36818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwWrh-0001MV-Cl
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 14:49:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54740)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1iwWZi-0002SX-Mp
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 14:31:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1iwWZh-0006y1-Jz
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 14:31:02 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37799
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>) id 1iwWZh-0006xM-E0
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 14:31:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580239861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q2R7nUuvkGjCuLBvUWzOveozSblD371N8yCoXHuEkeA=;
 b=FD6Z1rS6JLHavGbDDhrNCAQ8ozSJDLMr/TYvqjI0EitvApGm0yQJX1/P1lICruSYfircIo
 NXnQ0zx5/7rKG0t7XRzEc9jf8SC5VGA4SBXACqrUyEqaMxeJIz6D+AK0jdwuGSRrQFASo8
 xgrz+9W6CY/ZgzditRW7KN0DySGTvqo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-ifedSkNlNTKUWYVTLCyPdw-1; Tue, 28 Jan 2020 14:30:59 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A9301005F79;
 Tue, 28 Jan 2020 19:30:58 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 947CB66834;
 Tue, 28 Jan 2020 19:30:53 +0000 (UTC)
Message-ID: <cc410f54aeb01a517b74283a497e7ce861c92dab.camel@redhat.com>
Subject: Re: [PATCH v3 12/13] add 'error' prefix to vreport
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 28 Jan 2020 21:30:52 +0200
In-Reply-To: <20200127103647.17761-13-mlevitsk@redhat.com>
References: <20200127103647.17761-1-mlevitsk@redhat.com>
 <20200127103647.17761-13-mlevitsk@redhat.com>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: ifedSkNlNTKUWYVTLCyPdw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2020-01-27 at 12:36 +0200, Maxim Levitsky wrote:
> This changes most of qemu's error messages,
> but it feels like the right thing to do.
> 
> This is WIP patch, since I updated most of iotests but not all of them,
> and will be updated if this patch is accepeted in the review.
> Also few error message already have 'error' prefix, which should be removed.
> 
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> Suggested-by: Markus Armbruster <armbru@redhat.com>

Since Peter Krempa pointed out that libvirt doesn't need the error prefixes any more
(this wasn't the case when I developed this sadly) I guess I'll drop that patch,
although to me it looks just better to have errors cleanly prefixed to be honest.

Best regards,
	Maxim Levitsky


