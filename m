Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C94BA36D6F8
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 14:06:26 +0200 (CEST)
Received: from localhost ([::1]:39914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbixV-0005cG-BF
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 08:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lbivc-0004Z4-Mo
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 08:04:28 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:44242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lbivZ-0000DI-MK
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 08:04:27 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 46A2F7457E7;
 Wed, 28 Apr 2021 14:04:19 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CA034745709; Wed, 28 Apr 2021 14:04:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C87C17456B4;
 Wed, 28 Apr 2021 14:04:18 +0200 (CEST)
Date: Wed, 28 Apr 2021 14:04:18 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: X on old (non-x86) Linux guests
In-Reply-To: <CA+rFky5-FzxjFDJND8a8iQ1XYZ7PsBkYkK4CFO7X6mjAqD+sBg@mail.gmail.com>
Message-ID: <b5ed0e7-86fa-3157-3b5a-506f9aff5cac@eik.bme.hu>
References: <YIaPdjz7PpvwVPP/@work-vm>
 <925db5d2-f3f7-96cb-4549-8880408f018@eik.bme.hu>
 <CA+rFky7OWZUHdUgn1xFDTO6b-Y72KL=JjxjVYAFDMYh7H9DwRw@mail.gmail.com>
 <CA+rFky5-FzxjFDJND8a8iQ1XYZ7PsBkYkK4CFO7X6mjAqD+sBg@mail.gmail.com>
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
Cc: "kraxel@redhat.com" <kraxel@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 Andrew Randrianasulu <randrianasulu@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 28 Apr 2021, Andrew Randrianasulu wrote:
> On Wednesday, April 28, 2021, Andrew Randrianasulu <randrianasulu@gmail.com>
> wrote:
>> On Monday, April 26, 2021, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>> On Mon, 26 Apr 2021, Dr. David Alan Gilbert wrote:
>>>>  Over the weekend I got a Red Hat 6.x (not RHEL!) for Alpha booting
>>>> under QEMU which was pretty neat.  But I failed to find a succesful
>>>> combination to get X working; has anyone any suggestions?
>>>>
>>>
>>> Adding Andrew who has experimented with old X framebuffer so he may
>>> remember something more but that was on x86.
>>
>>
>>
>> Sorry, I still away from my desktop (with notes/logs), not sure when
>> return..
>> I do not think I tried something that old.. Kernel 2.2 i guess, before any
>> attempt at r128 drm Kernel module was written (in 2.4?) and so before ddx
>> attempted to use that (as it tries by default in much newer distros)

Maybe it would work better with newer RedHat than 6.0? I think I've seen 
images up to at least 7.1 that supported alpha but I don't know how to 
boot them. I could get kernel and installer running with -kernel -initrd 
but did not find the CD on the defailt CMD646 controller (seems to only 
have driver for one SCSI controller) so I'm not sure how to try this. 
Trying to just boot from the CD without -kernel -initrd it just stops 
after displaying "Hello" in top left but that could be something about 
alpha firmware I don't know how to use.

Regards,
BALATON Zoltan

