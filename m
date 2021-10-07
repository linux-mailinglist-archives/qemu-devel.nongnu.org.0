Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAC0425B81
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 21:26:09 +0200 (CEST)
Received: from localhost ([::1]:41088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZ1s-0000em-DB
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 15:26:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZ0O-0008OP-8B
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:24:36 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:44971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZ0M-0005jt-54
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:24:35 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so5936329pjb.3
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ttjLtOJob0AcWdpgzuxApREmo9qQ1oQzddfffz3EwN8=;
 b=kEyuy5AOb9PptihUBea+te8N/SV8pQ8sS0zjPmbUMct9zrWqRBO5/uTiCX6gYDh8EN
 zHZKEy8VdfakutDTE3Qcyjs6TJ8/Clj64kCzdtmPcKBE6ucUFKlZenVbUoBjfA5pCyPB
 BybArAHYhdJIQ9UkU3tAghl4XhSuX4IsG95tJ7sXCXX1dUi9DMWJtnk3PRlo+WihCBW0
 2eJkbHvD7XQo4sS28oZkiCR1WMZE2aMfFFvIIDKZwabci5IoaeuttUL3zGQ6+z1WGb61
 YDkyE0p9CnLCwHp9CanB6/WepqBMGLeucPdXIfhFzHvS54DrEh0Q90Rl0KTa5cJgzEDt
 4oVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ttjLtOJob0AcWdpgzuxApREmo9qQ1oQzddfffz3EwN8=;
 b=7qofitl11hdi4/gE04CtX6PPNTS0YqSh2daH00t38lPaqEo+I933qaYOtAvIhXwBB5
 /2IlJmqfLZ/5LcsHECc+5hlTiqqsqqzxJNhXWhLKYkxrTCv0Btp5rzY0Fo09WMcw/Nf3
 ql63DN+YDfoAp3qYm2BFRQKRrid1KE75GXPSdnIT09t7x5Dv5y4HiMonZuY8xTO9UcUz
 E6A1gURZMmx/HTw6qcfKcRBrPpDoh0+9h70lTbOw7PQjXJjRd414OSVPNl+v6QjfSoh2
 koeZw8wPf7hbsIGMvpS88SjzpJNPR9Gc9bgR3Tj77072J6DI2ohzv8M+fBWeC+Bv3S75
 Jwkw==
X-Gm-Message-State: AOAM530n+imWzjQzLMrXBXsVyKSPE5WG/EBFKmsb13kP6TCoB6XoSybE
 e4CHS0xyTAoU7FetNlkKdYAOh9gX0puuIw==
X-Google-Smtp-Source: ABdhPJx1xgGpIBmcUlXbbNlArCoU8Pkv2QtFIXdEGthQLbWb4KVMSTbSrOoVFFaN08t6w+IGEOHMqQ==
X-Received: by 2002:a17:90b:314d:: with SMTP id
 ip13mr6875343pjb.13.1633634672410; 
 Thu, 07 Oct 2021 12:24:32 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id l10sm108214pgn.22.2021.10.07.12.24.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 12:24:31 -0700 (PDT)
Subject: Re: [PATCH 15/24] configure, meson: move libaio check to meson.build
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130829.632254-10-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dc8d3342-96fa-a0fb-f337-c87066eba911@linaro.org>
Date: Thu, 7 Oct 2021 12:24:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007130829.632254-10-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.964,
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

On 10/7/21 6:08 AM, Paolo Bonzini wrote:
> +++ b/stubs/meson.build
> @@ -20,7 +20,9 @@ endif
>   stub_ss.add(files('iothread-lock.c'))
>   stub_ss.add(files('isa-bus.c'))
>   stub_ss.add(files('is-daemonized.c'))
> -stub_ss.add(when: 'CONFIG_LINUX_AIO', if_true: files('linux-aio.c'))
> +if libaio.found()
> +  stub_ss.add(if_true: files('linux-aio.c'))
> +endif

This bit doesn't look quite right, with the if_true.

r~

