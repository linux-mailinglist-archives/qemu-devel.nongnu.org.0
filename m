Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC059454D9D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 20:04:32 +0100 (CET)
Received: from localhost ([::1]:32918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnQER-0005lt-Cr
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 14:04:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mnQDT-000502-BA
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 14:03:31 -0500
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:50118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mnQDO-0003fI-NH
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 14:03:29 -0500
Received: from iva8-d2cd82b7433e.qloud-c.yandex.net
 (iva8-d2cd82b7433e.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:a88e:0:640:d2cd:82b7])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 2B20C2E1AF3;
 Wed, 17 Nov 2021 22:03:20 +0300 (MSK)
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net [2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by iva8-d2cd82b7433e.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 bC8dUzNwxS-3JsmoZfF; Wed, 17 Nov 2021 22:03:20 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1637175800; bh=6yvYOVdwUYe2s5hBPofp2+rMsViWSk7WsaCBr1rZQfQ=;
 h=In-Reply-To:Subject:To:From:Message-ID:Cc:References:Date;
 b=07FzLI9ujsvla43bl75XE6XbrU3moN+znMmnjV2IgSIyl4EZQYei5EYBI6xIuULKa
 piHoGaDF2ifLjEUvrtzwM0ZbDAqwTnW7qjqrFZxdRmXsINxC+FV2LmYy2yRZlbw6vE
 Javfbgy7s28LAHewUYha3N2BIfLoyheJKCSJjD4Y=
Authentication-Results: iva8-d2cd82b7433e.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from rvkaganb.lan (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:8825::1:30])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPS id
 To2GqPywPQ-3JwSOun1; Wed, 17 Nov 2021 22:03:19 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
Date: Wed, 17 Nov 2021 22:03:17 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Valentin Sinitsyn <valesini@yandex-team.ru>
Subject: Re: [PATCH v1] hw/i386/amd_iommu: clean up broken event logging
Message-ID: <YZVR9bJG0tuW1gai@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Valentin Sinitsyn <valesini@yandex-team.ru>,
 Daniil Tatianin <d-tatianin@yandex-team.ru>, qemu-devel@nongnu.org,
 pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com,
 marcel.apfelbaum@gmail.com, yc-core@yandex-team.ru
References: <20211117144641.837227-1-d-tatianin@yandex-team.ru>
 <76c294d0-37fb-cdbb-98e4-9363ba5f66ee@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76c294d0-37fb-cdbb-98e4-9363ba5f66ee@yandex-team.ru>
Received-SPF: pass client-ip=5.45.199.163; envelope-from=rvkagan@yandex-team.ru;
 helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: ehabkost@redhat.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 Daniil Tatianin <d-tatianin@yandex-team.ru>, yc-core@yandex-team.ru,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 17, 2021 at 11:13:27PM +0500, Valentin Sinitsyn wrote:
> On 17.11.2021 19:46, Daniil Tatianin wrote:
> > -/*
> > - * AMDVi event structure
> > - *    0:15   -> DeviceID
> > - *    55:63  -> event type + miscellaneous info
> > - *    63:127 -> related address
> Did you mean 64:127? Fields shouldn't overlap, and 65-bit address looks
> suspicious.

These lines are being removed by this patch.  And yes, they were wrong
WRT the spec.

Roman.

