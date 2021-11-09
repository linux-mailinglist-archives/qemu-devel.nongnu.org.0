Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7012344B963
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 00:35:30 +0100 (CET)
Received: from localhost ([::1]:57574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkaeG-0002Fp-J4
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 18:35:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mkacQ-0000MW-0U; Tue, 09 Nov 2021 18:33:34 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:31850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mkacL-000781-Qv; Tue, 09 Nov 2021 18:33:33 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 50C77746399;
 Wed, 10 Nov 2021 00:33:25 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3392F746353; Wed, 10 Nov 2021 00:33:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 31D677462D3;
 Wed, 10 Nov 2021 00:33:25 +0100 (CET)
Date: Wed, 10 Nov 2021 00:33:25 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 1/2] hw: m68k: virt: Add compat machine for 6.1
In-Reply-To: <CAFEAcA8yQ01RfaWCZO-qBd=quTYsMyTxfNsg0xbjRrzUb7LDJg@mail.gmail.com>
Message-ID: <f6ed2484-c92c-8ac4-e529-f9fc6797a0ec@eik.bme.hu>
References: <20211109111517.996104-1-laurent@vivier.eu>
 <20211109111517.996104-2-laurent@vivier.eu>
 <9537b527-d33e-59d5-e196-e1e84fa01325@eik.bme.hu>
 <YYpvvWLvkhR0/igt@redhat.com>
 <fa213548-ca60-bf7b-2075-83bd7f32462a@eik.bme.hu>
 <CAFEAcA8yQ01RfaWCZO-qBd=quTYsMyTxfNsg0xbjRrzUb7LDJg@mail.gmail.com>
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
Cc: qemu-devel@nongnu.org,
 =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-stable@nongnu.org, Laurent Vivier <Laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Nov 2021, Peter Maydell wrote:
> On Tue, 9 Nov 2021 at 20:01, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>> But maybe it's too late to change at this point.
>
> Massively too late. We've been using this versioned-machine
> scheme for over a decade, and the upheaval of changing the
> way it works now would be rather out of proportion purely to
> tidy up the list of machines in the help output...

Well it's more than just tidy up the list, as not adding identical 
machines would have saved maintenance of adding these, lines of code in 
code base that do nothing just making it harder to read and also would be 
easier for users but these benefits are maybe less than the effort to 
change it now so then it's too late (not because how long it's been done 
this way but how much effort would be to change for how much benefit). I'm 
OK with that, was just wondering so asked it to clarify.

Regards,
BALATON Zoltan

