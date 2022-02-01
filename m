Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8474A6965
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 01:52:55 +0100 (CET)
Received: from localhost ([::1]:44576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF3tG-0005kf-Il
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 19:52:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF0mX-0005Iq-WC
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:33:46 -0500
Received: from [2607:f8b0:4864:20::1036] (port=44788
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF0mV-000424-O1
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:33:45 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 y5-20020a17090aca8500b001b8127e3d3aso3972272pjt.3
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 13:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/oQJmkco/wyiGA1z9j7pL0zCJ5qI1q0wizCfCC+ed4c=;
 b=kiraLVlNpCzQJtGeOB8ggLeCBWrvCFG2pKcJlPLD83/ssl0QgdClYo0y1UEcXCMKYf
 latABoZcYKhjLod3EL31byGzZXkTdSJFMY7xWacKqHzT0YLRwXyKrDR/0fIwqHHt0z9a
 H/y5sXcvO2k2Ofe7uzGm7idjNlCoaPA91lq6oJ4DqjpCT4Yl/luw0KoEcJJgow3HV5B2
 0xFGDjHdjYycsSkkXRHguYNsc/9HNFoMC4sMaPP29X4qxf537gauE9nprUdzkUzByOGw
 QcSyHbblAfwSx+hegTE6rw+JMVBp6fUyuoGqFnCJBKUpWSLxIGrzTO6IETGQnwwP+nJe
 pcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/oQJmkco/wyiGA1z9j7pL0zCJ5qI1q0wizCfCC+ed4c=;
 b=bvDEfU/u91uxo12Dq9p5aEw/bslhqMiyd7vjMXhuinjWJR0W7H/Vc3v2FdBj5AQBr9
 TSyVsGv4oM6MUhfxgdsBPhpKyNQnEMPQP5510rwvhtULLYjNzetMUUnIlTPTjf/Cf/rD
 P4kS5/22BhsPAYPwZYxDkghpMysHTZksOQHh3CJaqbF6ijpTC3VnYlgJ7oeUHV9hf/h0
 j/sLnmruEn1G0osw638iLSpYQ93RHw5AYDE/+bGOSPA30bNctF0Fvt2JPnDs0Uu6iA5q
 g4oJqqTHMRQOgE5GzKpJphvguT0+jlcvpjHPekQ0XublmekIolJbdN6wyorGWwtqhq9w
 rm8A==
X-Gm-Message-State: AOAM533a1O1K8lY3NvuZ4kPm6rVYDZCRCapPNYinmUt99SuaIuESvVxc
 gDBdxpwPkS3ztksGegZOM6myBBFmjAOvO+zp
X-Google-Smtp-Source: ABdhPJz6yJE7I71yQ6cBHKdjSVLz1MspuA/HiPkhpDBxIiGWGBHlrIoFpdrv8jgSfAy29xqWdTGWVA==
X-Received: by 2002:a17:902:9a01:: with SMTP id
 v1mr10190499plp.56.1643751221956; 
 Tue, 01 Feb 2022 13:33:41 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:4f14:faaf:dae:66e4?
 ([2001:8003:3a49:fd00:4f14:faaf:dae:66e4])
 by smtp.gmail.com with ESMTPSA id b14sm32326659pgm.54.2022.02.01.13.33.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 13:33:41 -0800 (PST)
Message-ID: <4f81f811-2284-440a-4356-f511fe99fa1e@linaro.org>
Date: Wed, 2 Feb 2022 08:33:35 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 19/22] bsd-user: Add safe system call macros
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-20-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201111455.52511-20-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
> Add a series of macros to create system call macros that go via the
> safe_syscall path.
> 
> Signed-off-by: Kyle Evans<kevans@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/syscall_defs.h | 47 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 47 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

