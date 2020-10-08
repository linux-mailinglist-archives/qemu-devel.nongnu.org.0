Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 161EF287B32
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Oct 2020 19:51:41 +0200 (CEST)
Received: from localhost ([::1]:58120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQa4q-0001J9-6i
	for lists+qemu-devel@lfdr.de; Thu, 08 Oct 2020 13:51:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kQa3m-0000CX-MY
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 13:50:34 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:42492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kQa3k-0003dU-Rb
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 13:50:34 -0400
Received: by mail-oi1-x241.google.com with SMTP id 16so7161694oix.9
 for <qemu-devel@nongnu.org>; Thu, 08 Oct 2020 10:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=U23vUwmlz6KGbbeLb+fclcaf/LimQ6jo7TvNGEJyAvk=;
 b=vUnYMeq1bjKV4z/aJKVVSP/nRyZqQRVAuf476GgRc3vDB8Am/h3HUF4MUm0NTmFKL7
 PduPklzwwhgC09MAygIGTYA3eAcstUw7ndf4zoDLztbhTYhYf7XY+DsIoRx9vIurw1Db
 kT2+ENBcAaFhawQ7RdjRcL9fp6Y4a7bDaykPU0UJUu0AVaYElhDH/HZONE8h2bfYWfxv
 Zg3aEtXGhPAHssCIcvXg+gbv2ISeUV/pFM7/ElKRQ+/Bc9lg71xHt+0lxFnU0W8stL27
 kpTKtjTvNjkcTmViJ8ZI7w0E5Hoc0gvq+87qhQ31b9CuiSv4L8mbSH9glFmVAcmV0B1c
 3liQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U23vUwmlz6KGbbeLb+fclcaf/LimQ6jo7TvNGEJyAvk=;
 b=QEhFhStLjXTFpBynzzBFFUC8i1M9R7qtX/9a5iGfjNdkDRp8+YHHHg6FE1YOr825Pk
 VjG7p+HmmXRjR4pL8sWujz5HTnMlhgGuYLJthMBeNPveGHvRktxi7vro6Z5cgHj4tQmy
 GIPDN8DUZShw08QVFtg7wk7E3DiXJJYmk4OhMYBEuPhGfKnuV1T1PEeAqUGJVF5bgHWD
 EyLnnE+Yrw/PaOmlrRQZw/EO2Q4jUpKkGwXJTJcfED7ekuM9IaYhiFZ6mlX5a5I+q2TJ
 Az7/PnKhIWglzJeTfbAvakM8yh1D7mFa7hJMHfF5VsBrSF6kXB/E4O6uiIEjHgBizx09
 Mn/w==
X-Gm-Message-State: AOAM533/o3XD2H71KQi1kHPgCRV8QKP8rY9QWs0dpIYKxlLnGsJufDls
 P0Fv+R3V9MR/hVr/t6TEdP0X9g==
X-Google-Smtp-Source: ABdhPJwdSBWWXhtaWAbTiUhvxSxlaNzRvKFi3iXGeeLylmSG4vbUixjQBrJRv46nm6cO8sgt9PyaEw==
X-Received: by 2002:a05:6808:35a:: with SMTP id
 j26mr48593oie.105.1602179431364; 
 Thu, 08 Oct 2020 10:50:31 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id n23sm5800643oon.14.2020.10.08.10.50.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2020 10:50:30 -0700 (PDT)
Subject: Re: [PATCH] mingw: Fix builds on f33 mingw
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, quintela@redhat.com, thuth@redhat.com
References: <20201008174359.157627-1-dgilbert@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <872a9473-a334-5f62-4669-78ebedb39542@linaro.org>
Date: Thu, 8 Oct 2020 12:50:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201008174359.157627-1-dgilbert@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.214,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/8/20 12:43 PM, Dr. David Alan Gilbert (git) wrote:
> -#include <stdlib.h>
>  #include "qemu/osdep.h"
> +#include <stdlib.h>

As pointed out by pmm earlier, for someone else's version of this patch,
<stdlib.h> should simply be removed here -- it's already included by osdep.h.


r~

