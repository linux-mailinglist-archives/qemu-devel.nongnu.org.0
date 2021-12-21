Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF32B47C38C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 17:11:28 +0100 (CET)
Received: from localhost ([::1]:55258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzhja-00069q-Jd
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 11:11:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzhhh-0005Lz-77
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:09:29 -0500
Received: from [2607:f8b0:4864:20::52c] (port=41975
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzhhf-0001ry-MW
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:09:28 -0500
Received: by mail-pg1-x52c.google.com with SMTP id k4so12742146pgb.8
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yoR8XeuPd21z/wkDJv25cPLJ7W4g7DlYW1vS/9BZYe4=;
 b=dFAwvHb+rHq9aJpZsRwLnOgwGsdLsrhhaSgRex8ux7Eh+sisoZaw28L5Gn0iDA7+RL
 rfqCQCS/MKWt1LxEnq2sYxD667LYOhNdErKgu2e0UagYwC9qGbgXL4iv+GG+463lPgiW
 XrvR84pxMMZftSxVFVqwo/mWP7v8IaJaQxezB+0nz/adW+DSzzuIC/istCETjdaYZ6Ve
 VtmBm3myGEBeB48TEK6VLt+N/yfd8O3NEFm0jVuKJYRZ+DxzEK0JD8EqCAeREW/EYKHy
 hoHRNRW37IuJ9Qw4WOk9Im2/Kygxhl/R6vpsTXsyhIPGAGV8Qs6eTpRum16BP60Z6yD0
 xkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yoR8XeuPd21z/wkDJv25cPLJ7W4g7DlYW1vS/9BZYe4=;
 b=tgv/70Y4vNDd1ma67PLTDMwW5TTZIIQ4yonv9cTrLqJPMeWswCLiUnXJFJ+y2D0eyu
 ci6hpgwq/GkiTPkSMRRAlBgZ9K4hYhG+e2+pv8D6by+2VXurnBBnwxGAOp5wfzLM6Htm
 EUB/LUrFH9aOi2u8Qajyz8IFTZnAkLU/bdnP0eeI87aKiGgzY2+x4iHCmenf3aKM7t54
 Uh5+b8/iNDr5A3JWI4iUYrGQmLKO2fhjc1tMOGvt7a1/nAJRwhIwYYIE01kIZ/Gfaymg
 4PhqqnNResKW8+YCHxudft/IagD3V1NzoR58y+cPAglJoVcExiuvGaRIK3a92KkRZvgR
 1poA==
X-Gm-Message-State: AOAM533E0735sqUFBytc1RFO+yvREHXM8sqSwBT7uFsO5B273hbu0wjj
 j7H/V7N7WTMlMMNY7fBq+OihdA==
X-Google-Smtp-Source: ABdhPJwz7RM9S81OHkfuZBcKuVXY6EGsABKdajxyKLjXnDGtA8Ppvsn6LhDe2JkmmppgSBvNghQC6g==
X-Received: by 2002:aa7:88d6:0:b0:49f:dd4b:ddbc with SMTP id
 k22-20020aa788d6000000b0049fdd4bddbcmr3964577pff.31.1640102965630; 
 Tue, 21 Dec 2021 08:09:25 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id s5sm22714242pfk.65.2021.12.21.08.09.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 08:09:25 -0800 (PST)
Subject: Re: [PATCH] docker: include bison in debian-tricore-cross
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211221111624.352804-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0e3551ab-013d-ff77-d2ec-919574abd7d0@linaro.org>
Date: Tue, 21 Dec 2021 08:09:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211221111624.352804-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.012,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/21 3:16 AM, Paolo Bonzini wrote:
> Binutils sometimes fail to build if bison is not installed:
> 
>    /bin/sh ./ylwrap `test -f arparse.y || echo ./`arparse.y y.tab.c arparse.c y.tab.h arparse.h y.output arparse.output --  -d
>    ./ylwrap: 109: ./ylwrap: -d: not found
> 
> (the correct invocation of ylwrap would have "bison -d" after the double
> dash).  Work around by installing it in the container.
> 
> Cc: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

