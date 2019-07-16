Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8D46ACD1
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 18:32:27 +0200 (CEST)
Received: from localhost ([::1]:51101 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnQNO-0002Hh-91
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 12:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53297)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mlevitsk@redhat.com>) id 1hnQMV-0007r0-5Y
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 12:31:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1hnQMU-0002Xk-3M
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 12:31:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60000)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1hnQMR-0002U6-0u; Tue, 16 Jul 2019 12:31:27 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5E6D93082199;
 Tue, 16 Jul 2019 16:31:26 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 14A5019C68;
 Tue, 16 Jul 2019 16:31:19 +0000 (UTC)
Message-ID: <4e6497a9eeaecd2c20201dbb23bd3dfef7b53557.camel@redhat.com>
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Jul 2019 19:31:19 +0300
In-Reply-To: <20190716162923.13142-1-mlevitsk@redhat.com>
References: <20190716162923.13142-1-mlevitsk@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 16 Jul 2019 16:31:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [H v5 0/3] Few bugfixes for userspace nvme driver
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2019-07-16 at 19:29 +0300, Maxim Levitsky wrote:
> This is reduced version of patch series for userspace nvme driver,
> that only includes the bugfixes I made.
> 
> Best regards,
> 	Maxim Levitsky
> 
> Maxim Levitsky (3):
>   block/nvme: fix doorbell stride
>   block/nvme: support larger that 512 bytes sector devices
>   block/nvme: don't touch the completion entries
> 
>  block/nvme.c | 52 ++++++++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 42 insertions(+), 10 deletions(-)
> 
Ignore that, I messed up the patch prefix here.
Best regards,
	Maxim Levitsky


