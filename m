Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 009233484AF
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 23:36:56 +0100 (CET)
Received: from localhost ([::1]:35138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPC7T-0008BM-0F
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 18:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPC5t-0007dh-Dw
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 18:35:18 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:45776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPC5p-0000u8-8J
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 18:35:14 -0400
Received: by mail-oi1-x22f.google.com with SMTP id d12so88961oiw.12
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 15:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vChvtAvQkZL4JQrqHms0D4h+lGLsOo9x6SHwh6cq2YU=;
 b=LbYr8Evn278Nx0krxyPaoJBDlDL3RvOAAMz4XmvjJf/Ol4HKLmbPjklYS7r9V788Qu
 8SH4xfbOUzodqn4McffvqORHKidkHlW+x03zLG3IA1BD37XTYswbhVUm1PcuxxjY1dU+
 ThITQTtFbtWpsiV04pl9Nf0Hri7tkrbMQLbYksZmQfNxQag14KXfLPYX9ZF6ndt07aa2
 0wmHEVucUltj671TaKjWQDqRcxMNwI7/apAUNaeCzGniqddMLRgoAKRzdJOtMzGSIHRb
 L03k3LSnw4atW32b2Z53xNXqD8FqFLEtP1nm2P5BI2Ywqig+brwsuoddkUKLXBZRZQKv
 cLUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vChvtAvQkZL4JQrqHms0D4h+lGLsOo9x6SHwh6cq2YU=;
 b=lgmU+M/J9y6qmWddg9Gq6vZ5mRIo1KJMrMR3bddn73blPEeWzpXLOEMVbzVCqJwnyQ
 7MEWBwDEt9yvX7pwZ4AdKJN1wLqjgsy+V6BarRf8XQhEjFhGO0dSFxYKDbxyMBFvqOv4
 qEnfPbiZdV55HtpMduAeI9TpK3wsDdh1XqLvvYj7pQ95/94mIKxvRxelWOhUu9I6zWeh
 ww9rGw/Grb2WnlwDuIyb4X1oXdTieu2YJEft5zRy82mV7D6m+insiEprX4wj43xCNGg4
 0guPchYZWnHvk2dw+A4mLGxTFasQ/xINYzJ4myoiuyi8B77WbixG7uPT6nSjRkEXw99a
 HwIg==
X-Gm-Message-State: AOAM533A8Q1SU4bCMurh07dzRk53lI9UjSVTYG9S8Kez0CpGfnVumYRn
 A1x85m6HrNoza20yZfh6Hzk8LA==
X-Google-Smtp-Source: ABdhPJwbE4u7sbWbXUsajwDZW+lxwRlxcOS1pAHcWU7taw+teLMNShYcL5g51bIcgM3Hwqy+QIyX/w==
X-Received: by 2002:aca:da04:: with SMTP id r4mr3719409oig.123.1616625311773; 
 Wed, 24 Mar 2021 15:35:11 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id c26sm846604otm.51.2021.03.24.15.35.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 15:35:11 -0700 (PDT)
Subject: Re: [RFC v11 32/55] target/arm: move kvm-const.h, kvm.c, kvm64.c,
 kvm_arm.h to kvm/
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-25-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e2d195ab-a308-2061-ad67-144452877b21@linaro.org>
Date: Wed, 24 Mar 2021 16:35:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323154639.23477-25-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 9:46 AM, Claudio Fontana wrote:
>   target/arm/kvm-stub.c             | 24 ------------------------

Can you really get rid of this?
If so, I think this should be a separate step.


> --- a/target/arm/kvm/meson.build
> +++ b/target/arm/kvm/meson.build
> @@ -1,3 +1,8 @@
>   arm_ss.add(when: 'CONFIG_TCG', if_false: files(
>     'helper-stubs.c',
>   ))
> +
> +arm_ss.add(when: 'CONFIG_KVM', if_true: files(
> +  'kvm.c',
> +  'kvm64.c',
> +))
> \ No newline at end of file

Watch the whitespace warnings.


r~

