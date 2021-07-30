Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C833DBE83
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 20:48:46 +0200 (CEST)
Received: from localhost ([::1]:45732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9XYr-0003Uu-MB
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 14:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9XVo-0000xU-FX
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:45:36 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:34476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9XVm-0005Xb-Tx
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:45:36 -0400
Received: by mail-pl1-x635.google.com with SMTP id d1so12171191pll.1
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 11:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZVkc6l9Gf9peCwlPgIIifxDpAI7HIOpsyvm203k3p30=;
 b=Gm8RYj22pLuSUhUTwwKP2JvmPlqTkur5WnllE10YQjDGuH5ArLsYu8CwXn8pNfXzfU
 zn+0QYuoirOM3FpAAmJ1gtBEMsvltLPBbBdipFklHD6l7c3xmZgkzpCMAdkf5EvQSEm0
 dK/QHoZ668COJQxU03/a6B7uYpnOuCVU/E73C8AdZIU2aQd5RK0a0EGtaTBzsFx3IB4z
 iAOD5fCN/kp6W43DajUYgAD2ybliyPq6KbniTLDoxdBqOfjS2uajSgIdajig6WRPsmz7
 BW+NlK/n48YGpqRrTq+c4zOZtaa8n0nCoBHEIIubcyGSBpuhubZU1YVuLUVzNnHz+9P4
 9Wow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZVkc6l9Gf9peCwlPgIIifxDpAI7HIOpsyvm203k3p30=;
 b=aB/wfQUOt35pWF7KBsAMy9X7DDXKi2wk9Oe1NskmSddKqW0DOWtivbMnSs7n3PKIXe
 O65bZ2YKXW56Hu/BeO3VAs0PY2267o4WotVly8VtX5ww7oz44+36zDtLtzojs1Wwq6zp
 HKKT0YQitxu7SOj5TBYo1NeIaO95eWvev0FLxhdv3zOh6JUdGj3FPdhLUBJsV/Sr751l
 H0J9J1aRaNTK+NCVqb2uO6MxH8vGJ0h7Iyfh4Je/KGPu5bHejtLFRXCytvxI5iDOaqbi
 VLZTEfyE1DBFvc5rHecCeg7edfhN1V4GeyEmz6HWTcyfXLJPiO/gtwj9BwaWx0Ksvzw3
 oV/g==
X-Gm-Message-State: AOAM533t8EHaHtGx8w6IxHtoRsmvj8kJErNQ3/bJiR1SXdv2UzaZSd6N
 exwlbbqrue/4Pwn2xquRqiMuyQ==
X-Google-Smtp-Source: ABdhPJxY5GLXCgTgmEF3iPtAldOdaVM5+cy/cmq6iJ1t8Q8QYxP4ylGfkWAt7jv7xlrh4gKlIgBFwA==
X-Received: by 2002:a17:90a:69e3:: with SMTP id
 s90mr4561807pjj.193.1627670733433; 
 Fri, 30 Jul 2021 11:45:33 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id c24sm3920046pgj.11.2021.07.30.11.45.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 11:45:32 -0700 (PDT)
Subject: Re: [PATCH for-6.2 7/8] arch_init.h: Don't include arch_init.h
 unnecessarily
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210730105947.28215-1-peter.maydell@linaro.org>
 <20210730105947.28215-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8aa032d8-7193-7832-5e16-c0d9de4d686f@linaro.org>
Date: Fri, 30 Jul 2021 08:45:30 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730105947.28215-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
> arch_init.h only defines the QEMU_ARCH_* enumeration and the
> arch_type global. Don't include it in files that don't use those.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

