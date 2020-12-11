Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FC32D79D8
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 16:50:47 +0100 (CET)
Received: from localhost ([::1]:48130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knkgw-00067j-FD
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 10:50:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knkcR-0001XG-Ex
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:46:07 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:38920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knkcP-0004p6-8o
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:46:06 -0500
Received: by mail-oi1-x241.google.com with SMTP id w124so7146368oia.6
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 07:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YFYu2A9yVyHxFRXn5RmN6/PNpSGPi8MQoUIoNYOHJ0Y=;
 b=WHwkSAX4kWYDcfyqUnjsWgLdPS+LFgk7EuDWYgZpgOhbHidP9V25JKbcVguCT6PnX2
 MZbSkN3yn6NEMB6ySXHBwC2U0f7iooh83IuRJ2wJTSAFZFWSpAe3Gvki0jnukaBbiRxE
 HChSYQU+8pBljNjx+iT4q1fljw93Ambu8ilOjJWwpagbSSkcu9K3ulXj7E9sUNgmnaRB
 xhLxJXDyi0CIWXip7n8l0MZJNqb4QtGBj+iHZ0FA76uerdciSU2v0KaI5pw99Odsyou8
 STr3vI1fdbZ4bEz+Bk8YaUl2EgzW7i1Vwq4a3ot10hzXXpH1jY/58BJJjwtttOkA/RxF
 +ofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YFYu2A9yVyHxFRXn5RmN6/PNpSGPi8MQoUIoNYOHJ0Y=;
 b=W5Lpz768cTFSM8emshj6og1muw3i19pO97fMavuXHQXRoqXP1hYgCWTR3h06d5Ubvm
 aOWD/BzN0Pr7ADwHnnRubpYwTe2DsWu576A7dyTatJNdmHDi8HNfG0CSh8GtDlJe/TQj
 5tdn2zQYLPdUWffStF+f6aMLQ5uBiBo2149BezXGTmPt2fmJgdiMPydpJ92KDFZciDQp
 fT69XHXyk+Awnppmgvj6+H+jPOzyvdXoTdnnk6Mpx5mJF/+7eYfsHz9Ur4dM8Vb/wxBq
 GZOsdg3ivDC4da8GkSHWa8mqozrWQ8tYhdAPSr3qZlxjK5ytwTtrKlTZOwfWpFpX6+St
 swIA==
X-Gm-Message-State: AOAM530YiMqNUOOpj6R3dpiqmK+obsj7KrYoql2cbMvORFD3Z2QjbRQc
 5JIaOe+sITgCPgznpQRPn+vLcA==
X-Google-Smtp-Source: ABdhPJxM6BUfp4fCMeqFfLRMMJ0uxSCCU4a5KV8PGykCPP/QmC7N357eKTz0jbLEgN0vaBS8rNy8mw==
X-Received: by 2002:aca:fc96:: with SMTP id a144mr9771480oii.146.1607701563867; 
 Fri, 11 Dec 2020 07:46:03 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id x130sm214247oif.3.2020.12.11.07.46.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 07:46:03 -0800 (PST)
Subject: Re: [PATCH 11/12] tests/fp: Do not emit implicit-fallthrough warnings
 in the softfloat tests
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 qemu-devel@nongnu.org
References: <20201211152426.350966-1-thuth@redhat.com>
 <20201211152426.350966-12-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dcfe2676-6ca6-6862-7a43-05aa8b84b468@linaro.org>
Date: Fri, 11 Dec 2020 09:46:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211152426.350966-12-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
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
Cc: Chen Qun <kuhn.chenqun@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 9:24 AM, Thomas Huth wrote:
> The softfloat tests are external repositories, so we do not care
> about implicit fallthrough warnings in this code.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/fp/meson.build | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

