Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FEF45B7AA
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 10:44:06 +0100 (CET)
Received: from localhost ([::1]:43002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpoov-0007Gx-SL
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 04:44:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mponX-0006Xg-Dx
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:42:39 -0500
Received: from [2a00:1450:4864:20::42f] (port=35502
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mponV-0001q4-Gg
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:42:39 -0500
Received: by mail-wr1-x42f.google.com with SMTP id i5so3078497wrb.2
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 01:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sVnao8EeZ5rpEmACAUIi9fLp//PJPqmHzM58lBz9cuU=;
 b=qZHN5Q1OVsSYMqT7uZByw81H3noDZAdMqZecBOvTmDyr/Q6D1rtIBKraxp1Yy/DUKe
 hR2eQh0WRWhPRYQu0KibWBC58IginC6cF5pBdmRF1KHyezGJHQyjLxXLs4lon1u7M1Er
 vZJNimoONXEYCjJ0bu9AcNTVNYKtk+27VsO3nNkC1FXVgFPo/ObQ3i3PKqwi2eN7lEJG
 JF+UwKNXAcmC51DG78t+kGrAzYP2pFvMUJVnoP6EJMU5V9vCNj/Wnen082DanjXw0cFB
 QNtCw+B6wbkxwVBLGBQBSsVv+WldCWT7ytvHtkPYEPE5j60Zps/Asg8iDxtlXhL5aCbN
 FT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sVnao8EeZ5rpEmACAUIi9fLp//PJPqmHzM58lBz9cuU=;
 b=DBjKGn8s0HZE3gKIz/VHXkRv0eLwJKJdWyXS3Ek5E/+wXSVodjfWtdjA3ocJz01yA9
 YZL7mY1o/dVHh1rbUScflC6jd9cW08PIc1tTfYVwWDqhX18tsfcdIis/F9AIPNe7lxJW
 MLmQm+4FmkTY8s9hUG+6hp57rS3IKmzP0isYx5U22b4yszUroAh77m3ySpDWLHRShKQC
 +3YRg6RJVlPUXHp6hejWGTDgeoSllifkxYTBQCjkzNh66kOjpOn384bLIFsmNV56f1Cl
 5pucKjPxzPk2nvo4e9hQtWb455Ufj41MlCjD14Z5RKXtEiLSsvxBtQnCrBoWmd8mKdjR
 1n0w==
X-Gm-Message-State: AOAM530ewGsdF32maMfbSl1t+0eLDWRClCO6Re00eMuUIzcNxTVgbZfr
 wtc77KpTDiVRPp5M9sbYarbjlg==
X-Google-Smtp-Source: ABdhPJwnlrMV2+osKLO6XERU97sGSuHnpmyhYUTlL79AA2yiDPLZXq3uAQkunnevcQUN5zSlxbQsfw==
X-Received: by 2002:adf:b1cc:: with SMTP id r12mr13661214wra.217.1637746954755; 
 Wed, 24 Nov 2021 01:42:34 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id h15sm4864931wmq.32.2021.11.24.01.42.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 01:42:34 -0800 (PST)
Subject: Re: [qemu-web PATCH v3] Add Sponsors page
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211124080519.440677-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cb04d11f-cfe4-5de3-6e46-345f2fafaad3@linaro.org>
Date: Wed, 24 Nov 2021 10:42:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211124080519.440677-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Markey <admin@fosshost.org>, Alistair Francis <alistair23@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 9:05 AM, Philippe Mathieu-Daudé wrote:
> Add a page listing QEMU sponsors.
> 
> For now, only mention Fosshost which requested to be listed:

This...

> https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg05381.html
> 
> Cc: Thomas Markey <admin@fosshost.org>
> Resolves: https://gitlab.com/qemu-project/qemu-web/-/issues/2
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Since v2:
> - don't explicitly state /what/ we're using the resource for,
>    just that we've been granted it (danpb)
> - list Azure Cloud credits (Daniel)
> - list PLCT Lab (Paolo)
> - list Wow/CIP United again, since other are listed (Phil)
>    therefore do not include Stefan R-b tag.

... no longer matches this.


r~

