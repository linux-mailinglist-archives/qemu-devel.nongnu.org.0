Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52AB369D24
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 01:07:29 +0200 (CEST)
Received: from localhost ([::1]:55400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la4tU-00045z-S6
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 19:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la4q2-0000R6-4S
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:03:54 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:34675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la4q0-0004Sr-Jt
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:03:53 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 em21-20020a17090b0155b029014e204a81e6so5176461pjb.1
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 16:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xWeEuztEvpZ8sWce/0lCjVQanQzaZb5mtxiFZAXcngY=;
 b=z0iHHNEkOypU57hxKlp7NtJtcmp62SijjPFR7shvDYDepFeN9v5nBPoApQC+E+ixbg
 rGBf0bSvo0KX/BRdCIAvdrEUcL4qB0FIWuKYzczw96kO30MQ/pnLO2z+XVQLIn1FcQ2G
 Yk+PSTN+GqI/qZVRpX9kJ/WLDvgyn0TSlw5WHduSYOf1cAuufj7+ApnabjlbWj8YWAAT
 6oL/5c0WEdxbi97JyeIpSODyl3rQ+4ILWvMjC8atdv24lYIei3Va9rEO0hJ62d++2NKp
 8YbPKS25xxfdPLbGgPQyMoAaM4pKKQ58qBDnWyyA/Jcv597KZHt2bw76iEhTkBcusNcp
 kV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xWeEuztEvpZ8sWce/0lCjVQanQzaZb5mtxiFZAXcngY=;
 b=O+5qGt5vt0aeQmbzAWDfnFzRKLo6QYT1UhNY6DTZCYXqf2FGHuClqj3xh05xV6qP5x
 k+VyUIt5EHKp1af5F2rBFgyuo9nn+n6dxrMRH3AuVwyQGpcDpFPczSH++4lE5hS1RtcL
 X7L/r5RxjFxqAh0wYDJ+vB5XOtxuR0OgMT2256qroqkTmWAOFkdhTyRLOSPYbMXPU82L
 lywIVyHo7yOsjK6r+x+W5BrV4b24rhnzkEr5N5ifCUpY/Z8h32I1W/KIR/Cq7BuCWoPi
 ybj77SrKwKUwN8WIKY4eRsL/Jc0hNIzOQmckZ3x0Xas4yvH4aNumY3dyPxYSIhkvg1ai
 3E6g==
X-Gm-Message-State: AOAM531NzXWie7m6ppNAS9fD88M7HhCW5//DV7UPG4XNgJLuyadPLzMY
 p5vxD5tc6rotb4xvneo3u7HYyQ==
X-Google-Smtp-Source: ABdhPJzG/cfsSGClK8XwgJYATRS9cf46b8DD3CgKvfXLJHINJ6ti6F8k5B6d8w5sHiqCDli64lk67A==
X-Received: by 2002:a17:902:c404:b029:ea:f0a9:6060 with SMTP id
 k4-20020a170902c404b02900eaf0a96060mr6308194plk.9.1619219031565; 
 Fri, 23 Apr 2021 16:03:51 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id n16sm5419402pff.119.2021.04.23.16.03.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 16:03:51 -0700 (PDT)
Subject: Re: [PULL 07/24] bsd-user: style tweak: keyword space (
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210423203935.78225-1-imp@bsdimp.com>
 <20210423203935.78225-7-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1d075f33-a63a-ba28-cc78-72cadc459886@linaro.org>
Date: Fri, 23 Apr 2021 16:03:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210423203935.78225-7-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 1:39 PM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/uaccess.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


