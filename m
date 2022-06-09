Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A08AB5450DB
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 17:31:43 +0200 (CEST)
Received: from localhost ([::1]:39890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzK8M-00039r-J3
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 11:31:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nzItn-00005n-Ge
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:12:38 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:61892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nzIti-0001e7-8S
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:12:34 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0769274579D;
 Thu,  9 Jun 2022 16:12:26 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 57A88746324; Thu,  9 Jun 2022 16:12:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 55BB47462D3;
 Thu,  9 Jun 2022 16:12:25 +0200 (CEST)
Date: Thu, 9 Jun 2022 16:12:25 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Gerd Hoffmann <kraxel@redhat.com>
cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 0/3] Misc AC97 clean ups
In-Reply-To: <20220609101720.bf6s2uusjaivcru2@sirius.home.kraxel.org>
Message-ID: <c6a4a4-bbae-cec-4caa-3dbb3df19f1a@eik.bme.hu>
References: <cover.1650706617.git.balaton@eik.bme.hu>
 <6ff58395-65a8-a50-90ee-571ccb131a8@eik.bme.hu>
 <255fbc8f-3b2d-f121-472-91f4d5e36b81@eik.bme.hu>
 <bc93f5ae-a9a-d9ef-4022-fcb0169863@eik.bme.hu>
 <204fa7f7-6b15-e77e-ecec-c06b1873ef5e@redhat.com>
 <20220609101720.bf6s2uusjaivcru2@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-951608989-1654783945=:26668"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-951608989-1654783945=:26668
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 9 Jun 2022, Gerd Hoffmann wrote:
> On Wed, May 18, 2022 at 12:37:18PM +0200, Paolo Bonzini wrote:
>> On 5/17/22 21:47, BALATON Zoltan wrote:
>>> On Mon, 9 May 2022, BALATON Zoltan wrote:
>>>> On Mon, 2 May 2022, BALATON Zoltan wrote:
>>>>> On Sat, 23 Apr 2022, BALATON Zoltan wrote:
>>>>>> During trying to implement via-ac97 I did some small clean ups to ac97
>>>>>> which is in this series. The via-ac97 is not working yet so that's not
>>>>>> included but these unrelated clean ups could be merged now.
>>>>>>
>>>>>> v3: Fixed misalignments and drop spaces before commas (Víctor Colombo)
>>>>>> v2: Added R-b and changes from Peter Maydell
>>>>>
>>>>> Ping?
>>>>>
>>>>> https://patchew.org/QEMU/cover.1650706617.git.balaton@eik.bme.hu/
>>>>
>>>> Ping2
>>>>
>>>> Gerd, are you getting these messages?
>>>
>>> I got no reply to this so far so I think Gerd is not seeing my messages.
>>> Could someone who can reach him bring it to his attention please?
>>
>> I'll queue these in his stead.
>
> [ /me cleaning up my mailbox, looking for pending patches along the way ]
>
> Thanks.  It seems to not have landed in master yet even though.  Still
> sitting in your queue?  Or should I take it?

I think they are already in master as commits ab9f0f7d44d...dba2b2941ca so 
all is fine.

Regards,
BALATON Zoltan
--3866299591-951608989-1654783945=:26668--

