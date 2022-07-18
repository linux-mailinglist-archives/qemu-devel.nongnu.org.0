Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5AC578239
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 14:24:34 +0200 (CEST)
Received: from localhost ([::1]:51904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDPnd-0002Xs-QF
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 08:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oDPlP-0006b8-6m; Mon, 18 Jul 2022 08:22:17 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:37184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oDPlL-0002kZ-ET; Mon, 18 Jul 2022 08:22:13 -0400
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 0A9B02E0DAA;
 Mon, 18 Jul 2022 15:22:01 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b713::1:a] (unknown
 [2a02:6b8:b081:b713::1:a])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 lDtVcSk4Z7-LxPGTs1V; Mon, 18 Jul 2022 12:22:00 +0000
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658146920; bh=JyKrsJzujG3AA9Q4VC0j2PupC0MAKbBfom9sYQ5RqWo=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=VXaFocV3/6YqMQxSDHMnm+KdfEm2AoALXLoOnq8ig0IYOkEk1o282T0JIyt86Yls3
 6ch8NKXObgushnE6r/aJrLooTa1Ic1ok9O9mayELtEFdpsyHKkslK0BHEaWvAphU0n
 K8+uBVHe8uhI5zp9FPlmF66HFozmWbU1POecY19Y=
Authentication-Results: myt6-81d8ab6a9f9d.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <ed004747-6d23-e724-897b-c5d108e4347a@yandex-team.ru>
Date: Mon, 18 Jul 2022 15:21:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/2] iotests/131: Add parallels regression test
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Denis V . Lunev" <den@openvz.org>, Kevin Wolf <kwolf@redhat.com>
References: <20220714132801.72464-1-hreitz@redhat.com>
 <20220714132801.72464-3-hreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220714132801.72464-3-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/14/22 16:28, Hanna Reitz wrote:
> Test an allocating write to a parallels image that has a backing node.
> Before HEAD^, doing so used to give me a failed assertion (when the
> backing node contains only `42` bytes; the results varies with the value
> chosen, for `0` bytes, for example, all I get is EIO).
> 
> Signed-off-by: Hanna Reitz<hreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir

