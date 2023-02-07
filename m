Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A506568DF10
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 18:36:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPRtY-0002xX-Qt; Tue, 07 Feb 2023 12:36:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pPRtX-0002wF-4H
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:36:39 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pPRtV-00048z-NG
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:36:38 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0D30A745720;
 Tue,  7 Feb 2023 18:34:05 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CF871745712; Tue,  7 Feb 2023 18:34:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CE3C27456E3;
 Tue,  7 Feb 2023 18:34:04 +0100 (CET)
Date: Tue, 7 Feb 2023 18:34:04 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Howard Spoelstra <hsp.cat7@gmail.com>
Subject: Re: [PATCH 2/6] usb/ohci: Code style fix white space errors
In-Reply-To: <CAFEAcA8k_pVA_81Xr0cFqT6cTYqL2x3K3+WDKNMk02DtQ0XDMw@mail.gmail.com>
Message-ID: <39de90bd-a3ab-dda6-3767-43378389ef06@eik.bme.hu>
References: <cover.1675193329.git.balaton@eik.bme.hu>
 <42bcdf2e60211557ec44f11a45d6b465654693b4.1675193329.git.balaton@eik.bme.hu>
 <CAFEAcA8k_pVA_81Xr0cFqT6cTYqL2x3K3+WDKNMk02DtQ0XDMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 7 Feb 2023, Peter Maydell wrote:
> On Tue, 31 Jan 2023 at 19:39, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/usb/hcd-ohci.c | 162 +++++++++++++++++++++++-----------------------
>>  1 file changed, 80 insertions(+), 82 deletions(-)
>>
>> -    .subsections = (const VMStateDescription*[]) {
>> +    .subsections = (const VMStateDescription * []) {
>
> You might as well leave this one alone. (checkpatch does
> not analyse this syntax correctly and mistakenly thinks
> it needs spaces because it's a multiplication...)

I'd add a space before * at least but if this makes checkpatch happy I 
wenr for the second space just to avoid sputious warnings. Should this be 
changed back?

Regards,
BALATON Zoltan

> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> thanks
> -- PMM
>
>

