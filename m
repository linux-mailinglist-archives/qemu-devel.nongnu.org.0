Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F91340903
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 16:37:30 +0100 (CET)
Received: from localhost ([::1]:44084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMuiG-0002fS-Ko
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 11:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMugd-0002Cx-0l
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:35:47 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:32874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMugb-0002Yy-Bo
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:35:46 -0400
Received: by mail-qk1-x736.google.com with SMTP id l4so2423534qkl.0
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 08:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BB3knp/qYMDkd6gsCN8KcTYStzMCFeNux7zkBZQaJ0Y=;
 b=c+djd/yOfGpN4r8IXJwddVUViV3SIOKONZQaI2QhX9R7BC6vUS2Aj9Zuyq6ZbFVN9r
 A7J17f/BIjbDoQA1I53Wai9z9/Ekhh1P2rd2i/Bcz+ZnjgjeKwxa1ZvxdRjmH5qdDnHG
 TIMWi5/jVaxRZfEI+EEQdlGy16/lbkDKjrQFIZDEs6gNsYg3uJc9Yx964MlMbXBs9S3V
 LBSYB8u3d7P8XamhxAOu8oi0dil7fib0P2x3a3ntsDN6AnSsphXbGzbCoB9ot8GVVqnr
 EKPWA50LgwaVBw0bC2tMy96617jL/ryd2+JSMnVW46sNbc+Z2Mm3jTTbMnPAV0FEnNOs
 6DNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BB3knp/qYMDkd6gsCN8KcTYStzMCFeNux7zkBZQaJ0Y=;
 b=gjBLMNQK822hAUFLDX4lZTVyj5w5AP/c9/2qfG4crAo3n1xo+KsfzjWhkI7n+Bkoo5
 /Y07uGQoAT0Hcqqmyc+dOx6uTG4HTpdjyIfVn0Zid1nqp4hgLMMP+CA0udF/bFLQHxyK
 JiMBhpQ8Ab/AFSJfuZxDBtGyXDhNVl5A6hoyZP6zqvZoKPrCgYSwJTJ1gvgfY6otdGYu
 EcF/kq8yRTatJX1OZ4GEzuzvn7b2/5/z0vSR1W86qzEEn2KjPo8wjHXiGzoVktrTKOiD
 BGEDlNwTo7iGKazNwwvO54Iga+T9kQ5CSr5EsDcuMwfSul+fn4Myi8p/5MKuA3Bk9a2j
 O/1w==
X-Gm-Message-State: AOAM531CFFqITCazRQzveniVzmzQIFFq68JPvIwoxR1rMB9Zb9DYQRUD
 +ctqWl37Jibc78utgef+XXojTA==
X-Google-Smtp-Source: ABdhPJwRnU9X9urOl1lSwCMJFG4tIPPV14UZvqw13Oj5jdl4CV36Yr7iHU3+T1mvp5ix2mpfV5e8Pw==
X-Received: by 2002:a37:a282:: with SMTP id l124mr4778417qke.37.1616081743707; 
 Thu, 18 Mar 2021 08:35:43 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id q143sm1967131qke.110.2021.03.18.08.35.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 08:35:43 -0700 (PDT)
Subject: Re: [PATCH v8 16/35] Hexagon (target/hexagon/conv_emu.[ch]) utility
 functions
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-17-git-send-email-tsimpson@quicinc.com>
 <f0ff8663-9ea2-e8be-9123-4afffc41bad2@linaro.org>
 <BYAPR02MB4886A70EA367526D5834F501DE699@BYAPR02MB4886.namprd02.prod.outlook.com>
 <75d9fed2-ac04-846b-1426-6cd9fe657924@linaro.org>
 <BYAPR02MB4886CE42E5E7E79CD9C5006FDE699@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <db5eac2a-09fc-bf74-9738-8f058c439f82@linaro.org>
Date: Thu, 18 Mar 2021 09:35:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB4886CE42E5E7E79CD9C5006FDE699@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x736.google.com
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
Cc: "ale@rev.ng" <ale@rev.ng>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "laurent@vivier.eu" <laurent@vivier.eu>, Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 8:11 AM, Taylor Simpson wrote:
> Actually, softfloat raises inexact instead of invalid.  Is there a way to override?

Not true:

     switch (p.cls) {
     case float_class_snan:
     case float_class_qnan:
         s->float_exception_flags = orig_flags | float_flag_invalid;
         return max;


r~

