Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7857A39BF9A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 20:29:30 +0200 (CEST)
Received: from localhost ([::1]:60978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpEZV-0002sU-IX
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 14:29:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpEWM-0004Rk-II
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:26:14 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:43561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpEWK-0002dw-AT
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:26:14 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 l10-20020a17090a150ab0290162974722f2so6373257pja.2
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 11:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GvKPn4yOmvl3IQQILO5knfcmN49zFoxSi7F3AMeduYA=;
 b=f6bDALtLxCc8SHEUsQWemQXMS2fdXgqTnY4JBIgcTVHJkPeOUonn/A2LlLQ2LDI6QJ
 CQLXDpO2NBPEGiplSw8BS2QzbDhfQlPkpV+OL/MJLErJIkgqhTlTlFScfR203n10TOqi
 HF6ewuXbPxauOlK3HWb3adKf1wG8m/Vx8CklvRCXAc2TtpN4xVmo6/Db6cIY8/gabt1m
 LGzr0FvogD0ebRWFiMkU29RlRsSuUbZL4atfSHL6JQsOjuJmDbo76dmYN+hpHff7EWKJ
 wRjJwNOt2xKwkAS//h2lQNwwFyHru5YhhzUYB4rfFYTjzNJEOFWDknUZViiDSt/FebMX
 CgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GvKPn4yOmvl3IQQILO5knfcmN49zFoxSi7F3AMeduYA=;
 b=oq1dn9YtTkK4QiuaXAiGhJIRgPZvN9TyMWPfrA8W8hkUOtxSj9YH7ekJi8anoqpQ0N
 O0thOUoghAE9GV12c2Z11sDO2oc8ubYC97pis4IQH+Kh34m8ZCh5fBXLrS4cAMMi8bc8
 JuHOsjSS3zg7ARQxo6BO8SpJ/ZtpDISTXNJGKDX1AX6DPc2LW5O8+aLCHU+dUpKf4Ehl
 pHUiA5CXKltYMtvMLPdcljOFRJOefvAJx+mXcBfy6vkGxSL99wTIEMShTzaXB6DJx8a0
 JKJKDRRAHtmlbWzxkY8z5xY12Vqzy3DUimT7/jSNIY/gVyPbuHabP+FuKoqyOU93qpv2
 LI9w==
X-Gm-Message-State: AOAM532bssuRLCk6obNn7hbggrnBj8WmW4ks+QTgw/PQuAbk7nI5vyvN
 I8830yndETnTVweExbZs9IVBsg==
X-Google-Smtp-Source: ABdhPJwesw7+AZ/Wt9dL9xKepjnGD+RP/BzH+17JmNtHlA4guyJ0QbFj0gICwhlFxFPA+hhlfLgXUw==
X-Received: by 2002:a17:90a:e94c:: with SMTP id
 kp12mr17962191pjb.134.1622831170493; 
 Fri, 04 Jun 2021 11:26:10 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 r19sm2224598pfh.152.2021.06.04.11.26.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 11:26:10 -0700 (PDT)
Subject: Re: [PATCH v16 01/99] MAINTAINERS: Add qtest/arm-cpu-features.c to
 ARM TCG CPUs section
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <915aa9b2-023a-0265-7faf-3592c4607438@linaro.org>
Date: Fri, 4 Jun 2021 11:26:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:51 AM, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé<philmd@redhat.com>
> 
> We want the ARM maintainers and the qemu-arm@ list to be
> notified when this file is modified. Add an entry to the
> 'ARM TCG CPUs' section in the MAINTAINERS file.
> 
> Acked-by: Andrew Jones<drjones@redhat.com>
> Reviewed-by: Thomas Huth<thuth@redhat.com>
> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20210505125806.1263441-2-philmd@redhat.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

