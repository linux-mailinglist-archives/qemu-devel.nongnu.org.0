Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B264E468108
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 01:11:40 +0100 (CET)
Received: from localhost ([::1]:36876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtIeQ-00051y-S2
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 19:11:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mtIcb-00045h-EW
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 19:09:46 -0500
Received: from [2607:f8b0:4864:20::42c] (port=36355
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mtIcW-00066Z-W2
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 19:09:45 -0500
Received: by mail-pf1-x42c.google.com with SMTP id n26so4378069pff.3
 for <qemu-devel@nongnu.org>; Fri, 03 Dec 2021 16:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8q3RmQEYHVEcexmS6ORMdDOIiJxmB5Izza1r4Sd71bk=;
 b=TIBRU96sAtroFk9CnHwL3EyEBebCDbuWlEkWSUXKcSXL1y+ywDafTaSAZ3sJSYf+CH
 rjJkdhTTyt3TpjDG+jgwm24KcuKp94pgssT5IqH0g+PChvn5oPzKZIQcAv3W1a3MZfCg
 aLgIcuAexpoafS+M99YkdPymlsI4noHuvKLs/x6as+nGHPNh6OxEOIgPFfU8pnR1hAn4
 /Nva4DhpzeRu2yP566qO2/LwA/04OI6R0vjC31UZJpT4ypDZjKDi7mbXLRFh4jrSxsGR
 L6E8GjlfVyllvrYa/UOj8vlh6k9tI8QGn8x3/bnm1E78OYpthRuRXD+vDpiIAW6pZwlz
 KTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8q3RmQEYHVEcexmS6ORMdDOIiJxmB5Izza1r4Sd71bk=;
 b=x0djMGnkro0DUPK62pUOXsBKmDRqyshR7V9h8ei34NmZdBguDQXmiDD6d8vDRmIxRx
 UqRBBdraV8KtjvpuGMlFtswWUL03x7DmpVeTfolqNrwz5/rTFHpgzudHLu4Z/gv7DVLw
 5iycjszGfaLfJ0TP3k/9zo3DsauuLCWqZ5y0AEQ4qO/sKCMkrWFHZYezPF7AgAxeTgnR
 OH6VvIxBr8f6PGwMRiLCqsv5oKj9c7tEtMOLCR9d8QTpZO2+m6gh52vfquMmM5uq82p9
 HcA6zHhFzoT9FTTfOHt9OtKLWjJc3/URh4A9KpL4sDSE5odkUUyt80+tvpPAZLmiTKmm
 k9HA==
X-Gm-Message-State: AOAM532hVkF006mC4mIwjjh0D6q0V9b8kXrPEFu2prjsB5DdP5LGReFH
 GeKpqqUAOC0QzWAD6k6+t/BQng==
X-Google-Smtp-Source: ABdhPJz/ju/ono3LM/oEQDnK1I9IrkIN+2YtIPKmUy9MF6ZUVBWSER0xwwPsoqDZAyjzgOnEOM8q1Q==
X-Received: by 2002:a63:7c03:: with SMTP id x3mr7060526pgc.394.1638576579534; 
 Fri, 03 Dec 2021 16:09:39 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id q10sm6082130pjd.0.2021.12.03.16.09.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 16:09:39 -0800 (PST)
Subject: Re: QEMU 6.2.0 and rhbz#1999878
From: Richard Henderson <richard.henderson@linaro.org>
To: "Richard W.M. Jones" <rjones@redhat.com>, Eduardo Lima <elima@redhat.com>
References: <CAJzYwARYDA+E4wrszx-F1D_9+VAYB2dU=M-LtvzPJey02gu2qg@mail.gmail.com>
 <20211203193725.GB1127@redhat.com>
 <CAJzYwASbiKGe5n7Ggs3u+6b6-7KEyqLCHxFsv2YMh2xyU4Y1MQ@mail.gmail.com>
 <20211203210325.GG1127@redhat.com>
 <ca5c4fb4-3e9e-03c7-b682-cd29a01e0f13@linaro.org>
Message-ID: <a4421d15-81aa-4128-11f9-726765c814c5@linaro.org>
Date: Fri, 3 Dec 2021 16:09:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <ca5c4fb4-3e9e-03c7-b682-cd29a01e0f13@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.938,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, sw@weilnetz.de,
 Daniel Berrange <berrange@redhat.com>, qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/3/21 2:00 PM, Richard Henderson wrote:
>> Oh I see, it was indeed replaced by Richard Henderson's patch:
>>
>> https://src.fedoraproject.org/rpms/qemu/blob/rawhide/f/0001-tcg-arm-Reduce-vector-alignment-requirement-for-NEON.patch 
>>
>>
>>> At the moment I kept it as part of 6.2.0 build, which I am just about to push
>>> to rawhide. It builds locally, and I am only waiting for the scratch-build to
>>> finish.
>>
>> Yes looks like we need to keep it, and get it upstream too.
> 
> Whoops.  That dropped through the cracks.
> I'll queue that now-ish.

https://patchew.org/QEMU/20210912174925.200132-1-richard.henderson@linaro.org/

Ah right, I was supposed to test your kernel and never got there.
Plus it never got any r-b's.

Rebase was smooth and regression testing went ok on cortex-a57 host.


r~

