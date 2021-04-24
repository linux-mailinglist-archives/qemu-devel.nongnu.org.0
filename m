Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A0D36A27C
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 20:00:38 +0200 (CEST)
Received: from localhost ([::1]:49242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laMa5-0003eH-8q
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 14:00:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMYx-0003FV-Kn
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:59:27 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:54089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMYi-0005sk-Dj
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:59:27 -0400
Received: by mail-pj1-x1033.google.com with SMTP id nk8so11544289pjb.3
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 10:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Emgc37zTVIhsQeJkrxjtcaAj++WVpzSZZuhiE+0TIeU=;
 b=alyBGRZQBMZxFXiEk/36gT1HWuR1E4/RRiPaYKDj+FSVZmg9iMVkaQPYD/UfOHt7u2
 n30xln6sLO3ZQvuaa4NuE9yADdZOxMnqXLEndiwrG6LC6DBe1C3cId0IDORhCPspttz7
 g3yHCNl7vOuyA9tX+eWtSZ4+wsjr2CeN7mMgTfnpRtANza5TMvXTs8oKz54EdfwB/3yZ
 1XWNNEfvUJv63F9GOOfEz4+xq2UTNTrGszoLSCixvGv1IsTSElSIArA3M34d8XiLqDza
 qNSh6Q1pamxU3M0PkUKl9Wfnamq/SERZ603ctL+e/oURMbYpccFSeUveonksK5zaSMCB
 7iIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Emgc37zTVIhsQeJkrxjtcaAj++WVpzSZZuhiE+0TIeU=;
 b=ovxW5mrOrzx40Mxjae8TZqdlnJdKACGmiK7BFNvajvYPBOSrrs29glDEuxUFgBLfuk
 P6L41Zb5szPRZ9Ns+aTzarQwMI3GMKcRDuCyNvDYv4fiMLZlA/pAoiOKWuVL0w3zc4F2
 0d9oFaf4t3G/Zg/5IetrIK7G0BAOxtkj60TV4ffwYOe5g8YWsJ0ad5u3w2BQM7EoYUw5
 Y8umPl1HeQ53ilG1w/lvqSQFqGMq4ad1hIlqIVDKA8tek5n7/6feYYIH7b9T0BtZgZWe
 wbg5a92EN4R5az0l751l/P9lk2H7dNx98AvWyAmIRnfpjTYcKRT7hmToaUkqpMG5Jp7y
 H6ag==
X-Gm-Message-State: AOAM532TP8gU8r1jc+ylyQUY/FGd6v0dpmZ0tocOJMjHDddEbfgKT5lZ
 1midnUvnf1LQK3HJ5krSvuZSbw==
X-Google-Smtp-Source: ABdhPJxw7IcHeE7OVDOx5fITrw6ObPtdRmTI4uVe4nlSt7TcRiWmj2VGB2vcKuop746/hWZMibW7jA==
X-Received: by 2002:a17:90a:b78f:: with SMTP id
 m15mr2062292pjr.131.1619287150963; 
 Sat, 24 Apr 2021 10:59:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id w134sm7963229pfd.173.2021.04.24.10.59.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 10:59:10 -0700 (PDT)
Subject: Re: [PATCH v2 30/48] bsd-user: style tweak: fix block comments
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-31-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <69b3a064-ebaa-d931-a43a-54d479835d63@linaro.org>
Date: Sat, 24 Apr 2021 10:59:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-31-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/21 8:59 AM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/mmap.c | 51 ++++++++++++++++++++++++++++---------------------
>   1 file changed, 29 insertions(+), 22 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

