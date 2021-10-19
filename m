Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DE7433B54
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 17:54:45 +0200 (CEST)
Received: from localhost ([::1]:34528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcrRs-0000aE-9M
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 11:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mcqTs-0006tb-Ip; Tue, 19 Oct 2021 10:52:44 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:46781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mcqTq-0002Q4-I3; Tue, 19 Oct 2021 10:52:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=ZGLolpoILNqgmrp0ySIM+4KYrFC/BctgAwaH1CzKouo=; b=K15P/lyd77Tcz6QkRn9UiY3DXJ
 8NIKKVSYl5tUleRyna55O2YFE8zM7xTXIicvAt8R/d5l/gDf36jTN+j2TeCNPT6qmVf6dM8+OhTpD
 DNknFhZhMy2mvw1/idkcxXlG/8oSC2zF2/1AZ8UN0Z55fREs7n4jZfmpWbF5k7iuYm7qpX35VrS/O
 6n+FcJTvpeyMfmXJugJz764O4xlGAjqhY0iLrB2BXFxUrksz0ywBcTtBUGLoef372ZCS+qUzpjiaw
 basdRh4y5Q+KhSCh1eIMW2olV16+TKRjBJJC3k1mMMvYr0iIpqieKcKZ6qcxSVg/y+4iPjBfZW3Sx
 jcn6HBzYVulZvOD8zgHVBJknq/YHb7HpQUZ2Mpa587wcYp3rwq96N5x6Ak5ZqUukUmuNmmk5xWtG6
 YQYTH0hkFnwpxi8OJUPX7RR//Y88O9FZc2RiGDVpNdP3NdPu0hBrsBm94IdjB0YPlcG3GTN3wN5M5
 sjicQznNfTUwj2bgSoUdpfJOGK+E5iXGR4Y0OaoC8Q6KdeVezk39aZ3SEclYclXsm1Gk+/JsADh5+
 bRqQafhfXB/0Vc0S7A9+WbnNHJVDwTL15Sfv8VD6Z8CaTbIa6WYVO/j6sW5W/mKwgKfRWY4ONAzW1
 b2HHT2AIm1a637ZeZxF9yd1qQdSjHexO8IHvoY+W0=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, qemu-stable@nongnu.org,
 Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 00/64] Patch Round-up for stable 6.0.1,
 freeze on 2021-10-26
Date: Tue, 19 Oct 2021 16:52:37 +0200
Message-ID: <2448414.exmQesOQCs@silver>
In-Reply-To: <20211019140944.152419-1-michael.roth@amd.com>
References: <20211019140944.152419-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Dienstag, 19. Oktober 2021 16:08:40 CEST Michael Roth wrote:
> Hi everyone,
> 
> The following new patches are queued for QEMU stable v6.0.1:
> 
>   https://gitlab.com/qemu-project/qemu/-/commits/stable-6.0-staging/
> 
> Patch freeze is 2021-10-26, and the release is planned for 2021-10-28:
> 
>   https://wiki.qemu.org/Planning/6.0
> 
> Please respond here or CC qemu-stable@nongnu.org on any additional patches
> you think should (or shouldn't) be included in the release.
> 
> Thanks!

Hi Micheal,

I think the following 9p fix is yet missing:

f83df00900816476cca41bb536e4d532b297d76e 9pfs: fix crash in v9fs_walk()

Best regards,
Christian Schoenebeck



