Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 165D432E502
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 10:39:06 +0100 (CET)
Received: from localhost ([::1]:57608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI6vJ-0004jT-57
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 04:39:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lI6ss-0003ZC-Oz
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:36:34 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:56095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lI6sr-0002z2-AJ
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:36:34 -0500
Received: by mail-wm1-x32c.google.com with SMTP id w7so821863wmb.5
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 01:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Fzhw22W0xdH8EK5w11gXh2c9oLOFXDJrN/m86ZmWeHM=;
 b=ZPDmKASWmmhuLrPwKkhGJWrHIwAVMu9P4Nc+DEdGJLxq9ANqqlwLdxTN+KZm2ui3ru
 w/gVZg9arPV5gz1EbeBIimkFv12NLSlxHS1lqZJg/mCWjI1rlXlDTWDSjhjzqYzTA0UU
 ghYP/MI/mBFbGZUGe5LfqKNtqEXWjFR+jmDjojDp4HCYjBUCiW9hlAtQICMIhimA9qtO
 LMf/uCXpnIl9vGlA2r4/mDrQml6HNVaT4UunqudWEvY2QulHGqmkcRGWkflEPk7BDQCa
 FU40x+Bbe4yzbcFbDmINmwlpOR7r6AwwvVuaBylb2Ips1p2bTN2evu+xuydxVhKf5jGw
 IcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fzhw22W0xdH8EK5w11gXh2c9oLOFXDJrN/m86ZmWeHM=;
 b=ivnX3Y0jMD9gdBNrK5aIkIykRMWduQIVbcPlz/LGcDFM5KZqXiwITkTZZfQEhDQH7V
 yM8uHLQ3ITGHTJqGXNIdnUjfG7qhbsWKGatVEL3XtyZprCgZ5nRvZ0bymryaNWDUCDRl
 8nH3kcB7IOqdjFSq4O50ayOab5f+NrRExbKCryAh/oolvosQjM4wwPEdAmZYd2+MU/M7
 /GuLQxP4T+buEwFORYDTK2+6o85T5k0ySLagYFDG4ckdjMQBxKql5QWWHToFXwikiaOX
 dFwNiyKKE1oy2kw2t8quo3cbcEaoxFuP1Jkt/eyWvTeyzGhs40+ZQH/ZGBDEZvJ82ujs
 AnUA==
X-Gm-Message-State: AOAM532JS+yig3ppqr/MLiGouVxzKdC1JZVNfxa3vx+Yt2ROS3wf14q9
 mOYW9pMEm3LS+XzeuFlkVGrJ+3JuaB8=
X-Google-Smtp-Source: ABdhPJz/SUSecj4EZlKWDmipm8mgfTy1dHdZm1jAiSnb888PvArEaRzXVXYoHJMnzLOGjFw6shZcRQ==
X-Received: by 2002:a1c:bc8a:: with SMTP id m132mr7688964wmf.6.1614936991569; 
 Fri, 05 Mar 2021 01:36:31 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z188sm3902484wme.32.2021.03.05.01.36.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 01:36:31 -0800 (PST)
Subject: Re: [PATCH v2] linux-user: add missing MULTICAST_IF get/setsockopt
 option
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, laurent@vivier.eu
References: <20210305040542.9879-1-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <75d8ed44-1e5e-64d8-21e4-c785987453ec@amsat.org>
Date: Fri, 5 Mar 2021 10:36:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210305040542.9879-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/5/21 5:05 AM, Jiaxun Yang wrote:
> {IP,IPV6}_MULTICAST_IF was not supported.
> 

FWIW in v1 you had "Reported-by: Yunqiang Su <syq@debian.org>"

> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  linux-user/syscall.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 389ec09764..77343130b3 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -2219,6 +2219,7 @@ static abi_long do_setsockopt(int sockfd, int level, int optname,
>  #ifdef IP_FREEBIND
>          case IP_FREEBIND:
>  #endif
> +        case IP_MULTICAST_IF:
>          case IP_MULTICAST_TTL:
>          case IP_MULTICAST_LOOP:
>              val = 0;
> @@ -2265,6 +2266,7 @@ static abi_long do_setsockopt(int sockfd, int level, int optname,
>          case IPV6_V6ONLY:
>          case IPV6_RECVPKTINFO:
>          case IPV6_UNICAST_HOPS:
> +        case IPV6_MULTICAST_IF:
>          case IPV6_MULTICAST_HOPS:
>          case IPV6_MULTICAST_LOOP:
>          case IPV6_RECVERR:
> @@ -2891,6 +2893,7 @@ get_timeout:
>  #ifdef IP_FREEBIND
>          case IP_FREEBIND:
>  #endif
> +        case IP_MULTICAST_IF:
>          case IP_MULTICAST_TTL:
>          case IP_MULTICAST_LOOP:
>              if (get_user_u32(len, optlen))
> @@ -2926,6 +2929,7 @@ get_timeout:
>          case IPV6_V6ONLY:
>          case IPV6_RECVPKTINFO:
>          case IPV6_UNICAST_HOPS:
> +        case IPV6_MULTICAST_IF:
>          case IPV6_MULTICAST_HOPS:
>          case IPV6_MULTICAST_LOOP:
>          case IPV6_RECVERR:
> 


