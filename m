Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79FC4232EC
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 23:36:40 +0200 (CEST)
Received: from localhost ([::1]:60822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXs75-0006A2-Pu
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 17:36:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mXs5G-0004zR-IX
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 17:34:46 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:44990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mXs5E-0005gE-T8
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 17:34:46 -0400
Received: by mail-pl1-x62a.google.com with SMTP id t11so305187plq.11
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 14:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=YokBFa0MsTIN8BvY4byZUPN/dIuuOtZ79/7HenMVkVo=;
 b=FyBF/haQlE/jJuwl/+tBXjgzmAD64zgKUD2iJdY2sI9Ekyx6PZAEf7hLC9wKJm0SrR
 V9iY+RkvT7YZuFDETPxtcYB4xwnT6LLsq3YiDXt+F9i4dUEaqN9RhqAKOwlAHe+tY0Kf
 MBKWbar8hxz9ayhLj8MsEWbY6kwIxsGFc0Bj1zm6Z5FFURFbIoCv5LANqki32IWsvtfP
 G0d9pazyuddthZ3Sozh7sK7P0YMdt1lbQw7nL76yXSOQo30++1/JMR0AQgndRboY9/XN
 gXjYd+RwBFmUzUbdFdm8XQyLZz/K3JlAWsbCvj6qxd57eLks2+8BR9YwOkWZrTfGFLDm
 tEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YokBFa0MsTIN8BvY4byZUPN/dIuuOtZ79/7HenMVkVo=;
 b=IPTdTrihsrvfYwtX+mgiYZkJGpcJQsrZxTC9CMLvVRKug7TmAIar6aI8Y5Gj4mcCkF
 moAQNjBEORz0KLOVzBbbfOf+g9ylkfuOvU9mKo/aOxIzCF++qhUUmcXyzXUGjj6Me/VE
 xeopIucIMmbnukrRStib08ubAPwWKAB/NbeSWnS0yyP687NZw87bbhudVih6UjvlcCsd
 qPyOvjg6jjHImzY89ddIhd0RR3R9O2Wulb2D0NseIl3EurOAOcccfYGHF4jbWGBXqBtG
 V28knJJgfs97UGKqk1/N/3o1sCsrWBDU6roZuRNhjOHXZMK/hAA936RE8+nF6TaLTaqy
 zYuw==
X-Gm-Message-State: AOAM532zBeV4CkWnFArgEPHWk3NCYLjU1L+IPlYfkvBKyhh6mG7UEuw6
 AiVil3scsu/Di2Ii65LTIdZBFaUxcgeHVQ==
X-Google-Smtp-Source: ABdhPJyCHwAfQD+LCLOFuOEaPC4zgLlVI+IxAKRBwZF47TRZSyZReu7FXLgnoVSWBOq3GPHhL2Av5w==
X-Received: by 2002:a17:90b:1d0d:: with SMTP id
 on13mr6586568pjb.118.1633469683272; 
 Tue, 05 Oct 2021 14:34:43 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c18sm17647719pge.69.2021.10.05.14.34.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 14:34:42 -0700 (PDT)
Subject: Re: [PULL 00/12] Misc changes for 2021-10-05
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211005164408.288128-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c6ebad64-1765-6029-6cd9-18878ee68ed6@linaro.org>
Date: Tue, 5 Oct 2021 14:34:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211005164408.288128-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

On 10/5/21 9:43 AM, Paolo Bonzini wrote:
> The following changes since commit 9618c5badaa8eed25259cf095ff880efb939fbe7:
> 
>    Merge remote-tracking branch 'remotes/vivier/tags/trivial-branch-for-6.2-pull-request' into staging (2021-10-04 16:27:35 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git  tags/for-upstream
> 
> for you to fetch changes up to bb647c49b8f1f986d8171dd61db65e8a8d255be0:
> 
>    meson: show library versions in the summary (2021-10-05 13:10:29 +0200)
> 
> ----------------------------------------------------------------
> * Meson version update
> * fix search path when configuring with --cpu
> * support for measured SEV boot with -kernel (Dov)
> * fix missing BQL locks (Emanuele)
> * retrieve applesmc key from the host (Pedro)
> * KVM PV feature documentation (Vitaly)
> 
> ----------------------------------------------------------------

Applied, thanks.

r~


