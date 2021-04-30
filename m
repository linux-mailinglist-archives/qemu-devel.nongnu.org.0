Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A992A36FF64
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 19:22:09 +0200 (CEST)
Received: from localhost ([::1]:35662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcWq8-0008MI-KN
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 13:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcWWV-0000WR-Fp; Fri, 30 Apr 2021 13:01:51 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:48677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcWWT-0002eh-HU; Fri, 30 Apr 2021 13:01:51 -0400
Received: from [192.168.100.1] ([82.142.15.170]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MDPuq-1lkjRr3kAQ-00AVJk; Fri, 30 Apr 2021 19:01:42 +0200
Subject: Re: [PATCH] baum: Fix crash when Braille output is not available
To: Thomas Huth <thuth@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org
References: <20210310160815.3411019-1-samuel.thibault@ens-lyon.org>
 <8624f8c8-d541-051a-13f6-f05d685fefde@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <60cd5c4c-26f6-87f6-81b1-e9fcc1440659@vivier.eu>
Date: Fri, 30 Apr 2021 19:01:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8624f8c8-d541-051a-13f6-f05d685fefde@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:s/ANIcAQREBTiXq9A0iAwaoGz8dfpDxrL3yEqMh6S+0IRZk1BeD
 VZ6p6AaPSgl7PYSY1W4bQ/sZQdCX1PuYuZilU2bN5rsJ71HB/OveMYiUOACf12FYIE8P7rP
 OTcXWscBGk/DBtOeQFiJGnsZjfHt/QJUeMpXfjjepjONd7h+r3e2L2qlWWLgnyepgxeAo+w
 rOCoQd5gMgsMB8hC9ckTQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pk0rhs9atdo=:jnTIEn7bB6gJF/CzGmG3eh
 net/vf/whkviAZBMtFXWehPGdpxtbIMB764n+RuGOGgSaRYc2mbFhNQkzTHhBHXhYVhnHJ8zn
 QnUXYwf9tCq/alaJp75pLtw4uG4stg7IE5gHCQHsobeYoBe+ermQY2E6Jm0kaiTZdD7xKYTFi
 lvhTsDThJRyvYjsVcCsPiuxtfEKCfYKDTEPOMkh6nuHMpM3wFE/gupwI+16YQTZShCJADSgHy
 y7brw+BPSNKsJRDYNoYjqM+d20d8BhkylsU54I9Yx8jezMXBV0R1ApVqvJN02N5vCobfbgiQc
 +a3FTxMyRhHvdi91ZLLHz961Y0o3s450E/D45YsMj34IZ3ww74q0uytNdRCqJqvp2a5QN9R2S
 6WcxRVRlEbAUxgi7FY6KzxrLEcOUnv3KbYOn6kq17O5Sykvg2jz5LzClkJfrzFqHzIX9w8+45
 zesYspGWWlNegkjeCcEV8QhCz8Wwky0Jk6Ur/6W8RsqmoaVmUwzpLrJSbKFeOdqdsGLS+JQ+f
 1G7QHSEe2LKgrMCtMM1WfU=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Le 10/03/2021 à 18:23, Thomas Huth a écrit :
> On 10/03/2021 17.08, Samuel Thibault wrote:
>> When Braille output is not available, the backend properly reports being
>> unable to be created, but 5f8e93c3e262 ("util/qemu-timer: Make timer_free()
>> imply timer_del()") made the timer_free() call now refuse any NULL
>> parameter. char_braille_finalize thus now has to be more careful with
>> calling it on baum->cellCount_timer.
>>
>> Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
>> ---
>>   chardev/baum.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/chardev/baum.c b/chardev/baum.c
>> index 5deca778bc..aca5bf12fb 100644
>> --- a/chardev/baum.c
>> +++ b/chardev/baum.c
>> @@ -631,7 +631,9 @@ static void char_braille_finalize(Object *obj)
>>   {
>>       BaumChardev *baum = BAUM_CHARDEV(obj);
>>   -    timer_free(baum->cellCount_timer);
>> +    if (baum->cellCount_timer) {
>> +        timer_free(baum->cellCount_timer);
>> +    }
>>       if (baum->brlapi) {
>>           brlapi__closeConnection(baum->brlapi);
>>           g_free(baum->brlapi);
> 
> I just tried to debug this problem, too, and came to the same conclusion.
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

