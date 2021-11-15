Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8BE44FDCA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 05:01:14 +0100 (CET)
Received: from localhost ([::1]:57740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmTBA-00008G-T1
	for lists+qemu-devel@lfdr.de; Sun, 14 Nov 2021 23:01:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mmT9y-0007sF-VA
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 22:59:58 -0500
Received: from mail.loongson.cn ([114.242.206.163]:43842 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mmT9t-00024R-Dg
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 22:59:58 -0500
Received: from [10.20.42.193] (unknown [10.20.42.193])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxmuQS25FhbQgAAA--.281S3;
 Mon, 15 Nov 2021 11:59:14 +0800 (CST)
Subject: Re: [PATCH v10 04/26] target/loongarch: Add fixed point arithmetic
 instruction translation
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <1636700049-24381-1-git-send-email-gaosong@loongson.cn>
 <1636700049-24381-5-git-send-email-gaosong@loongson.cn>
 <7e6e5c26-2c1a-e4b5-a724-c2db33a36180@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <5c3c3107-da7f-7e13-189e-866c7ff1acde@loongson.cn>
Date: Mon, 15 Nov 2021 11:59:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <7e6e5c26-2c1a-e4b5-a724-c2db33a36180@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------36DBB13C8EDA14317D441ED6"
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxmuQS25FhbQgAAA--.281S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZFyfKry3WFWUWryDtF17trb_yoW5Gr18pr
 10kryxGrW0yr18J3WrtF45W345tr15Xa43J3s8C3WvqF15J3Wjv3W3X3yYgr42yrs7GF1Y
 qFW5XryqvF9Yg3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvE1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2
 jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzx
 vE52x082IY62kv0487McIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8
 JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYx
 C7Mx8GjcxK6IxK0xIIj40E5I8CrwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVCm-wCF
 04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26ryrJr1UJwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r106r1rMI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWI
 evJa73UjIFyTuYvjfUwYFCUUUUU
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-3.402, SPF_HELO_PASS=-0.001,
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------36DBB13C8EDA14317D441ED6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Richard,

On 2021/11/12 下午10:05, Richard Henderson wrote:
> On 11/12/21 7:53 AM, Song Gao wrote:
>> +#
>> +# Fields
>> +#
>> +%rd      0:5
>> +%rj      5:5
>> +%rk      10:5
>> +%sa2     15:2
>> +%si12    10:s12
>> +%ui12    10:12
>> +%si16    10:s16
>> +%si20    5:s20
>
> You should only create separate field definitions like this when they 
> are complex: e.g. the logical field is disjoint or there's a need for 
> !function.
>
>> +
>> +#
>> +# Argument sets
>> +#
>> +&fmt_rdrjrk         rd rj rk
>> +&fmt_rdrjsi12       rd rj si12
>> +&fmt_rdrjrksa2      rd rj rk sa2
>> +&fmt_rdrjsi16       rd rj si16
>> +&fmt_rdrjui12       rd rj ui12
>> +&fmt_rdsi20         rd si20
>
> Some of these should be combined.  The width of the immediate is a 
> detail of the format, not the decoded argument set.  Thus you should have
>
> &fmt_rdimm     rd imm
> &fmt_rdrjimm   rd rj imm
> &fmt_rdrjrk    rd rj rk
> &fmt_rdrjrksa  rd rj rk sa
>
'The width of the immediate is a detail of the format'  means:

&fmt_rdrjimm         rd  rj imm

@fmt_rdrjimm         .... ...... imm:12  rj:5 rd:5     &fmt_rdrjimm
@fmt_rdrjimm14         .... .... imm:14  rj:5 rd:5     &fmt_rdrjimm
@fmt_rdrjimm16           .... .. imm:16  rj:5 rd:5     &fmt_rdrjimm

and we print in the disassembly, liks this

output_rdrjimm(DisasContext *ctx, arg_fmt_rdrjimm * a,  const char *mnemonic)
{
     output(ctx, mnemonic, "%s, %s, 0x%x", regnames[a->rd], regnames[a->rj], a->imm);
}

is that right?

>> +alsl_w           0000 00000000 010 .. ..... ..... .....   
>> @fmt_rdrjrksa2
>> +alsl_wu          0000 00000000 011 .. ..... ..... .....   
>> @fmt_rdrjrksa2
>> +alsl_d           0000 00000010 110 .. ..... ..... .....   
>> @fmt_rdrjrksa2
>
> The encoding of these insns is that the shift is sa+1.
>
> While you compensate for this in gen_alsl_*, we print the "wrong" 
> number in the disassembly.  I think it would be better to do
>
> %sa2p1     15:2 !function=plus_1
> @fmt_rdrjrksa2p1  .... ........ ... .. rk:5 rj:5 rd:5 \
>                   &fmt_rdrjrksa sa=%sa2p1
>
1. We print sa in disassembly output_rdrjrksa(DisasContext *ctx, 
arg_fmt_rdrjsa* a, const char *memonic) { output(ctx, memonic, "%s, %s, 
%s, 0x0x", regnames[a->rd], regnames[a->rj], a->sa) } 2. We use sa on 
gen_alsl_* not (sa2+1). 3 bytepick_w use the same print functions. but 
the Field/Argurment/Format is %sa2 15:2 &fmt_rdrjrksa rd rj sa 
@fmt_rdrjrk sa2 .... ........ ... sa:2 rk:5 rj:5 rd:5 &fmt_rdrjrksa Is 
my understanding right? Thanks. Song Gao


--------------36DBB13C8EDA14317D441ED6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix"><tt><br>
      </tt></div>
    <div class="moz-cite-prefix"><tt>Hi Richard,</tt></div>
    <div class="moz-cite-prefix"><tt><br>
      </tt></div>
    <div class="moz-cite-prefix"><tt>On 2021/11/12 下午10:05, Richard
        Henderson wrote:</tt><tt><br>
      </tt></div>
    <blockquote type="cite"
      cite="mid:7e6e5c26-2c1a-e4b5-a724-c2db33a36180@linaro.org"><tt>On
        11/12/21 7:53 AM, Song Gao wrote:
      </tt><tt><br>
      </tt>
      <blockquote type="cite"><tt>+#
        </tt><tt><br>
        </tt><tt>+# Fields
        </tt><tt><br>
        </tt><tt>+#
        </tt><tt><br>
        </tt><tt>+%rd      0:5
        </tt><tt><br>
        </tt><tt>+%rj      5:5
        </tt><tt><br>
        </tt><tt>+%rk      10:5
        </tt><tt><br>
        </tt><tt>+%sa2     15:2
        </tt><tt><br>
        </tt><tt>+%si12    10:s12
        </tt><tt><br>
        </tt><tt>+%ui12    10:12
        </tt><tt><br>
        </tt><tt>+%si16    10:s16
        </tt><tt><br>
        </tt><tt>+%si20    5:s20
        </tt><tt><br>
        </tt></blockquote>
      <tt><br>
      </tt><tt>You should only create separate field definitions like
        this when they are complex: e.g. the logical field is disjoint
        or there's a need for !function.
      </tt><tt><br>
      </tt>
      <tt><br>
      </tt></blockquote>
    <blockquote type="cite"
      cite="mid:7e6e5c26-2c1a-e4b5-a724-c2db33a36180@linaro.org">
      <blockquote type="cite"><tt>+
        </tt><tt><br>
        </tt><tt>+#
        </tt><tt><br>
        </tt><tt>+# Argument sets
        </tt><tt><br>
        </tt><tt>+#
        </tt><tt><br>
        </tt><tt>+&amp;fmt_rdrjrk         rd rj rk
        </tt><tt><br>
        </tt><tt>+&amp;fmt_rdrjsi12       rd rj si12
        </tt><tt><br>
        </tt><tt>+&amp;fmt_rdrjrksa2      rd rj rk sa2
        </tt><tt><br>
        </tt><tt>+&amp;fmt_rdrjsi16       rd rj si16
        </tt><tt><br>
        </tt><tt>+&amp;fmt_rdrjui12       rd rj ui12
        </tt><tt><br>
        </tt><tt>+&amp;fmt_rdsi20         rd si20
        </tt><tt><br>
        </tt></blockquote>
      <tt><br>
      </tt><tt>Some of these should be combined.  The width of the
        immediate is a detail of the format, not the decoded argument
        set.  Thus you should have
      </tt><tt><br>
      </tt>
      <tt><br>
      </tt><tt>&amp;fmt_rdimm     rd imm
      </tt><tt><br>
      </tt><tt>&amp;fmt_rdrjimm   rd rj imm
      </tt><tt><br>
      </tt><tt>&amp;fmt_rdrjrk    rd rj rk
      </tt><tt><br>
      </tt><tt>&amp;fmt_rdrjrksa  rd rj rk sa
      </tt><tt><br>
      </tt>
      <br>
    </blockquote>
    <pre>'<tt>The width of the immediate is a detail of the format</tt>'  means:

&amp;fmt_rdrjimm         rd  rj imm 

@fmt_rdrjimm         .... ...... imm:12  rj:5 rd:5     &amp;fmt_rdrjimm
@fmt_rdrjimm14         .... .... imm:14  rj:5 rd:5     &amp;fmt_rdrjimm 
@fmt_rdrjimm16           .... .. imm:16  rj:5 rd:5     &amp;fmt_rdrjimm

and we print in the disassembly, liks this 

output_rdrjimm(DisasContext *ctx, arg_fmt_rdrjimm * a,  const char *mnemonic)
{
    output(ctx, mnemonic, "%s, %s, 0x%x", regnames[a-&gt;rd], regnames[a-&gt;rj], a-&gt;imm);
}

is that right? 
</pre>
    <blockquote type="cite"
      cite="mid:7e6e5c26-2c1a-e4b5-a724-c2db33a36180@linaro.org">
      <blockquote type="cite"><tt>+alsl_w           0000 00000000 010 ..
          ..... ..... .....   @fmt_rdrjrksa2
        </tt><tt><br>
        </tt><tt>+alsl_wu          0000 00000000 011 .. ..... .....
          .....   @fmt_rdrjrksa2
        </tt><tt><br>
        </tt><tt>+alsl_d           0000 00000010 110 .. ..... .....
          .....   @fmt_rdrjrksa2
        </tt><tt><br>
        </tt></blockquote>
      <tt><br>
      </tt><tt>The encoding of these insns is that the shift is sa+1.
      </tt><tt><br>
      </tt>
      <tt><br>
      </tt><tt>While you compensate for this in gen_alsl_*, we print the
        "wrong" number in the disassembly.  I think it would be better
        to do
      </tt><tt><br>
      </tt>
      <tt><br>
      </tt><tt>%sa2p1     15:2 !function=plus_1
      </tt><tt><br>
      </tt><tt>@fmt_rdrjrksa2p1  .... ........ ... .. rk:5 rj:5 rd:5 \
      </tt><tt><br>
      </tt><tt>                  &amp;fmt_rdrjrksa sa=%sa2p1
      </tt><tt><br>
      </tt>
      <tt></tt><br>
    </blockquote>
    <pre><tt>1. We print sa in disassembly 
output_rdrjrksa(DisasContext *ctx, arg_fmt_rdrjsa* a, const char *memonic)
{
    output(ctx, memonic, "%s, %s, %s, 0x0x", regnames[a-&gt;rd], regnames[a-&gt;rj], a-&gt;sa)
}

2. We use sa on gen_alsl_*  not  (sa2+1). 

3 bytepick_w use the same print functions. but the Field/Argurment/Format is 
%sa2      15:2
&amp;fmt_rdrjrksa   rd rj sa
@fmt_rdrjrk sa2  .... ........ ...  sa:2  rk:5 rj:5 rd:5  &amp;fmt_rdrjrksa

Is my understanding right?

Thanks.
Song Gao

</tt></pre>
  </body>
</html>

--------------36DBB13C8EDA14317D441ED6--


