Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C78B626A7
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jul 2019 18:52:57 +0200 (CEST)
Received: from localhost ([::1]:43374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkWsq-000633-9k
	for lists+qemu-devel@lfdr.de; Mon, 08 Jul 2019 12:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54021)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hkWrN-0005SW-DM
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 12:51:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hkWrM-0000xR-IE
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 12:51:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46658)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hkWrK-0000vv-JA; Mon, 08 Jul 2019 12:51:22 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C5BFD30ADC8E;
 Mon,  8 Jul 2019 16:51:16 +0000 (UTC)
Received: from linux.fritz.box (ovpn-116-204.ams2.redhat.com [10.36.116.204])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A5ECE2B9D1;
 Mon,  8 Jul 2019 16:51:13 +0000 (UTC)
Date: Mon, 8 Jul 2019 18:51:12 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20190708165112.GA14296@linux.fritz.box>
References: <20190705152812.26438-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190705152812.26438-1-eblake@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Mon, 08 Jul 2019 16:51:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH for-4.1] qcow2: Allow -o compat=v3 during
 qemu-img amend
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
Cc: qemu-devel@nongnu.org, "open list:qcow2" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 05.07.2019 um 17:28 hat Eric Blake geschrieben:
> Commit b76b4f60 allowed '-o compat=v3' as an alias for the
> less-appealing '-o compat=1.1' for 'qemu-img create' since we want to
> use the QMP form as much as possible, but forgot to do likewise for
> qemu-img amend.  Also, it doesn't help that '-o help' doesn't list our
> new preferred spellings.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>

This broke qemu-iotests 082. Please send a follow-up to update the
reference output.

Kevin

