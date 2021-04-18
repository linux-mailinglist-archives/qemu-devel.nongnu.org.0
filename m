Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9093637C4
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 23:12:20 +0200 (CEST)
Received: from localhost ([::1]:43482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYEiI-0005u9-Vy
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 17:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYEgH-0005TK-IO
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 17:10:13 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:42560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYEgF-0004f4-Rn
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 17:10:13 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id 30so15984193qva.9
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 14:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N2CXJVTyfvgtt92SSw1+GOHARdtnFC3toLPms0bQQr0=;
 b=yYkWihV43kgOjOZr+FiGcel7sfScK6x2Y/q1VA8vLftyJ2oiwlMow4/xewQ3YRPYAq
 uCI54RoiVf8E5+L/QOHjSWwGCxcjrEwDJ/FNTNADoo27T/mCkEPDgOQQvk83XOwQVio0
 Na19bUtTfbYuzPmSEsFeDZSf1pa+wozIg5pXuK8qkXrf+vU64yivOnRELAvKxeChVpge
 hZx8z+txjOfd9LBQ5moHRVd8K/Vr8ijwAoMkrSkgelu0GFtoExVElqZpIlg2FbUaQ6hd
 F1smvw+OOeqmbcY3mlmoX1KeyhzDxHMJZ5qjdtNlwIBaW6vqot1K9SK5exL+oqEH56qE
 p1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N2CXJVTyfvgtt92SSw1+GOHARdtnFC3toLPms0bQQr0=;
 b=fwZ5jl4qvYOxViShdrLQQqzu2w6j56c9Bhqx4SCP7089Dhq5VQGBPZ9Jb4+d3k60OE
 a3AJR8VSkSofH/U9Pr7kzAonAO7MSZrg4f/1IA1zLXww5AORlg3xsIJXMqq+zXbUM91D
 X2s7AxwyQUC9k6KSIeMYVITk8sslCBw51Lg+jAWQNWZYHLp1d6122VLd/NsU7PBE3QxW
 ot7kPZP6icILE+eJuFak1XtKbnxaxwjNunbrRQUG4E3Bz9AH+m0GPKUa7W1XOyU+xr8i
 CYrghYR8ZACkGuxExxImtmy0O24rX6nHDd/0K/rxJIm3fCUVH3VDp8Z1jSpxo5B4VFx1
 OOog==
X-Gm-Message-State: AOAM532X/zHD2wTK2TQDMndFau8YJCUyffFw2Y3mu2Iz+rM5lfGj3uYm
 poV4Z5w/fUgOIOCN2LpBk2IxeQ==
X-Google-Smtp-Source: ABdhPJw0RaI/rXRIzRpZRj8H5PpJ9ajfR+a2c1oiCt0778oB9IKciPb0lrpWKac1JDazoHE/RXZ/tw==
X-Received: by 2002:a0c:e601:: with SMTP id z1mr18623535qvm.62.1618780210877; 
 Sun, 18 Apr 2021 14:10:10 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id f14sm8502565qka.54.2021.04.18.14.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 14:10:10 -0700 (PDT)
Subject: Re: [PATCH v4 04/12] target/hexagon: make slot number an unsigned
To: Alessandro Di Federico <ale.qemu@rev.ng>, qemu-devel@nongnu.org
References: <20210415163455.3839169-1-ale.qemu@rev.ng>
 <20210415163455.3839169-5-ale.qemu@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0acaf98a-e9c6-d9d3-fedc-60d8dd9b352e@linaro.org>
Date: Sun, 18 Apr 2021 14:10:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210415163455.3839169-5-ale.qemu@rev.ng>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2b.google.com
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
Cc: Alessandro Di Federico <ale@rev.ng>, bcain@quicinc.com, babush@rev.ng,
 tsimpson@quicinc.com, nizzo@rev.ng, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/21 9:34 AM, Alessandro Di Federico wrote:
> From: Paolo Montesel<babush@rev.ng>
> 
> Signed-off-by: Alessandro Di Federico<ale@rev.ng>
> Signed-off-by: Paolo Montesel<babush@rev.ng>
> ---
>   target/hexagon/genptr.c | 6 ++++--
>   target/hexagon/macros.h | 2 +-
>   2 files changed, 5 insertions(+), 3 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

