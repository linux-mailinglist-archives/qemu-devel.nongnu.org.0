Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D705B4A66CA
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 22:06:17 +0100 (CET)
Received: from localhost ([::1]:45348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF0Lw-0005vx-W6
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 16:06:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEx0V-0003hn-Mc
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:32:01 -0500
Received: from [2607:f8b0:4864:20::d35] (port=45804
 helo=mail-io1-xd35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEx0T-0000wg-To
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:31:55 -0500
Received: by mail-io1-xd35.google.com with SMTP id s18so22094082ioa.12
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 09:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PgiC/Okq00P++6u7/2jxY9QoaLFhrO8NVYBNn3L29jw=;
 b=AlAgQ9+suep3hjrzgn5oa/818gB9VyTaNwEPioEvQ8G6QNJ8eloDxNi3fCCuV6+pkV
 ml5kTkywVWDn6p28eatx25b4Re54A3u/9eYdd38F1aBZe7nxjPiWzcLTCH+5BYCydpe7
 kuwJuxxWoowNVaqEEKerErT04AfcDgia0Y+ZN8Xb1BGHsuWrsMTqFYVLgLFLQ9QVsqP2
 ZWmvdq7U2wIrhpx6CUnq93b04fYAwiDQRBmjGPgF1xJnqm7NQpPn8fBFVruWSxh3ZcBu
 d+P8076/oaBEWuayCO9GAyRFHNXvu86xNxQ4WAWVDImlE6PkdHullxTPskgXTEf6T3h0
 iX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PgiC/Okq00P++6u7/2jxY9QoaLFhrO8NVYBNn3L29jw=;
 b=G7fdG9f6DMNZLjKUk47rH8jZUWOH+JPRGDVBNuKUoP46pkPmlITKl0612B9eQST+wZ
 H7w/47gRWmYqyKomCxrGdDIb/5nGndQ9ldoG7jlD8FvIaVIuRGhEOqMQq334Tx1BIbCa
 Xupijn3MlzLNLnSDjywDHpVwydh+2gbF2FzeP5inLTbivVhfEuQKu4uigXYFyDV/qbOI
 pCPfv1NqAecwS7bG/5wX5DkN+gNlwCu8vxGiFxlM/SeDWMddiawC5s/J28kM3ok3/TAP
 t9J5oqZWrU0YQry//DITpnlDSPYa+0lwM7v0peRgChJYH7phIYMD4g2/kDtJQna2fmNt
 teSw==
X-Gm-Message-State: AOAM5327JSuw0dsOj6olFyckclS1kEMtZfnp6wInmaN1fkzDYNUHKYzC
 hWWjrfcKYW5l19epfH7c984dxQ==
X-Google-Smtp-Source: ABdhPJx1lc1WWCu8K04BslSmo/Vn6Oo4E82WauJSJl2RpSND6d4kp9O+skIB3PUJ9jKYdlf6j7jMXQ==
X-Received: by 2002:a02:a19a:: with SMTP id n26mr14204330jah.129.1643736708709; 
 Tue, 01 Feb 2022 09:31:48 -0800 (PST)
Received: from [192.168.62.227] ([172.58.160.76])
 by smtp.gmail.com with ESMTPSA id c3sm22144823iow.28.2022.02.01.09.31.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 09:31:48 -0800 (PST)
Message-ID: <cac1bddb-b061-1a3c-5575-b36c7825cc6a@linaro.org>
Date: Wed, 2 Feb 2022 04:31:35 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 05/22] bsd-user/arm/target_arch_cpu.h: Only support
 FreeBSD sys calls
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-6-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201111455.52511-6-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd35.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>, def@FreeBSD.org, jrtc27@FreeBSD.org,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/22 22:14, Warner Losh wrote:
> Since we don't build on OpenBSD, only do FreeBSD system calls here. In
> the future, we'll need to move this to some place like
> bsd-user/freebsd/arm/mumble.h, but until then just leave this
> inline. This reflects changes to the upstream.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch_cpu.h | 139 ++++++++++++++++-----------------
>   1 file changed, 66 insertions(+), 73 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

