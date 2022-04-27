Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F3F510F8D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 05:28:42 +0200 (CEST)
Received: from localhost ([::1]:52250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njYM5-0003kx-Q7
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 23:28:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1njYKr-0002wl-Sy; Tue, 26 Apr 2022 23:27:25 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:39612 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1njYKo-0005Zu-7W; Tue, 26 Apr 2022 23:27:25 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAB3f5MLuGhixYVJAQ--.28350S2;
 Wed, 27 Apr 2022 11:27:09 +0800 (CST)
Subject: Re: [PATCH qemu 1/9] target/riscv: rvv: Add mask agnostic for vv
 instructions
To: eop Chen <eop.chen@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <165089631935.4839.7564289944057093570-1@git.sr.ht>
 <9deca899-2041-2452-77e4-6fb8a58bc2b8@iscas.ac.cn>
 <240B9B49-C26F-4C31-8B93-78094F27C918@sifive.com>
 <c79a9d80-5723-8f17-9094-e8447d4d7b5a@iscas.ac.cn>
 <C82F9B91-0345-43EA-BC03-8812DCAAD9D9@sifive.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <50622e83-c871-e2c6-e4fb-61932dfa3850@iscas.ac.cn>
Date: Wed, 27 Apr 2022 11:27:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <C82F9B91-0345-43EA-BC03-8812DCAAD9D9@sifive.com>
Content-Type: multipart/alternative;
 boundary="------------006FCA3125BD2BD5170DA0DB"
Content-Language: en-US
X-CM-TRANSID: zQCowAB3f5MLuGhixYVJAQ--.28350S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZr48Cw1Utw45tF1xCryfJFb_yoW5Gw1rpa
 yrC3WUtFZ5XryxWw18uwsrAryFkFs5Gay0kF1DJ3srZ398Zr1vyFWvyw4Fy3Wjyrs8uFyY
 qr1jq34kZan8AFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvE14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj
 6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c
 0EjII2zVCS5cI20VAGYxC7Mx8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vI
 Y487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWI
 evJa73UjIFyTuYvjfU8iSdDUUUU
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

This is a multi-part message in MIME format.
--------------006FCA3125BD2BD5170DA0DB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2022/4/27 上午10:07, eop Chen 写道:
>
>
>>
>> 在 2022/4/27 上午2:20, eop Chen 写道:
>>>
>>>> Weiwei Li <liweiwei@iscas.ac.cn <mailto:liweiwei@iscas.ac.cn>> 於 
>>>> 2022年4月26日 下午4:47 寫道：
>>>> 在 2022/3/17 下午3:26, ~eopxd 写道:
>>>>> From: Yueh-Ting (eop) Chen<eop.chen@sifive.com>
>>>>>
>>>>> This is the first commit regarding the mask agnostic behavior.
>>>>> Added option 'rvv_ma_all_1s' to enable the behavior, the option
>>>>> is default to false.
>>>>>
>>>>> Signed-off-by: eop Chen<eop.chen@sifive.com>
>>>>> Reviewed-by: Frank Chang<frank.chang@sifive.com>
>>>>
>>>> Similar to our last discussion, vext_set_elems_1s_fns array can be 
>>>> simplified to single vext_set_elems_1s,
>>>>
>>>> since the fourth argement can be used as the start offset.
>>>>
>>>> Another question, may be not related to this patchset, in section 
>>>> 3.4.3 of the spec:
>>>>
>>>> /"Mask destination tail elements are always treated as 
>>>> tail-agnostic, regardless of the setting of vta."/
>>>>
>>>> What does "Mask destination tail elements" mean?
>>>>
>>>> Regards,
>>>>
>>>> Weiwei Li
>>>>
>>>
>>> I have just updated a new version for the tail agnostic patch set, 
>>> it also includes a bug fix discovered today.
>>>
>>> Regarding the question, mask / masked-off are for body elements and 
>>> respects the mask policy, and tail elements respect the tail policy.
>>>
>>> Regards,
>>>
>>> eop Chen
>>
>> I find another descriptions in the spec. For the instructions that 
>> write mask register (such as vmadc, vmseq,vmsne,vmfeq...), they all 
>> have similar description
>>
>> (You can search "tail-agnostic" in the spec):
>>
>> /Section 11.4: "Because these instructions produce a mask value, they 
>> always operate with a tail-agnostic policy"//
>> /
>>
>> /Section 11.8/13.13: "Compares //write mask registers, and so always 
>> operate under a tail-agnostic policy"//
>> /
>>
>> /Section 15.1: "Mask elements past vl, the tail elements, are always 
>> updated with a tail-agnostic policy"//
>> /
>>
>> //
>>
>> /Section 15.4/15.5/15.6: "The tail elements in the destination mask 
>> register are updated under a tail-agnostic policy"/
>>
>> So I think "Mask destination tail elements" may means the tail 
>> element for instructions that take mask register as destination 
>> register.  For these instructions,
>>
>> maybe the setting of VTA can be ignored.
>>
>> Regards,
>>
>> Weiwei Li
>>
>
> Yes, the setting of VTA should be ignored when v-spec specifies.
> I think the implementation of the tail agnostic patch set don’t need 
> to change on this.

Sorry. I don't get your idea?

In current patch, these instructions seems need to set the tail elements 
to 1s when vta is true which means

VTA is setted and rvv_ta_all_1s is enabled. If setting of VTA should be 
ignored for these instrucitons,

they will set the tail elements to 1s only when rvv_ta_all_1s is enabled.

Regards,

Weiwei Li

>
> Regards,
>
> eop Chen
>
>
>

--------------006FCA3125BD2BD5170DA0DB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2022/4/27 上午10:07, eop Chen 写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:C82F9B91-0345-43EA-BC03-8812DCAAD9D9@sifive.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <br class="">
      <div class="">
      </div>
      <div><br class="">
        <blockquote type="cite" class="">
          <div class=""><br class="">
          </div>
          <div class="">
            <div class="">
              <div class="moz-cite-prefix">在 2022/4/27 上午2:20, eop Chen
                写道:<br class="">
              </div>
              <blockquote type="cite"
                cite="mid:240B9B49-C26F-4C31-8B93-78094F27C918@sifive.com"
                class="">
                <meta http-equiv="Content-Type" content="text/html;
                  charset=UTF-8" class="">
                <br class="">
                <div class="">
                  <blockquote type="cite" class="">
                    <div class="">Weiwei Li &lt;<a
                        href="mailto:liweiwei@iscas.ac.cn" class=""
                        moz-do-not-send="true">liweiwei@iscas.ac.cn</a>&gt;
                      於 2022年4月26日 下午4:47 寫道：</div>
                    <div class="">
                      <div class="">
                        <div class="moz-cite-prefix">在 2022/3/17 下午3:26,
                          ~eopxd 写道:<br class="">
                        </div>
                        <blockquote type="cite"
                          cite="mid:165089631935.4839.7564289944057093570-1@git.sr.ht"
                          class="">
                          <pre class="moz-quote-pre" wrap="">From: Yueh-Ting (eop) Chen <a class="moz-txt-link-rfc2396E" href="mailto:eop.chen@sifive.com" moz-do-not-send="true">&lt;eop.chen@sifive.com&gt;</a>

This is the first commit regarding the mask agnostic behavior.
Added option 'rvv_ma_all_1s' to enable the behavior, the option
is default to false.

Signed-off-by: eop Chen <a class="moz-txt-link-rfc2396E" href="mailto:eop.chen@sifive.com" moz-do-not-send="true">&lt;eop.chen@sifive.com&gt;</a>
Reviewed-by: Frank Chang <a class="moz-txt-link-rfc2396E" href="mailto:frank.chang@sifive.com" moz-do-not-send="true">&lt;frank.chang@sifive.com&gt;</a>
</pre>
                        </blockquote>
                        <p class="">Similar to our last discussion, 
                          vext_set_elems_1s_fns array can be simplified
                          to single vext_set_elems_1s,<br class="">
                        </p>
                        <p class="">since the fourth argement can be
                          used as the start offset. <br class="">
                        </p>
                        <p class="">Another question, may be not related
                          to this patchset, in section 3.4.3 of the
                          spec: <br class="">
                        </p>
                        <p class=""><i class="">"Mask destination tail
                            elements are always treated as
                            tail-agnostic, regardless of the setting of
                            vta."</i></p>
                        <p class="">What does "Mask destination tail
                          elements" mean?</p>
                        <p class="">Regards,</p>
                        <p class="">Weiwei Li<br class="">
                        </p>
                      </div>
                    </div>
                  </blockquote>
                </div>
                <div class=""><br class="">
                </div>
                <div class="">I have just updated a new version for the
                  tail agnostic patch set, it also includes a bug fix
                  discovered today.</div>
                <div class=""><br class="">
                </div>
                <div class="">Regarding the question, mask / masked-off
                  are for body elements and respects the mask policy,
                  and tail elements respect the tail policy.</div>
                <div class=""><br class="">
                </div>
                <div class="">Regards,</div>
                <div class=""><br class="">
                </div>
                <div class="">eop Chen</div>
              </blockquote>
              <br class="">
              <p class="">I find another descriptions in the spec. For
                the instructions that write mask register (such as
                vmadc, vmseq,vmsne,vmfeq...), they all have similar
                description</p>
              <p class="">(You can search "tail-agnostic" in the spec):</p>
              <p class=""><i class="">Section 11.4: "Because these
                  instructions produce a mask value, they always operate
                  with a tail-agnostic policy"</i><i class=""><br
                    class="">
                </i></p>
              <p class=""><i class="">Section 11.8/13.13: "Compares </i><i
                  class="">write mask registers, and so always operate
                  under a tail-agnostic policy"</i><i class=""><br
                    class="">
                </i></p>
              <p class=""><i class="">Section 15.1: "Mask elements past
                  vl, the tail elements, are always updated with a
                  tail-agnostic policy"</i><i class=""><br class="">
                </i> </p>
              <i class=""> </i>
              <p class=""><i class="">Section 15.4/15.5/15.6: "The tail
                  elements in the destination mask register are updated
                  under a tail-agnostic policy"</i><br class="">
              </p>
              <p class="">So I think "Mask destination tail elements"
                may means the tail element for instructions that take
                mask register as destination register.  For these
                instructions, <br class="">
              </p>
              <p class="">maybe the setting of VTA can be ignored.  <br
                  class="">
              </p>
              <p class="">Regards,</p>
              <p class="">Weiwei Li<br class="">
              </p>
            </div>
          </div>
        </blockquote>
      </div>
      <br class="">
      <div class="">Yes, the setting of VTA should be ignored when
        v-spec specifies.</div>
      <div class="">I think the implementation of the tail agnostic
        patch set don’t need to change on this.</div>
    </blockquote>
    <p>Sorry. I don't get your idea? <br>
    </p>
    <p>In current patch, these instructions seems need to set the tail
      elements to 1s when vta is true which means</p>
    <p> VTA is setted and rvv_ta_all_1s is enabled. If setting of VTA
      should be ignored for these instrucitons,  <br>
    </p>
    <p>they will set the tail elements to 1s only when rvv_ta_all_1s is
      enabled.</p>
    <p>Regards,</p>
    <p>Weiwei Li<br>
    </p>
    <blockquote type="cite"
      cite="mid:C82F9B91-0345-43EA-BC03-8812DCAAD9D9@sifive.com">
      <div class=""><br class="">
      </div>
      <div class="">Regards,</div>
      <div class=""><br class="">
      </div>
      <div class="">eop Chen</div>
      <div class=""><br class="">
      </div>
      <div class=""><br class="">
      </div>
      <div class=""><br class="">
      </div>
    </blockquote>
  </body>
</html>

--------------006FCA3125BD2BD5170DA0DB--


