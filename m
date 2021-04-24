Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A5336A272
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 19:52:52 +0200 (CEST)
Received: from localhost ([::1]:44100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laMSZ-0001GZ-W1
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 13:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMRZ-0000qJ-Eh
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:51:49 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:40887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMRX-00025i-TS
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:51:49 -0400
Received: by mail-pg1-x536.google.com with SMTP id b17so327727pgh.7
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 10:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9rxovDSkw3RlXj+eYqH9QmxRFZnGXwXzB59r7QRhwEA=;
 b=lPBnfLcowqgAhMhgrzukUBJ62zGLCcekrJPxEKtPC9NhtvebTYPpXOnEdtqm5CaQuX
 T0Bhq+NVJedPO3Omg2bq99VVq/6p3LEG07mQqmBL9rEuMDuBYq69L1H/p2DQSGk1Z+Hu
 kU26xalB1VH0h74bOfsu2ILDHQB1pIPMdNj21FHEdAVB2ceusXQA0FSDKErcU/8mFj/X
 mxXQotpD6y5t8Yl78cMD6EQRdpBAkX++dvsV0RQPmYWmTiwAXzTxXMzWv360JgvcC6Z8
 c2O9fQiNGOhQ6PpctukLhLgrYysyLkuNc4NxkPnaisKDo1Tahe4Huk9+Dth7rWq4MTc3
 0BQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9rxovDSkw3RlXj+eYqH9QmxRFZnGXwXzB59r7QRhwEA=;
 b=A1s1L5hR9LGZMJxfrtT9FVqGHsGqyOx+kt3IlDoH3Gu+vPWNWoRh4/UFRYG5nmarTT
 rtNT3fjU5r/rv/qcprAg5ccvERD3cYtRheKDJhFxpm7jfLzKBvgtUeigYtE7PYRnh/l6
 VL1XPu1dSPYfzbzv4AG4jNsEAwLQ0M51/u+cIYdxD0uHi0J/94swXZdaJUo3yQdwMVSI
 6MU8rE6BQPuNpKGYAm2k1uuZPa1UdcxjRajxR9t66Y/G6QISmuGsQS0qQbKcmcx/WMOC
 /Z1K+1xxdYtrDEMdTdnEQvnKI5ySOv7NUFIOWYj/MYC+Sint2+nLxg/DHItKGRoOENmo
 THBQ==
X-Gm-Message-State: AOAM533FRJsi8/dV0PVOOd6/EcP1IGI3hRomic4qw6EZt6zPkoh4njEx
 Lvsx/K4BtqnSSPnQK29HWj/fGA==
X-Google-Smtp-Source: ABdhPJy5dDNjuqjEBr6pKEwh5s/OnzxOrb99jZq84JZAGOrm2G0CUeM3YfAgbsLa2rqz3SsHIGsENA==
X-Received: by 2002:a62:528e:0:b029:1f5:c5ee:a487 with SMTP id
 g136-20020a62528e0000b02901f5c5eea487mr9305663pfb.7.1619286706377; 
 Sat, 24 Apr 2021 10:51:46 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id a20sm7586703pfk.46.2021.04.24.10.51.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 10:51:46 -0700 (PDT)
Subject: Re: [PATCH v2 28/48] bsd-user: style tweak: comments
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-29-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9173b5bf-6ad9-0563-3a0e-19bf0f9f623a@linaro.org>
Date: Sat, 24 Apr 2021 10:51:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-29-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/21 8:59 AM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Use the preferred block comment style, move comments as needed for line length
> restrictions, delete some dead code that looked like a comment, break some lines
>> 80 columns at the same time since there are many associated with comments.
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/elfload.c | 216 ++++++++++++++++++++++++++-------------------
>   1 file changed, 123 insertions(+), 93 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

