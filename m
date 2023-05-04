Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B776F6A0F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 13:34:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puXE1-0003vm-LO; Thu, 04 May 2023 07:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1puXDo-0003uK-Da
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:34:04 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1puXDl-0001TL-Jf
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:34:04 -0400
Received: from loongson.cn (unknown [10.20.42.57])
 by gateway (Coremail) with SMTP id _____8DxBekhmFNkcpkEAA--.7567S3;
 Thu, 04 May 2023 19:33:54 +0800 (CST)
Received: from [10.20.42.57] (unknown [10.20.42.57])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxddEgmFNkktpJAA--.5364S3; 
 Thu, 04 May 2023 19:33:52 +0800 (CST)
Subject: Re: [RFC PATCH v4 00/44] Add LoongArch LSX instructions
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 maobibo@loongson.cn
References: <20230425070248.2550028-1-gaosong@loongson.cn>
 <8a821169-6dc3-ab82-bd32-990b0f9a8c98@linaro.org>
 <b6243a8d-8ef6-7609-b71c-fd3cddb69d67@loongson.cn>
 <80c6ed35-1d19-eb6a-0e3b-6fbf23d8540c@linaro.org>
 <620c7286-f643-b7f8-5e21-56f3890db25a@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <5ab5deb9-707f-5b68-bd34-86c1efa159b9@loongson.cn>
Date: Thu, 4 May 2023 19:33:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <620c7286-f643-b7f8-5e21-56f3890db25a@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------1F08D90EB2DE16AB1B830D32"
Content-Language: en-US
X-CM-TRANSID: AQAAf8DxddEgmFNkktpJAA--.5364S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Ar1xXr45tw18ZrWkZr1xuFg_yoW8Gw1DpF
 4Fqan7GF9rJ3W8Jry8C3Wqya4Iya48K3yUCw1kGrW8uFn8uF9xJrWjv3W8W3WrWrZ2gF4U
 Aw1avryruwn8J3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 DUYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUUb4xYFVCjjxCrM7AC8VAFwI0_Jr0_
 Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFV
 AK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2
 z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM2
 8EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc80
 4VCY07AIYIkI8VC2zVCFFI0UMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxV
 WUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l7480Y4vEI4kI2Ix0rVAq
 x4xJMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUGVWUWwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
 42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxh
 VjvjDU0xZFpf9x07UBGQDUUUUU=
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-4.28, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a multi-part message in MIME format.
--------------1F08D90EB2DE16AB1B830D32
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2023/5/4 下午5:41, Richard Henderson 写道:
> On 5/4/23 09:25, Richard Henderson wrote:
>> On 5/4/23 02:26, Song Gao wrote:
>>>>> V4:
>>>>>    - R-b and rebase;
>>>>>    - Migrate the upper half lsx regs;
>>>>>    - Remove tcg_gen_mulus2_*;
>>>>>    - Vsetallnez use !do_match2;
>>>>>    - Use tcg_gen_concat_i64_i128/tcg_gen_extr_i128_i64 to replace
>>>>>      TCGV128_LOW(val)/TCGV128_High(val);
>>>>
>>>> One minor nit, everything reviewed!  Congratulations.
>>>>
>>> Thank you for your guidance and review.
>>>
>>> Since all patches are reviewed, how about drop 'RFC' on v5?
>>
>> Sure.
>>
>>> I am  really not sure When the Vol2 will be open.
>>
>> That is unfortunate.
>>
>> I think the timing of the merge of this code is now up to you as 
>> maintainer of the Loongson target.  As an employee of the company you 
>> have more insight into the status of the extension, whether it is 
>> already present in shipping silicon, or completed final draft, or 
>> still beta, etc.
>>
>> Even if the extension is finalized, I see no reason why you should 
>> not be able to merge, 
>
> Oops.  "Even if the extension is *not* finalized..."
> I.e., a beta extension can be merged if it is off by default. 
Thanks for  your explanation.

The  'la464' supports LSX and LASX by default.  The 'la364' supports LSX 
by default.
Neither of these are beta extensions. They are already present in the 
shipping silicon and have been finalized.

And the 'la664' also supports LSX and LASX by default.

I will send v5 series.

Thanks.
Song Gao

--------------1F08D90EB2DE16AB1B830D32
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2023/5/4 下午5:41, Richard Henderson
      写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:620c7286-f643-b7f8-5e21-56f3890db25a@linaro.org">On
      5/4/23 09:25, Richard Henderson wrote:
      <br>
      <blockquote type="cite" style="color: #000000;">On 5/4/23 02:26,
        Song Gao wrote:
        <br>
        <blockquote type="cite" style="color: #000000;">
          <blockquote type="cite" style="color: #000000;">
            <blockquote type="cite" style="color: #000000;">V4:
              <br>
                 - R-b and rebase;
              <br>
                 - Migrate the upper half lsx regs;
              <br>
                 - Remove tcg_gen_mulus2_*;
              <br>
                 - Vsetallnez use !do_match2;
              <br>
                 - Use tcg_gen_concat_i64_i128/tcg_gen_extr_i128_i64 to
              replace
              <br>
                   TCGV128_LOW(val)/TCGV128_High(val);
              <br>
            </blockquote>
            <br>
            One minor nit, everything reviewed!  Congratulations.
            <br>
            <br>
          </blockquote>
          Thank you for your guidance and review.
          <br>
          <br>
          Since all patches are reviewed, how about drop 'RFC' on v5?
          <br>
        </blockquote>
        <br>
        Sure.
        <br>
        <br>
        <blockquote type="cite" style="color: #000000;">I am  really not
          sure When the Vol2 will be open.
          <br>
        </blockquote>
        <br>
        That is unfortunate.
        <br>
        <br>
        I think the timing of the merge of this code is now up to you as
        maintainer of the Loongson target.  As an employee of the
        company you have more insight into the status of the extension,
        whether it is already present in shipping silicon, or completed
        final draft, or still beta, etc.
        <br>
        <br>
        Even if the extension is finalized, I see no reason why you
        should not be able to merge, </blockquote>
      <br>
      Oops.  "Even if the extension is <b class="moz-txt-star"><span
          class="moz-txt-tag">*</span>not<span class="moz-txt-tag">*</span></b>
      finalized..."
      <br>
      I.e., a beta extension can be merged if it is off by default.
    </blockquote>
    Thanks for  your explanation.<br>
    <br>
    The  'la464' supports LSX and LASX by default.  The 'la364' supports
    LSX by default.<br>
    Neither of these are beta extensions. They are already present in
    the shipping silicon and have been finalized.<br>
    <br>
    And the 'la664' also supports LSX and LASX by default.  <br>
    <br>
    I will send v5 series.<br>
    <br>
    Thanks.<br>
    Song Gao<br>
  </body>
</html>

--------------1F08D90EB2DE16AB1B830D32--


