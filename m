Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FA56D44FA
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 14:55:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjJiV-0003bf-1e; Mon, 03 Apr 2023 08:55:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pjJiP-0003Xm-KW
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 08:55:17 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pjJiM-0003Oo-8n
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 08:55:17 -0400
Received: from loongson.cn (unknown [10.20.42.238])
 by gateway (Coremail) with SMTP id _____8CxztqqzCpkihAWAA--.22401S3;
 Mon, 03 Apr 2023 20:55:07 +0800 (CST)
Received: from [10.20.42.238] (unknown [10.20.42.238])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bxqr2pzCpkr3AUAA--.16290S3; 
 Mon, 03 Apr 2023 20:55:06 +0800 (CST)
Subject: Re: [RFC PATCH v2 18/44] target/loongarch: Implement vsat
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-19-gaosong@loongson.cn>
 <c30ab882-1b50-7325-87bb-fd273e479e51@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <8d077ca4-9f49-6a38-744e-0a7878df26c9@loongson.cn>
Date: Mon, 3 Apr 2023 20:55:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <c30ab882-1b50-7325-87bb-fd273e479e51@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------EEBB56322351B8EACCD1346A"
Content-Language: en-US
X-CM-TRANSID: AQAAf8Bxqr2pzCpkr3AUAA--.16290S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7ZFWkWF1UKF4DAF1xKF13twb_yoW8Ar4kpr
 y7JrsrG3yrtw18JF48K3WYvr9rAw15Cas8GrZrWrWDJryUGw18Jry7ZFW09r4DXw40yw17
 XF1kJrWjqr4kXw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 DUYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUUbxxYFVCjjxCrM7AC8VAFwI0_Jr0_
 Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFV
 AK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2
 z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr
 1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG
 8wAqjxCEc2xF0cIa020Ex4CE44I27wAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aV
 AFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx8GjcxK6IxK0xII
 j40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
 Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_JrI_JrWlx2IqxVCjr7xvwVAFwI0_JrI_JrWl
 x4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
 1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_
 JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCT
 nIWIevJa73UjIFyTuYvjxUz4SrUUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-1.349, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
--------------EEBB56322351B8EACCD1346A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi, Richard

在 2023/4/1 下午1:03, Richard Henderson 写道:
> On 3/27/23 20:06, Song Gao wrote:
>> +static void gen_vsat_s(unsigned vece, TCGv_vec t, TCGv_vec a, 
>> int64_t imm)
>> +{
>> +    TCGv_vec t1;
>> +    int64_t max  = (1l << imm) - 1;
>
> This needed 1ull, but better to just use
>
>     max = MAKE_64BIT_MASK(0, imm - 1); 
For the signed  version use ll?
I think use MAKE_64BIT_MASK(0, imm -1 )  for the signed version is not 
suitable.

e.g   imm is 1,

  imm is 1
1ll << imm  -1    1
1ull << imm  -1   1
MAKE_64BIT_MASK   ffffffffffffffff

vsat.w    vr 22  vr25  0x1.
input  vr25:   {0, 0}
result vr22: {0, 0}
if we use MAKE_64BIT_MASK ,   result is {ffffffffffffffff, 
ffffffffffffffff}.


This is   RISU test log:

......

imm is d
1ll << imm  -1    1fff
1ull << imm  -1   1fff
MAKE_64BIT_MASK   fff
imm is 8
1ll << imm  -1    ff
1ull << imm  -1   ff
MAKE_64BIT_MASK   7f
imm is 7
1ll << imm  -1    7f
1ull << imm  -1   7f
MAKE_64BIT_MASK   3f
imm is 1d
1ll << imm  -1    1fffffff
1ull << imm  -1   1fffffff
MAKE_64BIT_MASK   fffffff
imm is 29
1ll << imm  -1    1ffffffffff
1ull << imm  -1   1ffffffffff
MAKE_64BIT_MASK   ffffffffff
imm is 6
1ll << imm  -1    3f
1ull << imm  -1   3f
MAKE_64BIT_MASK   1f
imm is 3
1ll << imm  -1    7
1ull << imm  -1   7
MAKE_64BIT_MASK   3
imm is 1
1ll << imm  -1    1
1ull << imm  -1   1
MAKE_64BIT_MASK   ffffffffffffffff
Mismatch reg after 63 checkpoints

......

mismatch detail (master : apprentice):
   f22    : 0000000000000000 vs ffffffffffffffff
   v22    : {0000000000000000, 0000000000000000} vs {ffffffffffffffff, 
ffffffffffffffff}

Thanks.
Song Gao.

--------------EEBB56322351B8EACCD1346A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi, Richard<br>
    </p>
    <div class="moz-cite-prefix">在 2023/4/1 下午1:03, Richard Henderson
      写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:c30ab882-1b50-7325-87bb-fd273e479e51@linaro.org">On
      3/27/23 20:06, Song Gao wrote:
      <br>
      <blockquote type="cite" style="color: #000000;">+static void
        gen_vsat_s(unsigned vece, TCGv_vec t, TCGv_vec a, int64_t imm)
        <br>
        +{
        <br>
        +    TCGv_vec t1;
        <br>
        +    int64_t max  = (1l &lt;&lt; imm) - 1;
        <br>
      </blockquote>
      <br>
      This needed 1ull, but better to just use
      <br>
      <br>
          max = MAKE_64BIT_MASK(0, imm - 1);
    </blockquote>
    For the signed  version use ll? <br>
    I think use MAKE_64BIT_MASK(0, imm -1 )  for the signed version is
    not suitable.<br>
    <p>e.g   imm is 1, </p>
     imm is 1<br>
    1ll &lt;&lt; imm  -1    1<br>
    1ull &lt;&lt; imm  -1   1<br>
    MAKE_64BIT_MASK   ffffffffffffffff<br>
    <br>
    vsat.w    vr 22  vr25  0x1.<br>
    input  vr25:   {0, 0}<br>
    result vr22: {0, 0}    <br>
    if we use MAKE_64BIT_MASK ,   result is {ffffffffffffffff,
    ffffffffffffffff}.<br>
    <p><br>
    </p>
    <p>This is   RISU test log:<br>
    </p>
    <p>......</p>
    <p>imm is d<br>
      1ll &lt;&lt; imm  -1    1fff<br>
      1ull &lt;&lt; imm  -1   1fff<br>
      MAKE_64BIT_MASK   fff<br>
      imm is 8<br>
      1ll &lt;&lt; imm  -1    ff<br>
      1ull &lt;&lt; imm  -1   ff<br>
      MAKE_64BIT_MASK   7f<br>
      imm is 7<br>
      1ll &lt;&lt; imm  -1    7f<br>
      1ull &lt;&lt; imm  -1   7f<br>
      MAKE_64BIT_MASK   3f<br>
      imm is 1d<br>
      1ll &lt;&lt; imm  -1    1fffffff<br>
      1ull &lt;&lt; imm  -1   1fffffff<br>
      MAKE_64BIT_MASK   fffffff<br>
      imm is 29<br>
      1ll &lt;&lt; imm  -1    1ffffffffff<br>
      1ull &lt;&lt; imm  -1   1ffffffffff<br>
      MAKE_64BIT_MASK   ffffffffff<br>
      imm is 6<br>
      1ll &lt;&lt; imm  -1    3f<br>
      1ull &lt;&lt; imm  -1   3f<br>
      MAKE_64BIT_MASK   1f<br>
      imm is 3<br>
      1ll &lt;&lt; imm  -1    7<br>
      1ull &lt;&lt; imm  -1   7<br>
      MAKE_64BIT_MASK   3<br>
      imm is 1<br>
      1ll &lt;&lt; imm  -1    1<br>
      1ull &lt;&lt; imm  -1   1<br>
      MAKE_64BIT_MASK   ffffffffffffffff<br>
      Mismatch reg after 63 checkpoints<br>
    </p>
    <p>......</p>
    <p>mismatch detail (master : apprentice):<br>
        f22    : 0000000000000000 vs ffffffffffffffff<br>
        v22    : {0000000000000000, 0000000000000000} vs
      {ffffffffffffffff, ffffffffffffffff}<br>
      <br>
    </p>
    Thanks.<br>
    Song Gao.<br>
  </body>
</html>

--------------EEBB56322351B8EACCD1346A--


