Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A76454272
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 09:11:06 +0100 (CET)
Received: from localhost ([::1]:53660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnG25-0007n1-6R
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 03:11:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mnG0c-0006Fp-Ci
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:09:34 -0500
Received: from mail.loongson.cn ([114.242.206.163]:55470 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mnG0Z-0007gG-FQ
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:09:34 -0500
Received: from [10.20.42.193] (unknown [10.20.42.193])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxWLLntZRh688AAA--.2608S3;
 Wed, 17 Nov 2021 15:57:27 +0800 (CST)
Subject: Re: [PATCH v10 04/26] target/loongarch: Add fixed point arithmetic
 instruction translation
To: Richard Henderson <richard.henderson@linaro.org>
References: <1636700049-24381-1-git-send-email-gaosong@loongson.cn>
 <1636700049-24381-5-git-send-email-gaosong@loongson.cn>
 <7e6e5c26-2c1a-e4b5-a724-c2db33a36180@linaro.org>
 <5c3c3107-da7f-7e13-189e-866c7ff1acde@loongson.cn>
 <f1e1b0fd-b34e-1403-1851-35c783a12237@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <6e225d21-c2e4-69d0-c4f9-d2018096ec70@loongson.cn>
Date: Wed, 17 Nov 2021 15:57:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f1e1b0fd-b34e-1403-1851-35c783a12237@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------36C324D7237E68E7E8BC7F4B"
Content-Language: en-US
X-CM-TRANSID: AQAAf9DxWLLntZRh688AAA--.2608S3
X-Coremail-Antispam: 1UD129KBjvJXoWxAF1DJF18KryUZF1UCFyDWrg_yoW5Zw13pF
 18tr1UGrW8Xr18Jw1Utr15X345Jr1UA3W3Jr1rJF4UJF1UJF1jqF1UXryjgrWUXr4kJr1j
 yr15JryjvrWDJw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvK1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
 87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
 Aq07x20xvEncxIr21lYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4U
 McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I
 1l7480Y4vEI4kI2Ix0rVAqx4xJMxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK6svPMxAI
 w28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_XrWUJr1UMxC20s026xCaFVCjc4AY6r
 1j6r4UMI8I3I0E5I8CrVAFwI0_JrI_JrWlx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
 b7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
 vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI
 42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxh
 VjvjDU0xZFpf9x0JUtkuxUUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-1.009, SPF_HELO_PASS=-0.001,
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------36C324D7237E68E7E8BC7F4B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Richard,

On 2021/11/15 下午4:42, Richard Henderson wrote:
> On 11/15/21 4:59 AM, gaosong wrote:
>> 'The width of the immediate is a detail of the format'  means:
>>
>> &fmt_rdrjimm         rd  rj imm
>>
>> @fmt_rdrjimm         .... ...... imm:12  rj:5 rd:5 &fmt_rdrjimm
>> @fmt_rdrjimm14         .... .... imm:14  rj:5 rd:5 &fmt_rdrjimm
>> @fmt_rdrjimm16           .... .. imm:16  rj:5 rd:5 &fmt_rdrjimm
>>
>> and we print in the disassembly, liks this
>>
>> output_rdrjimm(DisasContext *ctx, arg_fmt_rdrjimm * a,  const char 
>> *mnemonic)
>> {
>>      output(ctx, mnemonic, "%s, %s, 0x%x", regnames[a->rd], 
>> regnames[a->rj], a->imm);
>> }
>>
>> is that right?
>
> Yes.
>
> I'll note that regnames[] is defined in target/loongarch/cpu.c, which 
> is not available when we want to use this disassembler for 
> tcg/loongarch64/.  I think it would be easier to print this as
>
>     "r%d", a->rd
>
> so that you do not need to rely on the external strings.
>
> I also think you should print signed numbers, "%d", because 0xfffffff8 
> (truncated to 32 bits) is not really the correct representation of -8 
> for a 64-bit operand.
>
>
>> 1. We print sa in disassembly...
>> 2. We use sa on gen_alsl_* not (sa2+1).
>> 3. bytepick_w use the same print functions.
>> Is my understanding right?
>
> Yes, that is the issue I am describing.
>
I see that  insns.decode format is not very consistent with other 
architectures, such ARM/RISCV

I'll correct it , like this:

# Fields
#
%sa2p1     15:2         !function=plus_1

#
# Argument sets
#
&r_i          rd imm
&rrr          rd rj rk
&rr_i         rd rj imm
&rrr_sa     rd rj rk sa

#
# Formats
#
@fmt_rrr             .... ........ ..... rk:5 rj:5 rd:5 &rrr
@fmt_r_i20                        .... ... imm:s20 rd:5 &r_i
@fmt_rr_i12               .... ...... imm:s12 rj:5 rd:5 &rr_i
@fmt_rr_ui12               .... ...... imm:12 rj:5 rd:5 &rr_i
@fmt_rr_i16                   .... .. imm:s16 rj:5 rd:5 &rr_i
@fmt_rrr_sa2p1      .... ........ ... .. rk:5 rj:5 rd:5 &rrr_sa  sa=%sa2p1

#
# Fixed point arithmetic operation instruction
#
add_w            0000 00000001 00000 ..... ..... .....    @fmt_rrr
add_d            0000 00000001 00001 ..... ..... .....    @fmt_rrr
sub_w            0000 00000001 00010 ..... ..... .....    @fmt_rrr
sub_d            0000 00000001 00011 ..... ..... .....    @fmt_rrr
slt              0000 00000001 00100 ..... ..... ..... @fmt_rrr
sltu             0000 00000001 00101 ..... ..... ..... @fmt_rrr
slti             0000 001000 ............ ..... .....               
@fmt_rr_i12


and trans_xxx.c.inc

static bool gen_rrr(DisasContext *ctx, arg_rrr *a, ...) {}
static bool gen_rr_i12(DisasContext *ctx, arg_rr_i *a, ) {}
static bool gen_rrr_sa2p1(DisasContext *ctx, arg_rrr_sa *a, ...) {}
...

Richard, is that OK?

Thanks,
Song Gao


--------------36C324D7237E68E7E8BC7F4B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Richard,<br>
    </p>
    <div class="moz-cite-prefix">On 2021/11/15 下午4:42, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f1e1b0fd-b34e-1403-1851-35c783a12237@linaro.org">On
      11/15/21 4:59 AM, gaosong wrote:
      <br>
      <blockquote type="cite">'The width of the immediate is a detail of
        the format'  means:
        <br>
        <br>
        &amp;fmt_rdrjimm         rd  rj imm
        <br>
        <br>
        @fmt_rdrjimm         .... ...... imm:12  rj:5 rd:5    
        &amp;fmt_rdrjimm
        <br>
        @fmt_rdrjimm14         .... .... imm:14  rj:5 rd:5    
        &amp;fmt_rdrjimm
        <br>
        @fmt_rdrjimm16           .... .. imm:16  rj:5 rd:5    
        &amp;fmt_rdrjimm
        <br>
        <br>
        and we print in the disassembly, liks this
        <br>
        <br>
        output_rdrjimm(DisasContext *ctx, arg_fmt_rdrjimm * a,  const
        char *mnemonic)
        <br>
        {
        <br>
             output(ctx, mnemonic, "%s, %s, 0x%x", regnames[a-&gt;rd],
        regnames[a-&gt;rj], a-&gt;imm);
        <br>
        }
        <br>
        <br>
        is that right?
        <br>
      </blockquote>
      <br>
      Yes.
      <br>
      <br>
      I'll note that regnames[] is defined in target/loongarch/cpu.c,
      which is not available when we want to use this disassembler for
      tcg/loongarch64/.  I think it would be easier to print this as
      <br>
      <br>
          "r%d", a-&gt;rd
      <br>
      <br>
      so that you do not need to rely on the external strings.
      <br>
      <br>
      I also think you should print signed numbers, "%d", because
      0xfffffff8 (truncated to 32 bits) is not really the correct
      representation of -8 for a 64-bit operand.
      <br>
      <br>
      <br>
      <blockquote type="cite">1. We print sa in disassembly...
        <br>
        2. We use sa on gen_alsl_* not (sa2+1).
        <br>
        3. bytepick_w use the same print functions.
        <br>
        Is my understanding right?
        <br>
      </blockquote>
      <br>
      Yes, that is the issue I am describing.
      <br>
      <br>
    </blockquote>
    <p>I see that  insns.decode format is not very consistent with other
      architectures, such ARM/RISCV</p>
    <p>I'll correct it , like this:</p>
    <p># Fields<br>
      #<br>
      %sa2p1     15:2         !function=plus_1<br>
      <br>
      #<br>
      # Argument sets<br>
      #<br>
      &amp;r_i          rd imm<br>
      &amp;rrr          rd rj rk<br>
      &amp;rr_i         rd rj imm<br>
      &amp;rrr_sa     rd rj rk sa<br>
      <br>
      #<br>
      # Formats<br>
      #<br>
      @fmt_rrr             .... ........ ..... rk:5 rj:5 rd:5         
      &amp;rrr<br>
      @fmt_r_i20                        .... ... imm:s20 rd:5   
      &amp;r_i<br>
      @fmt_rr_i12               .... ...... imm:s12 rj:5 rd:5  
      &amp;rr_i<br>
      @fmt_rr_ui12               .... ...... imm:12 rj:5 rd:5  
      &amp;rr_i<br>
      @fmt_rr_i16                   .... .. imm:s16 rj:5 rd:5  
      &amp;rr_i<br>
      @fmt_rrr_sa2p1      .... ........ ... .. rk:5 rj:5 rd:5    
      &amp;rrr_sa  sa=%sa2p1<br>
      <br>
      #<br>
      # Fixed point arithmetic operation instruction<br>
      #<br>
      add_w            0000 00000001 00000 ..... ..... .....    @fmt_rrr<br>
      add_d            0000 00000001 00001 ..... ..... .....    @fmt_rrr<br>
      sub_w            0000 00000001 00010 ..... ..... .....    @fmt_rrr<br>
      sub_d            0000 00000001 00011 ..... ..... .....    @fmt_rrr<br>
      slt              0000 00000001 00100 ..... ..... .....      
      @fmt_rrr<br>
      sltu             0000 00000001 00101 ..... ..... .....     
      @fmt_rrr<br>
      slti             0000 001000 ............ .....
      .....               @fmt_rr_i12<br>
    </p>
    <p><br>
    </p>
    <p>and trans_xxx.c.inc<br>
    </p>
    <pre>static bool gen_rrr(DisasContext *ctx, arg_rrr *a, ...) {}
static bool gen_rr_i12(DisasContext *ctx, arg_rr_i *a, ) {}
static bool gen_rrr_sa2p1(DisasContext *ctx, arg_rrr_sa *a, ...) {}
...

Richard, is that OK?

Thanks,
Song Gao

</pre>
  </body>
</html>

--------------36C324D7237E68E7E8BC7F4B--


