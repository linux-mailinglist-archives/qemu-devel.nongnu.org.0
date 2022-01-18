Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 080844922D2
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 10:36:30 +0100 (CET)
Received: from localhost ([::1]:56556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9kui-0006aP-Hl
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 04:36:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9ksL-0004yw-8d
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 04:34:01 -0500
Received: from [2a00:1450:4864:20::32d] (port=41866
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9ksJ-0007Si-IB
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 04:34:00 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so5857119wme.0
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 01:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BE0ZsjkicHiHu6HA+f9briZdHXgmKFiwHfKdbz6P0lA=;
 b=kEEVcQAk9jTDX7UHzgTlrvKi0oxPf4wgILwMXHWWDMGUSJG43RbQ6+i/awVNC8BUcw
 04V5f7hfefJ/RxaLOxXEMej3JluG9co2nJZuGLzKLRA29MU4hp9SkT1LN9EuHpQftBE3
 H9AE51GsLHSKegZVLeG1KK/tV4+F5UhXSLiME1hb/gePnTpDWYFjFnaW0TtnJvs2ToNY
 yNRmNkLbafGxGvOhc9U8Xl37xxyfx2G8zzFSbEpp+pUJJzIDULy0byIfMdOLCAW6UFPY
 hftHVSEFRTSebMNobtaZV0Cwzw0r964AaP6ObIDUh48Cq5vbtEKpHgNM5NVHQ96Yp9qE
 1WaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BE0ZsjkicHiHu6HA+f9briZdHXgmKFiwHfKdbz6P0lA=;
 b=7FjNWftjQc0/23zX02IOpsxICrGzFjrHJdFnZa/9P3Ljv3+36K+tAMTVfp4J3m1kUg
 igOU4p0ZbX1CrVT5y+aqFv1Eb4pyTA8mX6QbLyR5Xi7a7x0NNbbNPQppVCQAmCO434Eh
 4tx1IT1jMhJCEB4bOeo4y3H2SpXIgjvM1I4cIaspnIZ3ii1LKmqFtLjKiv+Hmet7r4CE
 3ijr50gEkuew72VVJl+iZDqul6eBlGJZasU2FJZlwsrywyxQurZ88K4z/fQ/y86WTxm4
 tYHfb01lTW7e9QtBPIyYzOSjqxR8nyXkGl4Tr5M06MheAD5fhhHFOUI0W9WI16OAeF6V
 MNZg==
X-Gm-Message-State: AOAM532Ki1eOnIkcHMB8TymvUELP5exHQkSkyvqEbfvVyIiLXieNl44N
 d7oboaCLNNZoFWt0yXLvBGc=
X-Google-Smtp-Source: ABdhPJzvANRFqArrOYJpTJhpXY1ZLGMf0IYYg372gQ75Fd05Me2aJdHQ3PVe0cGI2MczY/p6wu2/zw==
X-Received: by 2002:a7b:c418:: with SMTP id k24mr20058978wmi.173.1642498437695; 
 Tue, 18 Jan 2022 01:33:57 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id m7sm1725613wmi.13.2022.01.18.01.33.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jan 2022 01:33:57 -0800 (PST)
Message-ID: <735e5238-bb70-506c-2551-4ed74519dacd@amsat.org>
Date: Tue, 18 Jan 2022 10:33:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] memory: Fix incorrect calls of log_global_start/stop
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Hyman Huang <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20211130080028.6474-1-peterx@redhat.com>
In-Reply-To: <20211130080028.6474-1-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 11/30/21 09:00, Peter Xu wrote:
> We should only call the log_global_start/stop when the global dirty track
> bitmask changes from zero<->non-zero.
> 
> No real issue reported for this yet probably because no immediate user to
> enable both dirty rate measurement and migration at the same time.  However
> it'll be good to be prepared for it.
> 
> Fixes: 63b41db4bc ("memory: make global_dirty_tracking a bitmask")
> Cc: Hyman Huang <huangy81@chinatelecom.cn>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: David Hildenbrand <david@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  softmmu/memory.c | 27 ++++++++++++++-------------
>  1 file changed, 14 insertions(+), 13 deletions(-)

Thanks, queued via memory-api (adding Cc: qemu-stable).

