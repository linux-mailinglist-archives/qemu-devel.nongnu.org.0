Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA5336FF07
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 18:57:50 +0200 (CEST)
Received: from localhost ([::1]:44308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcWSb-0004Gw-P1
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 12:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcWC7-0005c4-Fb; Fri, 30 Apr 2021 12:40:47 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:44745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcWC5-0008Bv-F4; Fri, 30 Apr 2021 12:40:47 -0400
Received: from [192.168.100.1] ([82.142.15.170]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MJW5G-1lrzhs1pMm-00JtqL; Fri, 30 Apr 2021 18:40:20 +0200
Subject: Re: [PATCH v2 05/12] mc146818rtc: put it into the 'misc' category
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org
References: <20201130083630.2520597-1-ganqixin@huawei.com>
 <20201130083630.2520597-6-ganqixin@huawei.com>
 <8c45ab34-2534-d5ad-ca0b-43b49a681e55@redhat.com>
 <65fe4d98-7f79-191e-34c5-c3e5021d2f36@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <93f06ce8-b51e-9804-739a-4c89f2e1d2c4@vivier.eu>
Date: Fri, 30 Apr 2021 18:40:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <65fe4d98-7f79-191e-34c5-c3e5021d2f36@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:pzikn9uHNeP+Ngr+yQ6XyA/EHUW+KGf7MrGy/ltYTCB17BRYCn+
 BnQ/bfxZUYWd09Wh25MffbzYQKVizDACzKwJgruwQqelyxs7PxII8QoSXGNqBqXCrR0po9q
 q6shoIgkrIHdYQ/EXNtclDYTentn74WG8Qlw2E6+VPrJHkQHYfiQcAdDUlvTOvw/TySUTR2
 KBYI1LSJinsUdcqOglGug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Tqt6PT2LqGc=:S69MjH1hroDTgRNqaOagWR
 I/jpME5H6dwcmHAwVjNMfFngXs8m/tgx1eMnJqM4cgLhYw4ScsGyA/EX1Z2ue6+K7jMxNta1l
 gK2xWqiwxFwblA/+2ugj6HBYuKLw+kza5tUOmuj/n7sbOCvcTi0j4S3Cwna7RyIMFTP1/Ptas
 DfKD8j6ltwWWTE4ZN1420fyTdd5TN5VeCw1C7XRS+SBcHnztL7UdxG4w33A5mLZqrS8dSRmkm
 QJCW+1oE9TP91JAkQC0bbfoVvvJ4krYe0bzkvRZ0cO0Cjkz9U2K0yeDQFJqunBHe5xOW71FO2
 ezQ19gzPElDoeq1ggvg9iQPkrEk0pfoxeivPVJPvevuOf1KQWjTUdwg4iasn2B8tq2DEATTr3
 nW+Q6N1InH/qPbTHb9Ixb/a59RKEwfgZQu/6XHPMmGdeWx/9I3iPVDFj6RiHsmo/rMndNTvcC
 aM6V8gB26RTleaNvz21PEBM5DANF8dtZRtjSplWynzVrtdaUWFfXQsRLEP9ghf8HpoM/mVzhW
 6+8r/2LNy04TE/EU923aao=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, zhang.zhanghailiang@huawei.com,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Gan Qixin <ganqixin@huawei.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 24/03/2021 à 18:23, Philippe Mathieu-Daudé a écrit :
> On 12/21/20 12:53 PM, Thomas Huth wrote:
>> On 30/11/2020 09.36, Gan Qixin wrote:
>>> The category of the mc146818rtc device is not set, put it into the 'misc'
>>> category.
>>>
>>> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
>>> ---
>>> Cc: Michael S. Tsirkin <mst@redhat.com>
>>> ---
>>>  hw/rtc/mc146818rtc.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
>>> index 7a38540cb9..39edca0996 100644
>>> --- a/hw/rtc/mc146818rtc.c
>>> +++ b/hw/rtc/mc146818rtc.c
>>> @@ -1039,6 +1039,7 @@ static void rtc_class_initfn(ObjectClass *klass, void *data)
>>>      dc->vmsd = &vmstate_rtc;
>>>      isa->build_aml = rtc_build_aml;
>>>      device_class_set_props(dc, mc146818rtc_properties);
>>> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>>>  }
>>
>> I wonder whether this device should be user_creatable at all (e.g. it uses a
>> hard-coded IO port)... Anyway setting the category certainly does not hurt,
>> thus:
>>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> Can this go via qemu-trivial?
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


