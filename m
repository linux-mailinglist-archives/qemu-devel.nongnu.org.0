Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BF24E5833
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 19:13:58 +0100 (CET)
Received: from localhost ([::1]:39414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX5Ub-0006fO-Bi
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 14:13:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX5SQ-0005oh-M2
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:11:42 -0400
Received: from [2607:f8b0:4864:20::1030] (port=39490
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX5SP-0007MH-1j
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:11:42 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 mr5-20020a17090b238500b001c67366ae93so7190538pjb.4
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 11:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=cAV67Kzzzz+0RrzBHHffepxqQjurRkNRf10KxFwW294=;
 b=JzBi3AZbh8gICTo9AtGTcnHh9HNLJBk24pXelXgLPnqcMloXkEQkf2sV+Ioa5uyfZG
 xXfcuNPJvjwMCl3jDryW0uCQYp0WRuYBUL9CDaarTiCdoXT8jUc/RSZxOlR2viKZLtcn
 SrJQB8CGhYdHGHfKNAtDATgHFdm3r26mw12/O/78TVSJLj7ghkt+dEP0nZdadSsZUTHV
 F2HRxuzqBqxt8TdulHlWPIQ73j6Anp0Mj3ZS6KacH1qjrZ74DtoI4aR9qcqcWw+sOAaJ
 1t1+687Om5CblolN7IEbcs4b7cnKYx7v8V0Wf1HY56+cAFbXWDNWeLzQukSiIu3eAr6A
 BUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cAV67Kzzzz+0RrzBHHffepxqQjurRkNRf10KxFwW294=;
 b=xzI3l3Ijub3Rh3r+uZ4pZF6h26JnKMZGrIdcTFJOPxK0DrCxdVI1tGasBteRS/KZY+
 FgztNCQ2uiceAhPxnvjRU0V1W2XCZwvXPr4rjJSQttyiGmYywVZBaqySYl7iruS+ykfW
 NayoCzS2AJWH0e6AFUarDMylb7DI9VTCN8p1Cs5QpgnHU8AsO8eYfcM4zINVvgX5A8TE
 DdCexh+Xu/j1A+nutMMBJ5ifmy+9nJnVcKXAKcMfe+22SGCBhnN8rg3qFe+TngisiW8W
 Ca7LR/0VkFqXjoPqhczUIqDtALxXRHDw5oRo2Bp2SF2fsdDRHrT5SiGvdtgrppaRDVxa
 Mu2g==
X-Gm-Message-State: AOAM533tBlUkDYdxFQ/f/PhEi94p7zI22MqJjaYyRIpkXyW+A+oQ2JhA
 XE4zQdLqb/yvNQAK/fwCXWM4ig==
X-Google-Smtp-Source: ABdhPJzK6W7V18yJGfw/4upzfqqFZsCAfNjbOLD9+uMNYSGuZW6awTzPzsyBKdcIimkuBDRG2MSJBw==
X-Received: by 2002:a17:902:728d:b0:151:dcc8:9f86 with SMTP id
 d13-20020a170902728d00b00151dcc89f86mr1370764pll.76.1648059099418; 
 Wed, 23 Mar 2022 11:11:39 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 v24-20020a634818000000b0036407db4728sm401753pga.26.2022.03.23.11.11.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 11:11:38 -0700 (PDT)
Message-ID: <7676118b-ba72-6efb-fcaf-2b9019066a54@linaro.org>
Date: Wed, 23 Mar 2022 11:11:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 09/32] include/qapi: add g_autoptr support for qobject
 types
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-10-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220323155743.1585078-10-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/22 08:57, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau<marcandre.lureau@redhat.com>
> 
> Need wrappers for qobject_unref() calls, which is a macro.
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   include/qapi/qmp/qbool.h   | 4 ++++
>   include/qapi/qmp/qdict.h   | 4 ++++
>   include/qapi/qmp/qlist.h   | 4 ++++
>   include/qapi/qmp/qnull.h   | 4 ++++
>   include/qapi/qmp/qnum.h    | 4 ++++
>   include/qapi/qmp/qstring.h | 4 ++++
>   qobject/qbool.c            | 5 +++++
>   qobject/qdict.c            | 5 +++++
>   qobject/qlist.c            | 5 +++++
>   qobject/qnull.c            | 5 +++++
>   qobject/qnum.c             | 5 +++++
>   qobject/qstring.c          | 5 +++++
>   12 files changed, 54 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

