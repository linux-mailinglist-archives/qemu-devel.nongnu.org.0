Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1B24D8EFC
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 22:46:29 +0100 (CET)
Received: from localhost ([::1]:51968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTsWK-0007tR-DU
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 17:46:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@ya.ru>)
 id 1nTsV7-0006yH-Ae; Mon, 14 Mar 2022 17:45:14 -0400
Received: from forward500o.mail.yandex.net ([37.140.190.195]:42332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@ya.ru>)
 id 1nTsV4-00088z-Ep; Mon, 14 Mar 2022 17:45:12 -0400
Received: from myt6-43c1316fdabf.qloud-c.yandex.net
 (myt6-43c1316fdabf.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:370d:0:640:43c1:316f])
 by forward500o.mail.yandex.net (Yandex) with ESMTP id 300519419C3;
 Tue, 15 Mar 2022 00:45:05 +0300 (MSK)
Received: from myt6-efff10c3476a.qloud-c.yandex.net
 (myt6-efff10c3476a.qloud-c.yandex.net [2a02:6b8:c12:13a3:0:640:efff:10c3])
 by myt6-43c1316fdabf.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 vWFGaELZbJ-j4emYxZU; Tue, 15 Mar 2022 00:45:05 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail;
 t=1647294305; bh=WB1qKPiWaSu7gFevukClf2VCux02xMeNPswwZip5UiE=;
 h=In-Reply-To:From:Subject:Cc:References:Date:Message-ID:To;
 b=HTZEFptYiDUciYk2KagaQHluJ13BJezshhnVEAHCAJFl5ZD4h7X4Ks+ulzTBTpmMZ
 aqhHtgp/xySll9bYznXrz7R/h9me5/3QeUOpIw5G+3eFZHo//6QQKTR0e5laYwgnYX
 llszINikNfc2G93zrWE8erqO76EFM+cN2rSxU8MY=
Authentication-Results: myt6-43c1316fdabf.qloud-c.yandex.net;
 dkim=pass header.i=@ya.ru
Received: by myt6-efff10c3476a.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id EXLNEAHdIZ-j4JORWXl; Tue, 15 Mar 2022 00:45:04 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <f6d36eb5-2dd7-6139-a021-40733d6482b1@ya.ru>
Date: Tue, 15 Mar 2022 00:45:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 for-7.1 0/3] qapi: nbd-export: select bitmap by
 node/name pair
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-block@nongnu.org
References: <20220314213226.362217-1-v.sementsov-og@mail.ru>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
In-Reply-To: <20220314213226.362217-1-v.sementsov-og@mail.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=37.140.190.195; envelope-from=v.sementsov-og@ya.ru;
 helo=forward500o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, hreitz@redhat.com, yuriy.vasiliev@virtuozzo.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

15.03.2022 00:32, Vladimir Sementsov-Ogievskiy wrote:
> From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
> 
> Hi all!
> 
> Here is small improvement for bitmap exporting interface.
> 
> v2: Sorry for the noise, me trying to find a email service, that don't
> consider sending patch series by git-send-email as as spam :/

Aha, and @mail.ru works a lot better. So, that's a candidate for v2 of my "[PATCH] MAINTAINERS: change Vladimir's email address".

This series itself is OK for reviewing, but email in s-o-b mark may change in v3.

> 
> Vladimir Sementsov-Ogievskiy (3):
>    qapi: rename BlockDirtyBitmapMergeSource to BlockDirtyBitmapOrStr
>    qapi: nbd-export: allow select bitmaps by node/name pair
>    iotests/223: check new possibility of exporting bitmaps by node/name
> 
>   block/monitor/bitmap-qmp-cmds.c        |  6 +--
>   blockdev-nbd.c                         |  8 +++-
>   include/block/block_int-global-state.h |  2 +-
>   nbd/server.c                           | 63 +++++++++++++++++---------
>   qapi/block-core.json                   |  6 +--
>   qapi/block-export.json                 |  5 +-
>   qemu-img.c                             |  8 ++--
>   qemu-nbd.c                             | 11 ++++-
>   tests/qemu-iotests/223                 | 16 +++++++
>   tests/qemu-iotests/223.out             | 47 ++++++++++++++++++-
>   10 files changed, 133 insertions(+), 39 deletions(-)
> 


-- 
Best regards,
Vladimir

