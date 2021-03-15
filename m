Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 584F733C70D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:47:41 +0100 (CET)
Received: from localhost ([::1]:45124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLtBj-0003jk-Vk
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLtAH-0002Qd-TQ
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:46:09 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:41400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLtAG-0002i3-Am
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:46:09 -0400
Received: by mail-oi1-x22c.google.com with SMTP id y131so32807974oia.8
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 12:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=o3w+X3Z9DgfJgc7F8sqgfgY/YQvoowUxFNFFPAvqZIk=;
 b=fEPHH3hVKSjO9Wm1uaqK9voZY75vBNP9Huvzd27E9xtML4CIsAldqhjZ+ITZ/kvo9r
 ymFyXSIJC+Op/ifwz/Q2dNzeWi7nxxXxnHrmaoubd4kZyTY0+GfOZH2gc6b8KRY5x1Tc
 oTMNP0qL534mNy1GCDV8kldwrlRw0U33zMyWWM+Le4Yg9Dq4fdsHvVLftZPT9tidSJ7W
 hzedFhDLhcWVoljxWzkKTBb9f35ERs0EbQXbr4thQBO/u+yTa+4dT8VUoViAnlhgGlmU
 ShIV2BNqtPkBPP4GyEM6XWZ/BnirZStrbzNIak7M1i+IMW/yEdVKdv05tDS0EeuX+H51
 pMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o3w+X3Z9DgfJgc7F8sqgfgY/YQvoowUxFNFFPAvqZIk=;
 b=SUXa4Kw3OeMxKxgEl3M5CEQd8Pr/r0OhcYMF4wrMa0mpYugIY6pFzmq/OKCNUc6I85
 sTaAUAjTeCcUCEy92uMbbkFarUCo1YwVfeeXZsjZbhgiDnXuVElk3QGJv54WEGazfG0r
 1arxwb3gVBmYPzEjFr4mhrwfzdW1l79IsW+pdkNzg8ZLwk49S0VDH1tYtg9yKJHiYju4
 i3FToa91ItYRs1rcwuO4wOxYu/BT8PQ853gNHDMq5Ymyi1WHixQiU5x6qdKu+gUxM7/9
 sRdXp774Kqm6y11YgbPUY7Jd+S6OKChH2OThaULljzVMMVxOXtj84XKFivmAxVQ5mThA
 wlUw==
X-Gm-Message-State: AOAM533V7wmbygNp23h7hUdvZTjDtkHjxq67id7+5sOzZZuLwtAUq/5m
 ZHBK6V2gYsT6TkFU1nbOJH5Gog==
X-Google-Smtp-Source: ABdhPJzaSA7dDxYalQZ84nPQhzrh9aVe6cLbat3S1cFHgftLW6+nTPNJAY8kfSh2F3ftreekaopSJw==
X-Received: by 2002:aca:c3c8:: with SMTP id t191mr520927oif.171.1615837567062; 
 Mon, 15 Mar 2021 12:46:07 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id e2sm7336553oti.8.2021.03.15.12.46.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 12:46:06 -0700 (PDT)
Subject: Re: [PATCH] Hexagon (target/hexagon) fix typo in comment
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1615784115-26559-1-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f228097e-68d1-2e4e-9ff6-443fb734a4f1@linaro.org>
Date: Mon, 15 Mar 2021 13:46:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1615784115-26559-1-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
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
Cc: philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/14/21 10:55 PM, Taylor Simpson wrote:
> Signed-of-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/op_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Queued.


r~

