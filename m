Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 736F14DB18D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 14:34:30 +0100 (CET)
Received: from localhost ([::1]:41270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUTnF-00045S-4P
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 09:34:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUTWF-0000qp-DR; Wed, 16 Mar 2022 09:16:51 -0400
Received: from [2a00:1450:4864:20::42f] (port=34490
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUTWD-0002t1-TW; Wed, 16 Mar 2022 09:16:51 -0400
Received: by mail-wr1-x42f.google.com with SMTP id j26so2964705wrb.1;
 Wed, 16 Mar 2022 06:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/oz4YPojUbaauFD3MxwS6xI+gOJTLPe7ATR21/UjuJo=;
 b=YR8PgiKSx1FlSuHSPHlGqAhnkWC4YFSQuLggtXAek7HogP3sABZZzS22UUg8yc7dgD
 zfDdCKKXtt6TJpLKtRx7uPYZfsGQaQHxyRj/o8YDIipbu8tC4ipUOiw+VwuIzMaRcg7I
 eSVYPvToGB6w2t3LtE411pva8a9B4dVEz6AY+q8GurA/YLWnHeuN2CzTc+f0CVn4//C8
 WP/2BteohbKvdwFGpL5AXy9UZrl/QyPt6aCkjNobnkZpjLjCLamijGAo945NTuF8wLni
 DabdJd7dFd9gv8PJNRHOm/FXcCw2lyCb6gQoKESH3hVak2QkDJW8+GeeauRyBgJ81bXx
 YnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/oz4YPojUbaauFD3MxwS6xI+gOJTLPe7ATR21/UjuJo=;
 b=k9CBGGdANqHXBN1D15a+oz99SBn/Jmb7R4TG/LS8KQUNC0kh3mU6Wrd2f82z+nj4/N
 Z42DCQu7NESoBDB1V5lyxmVTQZf+jatOTTUQ6jCulBf4sn8Zwc2BxUlINElx2Vq3BUdL
 Qjl43MVwPUzqldkXqirmmDB1gO9KWasghXaYJXdht45eQMeMV3Y3XsIi/UPCwMxS0kOS
 mZNyolgrTnbyn41/NDhNyHBldSb5P3NyjYpgos5atN1Hbl8THHqsJjLMOrz5hwKo34H9
 h0m3PhNCK81lTzkHHApHP3IhPl3nnV2k9VJAkviurlOnETzh2aeSzIhVPbF/+mf88HUA
 zUQQ==
X-Gm-Message-State: AOAM5329VsNLgWZIKzAuvrjyfQbPzIxHUTzy+MUYneYb9rTPm97YZE9f
 sDAsYVB7XSbaDDtWx7Mx6/M=
X-Google-Smtp-Source: ABdhPJzAl4maxh/+EfFC07Ht/ONkbn70w88p956GGdBhpDRpTAg9+At/FrpDuyJfpVerJ9eIpPcVUw==
X-Received: by 2002:a5d:4c87:0:b0:1e3:319d:519e with SMTP id
 z7-20020a5d4c87000000b001e3319d519emr16486286wrs.548.1647436608234; 
 Wed, 16 Mar 2022 06:16:48 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a5d6daf000000b00203db33b2e4sm1784373wrs.26.2022.03.16.06.16.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 06:16:47 -0700 (PDT)
Message-ID: <6ad8e176-d3bb-79b3-2928-a377e1bc0727@gmail.com>
Date: Wed, 16 Mar 2022 14:16:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 24/27] Remove trailing ; after G_DEFINE_AUTO macro
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220316095448.2613859-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220316095448.2613859-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/3/22 10:54, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The macro doesn't need it.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   configure    | 2 +-
>   nbd/server.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

