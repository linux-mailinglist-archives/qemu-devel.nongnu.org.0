Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BDC4AA9B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 21:05:41 +0200 (CEST)
Received: from localhost ([::1]:32956 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdJQJ-0003DI-P7
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 15:05:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36002)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hdJO3-0002Wv-PZ
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 15:03:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hdJNy-0005c7-6v
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 15:03:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49394)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1hdJNx-0005ZG-3o
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 15:03:14 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 11047C18B2DE;
 Tue, 18 Jun 2019 19:03:07 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-30.ams2.redhat.com
 [10.36.116.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 173EB98B5;
 Tue, 18 Jun 2019 19:03:04 +0000 (UTC)
Date: Tue, 18 Jun 2019 21:03:03 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Message-ID: <20190618190303.GF4296@localhost.localdomain>
References: <87d0jb9cex.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87d0jb9cex.fsf@trasno.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Tue, 18 Jun 2019 19:03:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] KVM call minutes for 2019-06-18
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
Cc: qemu-devel@nongnu.org, kvm-devel <kvm@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.06.2019 um 16:49 hat Juan Quintela geschrieben:
> * Kevin is experimenthing with an external qemu-storage daemon
> * qemu-storage daemon vs process for each image
>   * compromise: less isolation but easier to do
> * i.e. just doing the full subsystem instead of each device

This is something that users can do then, but it's not a must.

The storage daemon is just a building block, and it's completely up to
the user whether they start a single daemon with many --blockdev options
and exports, or whether they start many daemons that serve only a single
image each.

Kevin

