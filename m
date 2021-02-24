Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C0432445B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 20:06:41 +0100 (CET)
Received: from localhost ([::1]:46734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEzUe-00069l-LA
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 14:06:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEzNM-0000Xg-FW
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:59:08 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:39975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEzNJ-0003MJ-TW
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:59:08 -0500
Received: by mail-pg1-x52b.google.com with SMTP id b21so2071556pgk.7
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 10:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Zi6x3Zk/hHd1MITv61CPKGyAGKTPk/mddzsRrojJbZs=;
 b=B9aL7DzTF3qVxaUIO3OHj+n9AhBfVSh2bX9Yt4RE8zF04FY14XorO7jt5w/Qb2+QKE
 TBbytez8WKTJgdK3fMcxqGBd3D15yaF53S65qHu9FYcFl8KYU2zGKqX1OgXcbs6QXURm
 NUILrODFIALIdQo4fhRu8ATHf+EkoNLKvkvjFgMfF/Sddazs790SpRI+mhenJw+AGiu4
 /NDcO6EK0HMU2Er4WlNEZvCZutgR0bqE1HoDrHdbleHKIG2jkBL+TporSAB4m9U3IIo5
 nVXJmhyzT7SCdpFdp8h5pWOKbfNlbzaf7WnvwpeU4zAgRPKV/v4SaQoj2zKTBUWNwOeg
 vigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zi6x3Zk/hHd1MITv61CPKGyAGKTPk/mddzsRrojJbZs=;
 b=RRM6gp/Pd2s08Uctq4fdaTiYCmpSkRrnzv/w/RsY6uMH/G3zBOPOF9j0kchtYVUic6
 Qh/oWG3WUd158+FKZzUoKc4PXtI68ZGpfQ9o8HX97hoCx1OwnKkM+AdCilKo/HF5mg6R
 GGEWLRDp51vg6rxY5IByxcYcUENuYpAJ9SXDsL0ZjsOu7F02Sx6qmO0u+XT4VI1FxVrN
 PY+NXWC9UNN+Q2pMZHlJNqSa7TXx9CIgyYNAoJVpZEi5UrPPqLke4Dd6F9nCtgZcJJPe
 nbxtppHvAH1w+S6fWDBEyDCXga4cdBc+6u0lV659hI1NXw97oSQApbZ5vOoJinyGER/3
 U68Q==
X-Gm-Message-State: AOAM532uv/yziBcC7djdxS0zdanpOlwsx8P+OlCR66oAooO8sbigIXYH
 vTNGmMx9vRbt4xnyG8Pphr/Lcw==
X-Google-Smtp-Source: ABdhPJxdnBzB5Wjf+M9nJjSaZ1gsFA03Kv6+lw3Ms+jh5eMIUK1O3Ba346Ym3i6/tkq+vaW0+lQfaQ==
X-Received: by 2002:a63:fc58:: with SMTP id r24mr29350933pgk.72.1614193143711; 
 Wed, 24 Feb 2021 10:59:03 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id w3sm3476894pjt.24.2021.02.24.10.59.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 10:59:03 -0800 (PST)
Subject: Re: [PATCH] Remove deprecated target tilegx
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210224183952.80463-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f9a92212-dc80-c8fa-463a-9898bcaed9fc@linaro.org>
Date: Wed, 24 Feb 2021 10:59:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224183952.80463-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: Chen Gang <gang.chen.5i5j@gmail.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 10:39 AM, Thomas Huth wrote:
> TILE-Gx was only implemented in linux-user mode, but support for this CPU
> was removed from the upstream Linux kernel in 2018, and it has also been
> dropped from glibc, so there is no new Linux development taking place with
> this architecture. For running the old binaries, users can simply use older
> versions of QEMU.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

