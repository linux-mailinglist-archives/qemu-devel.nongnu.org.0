Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3E93CBA4C
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 18:07:23 +0200 (CEST)
Received: from localhost ([::1]:53416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4QN0-0006Ry-6Y
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 12:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4QKz-0005BO-SW
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 12:05:19 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:35430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4QKy-0004VT-91
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 12:05:17 -0400
Received: by mail-pl1-x635.google.com with SMTP id n11so5537408plc.2
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 09:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9Pa89aIDL0oxeBM6jvSp8jOl06M3oZmQ9c0sd5XH6nQ=;
 b=WB7wg1ARWGyzNB2cdIH3vlqWY0Gi3J/BKbg1jq+eHOJ1eB1pP2GvwW1PHx+qHy1jw7
 wUHp70vRVeeCswUcSwPHUvrOTaF+/umS8tNbfbj9k5TzLE4qwXnsvKIGDlLVvoLUTb8m
 snRAX6u5LK+GHPIRz/sCqoPA0lYjlR399NM7mYKWO5oGAU83HaQZKe858PGX/XxBiRDg
 L2EA7fpbko1JSDxOtlCNvaH11R0gGCidlIJPV8YIT1nIv1RkdHMAHBX4AlOlW2c3rJk3
 w2PZdROSV2bFjhfNnFr39E5RxT43Ic+hg6ZhlLkTL9EN1UOJGGZOf51xtyycf8K8o/CW
 NB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9Pa89aIDL0oxeBM6jvSp8jOl06M3oZmQ9c0sd5XH6nQ=;
 b=D639bZl7sONr0CHACDZe4ouaIjNOxeFuY1kuqsq1Bf7iKbquwHjWqn8cJ37wjC+tYU
 XyHkPxrQl4L2aMWbzna3Trv2Gu56Nj9tCtcUpiv8a7B4TFh8I5o4SDyqDA6082dXou4l
 h+PtPTjWrYC9K1Rq8Gzd4bXZMfOYsg7MrbHTg4uUZ8ryfAGm8XRXV0Luq65hKf/hnqK1
 Y1ojQ5ZDzAvJWQFUI9P+HAUBzkW28niCLVe65zEw6oPCwMIsvaYCe09UGKsbLrkgxmh9
 FURJ+rhDQW3qW7FyX9BXVpFPZOsFbpDYSPo0du+IvGKDS5ECZ8/fhwPZ4MYSoCL2CXTd
 Uh/Q==
X-Gm-Message-State: AOAM530Lhi05hgijDPN+V6xa6NHt5HnQU3TKJvdql46A/YpdqaFp5Liw
 8I/vWLrcNpI/MdQRh5aOJt00Ng==
X-Google-Smtp-Source: ABdhPJxxI8u78ji8l+c8paUre/hklciZ4yNJf7TLg6NL/JSrfMegzKfx+MSYXFGCAYtrheos4fAdNQ==
X-Received: by 2002:a17:90b:46cc:: with SMTP id
 jx12mr2597110pjb.26.1626451514779; 
 Fri, 16 Jul 2021 09:05:14 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id o25sm11956663pgd.21.2021.07.16.09.05.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 09:05:14 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] Hexagon (target/hexagon) remove
 put_user_*/get_user_*
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1626384156-6248-1-git-send-email-tsimpson@quicinc.com>
 <1626384156-6248-2-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <feb8ca44-7bc8-2230-e4c0-69125a2ba7c0@linaro.org>
Date: Fri, 16 Jul 2021 09:05:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626384156-6248-2-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/15/21 2:22 PM, Taylor Simpson wrote:
> Replace put_user_* with cpu_st*_data_ra
> Replace get_user_* with cpu_ld*_data_ra
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/op_helper.c | 39 ++++++++++++++++++---------------------
>   1 file changed, 18 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

