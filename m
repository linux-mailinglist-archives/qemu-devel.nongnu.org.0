Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 972C26A8B3A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 22:48:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXqlM-0006Mg-Hc; Thu, 02 Mar 2023 16:46:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXqlH-0006J4-W7; Thu, 02 Mar 2023 16:46:53 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXqkx-0004Qw-U2; Thu, 02 Mar 2023 16:46:49 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D60477462DB;
 Thu,  2 Mar 2023 22:46:21 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 944BC7457E7; Thu,  2 Mar 2023 22:46:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 928107456E3;
 Thu,  2 Mar 2023 22:46:21 +0100 (CET)
Date: Thu, 2 Mar 2023 22:46:21 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Woodhouse <dwmw2@infradead.org>
cc: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org, 
 ReneEngel80@emailn.de
Subject: Re: [PATCH v5 5/7] hw/isa/vt82c686: Work around missing level
 sensitive irq in i8259 model
In-Reply-To: <81f53c106bf9584828402ab92e94ac4331c58c7a.camel@infradead.org>
Message-ID: <ce8f4a90-5c92-ad06-770b-c0b20aaa670a@eik.bme.hu>
References: <cover.1677628524.git.balaton@eik.bme.hu>
 <cd0b323bb88df202e36014f950c0eb13a9fafd54.1677628524.git.balaton@eik.bme.hu>
 <CC88085A-C269-4BCF-8CFD-EB3B457533C9@gmail.com>
 <6502f6bd-029c-25a8-49ec-e61784c64db5@eik.bme.hu>
 <943866390436e3c8828fea3e8cec117ae8553887.camel@infradead.org>
 <1c9daa28-b4b0-5227-ea94-90035a8bed7a@eik.bme.hu>
 <859e28fd61203c35e30fce505f0101886a54e654.camel@infradead.org>
 <418dd5ca-cabc-fb91-6437-63bece1dfe1b@eik.bme.hu>
 <ca4e524d0f0ce8c404ad224d7de9eb1bdf51961e.camel@infradead.org>
 <20eb7e98-aedb-1528-8ba0-806b93b123ea@eik.bme.hu>
 <81f53c106bf9584828402ab92e94ac4331c58c7a.camel@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-106306512-1677793581=:95303"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-106306512-1677793581=:95303
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 2 Mar 2023, David Woodhouse wrote:
> On Wed, 2023-03-01 at 23:47 +0100, BALATON Zoltan wrote:
>> On Wed, 1 Mar 2023, David Woodhouse wrote:
>>> On Wed, 2023-03-01 at 19:01 +0100, BALATON Zoltan wrote:
>>>>
>>>>> It isn't a *correct* fix without a little bit more typing, but does
>>>>> this make it work?
>>>>>
>>>>> diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
>>>>> index 17910f3bcb..36ebcff025 100644
>>>>> --- a/hw/intc/i8259.c
>>>>> +++ b/hw/intc/i8259.c
>>>>> @@ -246,6 +246,7 @@ static void pic_ioport_write(void *opaque, hwaddr addr64,
>>>>>              if (val & 0x08) {
>>>>>                  qemu_log_mask(LOG_UNIMP,
>>>>>                                "i8259: level sensitive irq not supported\n");
>>>>> +                s->elcr = 0xff;
>>>>
>>>> This works too. I guess the log can be then removed too. Could you submit
>>>> a proper patch or you want me to do that so we can drop the workaround for
>>>> it? Thanks for looking into it.
>>>
>>>
>>> Happy for you to do the rest of the typing ... :)
>>
>> I don't mind the typing but this is quite a bit more involved than I
>> expected. You've lost me at the vmstate stuff which I don't quite know how
>> to change or test. If these were stored as bits in an ISW1 register as
>> described by the docs I've looked at now then no change in migration would
>> be needed but this isn't how it seems to be in QEMU so I give up on that
>> in this case. Could you please do the typing then?
>
> Yeah, it is a bit weird that we store the ICW1 byte in *separate*
> elements of persistent state, each of *them* a uint8_t which holds only
> a single bit of ICW1:
>
>            s->init4 = val & 1;
>            s->single_mode = val & 2;
>            s->ltim = val & 8;
>
> Still, it's a pattern that's easy enough to follow.
>
> As for the rest of the typing, I'd basically done the bulk of it
> already when showing how to adjust the existing (s->elcr&mask) checks;
> there was only one more of those to type.
>
> And then the vmstate part is basically just a cut and paste of the bit
> in docs/devel/migration.rst which tells you exactly how to do it.
>
> Patch follows. It builds, but I'll let you do the actual testing,
> including migration to/from the new version, checking with
> scripts/analyze-migration.py that the ltim is there when it should be,
> and isn't when it shouldn't, and any other review feedback.

I've tested that it fixes the problem with MorphOS on pegasos2 and checked 
that a migration file created while at the firmware, before MorphOS sets 
ltim does not have the subsection while migrate after MorphOS boot has it:

                 {
                     "name": "single_mode",
                     "type": "uint8",
                     "size": 1
                 },
                 {
                     "name": "elcr",
                     "type": "uint8",
                     "size": 1
                 }
             ],
             "subsections": [
                 {
                     "vmsd_name": "i8259/ltim",
                     "version": 1,
                     "fields": [
                         {
                             "name": "ltim",
                             "type": "uint8",
                             "size": 1
                         }
                     ]
                 }
             ]
         },
         {
             "name": "i8259",
             "instance_id": 1,
             "vmsd_name": "i8259",
             "version": 1,
             "fields": [
                 {
                     "name": "last_irr",
                     "type": "uint8",
                     "size": 1
                 },

A migration file saved from the qemu-system-x86_64 default pc machine also 
lacks the subsection so it should not affect migration there unless 
something sets the bit. Is this enough testing or should I try something 
else? I've updated the commit message but did not change the comment.

Regards,
BALATON Zoltan
--3866299591-106306512-1677793581=:95303--

