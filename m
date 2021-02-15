Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A308831B3E8
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 02:24:25 +0100 (CET)
Received: from localhost ([::1]:52066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBSci-0002sr-OX
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 20:24:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBSbh-0002Qd-Dj
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 20:23:21 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:42638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBSbd-0006j9-KE
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 20:23:21 -0500
Received: by mail-pl1-x62e.google.com with SMTP id s15so2822132plr.9
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 17:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fpe3G96sNt7HXHEXzW+VcNi4uqJsUFdTV6QoN7tSzp8=;
 b=qJCPtvTGyYhxfnqeG6NnE/8nbtkCffo8U2Op+UC2ZvUi/U5DRS+BZEmzl7ofqW+Hwq
 8vNNsvxmQcVvy4Os4QbFECQmM3TtzQahWtRm1YJq1RduK4cIaudHN4exm+Am2N0If7c8
 mWge441g8t5ZXn3TRmzPwV1aviD7q5FJKlAoGkyoIJuOO+eUKhOsFViySkTv8x5mWUD9
 KHio2k9TtCYe82cAPBPmasdmj/kdDzhS2Pn5ymOp4n62Tx4us8LQT1YOBkuXHENYHpQo
 iusD8azZV7UHIImUPu6WvO4ZIs58zllucOc2ybQirFfl4VKrHJqXPxRSQWJYnrzEFPXu
 Aj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fpe3G96sNt7HXHEXzW+VcNi4uqJsUFdTV6QoN7tSzp8=;
 b=uL2Fh+kygbzaXTMF/HmxTj9PevA+ejGGL15whlaTNBfbz7i0snCFvQD9vX80Yt6ciG
 szpkBg7A03q1MFhYy5xZcT4p0OSL15Ce9kcyfBuHcabPPxWIjEwP6T0NCqjxiDITk0nD
 2ktvBLC2s00qVtIS/AkZU8xv62H/kRncAV6q5AcfgGH8Ljc5fbzVS7xDrjig/arlB6Hr
 Qt81wms3+9zMnFEfLs0Rtu7MRu+gKi/UHmn+/gXRZYbvOnyvK4faClcoVg0Idq8ztNmv
 MaZJPfZm+JN3Mdifkf5OyL5vbDiKtVpN6lMlp27rOceWG97uMvzQLfimPs93QYMh8sIt
 tJcw==
X-Gm-Message-State: AOAM530zoxqSYZs4k6a8HJt4dUf8uw3ftRC2wHeLMGXv3khjGafaX0wk
 bSvzM/51Fa6vdCKDhBcxReW25w==
X-Google-Smtp-Source: ABdhPJxSgZ83SUFQlDFYmgtCbdt1m2sXdAPaoabHhqSb3TZ6Uv8s+1CcUpjAVexFQWM0zLTmQfTVLw==
X-Received: by 2002:a17:90a:8d83:: with SMTP id d3mr847644pjo.0.1613352195299; 
 Sun, 14 Feb 2021 17:23:15 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 j73sm16473809pfd.170.2021.02.14.17.23.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 17:23:14 -0800 (PST)
Subject: Re: [PATCH v8 00/35] Hexagon patch series
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <27b85311-3161-eebd-8e00-95ac87f7376d@linaro.org>
Date: Sun, 14 Feb 2021 17:23:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: ale@rev.ng, Peter Maydell <peter.maydell@linaro.org>, bcain@quicinc.com,
 philmd@redhat.com, laurent@vivier.eu, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/21 9:45 PM, Taylor Simpson wrote:
> This series adds support for the Hexagon processor with Linux user support
> 
> See patch 02 Hexagon README for detailed information.
> 
> This series assumes int128_or() is implemented.
> https://lists.nongnu.org/archive/html/qemu-devel/2020-10/msg06004.html
> 
> The series is also available at https://github.com/quic/qemu on branch
> small_series_v8.
> 
> 
> Once the series is applied, the Hexagon port will pass "make check-tcg".
> The series also includes Hexagon-specific tests in tcg/tests/hexagon.
> 
> The final patch in the series add docker support.  Thanks to Alessandro
> Di Federico <ale@rev.ng> and Brian Cain <bcain@quicinc.com> for making this
> happen.  The default container (debian-hexagon-cross) uses a toolchain built
> by rev.ng.  Alternatively, there is a container that will build the toolchain
> locally (debian-hexagon-cross-build-local).

Right.  This is in really good shape.

I've completed review of this round, and there are some nits.  But they're
minor enough that I wouldn't even mind them being addressed via the normal
development process.  I.e. I'd be keen to not look through that diffstat again.
 ;-)

Any objections from anyone else on that?

I don't suppose you and Peter Maydell signed gpg keys when we all met in Lyon?


r~

