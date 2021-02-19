Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA5B31FE8F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 19:09:17 +0100 (CET)
Received: from localhost ([::1]:33280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDADM-0003Vj-4X
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 13:09:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lDACE-0002x6-So
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 13:08:06 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:17039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lDACB-0005si-R9
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 13:08:06 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 71E6774634B;
 Fri, 19 Feb 2021 19:07:59 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5FF76746346; Fri, 19 Feb 2021 19:07:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 5E83D746342;
 Fri, 19 Feb 2021 19:07:57 +0100 (CET)
Date: Fri, 19 Feb 2021 19:07:57 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: who's using the ozlabs patchwork install for QEMU patches ?
In-Reply-To: <CAFEAcA8h8QVoGsfJCLTYnbk3yzmrtphsWdSsDUrgQkB=vGh3zw@mail.gmail.com>
Message-ID: <efff5920-3fd7-581d-d92-42b1b21ae66a@eik.bme.hu>
References: <CAFEAcA8h8QVoGsfJCLTYnbk3yzmrtphsWdSsDUrgQkB=vGh3zw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Feb 2021, Peter Maydell wrote:
> Does anybody use the ozlabs patchwork install for QEMU patches,
> either occasionally or on a regular basis ?
> http://patchwork.ozlabs.org/project/qemu-devel/list/
> The admins for that system are trying to identify which of
> the various projects are really using their patchwork instances,
> so I figured I'd do a quick survey here. We don't use it
> as an official project tool but it's certainly possible to
> use it as an individual developer in one way or another.

The "How to submit a patch" page at
https://wiki.qemu.org/Contribute/SubmitAPatch#If_your_patch_seems_to_have_been_ignored
says to send patchew URL with pings. Does that make it "official"?

Regards,
BALATON Zoltan

> (Personally I am in the "occasionally it's useful for finding
> a patch which didn't get archived by patchew or the 'patches'
> tool for some reason" camp at the moment.)


