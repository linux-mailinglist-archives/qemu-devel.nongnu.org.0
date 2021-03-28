Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3441134BD0A
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 17:47:25 +0200 (CEST)
Received: from localhost ([::1]:59658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQXdM-000856-0f
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 11:47:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQXbr-00072w-T8
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 11:45:51 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36]:46071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQXbp-0003qM-AX
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 11:45:51 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 s1-20020a4ac1010000b02901cfd9170ce2so549729oop.12
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 08:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cjLPNP2GQNJbEIPhbLQe2JsHeDbU9OTUb3bAWw8tJLQ=;
 b=DmYYDG3MsP4gpaqQX2mhbpkoqCQaPUaGzIbDYdyRC6W3DAQ/HO2VSsBOnWlNaoRu6d
 VTP2jzQYQKXUpnOXARqwUkMUrsDFXGM/J3rc1DJnXPccDzA/wf0QKzU8ixLkUHXeuQWr
 EidwkIMGy/wP6Q3aSgthXlflMLIk1D1E3fMCvtGlLZhcpDrgbkeqRXjOJiM1QJyitrOn
 /HtWM3uh3iH9cyHhbnR7GYTLBbH2WfRVvktGiKNkVK/vpMyMkTBOOzHYuvEbceihsEDC
 wFDCB7hpbskJ3FAzA67OBqFRDLnV9FkEMlX+Zk8tYmm/2XA+S9MUf/ebICLTVMkEcALt
 yVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cjLPNP2GQNJbEIPhbLQe2JsHeDbU9OTUb3bAWw8tJLQ=;
 b=IJrO2oqqo3coeGM45LyYGhaovllpqka9U8tHBRX1aFKoe2QxxU2bslo+UV1vx9Je6d
 oqTK2OizqZR8+ICfWOkmGdiRNqtyHxJsPwuVkrupeGoYf0fzuZrG3Zc50T2RBpAYhMjh
 vdSRXONRW3wMd97I7rL2KWEV9kATU0rKQpE/BV/4zKcmPl+wV0lSamU68tHWuaWH3LVv
 pTRFdxHgwoPfF9WIuWKa0BBG09f4wLb+kt5Dp+iD/sXIO8ThdilbbSMQK3879ihy6Jms
 YhEC2QfymmnPGGCcPjF9dpr+14/sYhzoNPmQ0Zbnin4edLChhDLyuzge5cit7GFAzd0E
 aoqA==
X-Gm-Message-State: AOAM531hm7CJClwq8qhoF9MKWWbItJmyMFMKjsbNiKdQ2r++2t9Oytv8
 ugtkOO3tfCAIDogqi+zjEzrvJA==
X-Google-Smtp-Source: ABdhPJxt98oWCn705zDAhUOHRppQDf397xyzox7h89/2VlNevuXbqF34qoTNauN5fKomeaucRCUIoQ==
X-Received: by 2002:a4a:d0ce:: with SMTP id u14mr18623537oor.36.1616946348042; 
 Sun, 28 Mar 2021 08:45:48 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id e4sm2957821oie.23.2021.03.28.08.45.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 08:45:47 -0700 (PDT)
Subject: Re: [RFC v12 13/65] target/arm: fix style in preparation of new
 cpregs module
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-14-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c0004d14-1723-4747-3acb-451765886bed@linaro.org>
Date: Sun, 28 Mar 2021 09:45:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-14-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc36.google.com
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
> in preparation of the creation of a new cpregs module,
> fix the style for the to-be-exported code.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/cpu.h        |  54 ++++---
>   target/arm/tcg/helper.c | 313 ++++++++++++++++++++++++++--------------
>   2 files changed, 241 insertions(+), 126 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

