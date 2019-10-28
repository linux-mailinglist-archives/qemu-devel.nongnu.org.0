Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE6BE6FED
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 11:51:30 +0100 (CET)
Received: from localhost ([::1]:52486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP2cT-0005NX-N4
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 06:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41696)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iP2at-0003Vh-QQ
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 06:49:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iP2as-0001Ym-UZ
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 06:49:51 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:29936
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iP2as-0001VQ-RD
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 06:49:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572259788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JZL3pXAQ//dav5O5vgjLSKgfVrTVuooZ7ZnHzF+P1eo=;
 b=M+uxhgGP7rtAbUjh4C+EB8uopoy+OKpRGU+JnR0YKfxcmWwMVyDANcI83LnGNsCL8mkOPG
 0JenLVuivWjtXf1+eMOtj+n8N02RJrMsmsZwimB/CKTRlyIgP2H7Q3HMoIdOqHoYPfoyBA
 VZAh/scDUg73FSUqPCNzzxsBIb4NV/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-_NfdEE1jOU-B5atWvyEgPA-1; Mon, 28 Oct 2019 06:49:47 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A108A107AD28;
 Mon, 28 Oct 2019 10:49:46 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-42.ams2.redhat.com
 [10.36.116.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5359760BF7;
 Mon, 28 Oct 2019 10:49:40 +0000 (UTC)
Date: Mon, 28 Oct 2019 11:49:38 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH] qemu-iotests/iotests.py: improve assert_qmp message
Message-ID: <20191028104938.GA3579@localhost.localdomain>
References: <20191026101221.5506-1-vsementsov@virtuozzo.com>
 <8938c24a-4f3d-4df2-4c30-f1922242789b@redhat.com>
 <53de13a9-a312-6a33-3b3b-2a655cc1c3d3@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <53de13a9-a312-6a33-3b3b-2a655cc1c3d3@virtuozzo.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: _NfdEE1jOU-B5atWvyEgPA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.10.2019 um 18:58 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 26.10.2019 14:29, Philippe Mathieu-Daud=E9 wrote:
> > On 10/26/19 12:12 PM, Vladimir Sementsov-Ogievskiy wrote:
> >> Make it obvious, from the two values which is found at path and which
> >> is expected.
> >=20
> > Maybe:
> >=20
> > "From the two values compared, make it obvious which is found at path, =
and which is expected."
> >=20
> > Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
>=20
> Thanks for review and better wording!

Thanks, updated the commit message and applies to the block branch.

Kevin


