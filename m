Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A0668C59D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 19:20:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP64j-0006uF-Qy; Mon, 06 Feb 2023 13:18:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP64h-0006ts-Kf
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:18:43 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP64f-0007WT-VB
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:18:43 -0500
Received: by mail-pf1-x434.google.com with SMTP id g9so9020606pfo.5
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 10:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nOWthjJoOdfwNDDVBtX36cp5WqT45KaTLhenePfSl9Y=;
 b=XKwaQN22QZNXe49mxuu8qEHD7o03B4XKfDCDSjQSgXtt7Aj0GeNK/n2mT+oGMShpgO
 m3ctN6XbaR1+Sc1d4Kd261iGkoWPNJvnkAzA3k2kucDvWZC/UgSYgGmpkfa5fuVYr8yV
 LIsXH7ZSkIQo7RH/Pjmvp1b2gyei7z9nBXoBh8DNEZQtatcv80/MJtSGRoTWGgwZlYEx
 k4PWZJk+6QXRMFmnJTYDBOPVjbu2cdyFECRN3AvCqTuMIM/z0vXH5QHZDgiVyO1Omlko
 /pbVrCfoDAocQEHChMalp9ApQgJnI4uVAD32qqswk4hJZnqUkOwnk4U5ShGlWlwOGwc0
 gBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nOWthjJoOdfwNDDVBtX36cp5WqT45KaTLhenePfSl9Y=;
 b=wC35ZxIV+VLjKysZZPYWl1WwA4ZpG4COoLJ2gl3ydEhJa7e9ldV8XToiQQ6YHVe5lO
 ocl3Hv9eIi80JF7oMAwsJQ1bliXI83cRHcySoTrYcOcgJwDx8QMkfwa1khKTSAiPJSII
 fMfO9ULfvWCiXf2UhJpSf/OIB0epZQYjvVJGt1jpA1HX2xPUOjVSvy1Yx//PdZTSamDj
 lW9Q0qbCJa1RVyRYPtl3US7DaLY2NgTlZ/OwWoIwuTTweFZxxQ1OLZz9Ct0XIVBTPMAJ
 nWfcpfylItAPSy0YsHoad4hTpeuHgEO/GzyYBkFQ8+uVdEbcj9AUzaJMKxCHCAC98BQ3
 VOaw==
X-Gm-Message-State: AO0yUKUpoFsqd2DebbNm7L91lgv7r78GHLf3wmAojUAZUOrdUff58w15
 rsQe47EK1mHVUlV5pblW5RXrHQ==
X-Google-Smtp-Source: AK7set9Mp3opcRxDSR3mpwDrx+cG9i5yncujzsQBsmG4sMuC9sKWZ3WpcNl0+YN2aLZ/xtlYvXVz/Q==
X-Received: by 2002:aa7:9f1d:0:b0:593:1bab:1501 with SMTP id
 g29-20020aa79f1d000000b005931bab1501mr393468pfr.7.1675707520056; 
 Mon, 06 Feb 2023 10:18:40 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 d198-20020a621dcf000000b00593225b379dsm7474997pfd.106.2023.02.06.10.18.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 10:18:39 -0800 (PST)
Message-ID: <8225a961-c59e-041e-41e4-a885b417b9aa@linaro.org>
Date: Mon, 6 Feb 2023 08:18:34 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 0/5] Deprecate/rename singlestep command line option
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Markus Armbruster <armbru@redhat.com>
References: <20230206171359.1327671-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230206171359.1327671-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/6/23 07:13, Peter Maydell wrote:
> So, questions:
> 
> (1) is this worth bothering with at all? We could just
>      name our global variable etc better, and document what
>      -singlestep actually does, and not bother with the new
>      names for the options/commands.
> (2) if we do do it, do we retain the old name indefinitely,
>      or actively put it on the deprecate-and-drop list?
> (3) what should we do about the HMP StatusInfo object?
>      I'm not sure how we handle compatibility for HMP.

I was thinking that a better place to put this is within -d, akin to nochain.

I would deprecate and drop.  I dunno what to do about HMP.


r~

