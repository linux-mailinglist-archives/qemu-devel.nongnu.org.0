Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2673D5D28
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 17:36:58 +0200 (CEST)
Received: from localhost ([::1]:48034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m82f3-0002EW-Q4
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 11:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m82e0-0001YM-2H
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:35:52 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:33510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m82dy-0007sU-Fb
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:35:51 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 gv20-20020a17090b11d4b0290173b9578f1cso300382pjb.0
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 08:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=09KJdSp37UkT5CV1A2F1l8cCXYAed5M5NV7z45xl/AQ=;
 b=YEBBOht3kUS0OMRjhhE2xMYCpaBP2ms3titevXiCb3bBXbW8xu2gfJKCMqYM8Qn/w9
 mfQjkJf1nkUTvCurD7vjsnmkYMAg71VAI+OYNdem5ylhwHOcHFfKY7PjJU1dQKycOE78
 p44jgRV2z2AzM6Vct0mXcSD7MTnuFhfG419+k+w80VsoyOtkk5wDRBHzA2CWo07wrncv
 KQtvu6Z4OSKWLaWYMYFZa5+udpoqbbxMk0qZW150sadbmRDH6Se71NSxvYQQcI6y3Uaq
 5Xqx7gLLPI5DUL9C2nO3q63CIQtc7WevNcY50pYa+12pkTKkkJPqiA7FJwhQS9jxd1yd
 iOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=09KJdSp37UkT5CV1A2F1l8cCXYAed5M5NV7z45xl/AQ=;
 b=b78FkAg0MGZyzK9t8HIWDv14pBTCmag8mTiCH5acpp4WOc0oIcU2A+jcqJ/Pooyrh3
 hRxiW84mahbBTPD9y42VVzjFFrWDK6lKBCHwylJAfDuUBgQIpInHvkX7/fuiArUpj+XF
 1aAZLEkI8DYGQcMkFYwdC05ehbXnrWtkqWH6UnBmgVCCxYrh8qsWN+EPvzd8dTK7/Cgw
 /XErXAW0b6o4rYmsC0EOwO+FUKfHyZMYBoK3khlZWBLAhzhZDzXOdXkwUJgYDKtms1X6
 bnqP8Fe5zj3zGVTvB2GpiJOWkYGZnI/sGUdi5O1+KpPsk3UffTqdvTyqLOJVZEp+5vav
 sAyQ==
X-Gm-Message-State: AOAM531v1XZnXMFxXu0DfG+3yY5dZlqKnkNFOoZJOGEBXA6WHo+M0+rk
 MRn8HB6Z3gl8Ylefb+wAKkUzrJbj9ls8fw==
X-Google-Smtp-Source: ABdhPJznaHTOBXFBRtxIStz6zsqWwY0NUkXMTJ9KPkgDDlZwHbCN9ETZ4SoynME0+/VQWJuWna6pKA==
X-Received: by 2002:a17:90a:c003:: with SMTP id
 p3mr17627030pjt.14.1627313748954; 
 Mon, 26 Jul 2021 08:35:48 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id r10sm379417pff.7.2021.07.26.08.35.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 08:35:48 -0700 (PDT)
Subject: Re: [PATCH v2 06/22] target/loongarch: Add main translation routines
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-7-git-send-email-gaosong@loongson.cn>
 <f4780c1c-b6a8-c265-01ff-2825cfc9a9b0@linaro.org>
 <ee0c91d5-0b47-bd79-22e4-68560d2dcf0e@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <46389389-96e1-6838-2e7b-07a685fd95cf@linaro.org>
Date: Mon, 26 Jul 2021 05:35:44 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ee0c91d5-0b47-bd79-22e4-68560d2dcf0e@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.438,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, yangxiaojuan@loongson.cn, laurent@vivier.eu,
 maobibo@loongson.cn, alistair.francis@wdc.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/25/21 11:39 PM, Song Gao wrote:
>>> +void gen_base_offset_addr(TCGv addr, int base, int offset)
>>> +{
>>> +    if (base == 0) {
>>> +        tcg_gen_movi_tl(addr, offset);
>>> +    } else if (offset == 0) {
>>> +        gen_load_gpr(addr, base);
>>> +    } else {
>>> +        tcg_gen_movi_tl(addr, offset);
>>> +        gen_op_addr_add(addr, cpu_gpr[base], addr);
>>> +    }
>>> +}
>>
>> Using the interfaces I quote above from my riscv cleanup,
>> this can be tidied to
>>
>>      tcg_gen_addi_tl(addr, gpr_src(base), offset);
>>
> 
> 'riscv cleanup' series at https://patchew.org/QEMU/20210709042608.883256-1-richard.henderson@linaro.org/ , Right?

Yes.


r~

