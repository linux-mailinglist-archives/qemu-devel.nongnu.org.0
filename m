Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C99B54CFE73
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:27:37 +0100 (CET)
Received: from localhost ([::1]:51860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCSe-0006vI-To
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:27:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nRCQr-0003VY-Hb
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:25:46 -0500
Received: from [2001:738:2001:2001::2001] (port=47327 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nRCQn-0001Nu-Sv
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:25:44 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0020A745958;
 Mon,  7 Mar 2022 13:25:36 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D0AC974581A; Mon,  7 Mar 2022 13:25:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CE86574579D;
 Mon,  7 Mar 2022 13:25:36 +0100 (CET)
Date: Mon, 7 Mar 2022 13:25:36 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH 2/2] ui/cocoa: add option to swap Option and Command
In-Reply-To: <4c171d81-576f-e2ff-787f-9b9744f79013@gmail.com>
Message-ID: <d459463b-c093-8a57-278-ef85c8fa464@eik.bme.hu>
References: <20220306111114.18285-1-akihiko.odaki@gmail.com>
 <20220306111114.18285-3-akihiko.odaki@gmail.com>
 <a2a389c-b253-133b-9415-ecc5a352c2e@eik.bme.hu> <87lexmw7t8.fsf@pond.sub.org>
 <4c171d81-576f-e2ff-787f-9b9744f79013@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Gustavo Noronha Silva <gustavo@noronha.dev.br>, Eric Blake <eblake@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Mar 2022, Akihiko Odaki wrote:
> On 2022/03/07 16:17, Markus Armbruster wrote:
>> BALATON Zoltan <balaton@eik.bme.hu> writes:
>> 
>>> On Sun, 6 Mar 2022, Akihiko Odaki wrote:
>>>> From: Gustavo Noronha Silva <gustavo@noronha.dev.br>
>>>> 
>>>> On Mac OS X the Option key maps to Alt and Command to Super/Meta. This 
>>>> change
>>>> swaps them around so that Alt is the key closer to the space bar and 
>>>> Meta/Super
>>>> is between Control and Alt, like on non-Mac keyboards.
>>>> 
>>>> It is a cocoa display option, disabled by default.
>>>> 
>>>> Acked-by: Markus Armbruster <armbru@redhat.com>
>>>> Signed-off-by: Gustavo Noronha Silva <gustavo@noronha.dev.br>
>>>> Message-Id: <20210713213200.2547-3-gustavo@noronha.dev.br>
>>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>>>> ---
>>>> qapi/ui.json    |  8 ++++++-
>>>> qemu-options.hx |  3 ++-
>>>> ui/cocoa.m      | 64 ++++++++++++++++++++++++++++++++++++++++++-------
>>>> 3 files changed, 65 insertions(+), 10 deletions(-)
>>>> 
>>>> diff --git a/qapi/ui.json b/qapi/ui.json
>>>> index 1e9893419fe..b082e1a7dee 100644
>>>> --- a/qapi/ui.json
>>>> +++ b/qapi/ui.json
>>>> @@ -1270,10 +1270,16 @@
>>>> #             a global grab on key events. (default: off)
>>>> #             See 
>>>> https://support.apple.com/en-in/guide/mac-help/mh32356/mac
>>>> #
>>>> +# @swap-option-command: Swap the Option and Command keys so that their 
>>>> key
>>>> +#                       codes match their position on non-Mac keyboards 
>>>> and
>>>> +#                       you can use Meta/Super and Alt where you expect 
>>>> them.
>>>> +#                       (default: off)
>>>> +#
>>>> # Since: 6.1
>>>> ##
>>>> { 'struct'  : 'DisplayCocoa',
>>>> -  'data'    : { '*full-grab'     : 'bool' } }
>>>> +  'data'    : { '*full-grab'           : 'bool',
>>>> +                '*swap-option-command' : 'bool' } }
>>> 
>>> This option name is too long to type. Could we abbreviate it somehow?
>> 
>> We've largely avoided abbreviations in the QAPI schema, for better or
>> worse.

There are already some abreviated options in this file and since users 
will need to use it to switch this on it's better to have something that 
can be typed without too much hassle and result in a command that still 
fits in a window...

>>> Like swap-opt-cmd or swap-alt-meta?
>> 
>> We should stick to how the keys are generally called on this platform.
>> I can't say (I'm not using it).
>> 
>
> The patch series is now in:
> https://patchew.org/QEMU/20220306231753.50277-1-philippe.mathieu.daude@gmail.com/
>
> It uses swap-opt-cmd for the name. Please reply to the series if it is 
> problematic.

The more common name for these keys on macOS is option and command 
although the opt key sometimes also has alt written on it and the code 
seems to use meta instead of command but I think swap-opt-cmd is simple 
and clear so unless it's mandatory to have very long options that's not 
practical for users I'd go with swap-opt-cmd (which is what's in the last 
patch from Philippe so it should be OK).

Regards,
BALATON Zoltan

