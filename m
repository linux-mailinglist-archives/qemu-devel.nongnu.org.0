Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B031F78B4
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jun 2020 15:21:46 +0200 (CEST)
Received: from localhost ([::1]:45880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjjcv-0000eh-EG
	for lists+qemu-devel@lfdr.de; Fri, 12 Jun 2020 09:21:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jjjc0-0000Bp-Co
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 09:20:48 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:51715)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jjjbx-00014c-ND
 for qemu-devel@nongnu.org; Fri, 12 Jun 2020 09:20:47 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1E0BA7475FA;
 Fri, 12 Jun 2020 15:10:53 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0414C74633F; Fri, 12 Jun 2020 15:10:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 0288674633D;
 Fri, 12 Jun 2020 15:10:53 +0200 (CEST)
Date: Fri, 12 Jun 2020 15:10:52 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/4] More sm501 fixes and optimisations
In-Reply-To: <cover.1591471056.git.balaton@eik.bme.hu>
Message-ID: <alpine.BSF.2.22.395.2006121510370.67073@zero.eik.bme.hu>
References: <cover.1591471056.git.balaton@eik.bme.hu>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sebastian Bauer <mail@sebastianbauer.info>,
 Magnus Damm <magnus.damm@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 6 Jun 2020, BALATON Zoltan wrote:
> Some small fixes and optimisations for hw/display/sm501.c.

Ping?

Regards,
BALATON Zoltan

> BALATON Zoltan (4):
>  sm501: Fix bounds checks
>  sm501: Drop unneded variable
>  sm501: Ignore no-op blits
>  sm501: Optimise 1 pixel 2d ops
>
> hw/display/sm501.c | 58 ++++++++++++++++++++++++++++++++++++++--------
> 1 file changed, 48 insertions(+), 10 deletions(-)
>
>

