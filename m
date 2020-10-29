Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5EE29EDDD
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 15:07:40 +0100 (CET)
Received: from localhost ([::1]:32962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kY8aZ-0003T9-QC
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 10:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kY8ZT-0002oU-Bx
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 10:06:31 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:45193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1kY8ZR-0003Ed-Hq
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 10:06:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=IFOBXrM4iYYLK7tjQcMgte7far14Rr5rYnl2LkIICy4=; b=Tw92aUm4WW3u/jft/Bz7VX7En5
 5Lfc7kdXgcNu23//bAvyfF8oreObO07XFg/KhM0CKabiHrFVaKzE60SXgg5WFNmt0f/KiU8OEhB+a
 qfLGX69MgKvjI2T06zlVwAPQ/w8Yi8QE8IhE3OFoH4lmM6OFqB7i/YWKwsqiczUCPN0V9+5tkJNd7
 IYkTl0sBd5B4EPJg4M8ruZ6JMy/inAiqIWlxq/+iuk2ToWmRfZdC/4CzpdR9qfjWa9MkonyeZvMJO
 kNTrmvjW3WY3ZgWrZQjeuwVhW+Y+5w6h17ga8vaJVueozHAY34Ig3UHCuYcG3tlvxMsmzwb0RSkMk
 qZZdyK6g==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>
Subject: Re: [PULL 00/13] 9p queue 2020-10-23
Date: Thu, 29 Oct 2020 15:06:25 +0100
Message-ID: <5649161.sut93UlCx4@silver>
In-Reply-To: <CAFEAcA-q0AVF-GMu1VLKPKmPAURV9j+YoC3g-C15F2Jy5nTUVQ@mail.gmail.com>
References: <cover.1603452058.git.qemu_oss@crudebyte.com>
 <3097828.JvSkC2jeLF@silver>
 <CAFEAcA-q0AVF-GMu1VLKPKmPAURV9j+YoC3g-C15F2Jy5nTUVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 08:52:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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

On Donnerstag, 29. Oktober 2020 14:57:45 CET Peter Maydell wrote:
> On Thu, 29 Oct 2020 at 13:48, Christian Schoenebeck
> 
> <qemu_oss@crudebyte.com> wrote:
> > So I'll append the architecture to the test dir location. To nail it this
> > time, anyting else that would come to your mind regarding test dirs?
> 
> I think most tests that need a temp directory set one
> up using mkdtemp().
> 
> thanks
> -- PMM

Ok, I'll use mkdtemp() instead, that avoids other potential parallel config 
colissions that I may not have considered yet.

The original motivation against mkdtemp() was that /tmp is isually a ramfs, 
hence very limited regarding large file tests. But that's not an issue right 
now.

Thanks Peter!

Best regards,
Christian Schoenebeck



