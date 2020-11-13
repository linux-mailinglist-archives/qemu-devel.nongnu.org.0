Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B292D2B18D0
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 11:12:03 +0100 (CET)
Received: from localhost ([::1]:41702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdW3m-0004BM-Pj
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 05:12:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dimastep@yandex-team.ru>)
 id 1kdW2M-0003j3-G9
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:10:34 -0500
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:53316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dimastep@yandex-team.ru>)
 id 1kdW2I-0001VE-4b
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:10:33 -0500
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 336212E155B;
 Fri, 13 Nov 2020 13:10:22 +0300 (MSK)
Received: from iva4-7c3d9abce76c.qloud-c.yandex.net
 (iva4-7c3d9abce76c.qloud-c.yandex.net [2a02:6b8:c0c:4e8e:0:640:7c3d:9abc])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 z1THaQa9RI-ALw47Orc; Fri, 13 Nov 2020 13:10:22 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1605262222; bh=+QgzP03b16pfRleqvPAAem+v7IVHx3eWHS9kz3qcf8s=;
 h=In-Reply-To:Message-ID:Subject:To:From:References:Date:Cc;
 b=aTA7ZV07sXO56rK2KnB1sXHp4HHE349QBAi+hP5rNSyAQPuUsK4Elkb59QjJa+qoQ
 cBbKgHebveEAnw0HLZK83sBNQugi5v7HWzlyH7OAT5Qx/OF2naRfRkh1X68rtueZxe
 z77NdpgccIkq4R7QyaTBFNcu4mYcvKb7QlVFGx8k=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:1222::1:d])
 by iva4-7c3d9abce76c.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 N2GnacMlaH-AKmiJu0C; Fri, 13 Nov 2020 13:10:21 +0300
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client certificate not present)
Date: Fri, 13 Nov 2020 13:10:20 +0300
From: Dima Stepanov <dimastep@yandex-team.ru>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 1/2] fuzz: add virtio-blk fuzz target
Message-ID: <20201113101020.GA7758@dimastep-nix>
References: <cover.1604920905.git.dimastep@yandex-team.ru>
 <e2405c459302ecaee2555405604975353bfa3837.1604920905.git.dimastep@yandex-team.ru>
 <ab97459c-f0e4-5f0d-455a-362001cca6ba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab97459c-f0e4-5f0d-455a-362001cca6ba@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=dimastep@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: stefanha@gmail.com, alxndr@bu.edu, qemu-devel@nongnu.org,
 yc-core@yandex-team.ru, darren.kenny@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 09, 2020 at 01:24:20PM +0100, Thomas Huth wrote:
> On 09/11/2020 12.25, Dima Stepanov wrote:
> > The virtio-blk fuzz target sets up and fuzzes the available virtio-blk
> > queues. The implementation is based on two files:
> >   - tests/qtest/fuzz/virtio_scsi_fuzz.c
> >   - tests/qtest/virtio_blk_test.c
> > 
> > Signed-off-by: Dima Stepanov <dimastep@yandex-team.ru>
> > Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
> > ---
> >  tests/qtest/fuzz/meson.build       |   1 +
> >  tests/qtest/fuzz/virtio_blk_fuzz.c | 234 +++++++++++++++++++++++++++++++++++++
> >  2 files changed, 235 insertions(+)
> >  create mode 100644 tests/qtest/fuzz/virtio_blk_fuzz.c
> 
> Thanks, I can add this to my next qtest-related pull request.
> Note: I just spotted your patch by accident ... please put me on CC: if you
> want me to merge qtest/fuzzer related patches.

Hi Thomas,

Thanks for handling it. Got it! Will add you to CC for the next fuzzing
pull requests.

Dima.

> 
>  Thomas
> 

