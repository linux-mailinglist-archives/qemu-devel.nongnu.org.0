Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2012E6E7657
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 11:33:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp4AH-0004bz-A7; Wed, 19 Apr 2023 05:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pp4A3-0004bB-2V
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 05:31:38 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pp49y-0003lb-8N
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 05:31:34 -0400
Received: from loongson.cn (unknown [10.20.42.57])
 by gateway (Coremail) with SMTP id _____8Dx_5fktD9kQuAeAA--.48717S3;
 Wed, 19 Apr 2023 17:31:17 +0800 (CST)
Received: from [10.20.42.57] (unknown [10.20.42.57])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxAeXjtD9kdd8uAA--.26935S3; 
 Wed, 19 Apr 2023 17:31:16 +0800 (CST)
Subject: Re: [RFC PATCH v2 18/44] target/loongarch: Implement vsat
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-19-gaosong@loongson.cn>
 <c30ab882-1b50-7325-87bb-fd273e479e51@linaro.org>
From: Song Gao <gaosong@loongson.cn>
Message-ID: <ba63a23c-a1a0-c40e-6202-22ad9f7e2e5c@loongson.cn>
Date: Wed, 19 Apr 2023 17:31:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <c30ab882-1b50-7325-87bb-fd273e479e51@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------F262A57CEE9E9EF94271050A"
Content-Language: en-US
X-CM-TRANSID: AQAAf8DxAeXjtD9kdd8uAA--.26935S3
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3Ar47WFykCw47WFWxCr48JFb_yoWxuFyfpr
 1rGr48ArW8JrykJr47tF1UKryUJrsrtw1DtrnrXF18Jr4UGr1jqFyUXryj9r1DJr40vr17
 KF1DJr4Uur1DJ3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 DUYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUUbx8YFVCjjxCrM7AC8VAFwI0_Jr0_
 Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFV
 AK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2
 z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr
 1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487
 Mc804VCY07AIYIkI8VC2zVCFFI0UMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67
 AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l7480Y4vEI4kI2Ix0
 rVAqx4xJMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
 0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUGVWUWwC20s026x8GjcxK67AKxVWUGVWUWwC2
 zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
 4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
 CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIda
 VFxhVjvjDU0xZFpf9x07UW6wZUUUUU=
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-2.597, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
--------------F262A57CEE9E9EF94271050A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi, Richard

在 2023/4/1 下午1:03, Richard Henderson 写道:
>
>> + tcg_gen_dupi_vec(vece, t1, max);
>> +    tcg_gen_smin_vec(vece, t, t, t1);
>> +}
>> +
>> +static void do_vsat_s(unsigned vece, uint32_t vd_ofs, uint32_t vj_ofs,
>> +                      int64_t imm, uint32_t oprsz, uint32_t maxsz)
>> +{
>> +    static const TCGOpcode vecop_list[] = {
>> +        INDEX_op_smax_vec, INDEX_op_smin_vec, 0
>> +        };
>> +    static const GVecGen2i op[4] = {
>> +        {
>> +            .fniv = gen_vsat_s,
>> +            .fnoi = gen_helper_vsat_b,
>> +            .opt_opc = vecop_list,
>> +            .vece = MO_8
>> +        },
>> +        {
>> +            .fniv = gen_vsat_s,
>> +            .fnoi = gen_helper_vsat_h,
>> +            .opt_opc = vecop_list,
>> +            .vece = MO_16
>> +        },
>> +        {
>> +            .fniv = gen_vsat_s,
>> +            .fnoi = gen_helper_vsat_w,
>> +            .opt_opc = vecop_list,
>> +            .vece = MO_32
>> +        },
>> +        {
>> +            .fniv = gen_vsat_s,
>> +            .fnoi = gen_helper_vsat_d,
>> +            .opt_opc = vecop_list,
>> +            .vece = MO_64
>> +        },
>> +    };
>> +
>> +    tcg_gen_gvec_2i(vd_ofs, vj_ofs, oprsz, maxsz, imm, &op[vece]);
>
> Better to expand imm to max here, rather than both inside gen_vsat_s 
> and the runtime do_vsats_*.
>
> Likewise for the unsigned versions. 

I tried to expand imm to max  here  for the unsigned versions.

{

     uint64_t max;

     ...

     static const GVecGen2i op[4] = {
         {
             //.fniv = gen_vsat_u,
             .fnoi = gen_helper_vsat_bu,
             .opt_opc = vecop_list,
             .vece = MO_8
         },
         {
             //.fniv = gen_vsat_u,
             .fnoi = gen_helper_vsat_hu,
             .opt_opc = vecop_list,
             .vece = MO_16
         },
         {
             //.fniv = gen_vsat_u,
             .fnoi = gen_helper_vsat_wu,
             .opt_opc = vecop_list,
             .vece = MO_32
         },
         {
             //.fniv = gen_vsat_u,
             .fnoi = gen_helper_vsat_du,
             .opt_opc = vecop_list,
             .vece = MO_64
         },
     };

     max = (imm == 0x3f) ? UINT64_MAX : (1ull << (imm + 1)) - 1;
     tcg_gen_gvec_2i(vd_ofs, vj_ofs, oprsz, maxsz, max, &op[vece]);

}


and  I got a tcg_debug_assert();


Thread 1 "qemu-loongarch6" received signal SIGABRT, Aborted.
0x00007ffff60b337f in raise () from /lib64/libc.so.6
(gdb) bt
#0  0x00007ffff60b337f in raise () from /lib64/libc.so.6
#1  0x00007ffff609ddb5 in abort () from /lib64/libc.so.6
#2  0x00007ffff609dc89 in __assert_fail_base.cold.0 () from /lib64/libc.so.6
#3  0x00007ffff60aba76 in __assert_fail () from /lib64/libc.so.6
#4  0x0000555555632fcf in simd_desc (oprsz=16, maxsz=16, data=134217727) 
at ../tcg/tcg-op-gvec.c:91
#5  0x000055555563312b in tcg_gen_gvec_2i_ool (dofs=768, aofs=432, 
c=0xb20, oprsz=16, maxsz=16, data=134217727, fn=0x5555555b5c00 
<gen_helper_vsat_wu>)
     at ../tcg/tcg-op-gvec.c:139
#6  0x0000555555636085 in tcg_gen_gvec_2i (dofs=768, aofs=432, oprsz=16, 
maxsz=16, c=134217727, g=0x5555559c25b0 <op+112>) at 
../tcg/tcg-op-gvec.c:1316
#7  0x00005555555e1ef5 in do_vsat_u (vece=2, vd_ofs=768, vj_ofs=432, 
imm=26, oprsz=16, maxsz=16) at 
../target/loongarch/insn_trans/trans_lsx.c.inc:2828
#8  0x00005555555db25e in gvec_vv_i (ctx=0x7fffffffcc00, 
a=0x7fffffffcb00, mop=MO_32, func=0x5555555e1e73 <do_vsat_u>) at 
../target/loongarch/insn_trans/trans_lsx.c.inc:121
#9  0x00005555555e1f80 in trans_vsat_wu (ctx=0x7fffffffcc00, 
a=0x7fffffffcb00) at ../target/loongarch/insn_trans/trans_lsx.c.inc:2833
#10 0x00005555555d2650 in decode (ctx=0x7fffffffcc00, insn=1932061023) 
at libqemu-loongarch64-linux-user.fa.p/decode-insns.c.inc:8967
#11 0x00005555555e8fca in loongarch_tr_translate_insn 
(dcbase=0x7fffffffcc00, cs=0x555555a4e5a0) at 
../target/loongarch/translate.c:230
#12 0x000055555565e9ae in translator_loop (cpu=0x555555a4e5a0, 
tb=0x7fffe409f340 <code_gen_buffer+652051>, max_insns=0x7fffffffccfc, 
pc=274886330028, host_pc=0x40008086ac,
     ops=0x5555559c0960 <loongarch_tr_ops>, db=0x7fffffffcc00) at 
../accel/tcg/translator.c:84
#13 0x00005555555e91d5 in gen_intermediate_code (cs=0x555555a4e5a0, 
tb=0x7fffe409f340 <code_gen_buffer+652051>, max_insns=0x7fffffffccfc, 
pc=274886330028, host_pc=0x40008086ac)
     at ../target/loongarch/translate.c:286
#14 0x000055555565d38b in setjmp_gen_code (env=0x555555a4e8f0, 
tb=0x7fffe409f340 <code_gen_buffer+652051>, pc=274886330028, 
host_pc=0x40008086ac, max_insns=0x7fffffffccfc,
     ti=0x7fffffffcd18) at ../accel/tcg/translate-all.c:285
#15 0x000055555565d64a in tb_gen_code (cpu=0x555555a4e5a0, 
pc=274886330028, cs_base=0, flags=0, cflags=0) at 
../accel/tcg/translate-all.c:365
#16 0x00005555556556d6 in cpu_exec_loop (cpu=0x555555a4e5a0, 
sc=0x7fffffffce40) at ../accel/tcg/cpu-exec.c:977
#17 0x0000555555655859 in cpu_exec_setjmp (cpu=0x555555a4e5a0, 
sc=0x7fffffffce40) at ../accel/tcg/cpu-exec.c:1034
#18 0x00005555556558eb in cpu_exec (cpu=0x555555a4e5a0) at 
../accel/tcg/cpu-exec.c:1060
#19 0x00005555555a75da in cpu_loop (env=0x555555a4e8f0) at 
../linux-user/loongarch64/cpu_loop.c:22
#20 0x000055555567bc18 in main (argc=5, argv=0x7fffffffd708, 
envp=0x7fffffffd738) at ../linux-user/main.c:957
(gdb) frame 4
#4  0x0000555555632fcf in simd_desc (oprsz=16, maxsz=16, data=134217727) 
at ../tcg/tcg-op-gvec.c:91
91        tcg_debug_assert(data == sextract32(data, 0, SIMD_DATA_BITS));
(gdb) p/x data
$1 = 0x7ffffff
(gdb) frame 7
#7  0x00005555555e1ef5 in do_vsat_u (vece=2, vd_ofs=768, vj_ofs=432, 
imm=26, oprsz=16, maxsz=16) at 
../target/loongarch/insn_trans/trans_lsx.c.inc:2828
2828        tcg_gen_gvec_2i(vd_ofs, vj_ofs, oprsz, maxsz, max, &op[vece]);
(gdb) p/x max
$2 = 0x7ffffff

qemu-loongarch64: ../tcg/tcg-op-gvec.c:91: simd_desc: Assertion `data == 
sextract32(data, 0, (32 - ((0 + 8) + 2)))' failed.

Could I drop this tcg_debug_assert()?

Thanks.
Song Gao

--------------F262A57CEE9E9EF94271050A
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
      cite="mid:c30ab882-1b50-7325-87bb-fd273e479e51@linaro.org"><br>
      <blockquote type="cite" style="color: #000000;">+   
        tcg_gen_dupi_vec(vece, t1, max);
        <br>
        +    tcg_gen_smin_vec(vece, t, t, t1);
        <br>
        +}
        <br>
        +
        <br>
        +static void do_vsat_s(unsigned vece, uint32_t vd_ofs, uint32_t
        vj_ofs,
        <br>
        +                      int64_t imm, uint32_t oprsz, uint32_t
        maxsz)
        <br>
        +{
        <br>
        +    static const TCGOpcode vecop_list[] = {
        <br>
        +        INDEX_op_smax_vec, INDEX_op_smin_vec, 0
        <br>
        +        };
        <br>
        +    static const GVecGen2i op[4] = {
        <br>
        +        {
        <br>
        +            .fniv = gen_vsat_s,
        <br>
        +            .fnoi = gen_helper_vsat_b,
        <br>
        +            .opt_opc = vecop_list,
        <br>
        +            .vece = MO_8
        <br>
        +        },
        <br>
        +        {
        <br>
        +            .fniv = gen_vsat_s,
        <br>
        +            .fnoi = gen_helper_vsat_h,
        <br>
        +            .opt_opc = vecop_list,
        <br>
        +            .vece = MO_16
        <br>
        +        },
        <br>
        +        {
        <br>
        +            .fniv = gen_vsat_s,
        <br>
        +            .fnoi = gen_helper_vsat_w,
        <br>
        +            .opt_opc = vecop_list,
        <br>
        +            .vece = MO_32
        <br>
        +        },
        <br>
        +        {
        <br>
        +            .fniv = gen_vsat_s,
        <br>
        +            .fnoi = gen_helper_vsat_d,
        <br>
        +            .opt_opc = vecop_list,
        <br>
        +            .vece = MO_64
        <br>
        +        },
        <br>
        +    };
        <br>
        +
        <br>
        +    tcg_gen_gvec_2i(vd_ofs, vj_ofs, oprsz, maxsz, imm,
        &amp;op[vece]);
        <br>
      </blockquote>
      <br>
      Better to expand imm to max here, rather than both inside
      gen_vsat_s and the runtime do_vsats_*.
      <br>
      <br>
      Likewise for the unsigned versions.
    </blockquote>
    <p>I tried to expand imm to max  here  for the unsigned versions.</p>
    <p>{</p>
    <p>    uint64_t max;<br>
    </p>
    <p>    ...<br>
    </p>
    <p>    static const GVecGen2i op[4] = {<br>
              {<br>
                  //.fniv = gen_vsat_u,<br>
                  .fnoi = gen_helper_vsat_bu,<br>
                  .opt_opc = vecop_list,<br>
                  .vece = MO_8<br>
              },<br>
              {<br>
                  //.fniv = gen_vsat_u,<br>
                  .fnoi = gen_helper_vsat_hu,<br>
                  .opt_opc = vecop_list,<br>
                  .vece = MO_16<br>
              },<br>
              {<br>
                  //.fniv = gen_vsat_u,<br>
                  .fnoi = gen_helper_vsat_wu,<br>
                  .opt_opc = vecop_list,<br>
                  .vece = MO_32<br>
              },<br>
              {<br>
                  //.fniv = gen_vsat_u,<br>
                  .fnoi = gen_helper_vsat_du,<br>
                  .opt_opc = vecop_list,<br>
                  .vece = MO_64<br>
              },<br>
          };<br>
      <br>
    </p>
    <p>    max = (imm == 0x3f) ? UINT64_MAX : (1ull &lt;&lt; (imm + 1))
      - 1;<br>
          tcg_gen_gvec_2i(vd_ofs, vj_ofs, oprsz, maxsz, max,
      &amp;op[vece]);<br>
    </p>
    <p>}</p>
    <p><br>
    </p>
    <p>and  I got a tcg_debug_assert();</p>
    <p><br>
    </p>
    <p>Thread 1 "qemu-loongarch6" received signal SIGABRT, Aborted.<br>
      0x00007ffff60b337f in raise () from /lib64/libc.so.6<br>
      (gdb) bt<br>
      #0  0x00007ffff60b337f in raise () from /lib64/libc.so.6<br>
      #1  0x00007ffff609ddb5 in abort () from /lib64/libc.so.6<br>
      #2  0x00007ffff609dc89 in __assert_fail_base.cold.0 () from
      /lib64/libc.so.6<br>
      #3  0x00007ffff60aba76 in __assert_fail () from /lib64/libc.so.6<br>
      #4  0x0000555555632fcf in simd_desc (oprsz=16, maxsz=16,
      data=134217727) at ../tcg/tcg-op-gvec.c:91<br>
      #5  0x000055555563312b in tcg_gen_gvec_2i_ool (dofs=768, aofs=432,
      c=0xb20, oprsz=16, maxsz=16, data=134217727, fn=0x5555555b5c00
      &lt;gen_helper_vsat_wu&gt;)<br>
          at ../tcg/tcg-op-gvec.c:139<br>
      #6  0x0000555555636085 in tcg_gen_gvec_2i (dofs=768, aofs=432,
      oprsz=16, maxsz=16, c=134217727, g=0x5555559c25b0 &lt;op+112&gt;)
      at ../tcg/tcg-op-gvec.c:1316<br>
      #7  0x00005555555e1ef5 in do_vsat_u (vece=2, vd_ofs=768,
      vj_ofs=432, imm=26, oprsz=16, maxsz=16) at
      ../target/loongarch/insn_trans/trans_lsx.c.inc:2828<br>
      #8  0x00005555555db25e in gvec_vv_i (ctx=0x7fffffffcc00,
      a=0x7fffffffcb00, mop=MO_32, func=0x5555555e1e73
      &lt;do_vsat_u&gt;) at
      ../target/loongarch/insn_trans/trans_lsx.c.inc:121<br>
      #9  0x00005555555e1f80 in trans_vsat_wu (ctx=0x7fffffffcc00,
      a=0x7fffffffcb00) at
      ../target/loongarch/insn_trans/trans_lsx.c.inc:2833<br>
      #10 0x00005555555d2650 in decode (ctx=0x7fffffffcc00,
      insn=1932061023) at
      libqemu-loongarch64-linux-user.fa.p/decode-insns.c.inc:8967<br>
      #11 0x00005555555e8fca in loongarch_tr_translate_insn
      (dcbase=0x7fffffffcc00, cs=0x555555a4e5a0) at
      ../target/loongarch/translate.c:230<br>
      #12 0x000055555565e9ae in translator_loop (cpu=0x555555a4e5a0,
      tb=0x7fffe409f340 &lt;code_gen_buffer+652051&gt;,
      max_insns=0x7fffffffccfc, pc=274886330028, host_pc=0x40008086ac, <br>
          ops=0x5555559c0960 &lt;loongarch_tr_ops&gt;,
      db=0x7fffffffcc00) at ../accel/tcg/translator.c:84<br>
      #13 0x00005555555e91d5 in gen_intermediate_code
      (cs=0x555555a4e5a0, tb=0x7fffe409f340
      &lt;code_gen_buffer+652051&gt;, max_insns=0x7fffffffccfc,
      pc=274886330028, host_pc=0x40008086ac)<br>
          at ../target/loongarch/translate.c:286<br>
      #14 0x000055555565d38b in setjmp_gen_code (env=0x555555a4e8f0,
      tb=0x7fffe409f340 &lt;code_gen_buffer+652051&gt;, pc=274886330028,
      host_pc=0x40008086ac, max_insns=0x7fffffffccfc, <br>
          ti=0x7fffffffcd18) at ../accel/tcg/translate-all.c:285<br>
      #15 0x000055555565d64a in tb_gen_code (cpu=0x555555a4e5a0,
      pc=274886330028, cs_base=0, flags=0, cflags=0) at
      ../accel/tcg/translate-all.c:365<br>
      #16 0x00005555556556d6 in cpu_exec_loop (cpu=0x555555a4e5a0,
      sc=0x7fffffffce40) at ../accel/tcg/cpu-exec.c:977<br>
      #17 0x0000555555655859 in cpu_exec_setjmp (cpu=0x555555a4e5a0,
      sc=0x7fffffffce40) at ../accel/tcg/cpu-exec.c:1034<br>
      #18 0x00005555556558eb in cpu_exec (cpu=0x555555a4e5a0) at
      ../accel/tcg/cpu-exec.c:1060<br>
      #19 0x00005555555a75da in cpu_loop (env=0x555555a4e8f0) at
      ../linux-user/loongarch64/cpu_loop.c:22<br>
      #20 0x000055555567bc18 in main (argc=5, argv=0x7fffffffd708,
      envp=0x7fffffffd738) at ../linux-user/main.c:957 <br>
      (gdb) frame 4<br>
      #4  0x0000555555632fcf in simd_desc (oprsz=16, maxsz=16,
      data=134217727) at ../tcg/tcg-op-gvec.c:91<br>
      91        tcg_debug_assert(data == sextract32(data, 0,
      SIMD_DATA_BITS));<br>
      (gdb) p/x data<br>
      $1 = 0x7ffffff<br>
      (gdb) frame 7<br>
      #7  0x00005555555e1ef5 in do_vsat_u (vece=2, vd_ofs=768,
      vj_ofs=432, imm=26, oprsz=16, maxsz=16) at
      ../target/loongarch/insn_trans/trans_lsx.c.inc:2828<br>
      2828        tcg_gen_gvec_2i(vd_ofs, vj_ofs, oprsz, maxsz, max,
      &amp;op[vece]);<br>
      (gdb) p/x max<br>
      $2 = 0x7ffffff<br>
    </p>
    <p>qemu-loongarch64: ../tcg/tcg-op-gvec.c:91: simd_desc: Assertion
      `data == sextract32(data, 0, (32 - ((0 + 8) + 2)))' failed.<br>
    </p>
    Could I drop this tcg_debug_assert()?<br>
    <br>
    Thanks.<br>
    Song Gao<br>
  </body>
</html>

--------------F262A57CEE9E9EF94271050A--


