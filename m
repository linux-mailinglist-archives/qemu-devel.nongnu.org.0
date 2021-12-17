Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5AB4792EC
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 18:35:40 +0100 (CET)
Received: from localhost ([::1]:44626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myH8t-0003AL-6k
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 12:35:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myH7k-0001mQ-7o
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 12:34:28 -0500
Received: from [2607:f8b0:4864:20::634] (port=43562
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myH7i-0006AV-Qj
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 12:34:27 -0500
Received: by mail-pl1-x634.google.com with SMTP id m24so2433422pls.10
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 09:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8CFYMmeRPmDS0ohE/aaPj4dWGyHTtLiLLfn1bCoeYlQ=;
 b=bXpsfMsDyJ50BC0yp7FBce0UKTmc5TUlLYl+S/WU2vHzMmTCIu4alPrgBUF+iC5YfY
 uPsm1ItXcgsI3wPA4btEcN43cIrPPCGr5s/aTg6HDPqomPdB7WePlCnWEIhIYpaE7S5v
 srZ0GI3M0zkrDa4vX0tdvVeB9yZD9NuwK0MAIZl/rR66xbU8CgyqZuvCbzd+Ml2mPELJ
 4WQGzG7+/hGXmtPr/j6pzK20bCtQdWc+olvIzzwS6PxMQ0GSnZk4lAuAoPLS/HSDqSQ/
 gfVyvAWrTCmDvcFzhUPMfJIRzTwAuKjLhxMKtGBjzIvnv3sRHYBwFs7SH8T4gXAjxw3r
 6Deg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8CFYMmeRPmDS0ohE/aaPj4dWGyHTtLiLLfn1bCoeYlQ=;
 b=SR7EuBuXl1wJvz22ChItKpQKdsX80SyXuUSthk/UBXCdsvZATuubHzTSdUGVJTSEcl
 2C7qjC9a5zgl5iaSpeVei3Qos6pBBQKLJ4O2zjmP1ulIeB9z3v+b+fdb6JHnGvoBfWPu
 ZQMGnpvErH+LTDzTfk1sCQTbg/FANYE3KIxEq1/Q+kC8YwnIju8+xzHaPYffJKt8mNkB
 tPnTOQ+GzcCNnYR8DjqOnwdR1y0hJcMu2t0QXaeU+6q0NCIEwILBbWGVQAth105eHQKA
 tFKBGRamBHef0X28AV5+PSwImLBjdMW419EC1aqPF+WpW6Ii2DSkH1wqFad6sWpvgXPv
 DaoA==
X-Gm-Message-State: AOAM530WdQqHsQagDsrqJYj0+cfLQBddCSElD6Z3KQEHWy7UQLC44e/B
 owh7KAP4LEUIcHbKDoCnLvT0AA==
X-Google-Smtp-Source: ABdhPJyYEImocqo6tKRM4ru4gyoCQci4sFKXoTJZynyrIE97LtEq9wh6SoNfYlyLF3bTDbPDkNjciQ==
X-Received: by 2002:a17:902:9a8a:b0:148:d8aa:16ae with SMTP id
 w10-20020a1709029a8a00b00148d8aa16aemr3980224plp.139.1639762465299; 
 Fri, 17 Dec 2021 09:34:25 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k2sm8559240pgh.11.2021.12.17.09.34.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 09:34:24 -0800 (PST)
Subject: Re: [PULL v2 000/101] ppc queue
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211216202614.414266-1-clg@kaod.org>
 <cf2bd3a9-007a-5881-efb8-9e6195958030@linaro.org>
 <655a7bc0-2063-55ed-9b68-9704db2af3cd@kaod.org>
 <7fb240a9-194d-7e13-a806-f1847c7220f3@linaro.org>
 <3087991f-eade-b170-9183-23d8541eeae8@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c5f22493-e9b7-700d-3d8f-9e6f45168a98@linaro.org>
Date: Fri, 17 Dec 2021 09:34:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <3087991f-eade-b170-9183-23d8541eeae8@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/21 9:31 AM, Cédric Le Goater wrote:
>> Maybe you can generate the email text with --inspect-emails, and then send only the 
>> cover letter manually with git send-email.
> 
> That's what I wanted to do: only send the cover letter. Is that ok ?

Yes, please.


r~

