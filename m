Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EA367661F
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 13:01:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJCX6-0008C5-RZ; Sat, 21 Jan 2023 06:59:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pJCX3-0008Bq-9a; Sat, 21 Jan 2023 06:59:37 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pJCX1-0006N0-CU; Sat, 21 Jan 2023 06:59:36 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 11E1F745712;
 Sat, 21 Jan 2023 12:57:09 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D66B3745706; Sat, 21 Jan 2023 12:57:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D4D1A7456E3;
 Sat, 21 Jan 2023 12:57:08 +0100 (CET)
Date: Sat, 21 Jan 2023 12:57:08 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH 0/2] tests/migration: add support for ppc64le in
 guestperf.py
In-Reply-To: <835c0cce-ea5e-c9c7-fd6a-f0e6ebd7ed20@gmail.com>
Message-ID: <c1d9c7eb-f129-eea1-5c65-9c5a1e80f184@eik.bme.hu>
References: <20220809002451.91541-1-muriloo@linux.ibm.com>
 <835c0cce-ea5e-c9c7-fd6a-f0e6ebd7ed20@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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

On Sat, 21 Jan 2023, Daniel Henrique Barboza wrote:
> Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,

Unrelated to this patch but just so you won't miss it, can you please take 
care of this patch too?

https://patchew.org/QEMU/20230118164512.1BCFB745706@zero.eik.bme.hu/

Thank you,
BALATON Zoltan

