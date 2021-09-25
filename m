Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0194D4180E8
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 11:59:53 +0200 (CEST)
Received: from localhost ([::1]:60660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU4TJ-0006ku-3A
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 05:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU4S2-0005vQ-Ab
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 05:58:34 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:39798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU4Rz-0005oA-ER
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 05:58:33 -0400
Received: by mail-wr1-x433.google.com with SMTP id r23so9585894wra.6
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 02:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bcYf8Ra3ff3lGvknhx+IBaip1I2CsgHMcaYrnoSd94s=;
 b=XtwGKeTb1DgzCFu4GdrqY4AMkdI/0t2embU0T3GYZ36ccoYB/3BsrH9T6Cy/jyEcnf
 jYGfGSwPxYTug8jtmg2a2qqbKq73NHxWITxxaO0rnh4TjTMhiBW0/hiFI+Wiei/EI7H7
 nU1E3adIhrtrTuAqOJrWhFl23Ssw7GBxgcun8pkyhwW24BV+gAcUyythCmkCm9+3MKlR
 qGTq3pXZJIAxz4ojmHiaFhP8FKayoklUx0PY3cN0y8Q3pX20Oh1DXVvT20IaF7J1CpLf
 dAWBOwi7ihR2caCYXhZndC3ip4nxkcha34ACl9OoIDrZmlmRI8JY/2F1V3i4eA/lj8G9
 xjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bcYf8Ra3ff3lGvknhx+IBaip1I2CsgHMcaYrnoSd94s=;
 b=bIB50HyaBa4yeRVnkpJN9dI/eNYvXcvlql+Twoy3L7HDgBgbJCJreLFf50rA8Gl1ev
 Upns6spmrWQ7tFRFTj0QYad0JWKfGwtoqEkFr8DkMO5llZTG6gz3wMU3w1oldFD6kHj7
 ciNSm0Dv2yohoiH2bbTe3C2kvmHOaDqVtxG5UdQkVfvMHGt4TN8jfWTn8ZaAUa3Z7f3l
 PNOXhoPqdazEcoZ+TrCT6Dl4Ergfov6lerrX5UyRJmEylpLBxwWlSbU1rWzg9VBQi7G5
 MEgcNnEFKL8kgX5FAjkY+us3q6q5gZNkkjGTaR8s5MYX3LREb7MVQn5/fMTeJzzsHKPN
 vKEw==
X-Gm-Message-State: AOAM532wB7N1GFwad4oL1W/xhVQ9pTzLBCGJtvyLXtwBxdwN7t6lmVz6
 6Dw4ovSbfxZpPxXVSDzK7HY=
X-Google-Smtp-Source: ABdhPJxDZspG7TKLx1hMqHWzG9WVha79rVq0/171Pos6eSUJNcKwG5+4Z91LFFJGDzCKyp/oYhC6iA==
X-Received: by 2002:adf:8919:: with SMTP id s25mr16541649wrs.185.1632563910065; 
 Sat, 25 Sep 2021 02:58:30 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id o17sm7247732wrs.25.2021.09.25.02.58.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 02:58:29 -0700 (PDT)
Message-ID: <4b0f548c-2dd7-36e4-866e-6b35573e98f1@amsat.org>
Date: Sat, 25 Sep 2021 11:58:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 11/30] tcg/loongarch64: Implement sign-/zero-extension
 ops
Content-Language: en-US
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210924172527.904294-1-git@xen0n.name>
 <20210924172527.904294-12-git@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210924172527.904294-12-git@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 19:25, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/loongarch64/tcg-target-con-set.h |  1 +
>   tcg/loongarch64/tcg-target.c.inc     | 82 ++++++++++++++++++++++++++++
>   tcg/loongarch64/tcg-target.h         | 24 ++++----
>   3 files changed, 95 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

