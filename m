Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A979F309
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 21:16:01 +0200 (CEST)
Received: from localhost ([::1]:56188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2gwi-0005c3-6J
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 15:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35844)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i2gvX-0005Bd-P2
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 15:14:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i2gvW-000352-Bz
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 15:14:47 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:36892)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i2gvW-00034M-3w
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 15:14:46 -0400
Received: by mail-pf1-x442.google.com with SMTP id y9so34320pfl.4
 for <qemu-devel@nongnu.org>; Tue, 27 Aug 2019 12:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DQI+jaZHkmkoU4U0OWZz6t/vPJmMdVZ5A6/M9eok95U=;
 b=ntppIMHkOLfikKJdjSQwCE37WKuc0iJvGUPoTAmXPbJHYCoCWkd61KY8/fuKUBpWo8
 dSrjHu8BiIXHsW5blfF+K0S5comRsZTmqttcrbZRTI5djpScWukxp/xrDTBqCh1owPkY
 YWsOTUTAbNxT4wmB4cqzYmN+ZwQoQ9OTkeBTrWgoAiZ4pzPKyOYQejAmLZ3+kR4qPiZ1
 0hRSdeJU2GxXqdRqH6v77aImRqZyzms2h1DH5XOVn9l51iitQJaz05RSvM+XTq1PGaH5
 l2loS0dyOxvwn5822+/M5ZX5VqZ5OuNP0TQ8DWN2D7OrSGTCu6luSQNPcQe/F3lqYhDc
 7N7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DQI+jaZHkmkoU4U0OWZz6t/vPJmMdVZ5A6/M9eok95U=;
 b=rTmZ7ce+iHgROBIwZyEJcfSEmad2PCaDp5fuN3/bW1s4YJ1TpTuM/vZeaIttjcmFn9
 i9oTrhaY/A99h8oPHpWOMFszSzO6/OW3o7EkFjXnJC97x9CUI37U3cag/lCRrfjrZuk/
 9j+r4MS71d7URO7GlkXl1tb/ErPSWdTlyrMonxE+mRjNtlFDp6G5HNMd3FY50ReBHvte
 vyuIGGW5+vVHyfSY11Oh+1t79XQISie+QtO4zeYVLzcXCwvRXSnlcjGYjamUXwws85Wf
 2UcXEamS0URGDfjpGozNJslJW5tj6xEyydTtFEI3lE9J9t7AWQkQoAxXzJuiyT2VkphA
 6D3A==
X-Gm-Message-State: APjAAAXWb5B3835oXtbhhuN9bQKrSlDv1HREAMoDjxFjI8RFzSLGqXmj
 C2BAFWuczB8SrblIm7235dIAYyRRuG8=
X-Google-Smtp-Source: APXvYqwKYfmgJeEDnfCR4tkFjmZPvRWr3qG6/TO7/Q74mGfdkZdITIjScAyuu4u7AEu8i8rcimUXJw==
X-Received: by 2002:a17:90a:17e2:: with SMTP id q89mr315133pja.8.1566933284579; 
 Tue, 27 Aug 2019 12:14:44 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id m34sm23084pje.5.2019.08.27.12.14.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2019 12:14:43 -0700 (PDT)
To: Stefan Brankovic <stefan.brankovic@rt-rk.com>, qemu-devel@nongnu.org
References: <1566898663-25858-1-git-send-email-stefan.brankovic@rt-rk.com>
 <1566898663-25858-3-git-send-email-stefan.brankovic@rt-rk.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e5f2bdb8-7bce-9b88-c2c9-79f1eeb52414@linaro.org>
Date: Tue, 27 Aug 2019 12:14:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566898663-25858-3-git-send-email-stefan.brankovic@rt-rk.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-devel] [PATCH v6 2/3] target/ppc: Optimize emulation of
 vclzh and vclzb instructions
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
Cc: david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/27/19 2:37 AM, Stefan Brankovic wrote:
> +    for (i = 0; i < 2; i++) {
> +        if (i == 0) {
> +            /* Get high doubleword of vB in avr. */
> +            get_avr64(avr, VB, true);
> +        } else {
> +            /* Get low doubleword of vB in avr. */
> +            get_avr64(avr, VB, false);
> +        }
> +        /*
> +         * Perform count for every byte element using tcg_gen_clzi_i64.
> +         * Since it counts leading zeros on 64 bit lenght, we have to move
> +         * ith byte element to highest 8 bits of tmp, or it with mask(so we get
> +         * all ones in lowest 56 bits), then perform tcg_gen_clzi_i64 and move
> +         * it's result in appropriate byte element of result.
> +         */
> +        tcg_gen_shli_i64(tmp, avr, 56);
> +        tcg_gen_or_i64(tmp, tmp, mask);
> +        tcg_gen_clzi_i64(result, tmp, 64);
> +        for (j = 1; j < 7; j++) {
> +            tcg_gen_shli_i64(tmp, avr, (7 - j) * 8);
> +            tcg_gen_or_i64(tmp, tmp, mask);
> +            tcg_gen_clzi_i64(tmp, tmp, 64);
> +            tcg_gen_deposit_i64(result, result, tmp, j * 8, 8);
> +        }
> +        tcg_gen_or_i64(tmp, avr, mask);
> +        tcg_gen_clzi_i64(tmp, tmp, 64);
> +        tcg_gen_deposit_i64(result, result, tmp, 56, 8);
> +        if (i == 0) {
> +            /* Place result in high doubleword element of vD. */
> +            tcg_gen_mov_i64(result1, result);
> +        } else {
> +            /* Place result in low doubleword element of vD. */
> +            tcg_gen_mov_i64(result2, result);
> +        }
> +    }

By my count, 60 non-move operations.  This is too many to inline.

Moreover, unlike vpkpx, which I can see being used for graphics
format conversion in old operating systems (who else uses 16-bit
graphics formats now?), I would be very surprised to see vclzb
or vclzh being used frequently.

How did you determine that these instructions needed optimization?

I can see wanting to apply

--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1817,8 +1817,8 @@ VUPK(lsw, s64, s32, UPKLO)
         }                                                               \
     }

-#define clzb(v) ((v) ? clz32((uint32_t)(v) << 24) : 8)
-#define clzh(v) ((v) ? clz32((uint32_t)(v) << 16) : 16)
+#define clzb(v) clz32(((uint32_t)(v) << 24) | 0x00ffffffu)
+#define clzh(v) clz32(((uint32_t)(v) << 16) | 0x0000ffffu)

 VGENERIC_DO(clzb, u8)
 VGENERIC_DO(clzh, u16)

as the cmov instruction required by the current implementation is going to be
quite a bit slower than the OR instruction.

And similarly for ctzb() and ctzh().


r~

