Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DE4363DD2
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 10:41:05 +0200 (CEST)
Received: from localhost ([::1]:51556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYPSm-0005gH-GT
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 04:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1lYPOW-0004RV-NX; Mon, 19 Apr 2021 04:36:37 -0400
Received: from kerio.kamp.de ([195.62.97.192]:58199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>)
 id 1lYPOQ-0005vF-9G; Mon, 19 Apr 2021 04:36:34 -0400
X-Footer: a2FtcC5kZQ==
Received: from [192.168.178.73] ([79.200.86.192])
 (authenticated user pl@kamp.de) by kerio.kamp.de with ESMTPSA
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits));
 Mon, 19 Apr 2021 10:36:14 +0200
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [RFC PATCH 0/2] qemu-img convert: Fix sparseness detection
From: Peter Lieven <pl@kamp.de>
In-Reply-To: <20210415152214.279844-1-kwolf@redhat.com>
Date: Mon, 19 Apr 2021 10:36:17 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <07747AB5-5BCE-49EE-A3AB-03AA7B6211F8@kamp.de>
References: <20210415152214.279844-1-kwolf@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-devel@nongnu.org, qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> Am 15.04.2021 um 17:22 schrieb Kevin Wolf <kwolf@redhat.com>:
>=20
> Peter, three years ago you changed 'qemu-img convert' to sacrifice =
some
> sparsification in order to get aligned requests on the target image. =
At
> the time, I thought the impact would be small, but it turns out that
> this can end up wasting gigabytes of storagee (like converting a fully
> zeroed 10 GB image taking 2.8 GB instead of a few kilobytes).
>=20
> https://bugzilla.redhat.com/show_bug.cgi?id=3D1882917
>=20
> I'm not entirely sure how to attack this best since this is a =
tradeoff,
> but maybe the approach in this series is still good enough for the =
case
> that you wanted to fix back then?
>=20
> Of course, it would be possible to have a more complete fix like =
looking
> forward a few blocks more before writing data, but that would probably
> not be entirely trivial because you would have to merge blocks with =
ZERO
> block status with DATA blocks that contain only zeros. I'm not sure if
> it's worth this complication of the code.

I will try to look into this asap.

Is there a hint which FS I need to set the extent hint when creating the =
raw image? I was not able to do that.

Peter



