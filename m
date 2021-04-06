Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D726355D4C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 22:57:38 +0200 (CEST)
Received: from localhost ([::1]:49152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTslV-0001no-FG
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 16:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTsfV-0005WE-A8
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 16:51:25 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:34414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTsfT-0003a6-PO
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 16:51:25 -0400
Received: by mail-pg1-x534.google.com with SMTP id z16so3887680pga.1
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 13:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9hRqDXoky3u+J1wx3M5/uyV5ckAEl7c4cJ/TG9asXbU=;
 b=AkQQ1NZ7iVcSA4zlLuRa+kd0biBQ1zTyx6lnhl3eQz/EwXW+Xz+pECwXbgOQ987taP
 JtWsN2wfbxtDRwWyGQjznqqPi8jkuJocOhdIaWGlU+II2JtJfwuB8cLnhXKJfSZJzRyK
 H8N0DrLnCy1dZJaVmwYtf+UhmzXVKPSYHYvVA7q9ccy6c2MLqY0KErqpJ2MwoY0w8KJj
 5QW8mjxtTiiaVtLb7hPK/e9fCpRDoQZgqTChum4xXslh+BYwnyzEQ3YVurXkexy7GqOz
 Hl2qSo2qC18b6afaoAyVYPO0mbo0TZVX8S6GwKqlO39J9YC08FTBCZpZ0LuKwzQwsI4Y
 xwwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9hRqDXoky3u+J1wx3M5/uyV5ckAEl7c4cJ/TG9asXbU=;
 b=VzAp41JfcX2qs1yScjIvsrFI88CiGWx5Ml1dMdt320q70pW3dlMRHm8cmWjNc/Fqgg
 65fhHsSZ1OPP/B/6UFdOvqsbf+5j+S7HxrTlD9gLYbWzcG+ylBa/T56VGk/pD5SR/I9Y
 MpJDt2aMg17NFD9LqEruE86kPbITbDc8r27/YvK+4Mo5/VPQLMkrbvgBWBKvVwQgs58q
 9D2bdjezphS0OSp4Q4f4Q7ZTdsMOmxXzfwb063RKCG7s7aUtEFySW55pOBmmqFjTcUrO
 v8PoO3ACRLck6mFDp3Kwq/j8eERaj5UnNTRhYX0JXeDAlT6ZFwMTXFK4ZUShd5y2i0nJ
 TCoA==
X-Gm-Message-State: AOAM531z8PxIE3awym0KJSj9xKTi2QSBSYs3Za3apgc0jqF2YnL1qdoW
 OilcwLH2dZNMHVf6mim0Is9n+A==
X-Google-Smtp-Source: ABdhPJww1Vm3PsMkuSpovagVeC2mVP4uUBapINI9Cic4b17XUrMi6CpdfrKiapaMIqwtkZb1Uogg6g==
X-Received: by 2002:a63:1502:: with SMTP id v2mr65302pgl.22.1617742282279;
 Tue, 06 Apr 2021 13:51:22 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id 14sm18044390pgz.48.2021.04.06.13.51.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 13:51:21 -0700 (PDT)
Subject: Re: [PATCH v2 14/21] Hexagon (target/hexagon) add A5_ACS (vacsh)
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
 <1617249213-22667-15-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f442b907-3e48-a452-9f6a-913d15296309@linaro.org>
Date: Tue, 6 Apr 2021 13:51:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1617249213-22667-15-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
> +#define fGEN_TCG_A5_ACS(SHORTCODE) \
> +    do { \
> +        gen_helper_vacsh_val(RxxV, cpu_env, RxxV, RssV, RttV); \
> +        gen_helper_vacsh_pred(PeV, cpu_env, RxxV, RssV, RttV); \
> +    } while (0)

You've modified RxxV before its last use.
I think just swapping the two lines is sufficient.


r~

