Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A3444E44E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 11:00:31 +0100 (CET)
Received: from localhost ([::1]:59582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlTME-0008I7-Tj
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 05:00:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mlTKy-0007Wl-Ht
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 04:59:12 -0500
Received: from mail.loongson.cn ([114.242.206.163]:41548 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mlTKt-0006Ld-Ih
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 04:59:12 -0500
Received: from [10.20.42.193] (unknown [10.20.42.193])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxadDlOo5hrZkCAA--.6204S3;
 Fri, 12 Nov 2021 17:59:01 +0800 (CST)
Subject: Re: [PATCH v10 16/26] target/loongarch: Add disassembler
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <1636700049-24381-1-git-send-email-gaosong@loongson.cn>
 <1636700049-24381-17-git-send-email-gaosong@loongson.cn>
 <22148b72-1696-2420-c937-7e0ce083f963@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <b0cda0bd-6746-ac47-c6e8-cc115c7082c1@loongson.cn>
Date: Fri, 12 Nov 2021 17:59:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <22148b72-1696-2420-c937-7e0ce083f963@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9CxadDlOo5hrZkCAA--.6204S3
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw1fAw4fXFW7uw15Jw4xWFg_yoW7Cw4kpr
 1ktrWUJryUJrn5XryUJr1UWryUAr1Ut342y348Xa18ArnFyryqvw1UXr1q9r1UAr48Wrn0
 yr4UZrnrZw15JrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU901xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2
 z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
 Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j
 6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
 1lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK6svP
 MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_XrWUJr1UMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq
 3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIda
 VFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.449,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Richard,

On 2021/11/12 下午3:39, Richard Henderson wrote:
> On 11/12/21 7:53 AM, Song Gao wrote:
>> +const char * const fccregnames[8] = {
>> +  "$fcc0", "$fcc1", "$fcc2", "$fcc3", "$fcc4", "$fcc5", "$fcc6", 
>> "$fcc7",
>> +};
>
> static.
>
OK.
>> +static void output_fcsrdrj(DisasContext *ctx, arg_fmt_fcsrdrj *a,
>> +                           const char *mnemonic)
>> +{
>> +    output(ctx, mnemonic, "%s, %s", regnames[a->fcsrd], 
>> regnames[a->rj]);
>> +}
>> +
>> +static void output_rdfcsrs(DisasContext *ctx, arg_fmt_rdfcsrs *a,
>> +                           const char *mnemonic)
>> +{
>> +    output(ctx, mnemonic, "%s, %s", regnames[a->rd], 
>> regnames[a->fcsrs]);
>> +}
>
> Wrong names for fcsr[ds].  Probably easiest to just use "fcsr%d" 
> rather than having an array of strings.
>
OK.
>> +static void output_rdrjsi12(DisasContext *ctx, arg_fmt_rdrjsi12 *a,
>> +                            const char *mnemonic)
>> +{
>> +    output(ctx, mnemonic, "%s, %s, 0x%x",
>> +           regnames[a->rd], regnames[a->rj], (a->si12) & 0xfff);
>> +}
>
> Surely printing the signed value is more useful.
>
>> +static void output_rdrjsi16(DisasContext *ctx, arg_fmt_rdrjsi16 *a,
>> +                            const char *mnemonic)
>> +{
>> +    output(ctx, mnemonic, "%s, %s, 0x%x",
>> +           regnames[a->rd], regnames[a->rj], (a->si16) & 0xffff);
>> +}
>> +
>> +static void output_rdsi20(DisasContext *ctx, arg_fmt_rdsi20 *a,
>> +                          const char *mnemonic)
>> +{
>> +    output(ctx, mnemonic, "%s, 0x%x", regnames[a->rd], (a->si20) & 
>> 0xfffff);
>> +}
>> +
>> +static void output_rdrjsi14(DisasContext *ctx, arg_fmt_rdrjsi14 *a,
>> +                            const char *mnemonic)
>> +{
>> +    output(ctx, mnemonic, "%s, %s, 0x%x",
>> +           regnames[a->rd], regnames[a->rj], (a->si14) & 0x3fff);
>> +}
>> +
>> +static void output_hintrjsi12(DisasContext *ctx, arg_fmt_hintrjsi12 *a,
>> +                              const char *mnemonic)
>> +{
>> +    output(ctx, mnemonic, "0x%x, %s, 0x%x",
>> +           a->hint, regnames[a->rj], (a->si12) & 0xfff);
>> +}
>> +
>> +static void output_fdrjsi12(DisasContext *ctx, arg_fmt_fdrjsi12 *a,
>> +                            const char *mnemonic)
>> +{
>> +    output(ctx, mnemonic, "%s, %s, 0x%x",
>> +           fregnames[a->fd], regnames[a->rj], (a->si12) & 0xfff);
>> +}
>
> Likewise.
>
>> +static void output_rjoffs21(DisasContext *ctx, arg_fmt_rjoffs21 *a,
>> +                            const char *mnemonic)
>> +{
>> +    output(ctx, mnemonic, "%s, 0x%x", regnames[a->rj], (a->offs21) & 
>> 0x1fffff);
>> +}
>> +
>> +static void output_cjoffs21(DisasContext *ctx, arg_fmt_cjoffs21 *a,
>> +                            const char *mnemonic)
>> +{
>> +    output(ctx, mnemonic, "%s, 0x%x",
>> +           fccregnames[a->cj], (a->offs21) & 0x1fffff);
>> +}
>> +
>> +static void output_rdrjoffs16(DisasContext *ctx, arg_fmt_rdrjoffs16 *a,
>> +                              const char *mnemonic)
>> +{
>> +    output(ctx, mnemonic, "%s, %s, 0x%x",
>> +           regnames[a->rd], regnames[a->rj], (a->offs16) & 0xffff);
>> +}
>> +
>> +static void output_offs(DisasContext *ctx, arg_fmt_offs *a,
>> +                        const char *mnemonic)
>> +{
>> +    output(ctx, mnemonic, "0x%x", (a->offs) & 0x3ffffff);
>> +}
>
> These are signed, but they're also pc-relative.  It's probably most 
> helpful to have stored the address into ctx and compute the final 
> address.
>
This's a good idea.
>> +static void output_rdfj(DisasContext *ctx, arg_fmt_rdfj *a,
>> +                        const char *mnemonic)
>> +{
>> +    output(ctx, mnemonic, "%s, %s", regnames[a->rd], regnames[a->fj]);
>> +}
>
> Wrong name for fj.
>
>> +#define output_fcmp(C, PREFIX, 
>> SUBFFIX)                                     \
>
> SUFFIX
>
>>
>> +        output_fcmp(ctx, "fcmp_slt_", suffix);
>> +        break;
>> +    case 0x4:
>> +        output_fcmp(ctx, "fcmp_ceq_", suffix);
>> +        break;
>> +    case 0x5:
>> +        output_fcmp(ctx, "fcmp_seq_", suffix);
>> +        break;
>> +    case 0x6:
>>
>> +        break;
>
> Here you're going to print nothing at all, which is wrong.
>
OK.
>> +    }
>> +}
>> +
>> +#define FCMP_INSN(insn, suffix, type) \
>> +static bool trans_##insn(DisasContext *ctx, arg_fmt_##type * a) \
>> +{ \
>> +    output_##type(ctx, a, #suffix); \
>> +    return true; \
>> +}
>
> I think you should drop "insn" and "type" from this define and use 
> output_cdfjfkfcond directly.
>
> I think that FCMP_INSN should return output_cdfjfkfcond, which should 
> return false for the default case, so that decodetree returns false, 
> so that we print "invalid".
>
Got it,  I'll correct it on V11.
>
> r~


