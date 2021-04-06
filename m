Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B61355D46
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 22:55:46 +0200 (CEST)
Received: from localhost ([::1]:45454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTsjh-0000Cg-9e
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 16:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTsba-0002p4-Jo
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 16:47:22 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:42980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTsbY-0001nG-U3
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 16:47:22 -0400
Received: by mail-pl1-x629.google.com with SMTP id z12so4115945plb.9
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 13:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rKivo4vIc9Qw4vbZijyoM/rK1TOtB9gBEXJ2jh/JV1c=;
 b=H7Ict+sqdM60HrenZUHXgn/bd/JGrMN8W+IC7gwKDTVXGtU2DOD9PJRvwGEDhqxHig
 UoQZkQmfM0h2qU8OXCqxcoedngLmooC4JgrwRAoZeULC0bnySUyd/WY1fQ3LR4hV3EzZ
 p5NyWKTg0D55D2xhgOZvp15cmHZ292x6KNBQA9NC6MPpac6RNRVSqlljUUTe2wNiLy2x
 8diJkH3eymvi/j2MlfnGbE4hRtmsFJLemiZrT/6rH1/JIca2O6xeK47yayiNjPtGUtUF
 Ma0OoExN80youP4jne0Q4FYErX3wEMQorBq/52xsbNrOvDP69PYT4n2FXe4l79P+dNHH
 zjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rKivo4vIc9Qw4vbZijyoM/rK1TOtB9gBEXJ2jh/JV1c=;
 b=BB0xY2ZK6Eiv4XE6WbKZ2ypaBLoIM5zwUanA/fNWH039ZQUc33qIh3+LK7+8auaO+J
 X6gHZsDgLUnF8GVjEX/b4vnTfEX3+mw53D6jV23cYfLtmCJ4IoZRkB5wdh73MA+xOElz
 S5npNy0bOP69sEVEtevACjSdw4XdbuIIlpHKspBStmJfzzDvoYfvpGKlkfGi9vYswxsE
 fd9RYnMijihBrFTfpVPy5OvsOTlrYbr8k72j3nTZ0T4LjuMifK4+1gF6C6DCYdmeBOm8
 UEAHnGH9d1xbkoRMqEPhWI58lYqoanK8lETrQZ+YWx1eHRDrbed10ztdo0dDZYCOPCGW
 KhEQ==
X-Gm-Message-State: AOAM530RO+20cHvJjbAzrKYo+gHN1BPwT3iCxmYmLW4QKb918PSOQ3Zq
 vtrDjirsHZDokuhKZAZmTfB7Lg==
X-Google-Smtp-Source: ABdhPJz22JYE0EwslQ+hFkWNXXat98oyVYRzSiBEr+x+bf14YZbU8ucarIZJfGNCpucCi8z96VEIXA==
X-Received: by 2002:a17:90b:8c3:: with SMTP id ds3mr21275pjb.71.1617742039406; 
 Tue, 06 Apr 2021 13:47:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id l3sm3175362pju.44.2021.04.06.13.47.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 13:47:19 -0700 (PDT)
Subject: Re: [PATCH v2 13/21] Hexagon (target/hexagon) add F2_sfinvsqrta
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
 <1617249213-22667-14-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c4e9282f-e42a-28d1-2ef7-94a0ae2ae001@linaro.org>
Date: Tue, 6 Apr 2021 13:47:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1617249213-22667-14-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/21 8:53 PM, Taylor Simpson wrote:
> +int arch_invsqrt_lookup(int index)
> +{
> +    index &= 0x7f;
> +    const uint8_t roundrom[128] = {
> +        0x069, 0x066, 0x063, 0x061, 0x05e, 0x05b, 0x059, 0x057,
> +        0x054, 0x052, 0x050, 0x04d, 0x04b, 0x049, 0x047, 0x045,
> +        0x043, 0x041, 0x03f, 0x03d, 0x03b, 0x039, 0x037, 0x036,
> +        0x034, 0x032, 0x030, 0x02f, 0x02d, 0x02c, 0x02a, 0x028,
> +        0x027, 0x025, 0x024, 0x022, 0x021, 0x01f, 0x01e, 0x01d,
> +        0x01b, 0x01a, 0x019, 0x017, 0x016, 0x015, 0x014, 0x012,
> +        0x011, 0x010, 0x00f, 0x00d, 0x00c, 0x00b, 0x00a, 0x009,
> +        0x008, 0x007, 0x006, 0x005, 0x004, 0x003, 0x002, 0x001,
> +        0x0fe, 0x0fa, 0x0f6, 0x0f3, 0x0ef, 0x0eb, 0x0e8, 0x0e4,
> +        0x0e1, 0x0de, 0x0db, 0x0d7, 0x0d4, 0x0d1, 0x0ce, 0x0cb,
> +        0x0c9, 0x0c6, 0x0c3, 0x0c0, 0x0be, 0x0bb, 0x0b8, 0x0b6,
> +        0x0b3, 0x0b1, 0x0af, 0x0ac, 0x0aa, 0x0a8, 0x0a5, 0x0a3,
> +        0x0a1, 0x09f, 0x09d, 0x09b, 0x099, 0x097, 0x095, 0x093,
> +        0x091, 0x08f, 0x08d, 0x08b, 0x089, 0x087, 0x086, 0x084,
> +        0x082, 0x080, 0x07f, 0x07d, 0x07b, 0x07a, 0x078, 0x077,
> +        0x075, 0x074, 0x072, 0x071, 0x06f, 0x06e, 0x06c, 0x06b,
> +    };
> +    return roundrom[index];
> +};

Similar commentary as for recip, but otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

