Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E0848DB7B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 17:16:48 +0100 (CET)
Received: from localhost ([::1]:38010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n82mN-0007yf-Az
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 11:16:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n82hJ-0004x3-DI
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 11:11:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n82hG-0006YL-Os
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 11:11:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642090285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2NLT7VBZQdxy6eXIinXfvRQjBdfXPrD3DlKyc/xp4Lo=;
 b=XXN8jaF8m8ZlrbRbAdFeDorshQHNKQuWESu3E2/y7gVCfZI68PjNmrS62RPBPOIPZDJ5Lp
 gRp4wVRrP2n+7f9EaIqKXrmRwzirzRC0RHHOaWh/uPalMLPM98DDpFTXpSWaTkG7M61Wsv
 uOgid49bBOQQ8i2LDu4gYhQnkLPutvE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-Mgvnxd56NrKg-xq5mVxqVA-1; Thu, 13 Jan 2022 11:11:25 -0500
X-MC-Unique: Mgvnxd56NrKg-xq5mVxqVA-1
Received: by mail-wm1-f71.google.com with SMTP id
 z13-20020a05600c0a0d00b003457d6619f8so3857312wmp.1
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 08:11:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2NLT7VBZQdxy6eXIinXfvRQjBdfXPrD3DlKyc/xp4Lo=;
 b=Gf1x/HWa50nmPr7vVOxnU+YT3TL/MgNEhSwDJHAAq0OvC0BNzJ54zzDp1QQ7epmgOa
 YKX5cqBMBx+sluBh0ajZieNyR1CvkviYdARMS60AiVssTdF2NbEbC6Ymzox8OGZMHQG/
 8caBNZwGjdQREeSYruBFddKxvVTZzqGkLuCicGx61Az4VJLAk3F2WvjsFq3f+c/H1TUk
 tm7g0AVZSWzCHfxx79VqG3rQAqkTJ9qlHEs9jVwuRPK/5NiKI8+Q5K8QfvIgScqDVWHg
 xmZEiQGr3WmrjPE0yyI6ltIKl0EGyRXocTuvmGEPDMGq9j9vlkGGBksd0Vu6LhaHOS/u
 prbw==
X-Gm-Message-State: AOAM532mOpQ+4agjWHoIjQPzZGpiHTnbhtrao6q/LKKz1yXd1HtyfYBJ
 OsFKbVMyDkpAqybtLU7eNjwhcdhOlA8AvrVuBs1rQVIKtWsQVqT7GAC7UJ8VqWrN8aulkP8mBdQ
 UwgjXCX/zuuNimMM=
X-Received: by 2002:a05:6000:18a6:: with SMTP id
 b6mr4439298wri.675.1642090282676; 
 Thu, 13 Jan 2022 08:11:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwplzQZ0Lg0EGsP67MUZFrtMGUmAL1z2Ulr8kUhUB0qnX/h3U+BMa209URYiF9MKMkDdckWIA==
X-Received: by 2002:a05:6000:18a6:: with SMTP id
 b6mr4439282wri.675.1642090282486; 
 Thu, 13 Jan 2022 08:11:22 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id bg12sm3768936wmb.5.2022.01.13.08.11.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 08:11:22 -0800 (PST)
Message-ID: <1faee052-7a31-0506-48ed-874a90b71ea8@redhat.com>
Date: Thu, 13 Jan 2022 17:11:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 00/19] iotests: support zstd
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211223160144.1097696-1-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211223160144.1097696-1-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.12.21 17:01, Vladimir Sementsov-Ogievskiy wrote:
> These series makes tests pass with
>
>     IMGOPTS='compression_type=zstd'
>
> Also, python iotests start to support IMGOPTS (they didn't before).
>
> v5: Move patches with unsupported_imgopts to the start of the series
> 02: add Hanna's r-b
> 03: - don't modify migrate-during-backup test
>      - disably any 'compat' instead of just 'compat=0.10'

Thanks!

Applied to my block branch: https://gitlab.com/hreitz/qemu/-/commits/block


