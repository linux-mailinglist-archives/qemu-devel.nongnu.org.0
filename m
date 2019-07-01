Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1486647D52
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 10:39:53 +0200 (CEST)
Received: from localhost ([::1]:45184 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcnB9-00064v-FC
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 04:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45324)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hcnAK-0005AJ-VO
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 04:39:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hcnAK-0008Sk-6C
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 04:39:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37962)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>)
 id 1hcnAI-0008Pj-BW; Mon, 17 Jun 2019 04:38:58 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 239DE7FDCC;
 Mon, 17 Jun 2019 08:38:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-33.ams2.redhat.com
 [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 888457E673;
 Mon, 17 Jun 2019 08:38:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B4FD811AAF; Mon, 17 Jun 2019 10:38:42 +0200 (CEST)
Date: Mon, 17 Jun 2019 10:38:42 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sam Eiderman <shmuel.eiderman@oracle.com>
Message-ID: <20190617083842.xlicosythr2gtnvh@sirius.home.kraxel.org>
References: <20190612115939.23825-1-shmuel.eiderman@oracle.com>
 <20190612115939.23825-8-shmuel.eiderman@oracle.com>
 <20190617072040.yriunmoffbjhvqc5@sirius.home.kraxel.org>
 <ECEA4896-C290-45A7-9574-D1704C63842C@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ECEA4896-C290-45A7-9574-D1704C63842C@oracle.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Mon, 17 Jun 2019 08:38:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [QEMU] [PATCH v2 7/8] bootdevice: FW_CFG interface
 for LCHS values
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, arbel.moshe@oracle.com,
 seabios@seabios.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 kevin@koconnor.net, liran.alon@oracle.com, karl.heubaum@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Keep it extendible for a low price of ABI + =E2=80=9Cbootdevices=E2=80=9D=
 name.
> Or go strict and rename to =E2=80=9Cbios-geometries=E2=80=9D?

The name should reflect what is in there, so "bios-geometries" looks
better to me.  I'd also keep it strict, unless we have at least a vague
idea what might be a useful future extension.  I don't have any.

cheers,
  Gerd


