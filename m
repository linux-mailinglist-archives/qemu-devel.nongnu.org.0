Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BE34A4BB0
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 17:19:43 +0100 (CET)
Received: from localhost ([::1]:46156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEZP3-0001vC-TI
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 11:19:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nEZ4f-0003UK-BK; Mon, 31 Jan 2022 10:58:40 -0500
Received: from [2a00:1450:4864:20::435] (port=34588
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nEZ4d-00048O-OZ; Mon, 31 Jan 2022 10:58:36 -0500
Received: by mail-wr1-x435.google.com with SMTP id f17so26353636wrx.1;
 Mon, 31 Jan 2022 07:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aeVM3OKGdh1yBMpgJYGt9f1C+fFFBFjn1JraQFkCh7M=;
 b=LCtcIjeFRtH1zPYVshUWxVj0BEIhKbt/HN8VTeNglj1G3u73RlDm1p9i3Y0f5Dgjek
 pmC95sVP4UU3RlbvNSzZ45EDQAkVaMJLS96jZAWBs3d3RvZPpKKkD1Xo/HGjTZNbpNRi
 HIQq3sFTiAKPgSeeayGUlcztS5S7ytFrjoNJllNqXsUkzB6R6swohw2u9K0sov2zcizy
 B1UWeKeHZsCXxKqWYW19b3lCoachU4JhokLSRACVu2Jz/jGhKMExFlwGE7JiHZ7RJfuU
 D16iA7EXMItZAIvk/Z0TOWVSVrCcijtndxmVCvXRUxgavjZP/ighhGMr4RIqprHtxPWU
 hbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aeVM3OKGdh1yBMpgJYGt9f1C+fFFBFjn1JraQFkCh7M=;
 b=gakmRy7T2RS+Jy9fszBEJIG6veEq6pllQIPSlOiWi2HiZmX/wX+/SMnIyjMQaJl7Cp
 YDbBkcdkGPsDeMA4avKcLGJtoTl0Jj/P1T7zGyM/YUMEJVwQ7cPRYUtE3H9lBJ3TqxcA
 BW9oXyD9EGPSVmEEdjbbhUZOahc+uM1mHM22UefbkX55VXlFeRK2cCcqlFotD4bCH5ss
 cjhuh2H6qHYMMIXsDxYdQ42fgEsSqWQ3ZGEN9amIKFc878mrnT3DRkIiEmyLezmtZ9aH
 ultzSNAxt5Ap/EItVbH4OBwYT17qYMd0ZDGqlMP2CIqf3Wt1HFZ8lHb6Y/4lqh0HFf4b
 IL0w==
X-Gm-Message-State: AOAM533TbDNSUqhyNFFXSK4tsCtt+h7FAXyhOnmHXRNbc6k33LfGPKNV
 Qq2fz4runsP8R7o8jBvRDhc=
X-Google-Smtp-Source: ABdhPJzkw1lumS2Ji3SA9l8tbWc4H1uz9DsD1U43rmoLFPXH+uwrcqIlSbOiAEyROjF9xPdLCD53KQ==
X-Received: by 2002:adf:c448:: with SMTP id a8mr18488656wrg.697.1643644713810; 
 Mon, 31 Jan 2022 07:58:33 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id r2sm17119493wrz.99.2022.01.31.07.58.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 07:58:33 -0800 (PST)
Message-ID: <1653fd9d-e1e9-5f32-3bd1-62abecd09601@redhat.com>
Date: Mon, 31 Jan 2022 16:58:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 02/33] include/block/block: split header into I/O and
 global state API
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-3-eesposit@redhat.com> <YfJ7pbLDuwP2hgnw@redhat.com>
 <ac8b0576-4c03-4eb6-9ef6-c0a6b20b6184@redhat.com>
 <Yff4Dl6bpHhTxAfB@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Yff4Dl6bpHhTxAfB@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/31/22 15:54, Kevin Wolf wrote:
> So I guess the decision depends on what you're going to use the
> categories in the future. I get the feeling that we have one more
> category than this series introduces:
> 
> * Global State (must run from the main thread/hold the BQL)
> * I/O (can be called in any thread under the AioContext lock, doesn't
>    modify global state, drain waits for it to complete)
> * Common (doesn't even touch global state)
> * iothread dependent (can run without the BQL, but only in one specific
>    iothread while holding its AioContext lock; this would cover at least
>    AIO_WAIT_WHILE() and all of its indirect callers)

Yes, I agree.

bdrv_drained_begin and friends are somewhat like a coroutine-level 
lock/unlock primitive, so they need to be available in both the main 
thread and the iothread.  They could be called iothread dependent, 
AioContext dependent, or perhaps "global or I/O".

That said, even if they are a different category, I think it makes sense 
to leave them in the same header file as I/O functions, because I/O 
functions are locked out between drained_begin and drained_end.

Paolo

