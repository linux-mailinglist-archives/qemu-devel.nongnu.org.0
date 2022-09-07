Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DC25B09DA
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 18:15:35 +0200 (CEST)
Received: from localhost ([::1]:47376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVxi5-0005lj-CF
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 12:15:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oVxaW-0000NH-7X
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 12:07:40 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:46434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oVxaT-0006q1-Lj
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 12:07:39 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3362474633D;
 Wed,  7 Sep 2022 18:07:26 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id F0BFD7461AE; Wed,  7 Sep 2022 18:07:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id EEC9A745702;
 Wed,  7 Sep 2022 18:07:25 +0200 (CEST)
Date: Wed, 7 Sep 2022 18:07:25 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>
cc: Markus Armbruster <armbru@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>, 
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] audio: add help option (?) for -audiodev
In-Reply-To: <Yxi3MOT/s8nn45zp@redhat.com>
Message-ID: <a264ac8-a94f-9a91-3de0-69ca79b8679a@eik.bme.hu>
References: <20220907142359.31827-1-cfontana@suse.de>
 <87fsh3usub.fsf@pond.sub.org> <Yxi3MOT/s8nn45zp@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1681831414-1662566845=:35947"
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

--3866299591-1681831414-1662566845=:35947
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 7 Sep 2022, Daniel P. Berrangé wrote:
> On Wed, Sep 07, 2022 at 05:06:36PM +0200, Markus Armbruster wrote:
>> Claudio Fontana <cfontana@suse.de> writes:
>>
>>> add a simple help option for -audiodev, so users can do
>>>
>>> qemu -audiodev ?
>>
>> The preferred form is actually '-audiodev help'.  The other one is
>> deprecated.  Recommend to stay away from it even in commit messages.
>
> We introduced 'help' many many years ago, but don't thing we
> ever formally deprecated '?'.  Should we do so and aim to
> remove it, or are we happy to keep '?' forever, despite it
> tripping up shell filename expansion with single char filenames.

Had this conversation before and I think we agreed to keep ? as a 
convenient shorthand even if help is preferred so it should not be 
deprecated but you can keep it from appearing in docs to advertise help as 
the preferred option. (\? is still shorter to type than help if you're 
worried about shell expansion which is rarely a problem in practice)

Regards,
BALATON Zoltan

> (tangential to this patch, NOT a request to fix something in v2)
>
>>>
>>> to get the list of drivers available.
>>>
>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>> ---
>>>  audio/audio.c | 20 ++++++++++++++++++++
>>>  1 file changed, 20 insertions(+)
>
> Update qemu-options.hx ?
>
>
> With regards,
> Daniel
>
--3866299591-1681831414-1662566845=:35947--

