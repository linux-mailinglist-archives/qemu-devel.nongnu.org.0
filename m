Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14ABF538CEE
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 10:33:37 +0200 (CEST)
Received: from localhost ([::1]:35860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvxJo-0004pv-7B
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 04:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvxGt-0003PG-EK; Tue, 31 May 2022 04:30:35 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:46865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvxGr-0007Yt-PV; Tue, 31 May 2022 04:30:35 -0400
Received: by mail-pl1-x62d.google.com with SMTP id w3so12207449plp.13;
 Tue, 31 May 2022 01:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=l6xnw937WQg5kBk8yFhTSGjV6a+LbCM1ZVLSisiAETk=;
 b=WMl404ElrFyX+/hBhA28VVyFPYb/141SpRFeLgKW8K951QA98xFiA5l9Ikpal5QyiV
 yurMPKD70Xa3b+kf8khzaxh28xiBRTXqHqnzc62AagsZIc6QwawxwJBLyv9IbstKjFCE
 66xAVzutre5Vih6qvlCP83PQ9Kf5U9tHa3oy3aiCBcbo3knPcSiOSqi5gj28SLsKov8c
 KlEjRoJUNFQlKpphaCJAIZb9RFiC6neFIY+N8fPtg0Z2wrXm/95ha8HDCi7GOwL1NUKd
 NnMcd6ht7qiGTHUqx2D4CEGr4/XFhoNvdl8yPzZxR1HGxAnh0OvBDMjK/WLi9p4ho+vD
 eD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=l6xnw937WQg5kBk8yFhTSGjV6a+LbCM1ZVLSisiAETk=;
 b=QSQO5+VS6aM5v38reWHoycVWTK357OBTYb4y4Rngc1El6w56ocqhQd9VEJF45bOJwi
 CSHZcdFdD04bwm9Y/zZww5T0bS1ko3fHamcWwQ8eQBUm6rMDmGbawPxfmtju8ehUDCCV
 6zAFuAsDPDLsCPwL6eH8M8w/5s99ZPjc7C1eSnCLrfsrDjT/j1gqoir/2/WYRDXllTOU
 gNnyuTRWymi2poWVXpMPyRkbAvj6VygzZjDDoD6TZSl9fXSvl38iEy4sKnqLHqpZywkg
 viqBwZJ0hYHzIKMF5k7n37KtNK/HkB4pDJ164V4/OuVgb9QPOR9ctQJ/NXPNO0Ch7HG+
 2r9g==
X-Gm-Message-State: AOAM530hGKE7azyjUDKWtTTmziUimPBrs27Yr0Ezg37E3u5zkL+zhvKI
 tL2ZEnvA4ub//HKTgpDGaWaDbVrDRKs=
X-Google-Smtp-Source: ABdhPJzLf2o3FwZORKr0RS/DeHm0CtyCM0DS5LKkvlheSPlDL3gjFDvoWsQdK6b/39BDsd2SffU1yA==
X-Received: by 2002:a17:903:22d0:b0:164:ec0:178c with SMTP id
 y16-20020a17090322d000b001640ec0178cmr819643plg.127.1653985831987; 
 Tue, 31 May 2022 01:30:31 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l22-20020a17090a071600b001e2f578560csm1225841pjl.45.2022.05.31.01.30.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 01:30:31 -0700 (PDT)
Message-ID: <3d9a2205-9d0c-4371-6693-4e2a95c0a7eb@amsat.org>
Date: Tue, 31 May 2022 10:30:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: -blockdev vs -snapshot bug
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>
References: <c457ed64-9457-9ebf-2935-bda2ae93ada5@msgid.tls.msk.ru>
Cc: Qemu-block <qemu-block@nongnu.org>
In-Reply-To: <c457ed64-9457-9ebf-2935-bda2ae93ada5@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

Cc'ing qemu-block@

On 13/5/22 20:54, Michael Tokarev wrote:
> Hi!
> 
> Now here's something.. interesting.
> 
> I tested -blockdev here with a real image.  This way:
> 
> qemu-system-x86_64 ... -snapshot \
>   -blockdev qcow2,node-name=q,file.driver=file,file.filename=w.qcow2 \
>   -device ide-hd,drive=q
> 
> I always use -snapshot when testing something, not to damage the image.
> 
> And to my great surprise, the above command *did* damage my image.
> 
> It looks like -snapshot is entirely ignored by -blockdev.
> 
> This is quite a serious issue, to me anyway, - it is seriously
> unexpected.
> 
> If it is intentional, I think an error should be thrown back
> because the expectation is definitely different.
> 
> Or am I doing it wrong?
> 
> Thanks,
> 
> /mjt
> 


