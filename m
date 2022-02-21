Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C9B4BDA7B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 16:12:10 +0100 (CET)
Received: from localhost ([::1]:36784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMAMD-0007JJ-HW
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 10:12:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMAJe-0005JZ-Tq; Mon, 21 Feb 2022 10:09:30 -0500
Received: from [2a00:1450:4864:20::32a] (port=55901
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMAJd-0001s3-DI; Mon, 21 Feb 2022 10:09:30 -0500
Received: by mail-wm1-x32a.google.com with SMTP id i19so9694125wmq.5;
 Mon, 21 Feb 2022 07:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=b9aVAlZV+umJAt/j0hy7xgaprdzJZ2TGFS1PzsRJ1HQ=;
 b=JUvt5l/HPdx0j0ttTDyZr0K1pvorM40/vgb0DG+ceCk2z46Yc1iaskhQ+piNZd/HV+
 MduYXi1INaWNClzs32M5cesCJFuXCkK6nzlVxMMLBvUFrikc9tDG5p5Sc2WTxu0uyj0Z
 9yh2CM+BWojPCaySLVh03C/XJOHACjlelXTY/dWz5c3QSi1YE9puwrM+WkLQYNVPfqZq
 0MF/5/ftk8bO44vTDm6/7FNfO0w5DvOgKDzxfCuvYkVX3F9yKl5m38GeKubCX3JkOVMN
 rINVeFZy6q4HSc7WLocwMdjDG8jHrgtntBHK9xUzorl2Z1VRDlt2pn5Qb5dwKvWU9tfr
 xESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b9aVAlZV+umJAt/j0hy7xgaprdzJZ2TGFS1PzsRJ1HQ=;
 b=BgPFK7Ga4zbKpEyYMseJrZ7seV54WfWFIBQXuvmKWYalZvLMYX5CShH0RroejcAwdE
 o2Qhc8JWTMBEWzRxVBapW04JtNcXtM9SjLv4LXdJOmYW+B1PE15K6g20sPILNQEtx/jU
 RqIwBlIjqj/O8rrFpC8Zm+EQ0XC7TILFrNxce/K00mHO8I/LsyXqbtUoej/TR1tzQUYE
 7SgQ/7ACnYs+VFpyEVZDM/SDJGL2YTB/Q0bWnzM+YcxyqnyL7pe8sLcpK5xfIWbSZlWZ
 Ac7bP1D2vSWlevo2zYPI55PR3U9Pl2jUKvA0BoE6t+g6te0GCTQeYRj8NEyj0zpa6G2q
 5NqA==
X-Gm-Message-State: AOAM530LSQ/UYA6eb5uOFpAUS+Q/j0mnXcaZeA5FUib0Y2woPjiJ89HI
 1o+NtZQM4KhrtCc0D/1LWyo=
X-Google-Smtp-Source: ABdhPJwMZiJk/jHXrN9OwxEoqm4Ke3RE1Uz+0vE3tqrMyaItpIKDV6GqGvxV4HC6xx/eubrbq5+vtw==
X-Received: by 2002:a05:600c:3aca:b0:37c:533d:d296 with SMTP id
 d10-20020a05600c3aca00b0037c533dd296mr18090381wms.147.1645456167871; 
 Mon, 21 Feb 2022 07:09:27 -0800 (PST)
Received: from [192.168.51.187] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id p16sm8338585wmq.18.2022.02.21.07.09.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 07:09:27 -0800 (PST)
Message-ID: <8c80e33b-df0f-a25e-5e3e-237fd3aa2f55@gmail.com>
Date: Mon, 21 Feb 2022 16:09:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH v4 2/4] util/async: replace __thread with QEMU TLS macros
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20220221142907.346035-1-stefanha@redhat.com>
 <20220221142907.346035-3-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220221142907.346035-3-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Florian Weimer <fweimer@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/2/22 15:29, Stefan Hajnoczi wrote:
> QEMU TLS macros must be used to make TLS variables safe with coroutines.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   util/async.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

