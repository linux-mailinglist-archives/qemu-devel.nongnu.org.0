Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A089651E4E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 11:02:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Z2w-0005B9-QI; Tue, 20 Dec 2022 04:36:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1p7Z2c-0004wV-Ks
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 04:36:06 -0500
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1p7Z2Y-000382-MR
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 04:36:06 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
 TI=SMTPD_---0VXkztOZ_1671528951; 
Received: from 30.39.253.78(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VXkztOZ_1671528951) by smtp.aliyun-inc.com;
 Tue, 20 Dec 2022 17:35:52 +0800
Content-Type: multipart/alternative;
 boundary="------------KNZfRptztUM012xWtfH0GBm1"
Message-ID: <dd39a372-3a81-f6fe-8219-cf337394e42c@linux.alibaba.com>
Date: Tue, 20 Dec 2022 17:35:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 01/11] contrib/gitdm: add C-Sky to the domain map
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Guo Ren <ren_guo@c-sky.com>,
 Liu Zhiwei <zhiwei_liu@c-sky.com>, guo_ren@linux.alibaba.com
References: <20221219121914.851488-1-alex.bennee@linaro.org>
 <20221219121914.851488-2-alex.bennee@linaro.org>
 <b674a0e9-28a7-76b6-d1a1-d34807a803de@linux.alibaba.com>
 <875ye6iir7.fsf@linaro.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <875ye6iir7.fsf@linaro.org>
Received-SPF: pass client-ip=115.124.30.45;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-45.freemail.mail.aliyun.com
X-Spam_score_int: -109
X-Spam_score: -11.0
X-Spam_bar: -----------
X-Spam_report: (-11.0 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

This is a multi-part message in MIME format.
--------------KNZfRptztUM012xWtfH0GBm1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2022/12/20 16:23, Alex Bennée wrote:
> LIU Zhiwei<zhiwei_liu@linux.alibaba.com>  writes:
>
>> The c-sky domain mail is no longer being used for Guo Ren and me.
>>
>> C-SKY company and C-SKY arch is still existing, but its website domain
>> has been moved tohttps://www.t-head.cn/.
> Is this the new corporate entity for the C-SKY architecture?
Yes, it is the website of new entity. And the new entity is T-Head 
Semiconductor.
> I can
> change the domain-map for that and add the old c-sky.com emails to a
> group map.

If possible, I think

/linux.alibaba.com  Alibaba/

is appreciated.

>
>> Otherwise,
>>
>> Reviewed-by: LIU Zhiwei<zhiwei_liu@linux.alibaba.com>
> Or map your old c-sky.com email addresses to your current address via
> the .mailmap.

If it doesn't conflict  with the domain-map, nor bother too much for 
you, please go ahead with this.

Thanks,
Zhiwei

>
>>
>> Thanks,
>> Zhiwei
>>
>> On 2022/12/19 20:19, Alex Bennée wrote:
>>> Although the majority of the recent work has been done by LIU Zhiwei
>>> it does appear to be a corporate effort.
>>>
>>> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
>>> Cc: Guo Ren<ren_guo@c-sky.com>
>>> Cc: Liu Zhiwei<zhiwei_liu@c-sky.com>
>>> ---
>>>    contrib/gitdm/domain-map | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
>>> index 3727918641..6f3a24b399 100644
>>> --- a/contrib/gitdm/domain-map
>>> +++ b/contrib/gitdm/domain-map
>>> @@ -7,6 +7,7 @@
>>>    amd.com         AMD
>>>    baidu.com       Baidu
>>>    bytedance.com   ByteDance
>>> +c-sky.com       C-Sky
>>>    cmss.chinamobile.com China Mobile
>>>    citrix.com      Citrix
>>>    crudebyte.com   Crudebyte
>
--------------KNZfRptztUM012xWtfH0GBm1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022/12/20 16:23, Alex Bennée wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:875ye6iir7.fsf@linaro.org">
      <pre class="moz-quote-pre" wrap="">
LIU Zhiwei <a class="moz-txt-link-rfc2396E" href="mailto:zhiwei_liu@linux.alibaba.com">&lt;zhiwei_liu@linux.alibaba.com&gt;</a> writes:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">The c-sky domain mail is no longer being used for Guo Ren and me.

C-SKY company and C-SKY arch is still existing, but its website domain
has been moved to <a class="moz-txt-link-freetext" href="https://www.t-head.cn/">https://www.t-head.cn/</a>.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Is this the new corporate entity for the C-SKY architecture? </pre>
    </blockquote>
    Yes, it is the website of new entity. And the new entity is T-Head 
    Semiconductor.<br>
    <blockquote type="cite" cite="mid:875ye6iir7.fsf@linaro.org">
      <pre class="moz-quote-pre" wrap="">I can
change the domain-map for that and add the old c-sky.com emails to a
group map.</pre>
    </blockquote>
    <p>If possible, I think</p>
    <p><i><font face="monospace">linux.alibaba.com  Alibaba</font></i></p>
    <p>is appreciated.<br>
    </p>
    <blockquote type="cite" cite="mid:875ye6iir7.fsf@linaro.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Otherwise,

Reviewed-by: LIU Zhiwei <a class="moz-txt-link-rfc2396E" href="mailto:zhiwei_liu@linux.alibaba.com">&lt;zhiwei_liu@linux.alibaba.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Or map your old c-sky.com email addresses to your current address via
the .mailmap.</pre>
    </blockquote>
    <p>If it doesn't conflict  with the domain-map, nor bother too much
      for you, please go ahead with this.<br>
    </p>
    <p>Thanks,<br>
      Zhiwei<br>
    </p>
    <blockquote type="cite" cite="mid:875ye6iir7.fsf@linaro.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

Thanks,
Zhiwei

On 2022/12/19 20:19, Alex Bennée wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Although the majority of the recent work has been done by LIU Zhiwei
it does appear to be a corporate effort.

Signed-off-by: Alex Bennée <a class="moz-txt-link-rfc2396E" href="mailto:alex.bennee@linaro.org">&lt;alex.bennee@linaro.org&gt;</a>
Cc: Guo Ren <a class="moz-txt-link-rfc2396E" href="mailto:ren_guo@c-sky.com">&lt;ren_guo@c-sky.com&gt;</a>
Cc: Liu Zhiwei <a class="moz-txt-link-rfc2396E" href="mailto:zhiwei_liu@c-sky.com">&lt;zhiwei_liu@c-sky.com&gt;</a>
---
  contrib/gitdm/domain-map | 1 +
  1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 3727918641..6f3a24b399 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -7,6 +7,7 @@
  amd.com         AMD
  baidu.com       Baidu
  bytedance.com   ByteDance
+c-sky.com       C-Sky
  cmss.chinamobile.com China Mobile
  citrix.com      Citrix
  crudebyte.com   Crudebyte
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

</pre>
    </blockquote>
  </body>
</html>

--------------KNZfRptztUM012xWtfH0GBm1--

