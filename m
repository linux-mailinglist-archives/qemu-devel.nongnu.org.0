Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1731536DD2E
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 18:37:57 +0200 (CEST)
Received: from localhost ([::1]:43562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbnCG-0003db-6J
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 12:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbn9T-0002QQ-3z
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 12:35:03 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:38442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbn9Q-0000rI-L3
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 12:35:02 -0400
Received: by mail-pl1-x629.google.com with SMTP id o16so19549959plg.5
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 09:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4LZEHcMxypBZR5IOssG2yDi20GGzjiqgvJHoLZbj4x4=;
 b=X2SdtEzgpeNS+Zno1KPUeevXFfuPf3K4BMKd5KDfYQMCofVrETTM6H7+nqy9YwZuz5
 FHPNgbXqgW3M4oTkilaz27l3yq1iVCs4wRSuzjx+G/9cURRd6809IwEKYKaC4PICEi55
 U/8SLWZISyYJbx1jYUOtjGd/NzEehUIMxp6GdG8vYyluO1i1i7I0TjXfR92byLqiBAVT
 phZ8aWkPGm+faEwWN6ik4X4+Ca3lzjXF5uNpDR/To4W1mQdv/RV2F631n6Z54DVmuPPM
 aUE4he50XQpsngQoxwhiqGgG6FbvcYC6+kJ/37q2P+DA7Ui2MDlhnkHG6qOW7H6qc0I3
 EQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4LZEHcMxypBZR5IOssG2yDi20GGzjiqgvJHoLZbj4x4=;
 b=LZN83imfyFHMRxmsSjrEtB6OK2dqJXNsXJ4lSWJ78UDJdue4iUQJV584B6uEv6n/9x
 VWjiizL87WfC21cbnsg2ngiYDboQdHC8C9BwhRag0BcPzkUoxi5pfmOKput6kXm6RoVq
 MMl8yN/z/3P8sf2zawkJEmjplMepzYZFDIpE2Zmka1vIhiIMlC1h00ElCc3O1VSuqiAH
 Y5FPdwF0PYpZuIcYcFoPCLUM2JvGA8kZY2gogWEL5Wk/o8vNwmMWffr3KLnfFKv1XI3I
 PnLVvVZzCR9owR5ZfTSi5Q+eYfy2A7Wlx//nOG6q3p4SSfJukR+3SsywOMz2YZyxub9J
 n6Dw==
X-Gm-Message-State: AOAM530k3MITReE5SN0Y1+suaPd4HYW/h/ulxe3OlHJZvBekkQi8J+uE
 eWG8K9riO4wuvvk65UPaF8Iq+Q==
X-Google-Smtp-Source: ABdhPJz/eqGqsU8hZBSQAlIuqyt1YWbS+WQEOww9ALn6nNkIv7jsw98bh1ySzoKWSuSyQdfHOQoS5w==
X-Received: by 2002:a17:90b:f87:: with SMTP id
 ft7mr34321342pjb.11.1619627698508; 
 Wed, 28 Apr 2021 09:34:58 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id h133sm214881pfe.32.2021.04.28.09.34.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 09:34:58 -0700 (PDT)
Subject: Re: [PATCH 1/2] meson: Check for seccomp/cap-ng libraries if
 virtiofsd is enabled
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210428144813.417170-1-philmd@redhat.com>
 <20210428144813.417170-2-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <15dbfc38-f0ba-65f1-382c-3ce5b961f108@linaro.org>
Date: Wed, 28 Apr 2021 09:34:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210428144813.417170-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 7:48 AM, Philippe Mathieu-Daudé wrote:
>   seccomp = not_found
> -if not get_option('seccomp').auto() or have_system or have_tools
> +if not get_option('seccomp').auto() or have_system or have_tools or not get_option('virtiofsd').auto()
>     seccomp = dependency('libseccomp', version: '>=2.3.0',
>                          required: get_option('seccomp'),
>                          method: 'pkg-config', kwargs: static_kwargs)

This construct is wrong, both before and after, as I read it.

not get_option(foo).auto() is true for both enabled and disabled.  If disabled, 
why are we examining the dependency?  If auto, if we have all of the 
dependencies we want to enable the feature -- if we don't probe for the 
dependency, how can we enable it?

This error seems to be offset by the OR have_* tests, for which the logic also 
seems off.

I think the test should have been

   if (have_system or have_tools) and
      (not get_option('seccomp').disabled() or
       not get_option('virtiofsd').disabled())

Then we need to combine the required: argument, probably like

   required: get_option('seccomp').enabled() or
             get_option('virtiofsd').enabled()


r~

