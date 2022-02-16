Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7E74B861E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:46:01 +0100 (CET)
Received: from localhost ([::1]:45064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHou-0003np-RE
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:46:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nKHZi-0007Bg-B7
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 05:30:19 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:60309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nKHZf-00060L-Ha
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 05:30:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=jILkoSmkFgT3w1Xyq0SBfj99Lw/U1s6SUXdkbpvKF48=; b=oeQjjqQ7DT9rfv97LYYjEySu0J
 +zjKkAtmzt9Zan609aZy496QdM3AXFH+5s4LOymTMrcg9wXPXDQH8ewOXWe5Wd5Z8485u/azGFbZN
 atggNsRUzkAqhWIi2f6ZIgfEWMOSszjaaBBVKNw1Kvkm2gbBaFABV/mVFp+HWPFHBskZB81oPtbve
 c5dyklOAaeBGCzh8l7qxe/GfjfsLVvu4+NA5sADRAG7hXP59oGADjxG2m7ty91bvuUUQjmcOluPTx
 cQl0SoSkDJXwC+zaTn5KC+qf0rTJrx9A0BUr2Xj4RZYZlBNXsBF4dKG1XZRGmOgoO5S+h6IgXb+Dz
 VPj7VfJfJz+kCiw6WyFwhvfOB9CgMlpM+L2Vx7g9BIoDLmYMiEPg64pEXvNRPZNXZ8mMZI8sfXIJk
 fCvnHLwo0Q7Zi8Yg+TSteXFNBUGav5NyJVPCfPWIuxE27kuBzy5It3QByqskIvrLvmMs6M1t2wPnQ
 huYhTReySBDrD9engdAzBuWTxCQ0kC6JuHhVb8frmF84UEdmMhWsiSK4Ugv/vSyJbkqz1f6W50jKt
 CjmjNPCFtli6Ia5di17PUsKzyHSY6qrUUgTSKDHvqU+4MAuKLUG0YdfqnKOA3yreWxV9vZSFsYrXt
 fITM7ZCD223ee344b/en5xBTLijDwr3Ql5uLFtf7E=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Vitaly Chikunov <vt@altlinux.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dmitry V . Levin" <ldv@altlinux.org>
Subject: Re: [PULL 0/5] 9p queue 2022-02-10
Date: Wed, 16 Feb 2022 11:30:12 +0100
Message-ID: <1736989.e8qiMhLugc@silver>
In-Reply-To: <20220215080137.021f6938@bahia>
References: <cover.1644492115.git.qemu_oss@crudebyte.com>
 <20220214144351.dp57o6jyfvliwkos@altlinux.org>
 <20220215080137.021f6938@bahia>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Dienstag, 15. Februar 2022 08:01:37 CET Greg Kurz wrote:
> On Mon, 14 Feb 2022 17:43:51 +0300
> 
> Vitaly Chikunov <vt@altlinux.org> wrote:
> > Why g_new0 and not just g_malloc0? This is smallest code change, which
> > seems appropriate for a bug fix.
> 
> I prefer g_new0() for the exact reasons that are provided in QEMU's
> official coding style docs/devel/style.rst:
[...]
> I'm fine with the acceptable version as well. The only important thing is
> to fix the synth backend.
> 
> Cheers,

Hi, is anybody working on a v5 of this patch? If not I will send one this 
evening to bring this issue forward, because it is blocking my queue.

Best regards,
Christian Schoenebeck



