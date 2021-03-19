Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F6C3412AB
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 03:18:02 +0100 (CET)
Received: from localhost ([::1]:56642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN4i9-0005TZ-8r
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 22:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@nh2.me>)
 id 1lN4h8-0004xJ-9b; Thu, 18 Mar 2021 22:16:58 -0400
Received: from mail.nh2.me ([116.202.188.98]:43927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@nh2.me>)
 id 1lN4h6-0001rY-5U; Thu, 18 Mar 2021 22:16:57 -0400
Subject: Re: [PATCH] net/slirp: Fix incorrect permissions on samba >= 2.0.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nh2.me; s=mail;
 t=1616120210; bh=4V1eiws8WdUo6+MuRUZ4WRbC9/xj7a6H3HSMiRAOBlQ=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To;
 b=jJS22cnP5cI4iI9TGaAkS+PNp9yWTHlj1DBB7hnSkT+kqmlmx8BEfRLxR/OjGaGOJ
 EadRixe7CtMMEjC3KLGfhjnk0eWOEN5EHWcjJVgSvzVcZUPP2LvaZXKbSQJ3D8RtUf
 GVR2kIrpqKWWnFuV6QX5igCnJ/C7HzstEhwD+SyoaXimC32S0FCEmCU15UN9R2PnDY
 hPgA+rFeS68WNGpydbSnzMr5Xg+mRJxnsoazGVNVU0cObWDyNhSm4sxBcJXy0OLRXv
 PfzbxEip7dkco4U1qGNlXW0X0UtOVvvYzM3+j/4lLetEnIm1BeKUgPx75JV960lrQ0
 krYcgC7XeRsVQ==
From: =?UTF-8?Q?Niklas_Hamb=c3=bcchen?= <mail@nh2.me>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, qemu-trivial@nongnu.org
References: <c2b98872-4649-c291-bfb2-0fd5b3d40ac4@nh2.me>
Message-ID: <98ecfb50-c14c-4c66-5f9d-4ad761717f23@nh2.me>
Date: Fri, 19 Mar 2021 03:16:49 +0100
MIME-Version: 1.0
In-Reply-To: <c2b98872-4649-c291-bfb2-0fd5b3d40ac4@nh2.me>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=116.202.188.98; envelope-from=mail@nh2.me;
 helo=mail.nh2.me
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/21 3:41 AM, Niklas Hambüchen wrote:
> This broke `-net user,smb=/path/to/folder`:

Hey, just a short ping on whether anyone would have a moment to review this `qemu-trivial` patch; it would be very nice to have SMB support to work out of the box again.

Thanks!

