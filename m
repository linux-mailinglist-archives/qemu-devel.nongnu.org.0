Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA16C6F247
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Jul 2019 10:37:17 +0200 (CEST)
Received: from localhost ([::1]:55072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hp7LI-00038N-RU
	for lists+qemu-devel@lfdr.de; Sun, 21 Jul 2019 04:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59309)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mlevitsk@redhat.com>) id 1hp7L7-0002fe-9B
 for qemu-devel@nongnu.org; Sun, 21 Jul 2019 04:37:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1hp7L6-0003yX-6s
 for qemu-devel@nongnu.org; Sun, 21 Jul 2019 04:37:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52038)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1hp7L3-0003vk-9b; Sun, 21 Jul 2019 04:37:01 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9E20EC18B2C6;
 Sun, 21 Jul 2019 08:37:00 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B88B19C77;
 Sun, 21 Jul 2019 08:36:56 +0000 (UTC)
Message-ID: <07d47f44f792c7710e699a82ec5abb0d91f7ac30.camel@redhat.com>
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
Date: Sun, 21 Jul 2019 11:36:55 +0300
In-Reply-To: <e410dc4e-0d43-dc89-4935-fba9ce164cdf@redhat.com>
References: <20190716163020.13383-1-mlevitsk@redhat.com>
 <e410dc4e-0d43-dc89-4935-fba9ce164cdf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Sun, 21 Jul 2019 08:37:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v4 0/3] Few bugfixes for userspace nvme
 driver
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
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2019-07-19 at 11:51 +0200, Max Reitz wrote:
> On 16.07.19 18:30, Maxim Levitsky wrote:
> > This is reduced version of patch series for userspace nvme driver,
> > that only includes the bugfixes I made.
> > 
> > Best regards,
> > 	Maxim Levitsky
> > 
> > Maxim Levitsky (3):
> >   block/nvme: fix doorbell stride
> >   block/nvme: support larger that 512 bytes sector devices
> >   block/nvme: don't touch the completion entries
> > 
> >  block/nvme.c | 52 ++++++++++++++++++++++++++++++++++++++++++----------
> >  1 file changed, 42 insertions(+), 10 deletions(-)
> 
> Thanks, applied to my block branch:
> 
> https://git.xanclic.moe/XanClic/qemu/commits/branch/block
> 
> Max
> 
Thank you!!
Best regards,
	Maxim Levitsky


