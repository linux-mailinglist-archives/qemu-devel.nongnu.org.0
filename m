Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D804B4E1D41
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:55:01 +0100 (CET)
Received: from localhost ([::1]:48870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzlc-0003wm-UX
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:55:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz8K-0002vs-AB
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:14:29 -0400
Received: from [2607:f8b0:4864:20::102d] (port=33052
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz8I-0003hB-2o
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:14:23 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 q1-20020a17090a4f8100b001c6575ae105so8764430pjh.0
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=JV1lSbvbxcntAU71axjdGOp7EiTeIeda5B50ROh6QR8=;
 b=XDopeHsL59kETwH6fIjtuN9hpFdEUdZqqmGPJeplb5lCBLUC/KMuaPz7XjjOnuR5hK
 VwpvYglVTRFARet1BBNy+q9I1KO/k8dZLixrqmvUMeyIYCEarq3G4uGSKYrCq5CYuvoz
 MqX5bn7F9vh05Uh+4BK0jXDqfK/dqyfdKskFk22LWwzcjm49B49nMSIBcqe9bLlepY5M
 RLBghg4vkHnQ9KILHDZ54cBE3wydnFZ5WG11NYcidexbhAghKrYUf7gK5rWNBVRzD38n
 RRhgRomq/E0givHEouHwx6aoTwak6SpP+yOt9BJ+6iRE78T2vEiRjFCTmtAg0KmbZYBe
 C4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=JV1lSbvbxcntAU71axjdGOp7EiTeIeda5B50ROh6QR8=;
 b=xDwkNMN0Eb5PyV1++VltZI2zH+3abTSZ0uuE7sK42Kut95u5XmENB+x1FewUxY2QIx
 kT3Nv5BAEXD3nA1f4+5FeKurG8A8skeEOS42HP8nq3Tv2Ohq2z/EvFDlIUBCLqq3lo4g
 87aQkCSLG5Zk2qQ617QBF9ejtVPnPLx/GWLOqNWalkTiDv9y/ML5osNJBBQMJwFfVW6u
 DmRgc8lZyJvGL547h6Wz+3l8W4ySFcmjt3QnPnF8l+PayRwXRwzjKI+/aUw0683LZkwh
 paeswnebmSHLaUeboRgPToVPCs9ZfjQ1oEGuPKMjIcQsaCK2ZjHq443Yb0/eI4veO0op
 kSAA==
X-Gm-Message-State: AOAM532uxhmyFvETIplAu+i/0E4symdShHt5Zge1um7oN0OfFmC1fUDy
 zv9yHJuCchLnNwUcW52Qer5O92wkWwi37A==
X-Google-Smtp-Source: ABdhPJwnPHeUH9taGNw4qKe0mRvMx7gd8rrkrznq5ErrtBCcs1jT/SShouR5BkqHdMRYf2H3rxQWwA==
X-Received: by 2002:a17:902:b406:b0:14f:bb35:95ab with SMTP id
 x6-20020a170902b40600b0014fbb3595abmr9150118plr.140.1647796460790; 
 Sun, 20 Mar 2022 10:14:20 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a056a00248300b004f6f729e485sm16748848pfv.127.2022.03.20.10.14.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Mar 2022 10:14:20 -0700 (PDT)
Message-ID: <840fb436-3f3a-a8a9-9ba1-ac2a2fca9a22@linaro.org>
Date: Sun, 20 Mar 2022 10:14:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PULL for-7.1 00/36] Logging cleanup and per-thread logfiles
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/20/22 10:10, Richard Henderson wrote:
> Most of the changes here reduce the amount of locking involved
> in logging, due to repeated qemu_log calls, each of which takes
> and releases the rcu_read_lock.
> 
> This makes more use of qemu_log_lock/unlock around code blocks,
> which both keeps the output together in the face of threads and
> also plays the rcu_read_lock game only once for the block.
> 
> Finally, add a -d tid option to open per-thread logfiles.
> This can be extremely helpful in debugging user-only threads.

Gah.  I didn't mean to write 'PULL' here, just PATCH.


r~

