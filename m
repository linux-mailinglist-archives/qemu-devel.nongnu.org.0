Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C1F3378C1
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 17:07:32 +0100 (CET)
Received: from localhost ([::1]:58584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNqV-0006ci-Cv
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 11:07:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKNY9-0007WP-B8
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 10:48:35 -0500
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:46998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKNY6-0003NM-4O
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 10:48:32 -0500
Received: by mail-oi1-x235.google.com with SMTP id q130so4623494oif.13
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 07:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+RNjm7mrAC6nOnKCk9uMqHF9P1By+o0WSFikzlKIccA=;
 b=Jh+lUxXB/ltMsBvFU2L+pq7v1ZlYSsoU8icDd4F2tWqKC02Xk89G8UF6oU8oMWz+Ff
 8ErvGmefyvpAED/6QQOCmCC0MC/aVqC+NaR1LY4ybuo9fMXKOIvW1W3Nx82waHnhuGuy
 kiP0RoQvYQ38sCV14UZssEngeGfEITsuTVG2ZMAYKpG3JHlR8fNt6vIe73W/rmeGzj6K
 7+854pGMgQhLa70M0r7LwN9NnZylKdhJCRZVxXaBp4LbUUM8HpN8oTCNwmpsiEmdhOU1
 wNznFYSCuNUDahBSozNEUqLVKorLx+z5llNILVyjhV1/gil/3YvikPXNopqSM9NJkD64
 pL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+RNjm7mrAC6nOnKCk9uMqHF9P1By+o0WSFikzlKIccA=;
 b=p9ng2rv99P4IK5sfhzsluYUysJNMfgyfmKYfi/XN3AmXzgIXFvbD3sgUcuNBIPc5md
 5n9MxZgjxgMKpEy5Xh6sjcZh1ovowhBxbZRFlDnLypRKEhTE/vz3zAKkftdOiKxKOXJ2
 8ogG/+GcnFS2V23X4iE5ZMN6ymcOlwVZ1P+Q9hvSQRb5WUStK1DDNKayRlDxsTR2MUck
 4iTS1x4/Dl7yz/Ou/E0eaQNSwAFpbz/RZv8f1E7TTUig3hGsguF2qaDVTK3WTSkFiPuC
 D2GVW7tb0cSDOUfsdOsD44eP+WImxhn79TUMxyx5R+78ogI+XRkVueNHQv5OUeRk6jy/
 +urw==
X-Gm-Message-State: AOAM5328W1ibmLOyG9WUFFE1Zt8PYlnBcy5K4AwY9b4wK5vcX178EyW7
 JY9yqVZm+JxSUM3coZkXom7iHg==
X-Google-Smtp-Source: ABdhPJxVGxt5PdYOr/Alw4Uk5agsEJGIBDsR5BCD9/QBL/bXlkqtrYwUuuaEfSFqwKY2ZbSI/FSq6A==
X-Received: by 2002:aca:57c5:: with SMTP id l188mr6585630oib.159.1615477708706; 
 Thu, 11 Mar 2021 07:48:28 -0800 (PST)
Received: from [192.168.3.43] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a6sm699504otb.41.2021.03.11.07.48.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 07:48:28 -0800 (PST)
Subject: Re: [PATCH 0/4] gitlab-ci improvements
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210311142211.1547864-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d72df1dc-8f0c-8ff7-3205-582680c4d3fe@linaro.org>
Date: Thu, 11 Mar 2021 09:48:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311142211.1547864-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 8:22 AM, Thomas Huth wrote:
> Thomas Huth (4):
>    gitlab-ci.yml: Move build-tools-and-docs-debian to a better place
>    gitlab-ci.yml: Add some missing dependencies to the jobs
>    gitlab-ci.yml: Merge one of the coroutine jobs with the tcg-disabled
>      job
>    gitlab-ci.yml: Merge check-crypto-old jobs into the build-crypto-old
>      jobs

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

