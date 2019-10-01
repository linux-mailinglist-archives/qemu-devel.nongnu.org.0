Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF033C4377
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Oct 2019 00:06:38 +0200 (CEST)
Received: from localhost ([::1]:48750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFQI1-0004vq-Kh
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 18:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55878)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iFOBq-0000uM-Ox
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:52:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iFOBo-0001SZ-NL
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:52:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45610)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1iFOBm-0001Qz-In; Tue, 01 Oct 2019 15:52:02 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C4DC52A09DA;
 Tue,  1 Oct 2019 19:52:01 +0000 (UTC)
Received: from [10.3.116.201] (ovpn-116-201.phx2.redhat.com [10.3.116.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DB6C5C219;
 Tue,  1 Oct 2019 19:51:58 +0000 (UTC)
Subject: Re: [PATCH 0/2] block: Skip COR for inactive nodes
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20191001174827.11081-1-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <4638c5bf-b4fd-d9fb-bae4-e7cc6bbacb83@redhat.com>
Date: Tue, 1 Oct 2019 14:51:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191001174827.11081-1-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 01 Oct 2019 19:52:01 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/1/19 12:48 PM, Max Reitz wrote:
> Hi,
>=20
> While working on $IMGOPTS support for Python iotests, I noticed a minor
> bug.  Let=E2=80=99s fix it, as you do with bugs.
>=20
>=20
> Max Reitz (2):
>    block: Skip COR for inactive nodes
>    iotests/262: Switch source/dest VM launch order

Reviewed-by: Eric Blake <eblake@redhat.com>

>=20
>   block/io.c                 | 41 +++++++++++++++++++++++++------------=
-
>   tests/qemu-iotests/262     | 12 +++++------
>   tests/qemu-iotests/262.out |  6 +++---
>   3 files changed, 36 insertions(+), 23 deletions(-)
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

