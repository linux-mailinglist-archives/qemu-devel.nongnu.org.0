Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E57FB3DBE78
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 20:42:37 +0200 (CEST)
Received: from localhost ([::1]:35718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9XSu-00050u-GB
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 14:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9XRT-0003rx-SG
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:41:07 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:54824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9XRS-00029k-9T
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:41:07 -0400
Received: by mail-pj1-x1035.google.com with SMTP id b6so16489852pji.4
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 11:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zTU1Ub9j8ixQGhrwyqHRA6ml+JNs15Tiy0bwJyxTaCg=;
 b=Ged1rV6OksqSfje0FBdGiNUYtKwlpmcDltKdy04YBvl/uFkINjCQ+p37aPK9KVw8Fj
 vNPOHCXqin/dCf04aclPhMju81aY8s5M+4FoelSwD8cms4c+w76mJ56OvUZtD9uw3lzg
 En6xqwuizMp+O80BaaxFZ04mXxeTRKZBR6jDwJ7n8LB269X5b8+PeahnuC1SYy65+exR
 2yA05PmVvm8Hq05cSP3Q5+B7LT38jmg9oEzxoXMLz1dcSgs0wFxezsU5b+y7AjKu1mWd
 aKlnMPQsDH+ac9tyWp7R3mhTpD2p0odrTCcCHt2O26BJ5yy1yIsOSeTSCWeHmbucotSp
 ZRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zTU1Ub9j8ixQGhrwyqHRA6ml+JNs15Tiy0bwJyxTaCg=;
 b=VqxOdRxHfH9vOtoEyqKAuYhnlQQ/BspKvBkcAfbOduBHu+ebO+iVHaTqjNHLf28Nxv
 LLwfT9AmLMG+n8ZXx7I/aGCrgEjquSILkF2omid3iCOKAu8j1UH9vrrvicjO8cCqMO6x
 sMWjub/hQKJfUXxIVeuhY0/59VlaNevJ7zKmyYu2JAr9d/QqoaO2AtEjrW3+i75/xZU2
 UUrMzGPYitG/D5NeQ1qg3/Iz2uoNkFvrXQ2mbMQDslTvnuyVwICIjrdqy7agG8tBmhSr
 mlt7GGFcR1gmsAcQdgW/KZ0YZtXWutcyzGAhI6W9QHOWxs6V2We3dZR1ml2cpA/q0XoV
 Xvmw==
X-Gm-Message-State: AOAM530Id2Gb2IDSxfcdWcRdxcDdnkJfVs1saI79uYQXd98san2OBgY9
 5/Zu7Z+hWTahHCq9jcuWZcDOHQ==
X-Google-Smtp-Source: ABdhPJyPSv5tniaNKo0qRpt5PDjVBdiw0z+OYiFLgHNyejUJ+zOggZZGtqTQY5F0C6RdVwYtOoKhXQ==
X-Received: by 2002:a17:90a:9f91:: with SMTP id
 o17mr4423402pjp.29.1627670464539; 
 Fri, 30 Jul 2021 11:41:04 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id kr6sm2932416pjb.23.2021.07.30.11.41.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 11:41:04 -0700 (PDT)
Subject: Re: [PATCH for-6.2 1/8] softmmu: Use accel_find("xen") instead of
 xen_available()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210730105947.28215-1-peter.maydell@linaro.org>
 <20210730105947.28215-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <632fe4ad-7551-40f8-7c15-e847ed0c801f@linaro.org>
Date: Fri, 30 Jul 2021 08:41:00 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730105947.28215-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/30/21 12:59 AM, Peter Maydell wrote:
> The xen_available() function is used only to produce an error
> for some Xen-specific command line options in QEMU binaries where
> Xen support was not compiled in: it just returns the value of
> the CONFIG_XEN define.
> 
> Now that accelerators are QOM classes, we can check for
> "does this binary have Xen compiled in" with accel_find("xen"),
> and drop the xen_available() function.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/sysemu/arch_init.h | 1 -
>   softmmu/arch_init.c        | 9 ---------
>   softmmu/vl.c               | 6 +++---
>   3 files changed, 3 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

