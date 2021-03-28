Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E9B34BD3B
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 18:24:14 +0200 (CEST)
Received: from localhost ([::1]:55470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQYCz-0006qV-9N
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 12:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQYBe-0006A5-QR
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 12:22:50 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:41631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQYBd-0005pm-BX
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 12:22:50 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 l12-20020a9d6a8c0000b0290238e0f9f0d8so9996508otq.8
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 09:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D54tk6uBO5spsEfgGmZLsxXmTX5Om+ChmrLsfKkUdhw=;
 b=J9MKfESAWvu1uMNz09EXcuKGcVahJ/vJd/S2SfDA+oSJtDB2hyyXfIn7AG/dwVxWuE
 nAwtmooVJN6PLUdeVw29Ey0FCvFzD2Jb+D7B0DYFp6j83p4R+w7aBoNT5lqeNbaJy4GC
 0tYTtCBB626IQa42kUAmPa4rRGX9rQ1EBWqEyPjpBLElHEW6g5vtCbJiaGiCKeB1lwg6
 rAwCfJfzIlDGQc05paVz2A298aqvQKs4R4SIyG8smNMStZv82q+ANbCTdUJjfWqxsh/9
 LTCz0xb2Tj1iXhuwdT1Bl506HcTeqXfyB6cm2mKg5SBNlxAFx4UccDD+CcJacW0wcEz4
 FMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D54tk6uBO5spsEfgGmZLsxXmTX5Om+ChmrLsfKkUdhw=;
 b=bKmfX643yaDyd1bPHabTGJvPHntfInp5kN6zE+JjUcXNFb1KYRP89AosyHiqilYJUz
 LyPIziRpwY7m2bnkH/BV8DivFkYbR8yaQN1dUucDgXY2pcRnmBaNM/XPoCm8cMWa3XtR
 D1aY8DQMA/bhuBs7p+p+ILCDNc3Cc2ZLpfVqAbRLihP4c3n5pcZTkX4HiCjpPtvRTTvL
 8JGSaRweNkNKN6bncS5jdsND0c6Gu5k7MoR0TYkdAHrwUFWPyc7smNjQMNqr14z9+yW+
 9ZNuJAvYGvQ2ce3cA9BuMplKoJGHGAHksjt9Om3XIPxkUBly45pOBAMhZLYgjwUZ71JI
 D2CQ==
X-Gm-Message-State: AOAM533b/IfYMOWc5wHQr3L2vjxVt3fuWqQl4MGrUa0AmFmAsi4+FM0R
 RGKDtn4ZOUL5nHQlzje9gsfj2w==
X-Google-Smtp-Source: ABdhPJzc6piifmgEoLFqQFQu2YAizTbze0KZGJrGQGQfX5NPko1/12U7yGy2f3djfc48rOr8pd2+wA==
X-Received: by 2002:a9d:da4:: with SMTP id 33mr19875215ots.176.1616948568370; 
 Sun, 28 Mar 2021 09:22:48 -0700 (PDT)
Received: from [192.168.211.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id e12sm3677346otq.30.2021.03.28.09.22.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 09:22:48 -0700 (PDT)
Subject: Re: [RFC v12 17/65] target/arm: tcg: add stubs for some helpers for
 non-tcg builds
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-18-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20afd643-604c-8b0a-fe02-3e6a08c5f848@linaro.org>
Date: Sun, 28 Mar 2021 10:22:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-18-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> +int fp_exception_el(CPUARMState *env, int cur_el)
> +{
> +    return 0;
> +}

Oh, I'm pretty sure this should be identical with sve_exception_el, where the 
fpu may or may not be enabled for a given cpu state (e.g. lazy fpu switching in 
the kvm guest kernel).

Are we really returning constant 0 for kvm before your patch set?


r~

