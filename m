Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E36566549
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:44:01 +0200 (CEST)
Received: from localhost ([::1]:37192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8eA4-00062E-D1
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1o8e8h-0004UI-If
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:42:35 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34986 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1o8e8f-0005k8-0I
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:42:35 -0400
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxKeFy+cNitSEKAA--.30591S3; 
 Tue, 05 Jul 2022 16:42:27 +0800 (CST)
Subject: Re: [PATCH] hw/rtc/ls7a_rtc: Drop unused inline functions
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: thuth@redhat.com, yangxiaojuan@loongson.cn
References: <20220705082836.1141160-1-richard.henderson@linaro.org>
From: gaosong <gaosong@loongson.cn>
Message-ID: <2fe2a1f0-12e9-b9c6-a16b-461a7ac3338b@loongson.cn>
Date: Tue, 5 Jul 2022 16:42:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20220705082836.1141160-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: AQAAf9AxKeFy+cNitSEKAA--.30591S3
X-Coremail-Antispam: 1UD129KBjvJXoWxWFW3ZryxKrWDKrW5WryrtFb_yoW5Xr4UpF
 W3Cas7GF4jqasF9FW8trWqyryYywsrAF95tr1DC3yvk3ZrX34kWFykJ3y2yryDuFW0qr45
 CrW3AF4Fga12v37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU901xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
 87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
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
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


On 2022/7/5 下午4:28, Richard Henderson wrote:
> Remove toy_val_to_time_mon and toy_val_to_time_year as unused,
> and to avoid a build failure with clang.  Remove all of the
> other inline markers foo so that this does not creep back in.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Sorry for this problem,  We need more CI tests before push code.

Reviewed-by: Song Gao <gaosong@loongson.cn>

>   hw/rtc/ls7a_rtc.c | 27 ++++++---------------------
>   1 file changed, 6 insertions(+), 21 deletions(-)
>
> diff --git a/hw/rtc/ls7a_rtc.c b/hw/rtc/ls7a_rtc.c
> index e8b75701e4..1f9e38a735 100644
> --- a/hw/rtc/ls7a_rtc.c
> +++ b/hw/rtc/ls7a_rtc.c
> @@ -86,46 +86,31 @@ struct LS7ARtcState {
>   };
>   
>   /* switch nanoseconds time to rtc ticks */
> -static inline uint64_t ls7a_rtc_ticks(void)
> +static uint64_t ls7a_rtc_ticks(void)
>   {
>       return qemu_clock_get_ns(rtc_clock) * LS7A_RTC_FREQ / NANOSECONDS_PER_SECOND;
>   }
>   
>   /* switch rtc ticks to nanoseconds */
> -static inline uint64_t ticks_to_ns(uint64_t ticks)
> +static uint64_t ticks_to_ns(uint64_t ticks)
>   {
>       return ticks * NANOSECONDS_PER_SECOND / LS7A_RTC_FREQ;
>   }
>   
> -static inline bool toy_enabled(LS7ARtcState *s)
> +static bool toy_enabled(LS7ARtcState *s)
>   {
>       return FIELD_EX32(s->cntrctl, RTC_CTRL, TOYEN) &&
>              FIELD_EX32(s->cntrctl, RTC_CTRL, EO);
>   }
>   
> -static inline bool rtc_enabled(LS7ARtcState *s)
> +static bool rtc_enabled(LS7ARtcState *s)
>   {
>       return FIELD_EX32(s->cntrctl, RTC_CTRL, RTCEN) &&
>              FIELD_EX32(s->cntrctl, RTC_CTRL, EO);
>   }
>   
> -/* parse toy value to struct tm */
> -static inline void toy_val_to_time_mon(uint64_t toy_val, struct tm *tm)
> -{
> -    tm->tm_sec = FIELD_EX32(toy_val, TOY, SEC);
> -    tm->tm_min = FIELD_EX32(toy_val, TOY, MIN);
> -    tm->tm_hour = FIELD_EX32(toy_val, TOY, HOUR);
> -    tm->tm_mday = FIELD_EX32(toy_val, TOY, DAY);
> -    tm->tm_mon = FIELD_EX32(toy_val, TOY, MON) - 1;
> -}
> -
> -static inline void toy_val_to_time_year(uint64_t toy_year, struct tm *tm)
> -{
> -    tm->tm_year = toy_year;
> -}
> -
>   /* parse struct tm to toy value */
> -static inline uint64_t toy_time_to_val_mon(struct tm *tm)
> +static uint64_t toy_time_to_val_mon(const struct tm *tm)
>   {
>       uint64_t val = 0;
>   
> @@ -137,7 +122,7 @@ static inline uint64_t toy_time_to_val_mon(struct tm *tm)
>       return val;
>   }
>   
> -static inline void toymatch_val_to_time(LS7ARtcState *s, uint64_t val, struct tm *tm)
> +static void toymatch_val_to_time(LS7ARtcState *s, uint64_t val, struct tm *tm)
>   {
>       qemu_get_timedate(tm, s->offset_toy);
>       tm->tm_sec = FIELD_EX32(val, TOY_MATCH, SEC);


