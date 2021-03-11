Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB735337382
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 14:13:11 +0100 (CET)
Received: from localhost ([::1]:36120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKL7m-0005n5-Gd
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 08:13:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKL6a-00050t-IJ
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 08:11:58 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:41928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKL6R-0004J6-3H
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 08:11:56 -0500
Received: by mail-oi1-x22a.google.com with SMTP id y131so20175859oia.8
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 05:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=PJN3YqmOgCfb3pTakcHu84m2gQg7Uqt9JxGgG8SVFYs=;
 b=KXKX6gVr8kpv8VubmscCZoKcBL4uatIYx+/2iNztN61AAdK1xTDLbVdgqbBGxd+J3y
 S5jyQq3qZ5D1iZhfvcuNY+4p4bOWKFPPNmdkDub/w4gvuXqM2KQYmEjneGHxazcQGna7
 cECk0txEY5bwSV+1Sj185aRuwv4/a7TH3UBR0Q+AE++zILZ20LVyWm/QqB9gHilfpSAV
 m7K7L0goh/kDguf622nZHyQ0Clt6xgiG6+rjZ34lw7G3SYDVPzL+ZktWyvP6r9ORr1lJ
 4zSGudH6Z57Y+3V89YaO96r38K3XjcR7epP1V3F2HdVKX/9HrQ9Nty3KS1oaGhgrl80o
 Csrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PJN3YqmOgCfb3pTakcHu84m2gQg7Uqt9JxGgG8SVFYs=;
 b=CoHOvWKFt+7MZwikoSf0TJvfbywhRkfi6mlEAnH+6+/2NZaPnvgyzpcwoNwo6xysO7
 lomMnfdDRdCRvpC42i0T0kXMEHvreC+ZNbFsArIgcdl865nRPa9GpNIb7+3Vfu6U6RbZ
 oMytSWNLa5kVdacMWZH757rKfR22gz59a20yEFqtOqEX584PKUN0deiLQMmgIXI4rsjd
 gix1Ftp8PQ8wrTJJG+MD1MQKIrQP9xxVglnQDPvV9zApPYnEX8TS9VjadeSjyvCDW/IY
 e5DTPWB8yEccmyvn/7I5kKRxG+jxN6RPJueYvZbsGnROH2qEo0h0/EbJ+NMY2cFrtT/g
 Kttg==
X-Gm-Message-State: AOAM532KHqJH3Gbvmlgz0XvlYXE+PlZYCYUdwSBGWjr3ffiz9yIobV5O
 Z7LEVBUOzNQAynKPie4WNb4nS8gJZdYAg1UP
X-Google-Smtp-Source: ABdhPJwcHk38JWR+ig/mOth7OkpLpyBBcUDN5umseDKmNoHA11Tk3ba3UEMiUWT0yrq4Zv1Pxqjlmw==
X-Received: by 2002:a05:6808:1390:: with SMTP id
 c16mr5965251oiw.27.1615468304611; 
 Thu, 11 Mar 2021 05:11:44 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id u7sm508685ooq.13.2021.03.11.05.11.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 05:11:44 -0800 (PST)
Subject: Re: [PATCH 1/4] hexagon: do not specify Python scripts as inputs
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210310104937.253532-1-pbonzini@redhat.com>
 <20210310104937.253532-2-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9513869e-a485-b307-e9c3-cd5992ca9323@linaro.org>
Date: Thu, 11 Mar 2021 07:11:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210310104937.253532-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 4:49 AM, Paolo Bonzini wrote:
> -    command: ['PYTHONPATH=' + meson.current_build_dir(), '@INPUT@', '@OUTPUT@'],
> +    command: ['env', 'PYTHONPATH=' + meson.current_build_dir(), files('dectree.py'), '@OUTPUT@'],

Should we not use the python variable in this command-line?


r~

