Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A2D66AB2
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 12:07:07 +0200 (CEST)
Received: from localhost ([::1]:47900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlsSI-0006F7-RJ
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 06:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53552)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pagupta@redhat.com>) id 1hlsS6-0005pJ-CT
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 06:06:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pagupta@redhat.com>) id 1hlsS4-0005f8-Rv
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 06:06:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54416)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pagupta@redhat.com>) id 1hlsS4-0005eV-Li
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 06:06:52 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E2711308338F;
 Fri, 12 Jul 2019 10:06:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C13F15F9D9;
 Fri, 12 Jul 2019 10:06:51 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
 (zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9DFC718184A5;
 Fri, 12 Jul 2019 10:06:51 +0000 (UTC)
Date: Fri, 12 Jul 2019 06:06:51 -0400 (EDT)
From: Pankaj Gupta <pagupta@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Message-ID: <53616588.41212980.1562926011609.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190712120301.7e6b6098.cohuck@redhat.com>
References: <20190712073554.21918-1-pagupta@redhat.com>
 <20190712073554.21918-4-pagupta@redhat.com>
 <20190712120301.7e6b6098.cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.117.66, 10.4.195.1]
Thread-Topic: virtio pmem: remove transational device info
Thread-Index: FnsqUKNa14/kt8E4cdZp7iuJ+K1BbA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Fri, 12 Jul 2019 10:06:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 3/3] virtio pmem: remove transational
 device info
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
Cc: peter maydell <peter.maydell@linaro.org>, david@redhat.com,
 qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> 
> On Fri, 12 Jul 2019 13:05:54 +0530
> Pankaj Gupta <pagupta@redhat.com> wrote:
> 
> > Remove transactional & non transactional device info
> > for virtio pmem.
> 
> s/device info/names/ ?

yes.

> 
> > 
> > Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
> > ---
> >  hw/virtio/virtio-pmem-pci.c | 2 --
> >  1 file changed, 2 deletions(-)
> 
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> 

