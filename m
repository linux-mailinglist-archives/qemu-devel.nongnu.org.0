Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 360F134BE8B
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 21:29:04 +0200 (CEST)
Received: from localhost ([::1]:58678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQb5q-0005WT-Nr
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 15:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQb4W-0004xG-Be
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 15:27:40 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:38563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQb4O-0002uT-7Z
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 15:27:39 -0400
Received: by mail-oi1-x236.google.com with SMTP id f9so11160128oiw.5
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 12:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=94nQo88yblpLKgJK46V/fIkawlAgjmiM2ZjZd4FTzRI=;
 b=FCu4zvgY+cC3b5DLQviJN3eRGMPdrQ1B7oZH5YsmcA9UVyCL5X7XykIqlNRwl7B4m7
 VNrYwMNcE/dBL+ScqiAcG9nMd2XEQwpCl5KR5BlXnDvDCI0dqqFJ+xG7wZTdtroxSGuE
 pp4Al+phoTNMZUT8npZZeR5a63WIGkfpDj8SYWDxfgCdEPIfGXLAlRbX/qHkHt2IzBCd
 YPVwOgQQVHYpA8gOtGLZ+0+u5VHG0gtkQUVbozX0tIaCGeLsM0YZFvI+jSNrIXqJ6HM6
 7g6srurqWl/5Q8aKu+esWdZ2muZ1tyczY4wXt3r51vqDl9w0uY9QsafCNTpsZgpxDK0f
 e2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=94nQo88yblpLKgJK46V/fIkawlAgjmiM2ZjZd4FTzRI=;
 b=QgzWxOBxE91vZkzAMXvRRojmEpyljDR7HOBJ0vYo95Co6m9ze+B+AAM/j1dZkVH0lX
 95eC880tj3oBfSEc/F3dzJwnm+v9h3q1HZtOaaygk2tcY+V687vRxoYVg/x4P/BgAnAe
 TY8PtTU43uiBhw1xF2sr99Iab3mI5afWqrq7hK3ygbdKVOPI5/bFkczY7YmPHAIbi7YR
 xN4Yu4sQOm1Xz7vJoFmYAcc+nLjkaKDB8RO3J38wU0jGTwEeSzKYttUdSdFNzpJhqGq/
 MHCH+75ks6tK1spUschV0ETHQqFxeB4JOKJ55UL0sJWVxOFicPGKSvxV4R+5uZA8n9K2
 lU9w==
X-Gm-Message-State: AOAM5302DaWleIVdKMinwMyUziWiIlvFVp5cPgGDWJPDyfqGvuL0AqW9
 qBJSoKny+tEHblqZ4d9wwZ0bZw==
X-Google-Smtp-Source: ABdhPJwXe2PI21/SPGMmaAy9k5NRKeNZ3oVxOf2TKPkUnytSELGEzJbDaPH1WKKqNXhEfdyTO2CmBg==
X-Received: by 2002:a05:6808:d4d:: with SMTP id
 w13mr16559166oik.179.1616959650926; 
 Sun, 28 Mar 2021 12:27:30 -0700 (PDT)
Received: from [192.168.44.35] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id c26sm3783142otm.51.2021.03.28.12.27.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 12:27:30 -0700 (PDT)
Subject: Re: [RFC v12 00/65] arm cleanup experiment for kvm-only build
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a7cb8809-5016-de7d-c9cc-8f1003bc6703@linaro.org>
Date: Sun, 28 Mar 2021 13:27:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-1-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
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

On 3/26/21 1:35 PM, Claudio Fontana wrote:
> Here a new version of the series that enables kvm-only builds.
> 
> The goal here is to enable the KVM-only build, but there is
> some additional cleanup too.
> 
> In this iteration I mostly fixed existing issues, and added an attempt
> to put more content in cpu-sve. More splitting still required
> for both cpu-sve and cpu-auth.
> 
> Comments welcome, thanks,

My number 1 takeaway is that I don't think we should bother trying so hard to 
compile out aarch64-specific code.  The number of ifdefs seems to be quite high 
in the end.

The cleanup that I think would be better would be to *remove* the 32-bit-only 
qemu-system-arm and build it all into a single binary.  That would reduce the 
number of build combinations and could in turn simplify or speed up CI.

We probably cannot remove qemu-arm for 32-bit linux-user binaries.  But my 
guess is the amount of aarch64-specific code that would leak in is pretty 
minimal.  The bulk of the difference is in the set of tcg helpers, which are 
segregated already.

The tcg/kvm split is much more interesting, and that part of the patch set 
looks pretty good.


r~

