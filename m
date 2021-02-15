Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE9631B39B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 01:36:10 +0100 (CET)
Received: from localhost ([::1]:33700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBRs1-0000cz-KK
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 19:36:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBRqj-0008RO-Nt
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 19:34:49 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:37716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBRqi-0001rM-4b
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 19:34:49 -0500
Received: by mail-pj1-x102a.google.com with SMTP id t2so2893285pjq.2
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 16:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z6NH1swYCj8rVkKXRPKk+1EktmQT7T1txq7iHadg5Gs=;
 b=Vqgi+t0tYtEFSHVxq82fzQQSI0bGhJRZP47weIpzjO4fHJTuXWGg1ic7KXnV99+Oie
 v2ijt+zrZSFFXNF2JXjXBRzALW6xt0T8vYSHb7hw01l+GycaM3dved5MyFOlJ7r5LGIs
 onBcZPDSYDD9ejUFb9dYi75/GIp9H53nfLOQiamuZjY51DdE3goQUmX5jBlQdJnlP5V5
 dhC9fOYf5C5QcrnLWYIdqj6RcC979KZtfrLHPh9SV78gAO56cb9zu/uXXPVwunIx9snA
 5215W/e8WhxSoDW2hj13YcsavZG/mOo/JjMHPeESuRZK7rVuqqgRhnw7XGtR7bBF72xY
 480Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z6NH1swYCj8rVkKXRPKk+1EktmQT7T1txq7iHadg5Gs=;
 b=B0LGpjnuokIElQmmQwU6m9Wtsf62WrzNoj+Uy+p49wzvPnf/UuZEsMMZac0RVUjLdv
 UTerKrkVxw/pG0yDnjE+ySTIGysutK6h/IYIT/j7k1/sbd+AK2D/KJlW+wvCYpNUEMrh
 MzuDnoivXOaaO+CXbtFfrl8Pijhkdh0IHcFEoUECH9grPva6ttX1sk3rv2MoOo/eSZ0S
 k+gVTq0LdmNzZhqPIpT5NSFhB7hvSg4HwcnuBJh6nLh4T0jnaoGVkE1Q5M4bqL3DQuVb
 1qmFkxd9Wy9wjDmA7PlUDwGQELLbvgQf+jQvYhImHhaIsFuMxGut+qvTI3TJH6OlilMK
 cb+g==
X-Gm-Message-State: AOAM5303KJj8pMbNj1B3SPdbnoDZIGI+TXEKaRpcSNnYo6KZfKKm9xKs
 5vdsUHFgPyRtUGW7oCgljS11rw==
X-Google-Smtp-Source: ABdhPJzjSKXxg3n6+e0lqcItm1T6rjQJniKybjzY++XK1dm3FryvHpSNjNEzszbpdG2LkWAQjuj30Q==
X-Received: by 2002:a17:90a:fd0f:: with SMTP id
 cv15mr13794620pjb.36.1613349286714; 
 Sun, 14 Feb 2021 16:34:46 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 k13sm16522605pfg.146.2021.02.14.16.34.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 16:34:46 -0800 (PST)
Subject: Re: [PATCH v8 28/35] Hexagon (target/hexagon) TCG for floating point
 instructions
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-29-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1232d24c-2f3d-a7f8-a44d-53b97446402b@linaro.org>
Date: Sun, 14 Feb 2021 16:34:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612763186-18161-29-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: ale@rev.ng, alex.bennee@linaro.org, philmd@redhat.com, laurent@vivier.eu,
 bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/21 9:46 PM, Taylor Simpson wrote:
> The imported code uses host floating point.  We override them
> to use qemu softfloat
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  target/hexagon/gen_tcg.h | 121 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 121 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


