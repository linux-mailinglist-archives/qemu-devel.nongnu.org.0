Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F71F510926
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:33:54 +0200 (CEST)
Received: from localhost ([::1]:57338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQwb-0002Yv-Oa
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njQBt-0003cI-2d
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:45:37 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:39606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njQBr-0000oR-Eh
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:45:36 -0400
Received: by mail-pl1-x630.google.com with SMTP id c12so31037449plr.6
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DBDwrP0L9Ax2VEe+wgAT2EfPtUE2Bkt+Cbi9q1zI43g=;
 b=Pk941Oa/tkuF8062P6fiWglZYt5rebi+rFl0e+osb0mZUdqL4iLA9C1Rcqn3H6zTPB
 683n2AVYpY6Qz5Gp//ekgx9WTOi7J+CO0kCaTjluHfHBHZYhwoqmXeTkI0tmDTC6HhcZ
 l91SHStoQRyBAfchimjYEGFcPBZzv85kdEotBVZJISRSgxRYG2bdzvns2z/dXdXuLfdF
 4xaX5ltcj2j88EXqU8NkSBYc5QJWGRNPWVWtB2M84Xm3/cUAziObatbjnUnzuZEkyt+8
 luIZTEeAGnqSQP5ZxB2BQlj8gG4frK2hsZb9luRhXKhvy3tMfgduBOH2X+9W+JxJri0D
 FRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DBDwrP0L9Ax2VEe+wgAT2EfPtUE2Bkt+Cbi9q1zI43g=;
 b=OBfa+zAlpSUuntxKBbE7Kjex04bLs5zQQ6l9K5BHaBoz64hTY2AOT6O3KtfPhVu4sF
 ZmgT8xDsRKUsNqCnR+LZDzAIWEQfVdm/lN8gOOB65Oy4sOc02XUpam/bXAieCnOyNOwR
 rMFsfB61kRdrpga1mLRSStBeHf6OOH2cMlIgSXse1mwnoZqaCkEh2GA4g9OIE5n6lgFz
 ergpKfHXtf4ulrEcBa9PLkvkz2F5vZRNTaDznrWa1nnWAfxYqTnEfkiSgo2qTzpPusl4
 lbHx1It4v+ldzSx0Ym8f+qUoxFtf1aRbHlSap0cmsciJsAUvILzddGOR4sxeIkgGRB69
 L8MA==
X-Gm-Message-State: AOAM533xZR34HSaQI27zpUS+cIDN0Nr/qS8/ugYku0vPXbozgkl/wOe5
 4nu9gzno8j7AkRr6Kn7q43ESLA==
X-Google-Smtp-Source: ABdhPJx7A/7FljWobxb3CLwm1spMBXbyg28pSAHeWD0JtFbcDeawL7elmC0SxlxnWnJvcAPJ4gzToA==
X-Received: by 2002:a17:90b:4c47:b0:1d9:88b2:1995 with SMTP id
 np7-20020a17090b4c4700b001d988b21995mr10480203pjb.80.1650998734000; 
 Tue, 26 Apr 2022 11:45:34 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a056a001a0600b004f7bd56cc08sm16110878pfv.123.2022.04.26.11.45.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 11:45:33 -0700 (PDT)
Message-ID: <40c2ef33-2775-5d85-e9ff-122d6aae4ced@linaro.org>
Date: Tue, 26 Apr 2022 11:45:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/9] replay: notify vCPU when BH is scheduled
Content-Language: en-US
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <165062838915.526882.13230207960407998257.stgit@pasha-ThinkPad-X280>
 <165062840023.526882.4524922830180183891.stgit@pasha-ThinkPad-X280>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <165062840023.526882.4524922830180183891.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, wrampazz@redhat.com,
 crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/22 04:53, Pavel Dovgalyuk wrote:
> +void icount_notify_exit(void)
> +{
> +    if (icount_enabled() && first_cpu) {
> +        cpu_exit(first_cpu);
> +        qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
> +    }
> +}

Why first_cpu?  Did you really want to continue to the end of the round-robin?
Otherwise I'd expect qemu_cpu_kick(current_cpu), or something.


r~

