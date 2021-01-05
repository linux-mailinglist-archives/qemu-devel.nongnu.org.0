Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5258A2EAC13
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 14:44:11 +0100 (CET)
Received: from localhost ([::1]:32874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwmd7-0003P5-Tx
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 08:44:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwmbh-0002uK-Cw
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 08:42:42 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwmbe-0001qx-Ud
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 08:42:40 -0500
Received: by mail-wr1-x429.google.com with SMTP id a12so36200750wrv.8
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 05:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XGzE5xJpHc7bzWDzWCouqJuT7iLxguzawcO6J77bKLI=;
 b=MkSy0rVM+/ET+K0Et0/YNZ2ZO8lnRSQE0iYFCrZT02z+OgFrSuK+KrvtSP9ppsqv+i
 EprZT0kK8YDUjmfGLk967P+2zSO/RetmpBDyegwpb6QPwAAfYi2LAjxBeTCpJvfOLl0q
 LKvPthosMz/e58aRk3arsWkRewrQBeyhbHiEhVPFMe+iw8zln3c9uyPFoSThyKsXCPZ6
 S4/by5KMFi97KVuKNn6YTE/IiX4jL6kUknZSyP+fzoXfv8dU+/S0pOFNdYT1Rx/PaZxi
 AfChGuagGxT3OInfhC/B8AUxR7HGkPIqsSG5xnjZ8PahptLgGofs65XxX2pe8I74Nfhh
 dsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XGzE5xJpHc7bzWDzWCouqJuT7iLxguzawcO6J77bKLI=;
 b=M+RuNjh6tCDp/MbV6rdluPe1lfKQ9OT32oU5d2i/2TchI4lAhXQMLoWlvlWzl1yp/A
 6gq27uUHXxxOKbxQzZeAHub3tgKAbY6zxU4Q/kcuBbnuHxGYmh1DeRh/HPBwliE3zNd2
 7Tcnt/xzM+kBaBXnZkUjPnCqjqvdOQbo4QX1Ko+XKYABN/GYxbszQlGI70NDNt4j4Wm7
 9PaZZqkbK9aHj5iHvTFjpkPOh/HVt3ymUouOdbUKcewgb+tgRYS6Vw5ICPGIitupl0pv
 UrwZHrw9J/p3WnO2ctfvWbKwMX9EgvLu3H7MHB9SgMlfVpa89lGTcJWsU2Ul3IN/x3Ne
 ofKQ==
X-Gm-Message-State: AOAM532PRT0jTHuQPPc2V90BsLUXC7eJGL1A6+hf8pDIKbbtZGH5N7EZ
 JGX6NF8KXdsUuBBp1+cezGCgz7l7PTI=
X-Google-Smtp-Source: ABdhPJyzHiN+viI5Fyhbj30jKN9qGwDjm2hbJL8xyds63e28cgCanmktwQFXbYzvMIYoD07kAa6sKg==
X-Received: by 2002:a5d:6884:: with SMTP id h4mr84429278wru.174.1609854156886; 
 Tue, 05 Jan 2021 05:42:36 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id v11sm95263108wrt.25.2021.01.05.05.42.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 05:42:35 -0800 (PST)
Subject: Re: [PATCH 1/2] tcg/i386: Adjust TCG_TARGET_HAS_MEMORY_BSWAP
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201211011453.475155-1-richard.henderson@linaro.org>
 <20201211011453.475155-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <22abdca0-5e0a-3f72-1032-3186848d1ee6@amsat.org>
Date: Tue, 5 Jan 2021 14:42:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201211011453.475155-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 2:14 AM, Richard Henderson wrote:
> Always true when movbe is available, otherwise leave
> this to generic code.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/i386/tcg-target.h     |   3 +-
>  tcg/i386/tcg-target.c.inc | 119 ++++++++++++++------------------------
>  2 files changed, 47 insertions(+), 75 deletions(-)

LGTM but I'd feel safer with some x86 developer reviewing it.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

