Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2403941FC0C
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 15:06:45 +0200 (CEST)
Received: from localhost ([::1]:51364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWeiy-0000gw-4J
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 09:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWeaA-0007r2-1U
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:57:39 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:34642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWea8-00026z-AV
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:57:37 -0400
Received: by mail-qk1-x733.google.com with SMTP id i132so11928218qke.1
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 05:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=U+z8PoE+gvGsvq3CyzLAkvJJ2iAUZ+po4sXgkwcA2VY=;
 b=ACkfNp5V8Fy6n2uIywpH+3TXYKNrLQQGiUDNVyse1KSTG8O1a0/09/boIQwRvO+833
 c0z3StegpyGw1jQDwKS4XLeyLN+lKWzzQGelAqeaihz99sZqb1QG+TyJ4Q6W7BnKNiBe
 QgR89zu5ijXscTj4wANYud0Kzu7hJtsHJDHRhzw2uOhhFSGt9gwGmuYcqJupEVT1aMNK
 Gg9Hz/CQre3LJumvWlOgoiYBMYRxuJHQUHy72FMNIqJ3huO55mLkL+5Fphgnq//17A/i
 7Wqv6MShhtiqhJt2OsSPymPxGCv/i2oKfWRHKgjQfsquzKSB9hZdZGd4J9wXOcPeaf0V
 l5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U+z8PoE+gvGsvq3CyzLAkvJJ2iAUZ+po4sXgkwcA2VY=;
 b=3Gw/ngmfvI1FBMcfpakB3LSU9CzQP03yZzjF6ENrP9KfkZ9r3putne5Z8FLg07kBQ3
 DXLUCkTctmOVbGbYRm8cXBDuNWwycb3FpxiAI3LywcKPlM57s90o3aJVY4TvSvIoXnWo
 RE/5jCyn/ywuNJx7+I6zVZj6tHsdHE72wQ5ggKv45nHp7y2PUBFl5F+Y5/ybUHlWMqTe
 0zd/vJKNbvPQr+hNgLaGhDXUhCWFDuGFLU4BmdhRyQTVwlBx/Gm26Jz8TMH/oKbVR/WZ
 5YmQgeGWrLK0mUa5Qav97EWtvZGIh4ybxscyedmxJvRpGyeMwbwRRFNDZ++26xjYpfRp
 zThg==
X-Gm-Message-State: AOAM533I6bVx9MwJVyr6DwRskanjjxcqqEb8lcvffjoCtyAVwSACscTQ
 qpOklH3ACF5gS7oeYW4MGE/rQcG7Qxkf0Q==
X-Google-Smtp-Source: ABdhPJzop+74SCN8qh3LhE+Ea4YNgv6lt5I9+nZjjFfoprtcwUjZ8IWDHY3dybvW0jZ4lLyKLVEVPA==
X-Received: by 2002:a37:ba06:: with SMTP id k6mr2387617qkf.312.1633179452773; 
 Sat, 02 Oct 2021 05:57:32 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id x6sm4782866qkh.45.2021.10.02.05.57.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 05:57:32 -0700 (PDT)
Subject: Re: [PULL v2 00/33] x86 and misc changes for 2021-09-28
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210930145722.184577-1-pbonzini@redhat.com>
 <f10773b7-6c69-413b-2865-da802d9c0953@linaro.org>
 <CAFEAcA-eYB31+Xf7ZRQMkwz3kTOoWgSzr2vdceoR5WQWpgoEdA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <13177b47-88df-0493-6840-8d1be9b4fbb4@linaro.org>
Date: Sat, 2 Oct 2021 08:57:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-eYB31+Xf7ZRQMkwz3kTOoWgSzr2vdceoR5WQWpgoEdA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x733.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.413,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/2/21 6:09 AM, Peter Maydell wrote:
> On Sat, 2 Oct 2021 at 01:41, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 9/30/21 10:57 AM, Paolo Bonzini wrote:
>>> The following changes since commit ba0fa56bc06e563de68d2a2bf3ddb0cfea1be4f9:
>>>
>>>     Merge remote-tracking branch 'remotes/vivier/tags/q800-for-6.2-pull-request' into staging (2021-09-29 21:20:49 +0100)
>>>
>>> are available in the Git repository at:
>>>
>>>     https://gitlab.com/bonzini/qemu.git  tags/for-upstream
>>>
>>> for you to fetch changes up to c1de5858bd39b299d3d8baec38b0376bed7f19e8:
>>>
>>>     meson_options.txt: Switch the default value for the vnc option to 'auto' (2021-09-30 15:30:25 +0200)
>>
>> Applied, thanks
> 
> Uh, I'd already done this one :-)

I seem to have replied to the wrong cover.  How odd.

r~

