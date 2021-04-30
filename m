Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCB036FF8C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 19:32:47 +0200 (CEST)
Received: from localhost ([::1]:34554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcX0Q-00039p-5E
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 13:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcWcN-00067m-1b; Fri, 30 Apr 2021 13:07:55 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:59535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcWcK-0003l6-TR; Fri, 30 Apr 2021 13:07:54 -0400
Received: from [192.168.100.1] ([82.142.15.170]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MeD1l-1l3CCL3bbL-00bHBg; Fri, 30 Apr 2021 19:07:47 +0200
Subject: Re: [PATCH] baum: Fix crash when Braille output is not available
From: Laurent Vivier <laurent@vivier.eu>
To: Thomas Huth <thuth@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org
References: <20210310160815.3411019-1-samuel.thibault@ens-lyon.org>
 <8624f8c8-d541-051a-13f6-f05d685fefde@redhat.com>
 <60cd5c4c-26f6-87f6-81b1-e9fcc1440659@vivier.eu>
Message-ID: <cdc1b3cd-5518-45b7-cbee-5c36e0f42473@vivier.eu>
Date: Fri, 30 Apr 2021 19:07:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <60cd5c4c-26f6-87f6-81b1-e9fcc1440659@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:oRhqVxU1Cmlm+kR0Xsb6QMjD4dU44gtcjXTjADQ2IzBg93nZUaJ
 o0SStsY7yZeeTtA7WgS4WX6ZI5sEmiPHmAOanjeFWO9JU7d3/op0JARyIMfA2Muf2ckQMXD
 mMmqIct3Z8XRiWILZcZ1Yp/6h9WW7+buPgpEKtl4kg4Jh1LbVR7H1bVYj/4Yf+3I89IKfYI
 WdJtGE4AeoNOBQL6tHqdg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+hqClVkEnjE=:aYWKrw4WC+QioYx+g3xzZQ
 ydS0n+D+Jdd16LbVBe3le23+GSRmm8pqjnbR8wpvaf51fgA169rPXJffH24VH6HpuNXkmlAtX
 evD1reqxe3Vsx4P0A72E9CSA5CdBdJe1dDXHyAzmuQvRtVPv2cayNqDHGPyJpBen+6sWadGtL
 WCL1E3XNmo1izc8obCcZek2zyG7OqQElV8+2X1GiQjq616zICp4r/7yRVVbLMC8U44EtAj9n2
 J3Kr/GeK8jwt8lTE3FNGrtC+yqOILjJ5RNQ2Ng10YtMyTdiCYdi1+LEiL1mHoP3F0l9xQ8rYH
 S9wAaMsE/KNjJNJHvtbplPlzyg80Y1frqtpifGgOYXHHL6EJk5B+XlbBjkO4TrIPDRD9Cuzac
 9QQUsnZRPMei3kmvOKGD9XaAEjHhdFx+zxDYtZLvfhmr9Y1jSdjdIi8fGO0wL/SsoQyOYGdMt
 xjgs0KbvkvdQXlIIwMv3xEdlldnmVsGPE/CBbELzdls4lhLmo4ok2qq2G465o4hcXJbfEei0/
 OaJcKjdRSaPZNCwS8faArA=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 30/04/2021 à 19:01, Laurent Vivier a écrit :
> Le 10/03/2021 à 18:23, Thomas Huth a écrit :
>> On 10/03/2021 17.08, Samuel Thibault wrote:
>>> When Braille output is not available, the backend properly reports being
>>> unable to be created, but 5f8e93c3e262 ("util/qemu-timer: Make timer_free()
>>> imply timer_del()") made the timer_free() call now refuse any NULL
>>> parameter. char_braille_finalize thus now has to be more careful with
>>> calling it on baum->cellCount_timer.
>>>
>>> Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
>>> ---
>>>   chardev/baum.c | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/chardev/baum.c b/chardev/baum.c
>>> index 5deca778bc..aca5bf12fb 100644
>>> --- a/chardev/baum.c
>>> +++ b/chardev/baum.c
>>> @@ -631,7 +631,9 @@ static void char_braille_finalize(Object *obj)
>>>   {
>>>       BaumChardev *baum = BAUM_CHARDEV(obj);
>>>   -    timer_free(baum->cellCount_timer);
>>> +    if (baum->cellCount_timer) {
>>> +        timer_free(baum->cellCount_timer);
>>> +    }
>>>       if (baum->brlapi) {
>>>           brlapi__closeConnection(baum->brlapi);
>>>           g_free(baum->brlapi);
>>
>> I just tried to debug this problem, too, and came to the same conclusion.
>>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>
>>
> 
> Applied to my trivial-patches branch.
> 

Unapplied from my branch because of:

https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg03457.html

[missed it because all the thread was not cc'ed to trivial]

Thanks,
Laurent

