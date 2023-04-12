Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B8E6DF4CD
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 14:14:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmZMM-0006sA-U5; Wed, 12 Apr 2023 08:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pmZME-0006kH-Na
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 08:13:51 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pmZM9-0000FX-9v
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 08:13:47 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 15F34746324;
 Wed, 12 Apr 2023 14:12:26 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D836E7462DB; Wed, 12 Apr 2023 14:12:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D59F2745712;
 Wed, 12 Apr 2023 14:12:25 +0200 (CEST)
Date: Wed, 12 Apr 2023 14:12:25 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Howard Spoelstra <hsp.cat7@gmail.com>
cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: Re: source fails to compile on msys2
In-Reply-To: <CABLmASEcJRNWRaFum_BKgwKu7cJ8BDM3W94W-ZZwFLFuEwkh7g@mail.gmail.com>
Message-ID: <1aacbfc4-2303-4d9c-7644-32ad97d6d748@eik.bme.hu>
References: <CABLmASEcJRNWRaFum_BKgwKu7cJ8BDM3W94W-ZZwFLFuEwkh7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 12 Apr 2023, Howard Spoelstra wrote:
> It seems the current source fails to compile with up to date msys2.

See here: https://qemu.weilnetz.de/
I think there are some patches there that aren't upstream. I don't know 
why and also don't know why those binaries are not built from QEMU master.

Regards,
BALATON Zoltan


