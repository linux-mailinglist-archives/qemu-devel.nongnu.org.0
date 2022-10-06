Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EC05F6B0B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 17:53:05 +0200 (CEST)
Received: from localhost ([::1]:59266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogTBI-0001rM-7S
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 11:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ogSaS-0008H7-Ds; Thu, 06 Oct 2022 11:15:00 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:46809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ogSaQ-0004x6-U9; Thu, 06 Oct 2022 11:15:00 -0400
Received: by mail-pg1-x535.google.com with SMTP id 78so2097574pgb.13;
 Thu, 06 Oct 2022 08:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=oUV2Q1/Rl8HAoNmyuAUrheeBg+yzKyMfp64lUYPUuxQ=;
 b=EIlBHl+WVrHYnLtstd5kJgeGRk8WQ4QFeKok/4szPfajdsme4TdhuJ8l5vDJU5QOE4
 ptC8xNA453HTcfSgWGNXzBf93SvhVft3sOnAAJDYjXZ9M1dy5Q+Q/Xh0IpTLG+EP7PTk
 fMMlM87kgO58DcBrprs/HAEMzyOQH9+iglLpjGX4WeAJa1SlU7HEPnOscQFYd+XnS7cl
 jFsjW3yxGFaRlS3C/7szJyOPLjdvrD5DXsqbWJ3+/EzEJ4GRiq/3oNYnfRWM6u0LHUXK
 O7AyD5pl1rwTBUkvjbbqiVZiFl/KVjqjReiZqCUadTiSkKUbX5Ldb66xpOyWMk7AuPSW
 7QGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oUV2Q1/Rl8HAoNmyuAUrheeBg+yzKyMfp64lUYPUuxQ=;
 b=06dBQ35Z4ePUldrnJ7ec4mblD73r4QQ4jHLei4KdmmktQklRR0DMioM3HAHEpTyLxt
 47FbBmF0ZMBtPOTczhCjdcwGUg63BIiZOsQtK8P2kyIpvCHfyrbWyXRygip2qFbSUQxH
 4MqO/9eo3JUbQZiuYhXqVZeShyMsUJDxk623f1vW1uvUzUZfkRwyHocrzpVvEOmaPUM6
 8O5HKR2InWjcMX2kuFpyztZa8Vf8uYjpH9wX5Lh+V5xL15P6/b3Hn8L7sMeTe1q/dN0V
 WN+Ofcq2i6f53xN9Ehdyh15euXRXyiH6lRc//MhaZK6ahAuOnxgfWPlB+syoUxds/42f
 hB0w==
X-Gm-Message-State: ACrzQf2PFnTw2N+0X12ffU3/3r/HwiRuFX1/DZHb5a1xotogj+iK9AtF
 uFecxENSIZ3VLtXwmyoyO+ci2cDL45Q=
X-Google-Smtp-Source: AMsMyM4XBjdPhi+lDweY7y/6QmJWKjPpiFg/QwJ8SnNEC/acp52kRPv8P/AXvJdmMEu9ym9X6lkEUw==
X-Received: by 2002:a63:6a03:0:b0:43a:18ce:7473 with SMTP id
 f3-20020a636a03000000b0043a18ce7473mr338810pgc.616.1665069296249; 
 Thu, 06 Oct 2022 08:14:56 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a17090a1c9000b0020abcecbf86sm2956619pjt.17.2022.10.06.08.14.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 08:14:55 -0700 (PDT)
Message-ID: <21db8af1-efad-4ae8-1087-f7846eb50882@amsat.org>
Date: Thu, 6 Oct 2022 17:14:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH] quorum: Remove unnecessary forward declaration
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20221006122607.162769-1-kwolf@redhat.com>
In-Reply-To: <20221006122607.162769-1-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.435,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 6/10/22 14:26, Kevin Wolf wrote:
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   block/quorum.c | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


