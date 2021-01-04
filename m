Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 645182E8F35
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 02:31:14 +0100 (CET)
Received: from localhost ([::1]:36630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwEiH-0005J4-GI
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 20:31:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kwEg4-0004m7-RY; Sun, 03 Jan 2021 20:28:56 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:41597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kwEg3-0008VL-9f; Sun, 03 Jan 2021 20:28:56 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 676F87470DD;
 Mon,  4 Jan 2021 02:28:53 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3B9E074645F; Mon,  4 Jan 2021 02:28:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 39F1274645B;
 Mon,  4 Jan 2021 02:28:53 +0100 (CET)
Date: Mon, 4 Jan 2021 02:28:53 +0100 (CET)
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v3 0/5] Misc sam460ex fixes (was: Clean up sam460ex irq
 mapping)
In-Reply-To: <20210104010532.GB1915@yekko.fritz.box>
Message-ID: <c6a1a134-6f1b-a1ed-6d7e-dbd9e8ce40f1@eik.bme.hu>
References: <cover.1609636173.git.balaton@eik.bme.hu>
 <20210104010532.GB1915@yekko.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

On Mon, 4 Jan 2021, David Gibson wrote:
> On Sun, Jan 03, 2021 at 02:09:33AM +0100, BALATON Zoltan via wrote:
>> So this is v3 of a series that started to fix a potential problem with
>> irq mapping in pci440_pcix (used by sam460ex) that got some other
>> fixes along the way as by-products. But it turns out the irq issue
>> this was trying to fix is not really a problem so finally we just
>> update the comment for now documenting why it works and only the
>> by-products remain in this series. Of which there are two more in this
>> v3 finally fixing a long standing problem booting MorphOS on sam460ex
>> (which I've got after debugging similar problem with pegasos2/vt8231
>> that gave me an idea how to debug this.)
>
> Applied to ppc-for-6.0.
>
> So.. you're pretty much the only person who's shown any interest in
> the embedded ppc stuff in qemu for a pretty long time.  Any chance I
> could convince you to be ppc4xx submaintainer?

Not if it involves testing or sending pull requests because I don't have 
time for that. I'm already listed as maintainer for stuff I contributed 
and try to review and test changes to that (i.e. sam460ex) but I'm afraid 
that's all I can do.

Regards,
BALATON Zoltan

