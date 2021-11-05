Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC54446617
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 16:44:40 +0100 (CET)
Received: from localhost ([::1]:58128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj1OR-0006j9-H8
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 11:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj1La-00045C-A2
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 11:41:42 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:39847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj1LY-00007M-2O
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 11:41:41 -0400
Received: by mail-qt1-x82f.google.com with SMTP id x10so7079632qta.6
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 08:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qpC39RsLR8965d0WgV4iLmSeRjHxXgBq7CgQ+gMygO0=;
 b=UBxihKtN8N2Df1CTuawzqTQBddBOjHOVJbfUD36aD8KXeksLt6myIokljZILEUeh+h
 cljvepg52cOCxBORqzZ/E8fmjBrxz472CZ8XO+z713w6pChB1RiG7i45VMFSb4maySHR
 wKsRYnINbSSZzG8vnpuLTyxyyLi936O/7Qvw1al6ydGQG3o01YdHf7pCDaNAQp1H9Gjm
 o2Wfk7Ff0B7sJCZWjmuDK2mJwCI0woAacZTDM7edjHjxOqV4WEznM2mYVAb+li+eNUjq
 KKE7ssLS1yk2L9HfpldjW9tXsO0FkBDmPkot1de+gJljI6wBPcg+KQSAoJ5lxkOcxYxs
 XHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qpC39RsLR8965d0WgV4iLmSeRjHxXgBq7CgQ+gMygO0=;
 b=v1HjDcyqnLYHF5DNg9TPdob9WHqJCalta0RxlmgItUGy7/vg6ehy/V75PdPWdaZC7E
 79+3ymE+xkbGM68PDezaBt4pRZThV0MPGLHn1WTgCwyBqfCVYM0oEydLRaDqfPo0w06S
 rBmSORzx4qYzokngpw8iSJ+jFUeHYV91I9BVS+JlO3VdbMiLWrfGYdbRFopzG9G23uKD
 TLVFEt3GUqFa5BBs7x7CDjesWeQWTVCu5Fc+n9/3IGwsVIqBRYyB1OL1IQD+VQ1VqNng
 +YAdXBCayETo64Ds6sRshQrLFOiNHqd6jGADM1PA3Ke3Nm1SUyS8J/DrU4VStv0gaqc8
 gFDw==
X-Gm-Message-State: AOAM531CoWUGcc2IkZmDByX+wTiqoGhC8ep4jFI8/Efz036nxUcP9gnS
 58bhf4h9CK5oYoqs9cG7PAUVz4cmPa7W2A==
X-Google-Smtp-Source: ABdhPJytipXi6S2tcKoRCOQ6rsOjgI+92oQm2GSr9SmuABsK5qlbHUOnx5lwPHPbwc5CfPlt7a8iIQ==
X-Received: by 2002:ac8:46c8:: with SMTP id h8mr25929931qto.208.1636126897364; 
 Fri, 05 Nov 2021 08:41:37 -0700 (PDT)
Received: from [10.200.5.34] ([38.66.81.217])
 by smtp.gmail.com with ESMTPSA id j15sm6402289qtx.67.2021.11.05.08.41.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 08:41:37 -0700 (PDT)
Subject: Re: [PULL 0/2] Net patches
To: Jason Wang <jasowang@redhat.com>, peter.maydell@linaro.org
References: <20211105041748.1681-1-jasowang@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4582269e-d747-c089-f3a0-b542ad09586a@linaro.org>
Date: Fri, 5 Nov 2021 11:41:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211105041748.1681-1-jasowang@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/5/21 12:17 AM, Jason Wang wrote:
> The following changes since commit 18e356a53a2926a15343b914db64324d63748f25:
> 
>    Merge remote-tracking branch 'remotes/stsquad/tags/pull-for-6.2-041121-2' into staging (2021-11-04 08:33:46 -0400)
> 
> are available in the git repository at:
> 
>    https://github.com/jasowang/qemu.git tags/net-pull-request
> 
> for you to fetch changes up to 3fd641ac5ec713e67129c1a57e8b6281182bd843:
> 
>    Fix virtio-net-pci* "vectors" compat (2021-11-05 11:32:00 +0800)
> 
> ----------------------------------------------------------------
> 
> ----------------------------------------------------------------
> Eduardo Habkost (1):
>        Fix virtio-net-pci* "vectors" compat
> 
> Jon Maloy (1):
>        e1000: fix tx re-entrancy problem
> 
>   hw/core/machine.c | 2 +-
>   hw/net/e1000.c    | 7 +++++++
>   2 files changed, 8 insertions(+), 1 deletion(-)

Applied, thanks.

r~

