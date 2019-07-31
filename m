Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5237BA0F
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 09:00:16 +0200 (CEST)
Received: from localhost ([::1]:38402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsiat-0000j2-2r
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 03:00:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56840)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jasowang@redhat.com>) id 1hsiaK-0000Iz-1A
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 02:59:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1hsiaI-0004QX-4r
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 02:59:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59292)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1hsiaH-0004NG-VU
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 02:59:38 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CBD4D3082120;
 Wed, 31 Jul 2019 06:59:35 +0000 (UTC)
Received: from [10.72.12.51] (ovpn-12-51.pek2.redhat.com [10.72.12.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3CB715C1B5;
 Wed, 31 Jul 2019 06:59:29 +0000 (UTC)
To: P J P <ppandit@redhat.com>
References: <20190723104754.29324-1-ppandit@redhat.com>
 <20190723104754.29324-4-ppandit@redhat.com>
 <20190723130326.GC5445@stefanha-x1.localdomain>
 <CAKXe6S+pXN0d6K9Vw=kxsy51bVz1PxXBHYEmTesUnYo8u8vcYg@mail.gmail.com>
 <nycvar.YSQ.7.76.1907241116470.10049@xnncv>
 <20190729150400.GG6771@stefanha-x1.localdomain>
 <fb5835f4-2894-72c5-db35-91ccf966cb9f@redhat.com>
 <nycvar.YSQ.7.76.1907311211020.1746@xnncv>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <3bd45075-bec1-f597-8f84-4de1f9bd29bf@redhat.com>
Date: Wed, 31 Jul 2019 14:59:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <nycvar.YSQ.7.76.1907311211020.1746@xnncv>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Wed, 31 Jul 2019 06:59:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v4 3/3] net: tap: replace snprintf with
 g_strdup_printf calls
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Li Qiang <liq3ea@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2019/7/31 =E4=B8=8B=E5=8D=882:42, P J P wrote:
> +-- On Wed, 31 Jul 2019, Jason Wang wrote --+
> | On 2019/7/29 =E4=B8=8B=E5=8D=8811:04, Stefan Hajnoczi wrote:
> | > This change isn't related to the topic of the patch.  It's a separa=
te bug
> | > fix.
> | >
> | > Please either document it in the commit description so it's clear t=
he
> | > change is intentional, or send it as a separate patch.
> |
> | Prasad, please send a patch for this.
>
> Okay, do I redo the series, or just this one patch is okay? (to confirm=
)


The series has been merged. Just need a patch on top and I can queue it=20
for next release.

Thanks


>
> Thank you.
> --
> Prasad J Pandit / Red Hat Product Security Team
> 47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F

