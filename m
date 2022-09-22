Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F086E5E6F58
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 00:07:09 +0200 (CEST)
Received: from localhost ([::1]:57088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obULd-0005mJ-2R
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 18:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obUFp-00006m-EN
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 18:01:09 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:36732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obUFm-0004w7-L3
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 18:01:08 -0400
Received: by mail-pl1-x634.google.com with SMTP id c24so10086119plo.3
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 15:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=t6ufwCleiFcWFqt9j18IS4ZwKdEvfPBoUtao/dhy21E=;
 b=TgFqNBrAJ1BaHh2RcAK+8kSD73QsnYfq3cfPfh24id1LBWtd0eNf8rGa+31r/TGX/5
 ysSoimFbQorejNRAGKkCExucpY3owsGZdbgpBp+gxbLWnu9EWOOp2Y/pSvOWJpmEsBTm
 12ptaXaF1ahcxjBob6KPlAwwwctDoMshRIAEKOJ0uM5/KIz6t2/lp5tNd0NCCkwCAdYS
 mczq6hrUkq3eOY6qsFl4e65jdPJXkXqoyFpNfYIFCUJOwOBkf0mg1xLEwsrCqYDZUy2r
 0trccquUGce5jdCorM/sVRHdHj6bvhx8cfpAEoAlwGY1I37+/7wIrAYGtBxWCPqCrZNi
 8pYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=t6ufwCleiFcWFqt9j18IS4ZwKdEvfPBoUtao/dhy21E=;
 b=X34BHL1yUGGMLnBkz5QGmLYXpNugv5NNps0bEPqxpkrAppqU3o93hwW7TeQRV+Su56
 KlyvgsaGK30GFHZhQcop4B6GDDVEFTqtiFT6tBqZhnt7iLp5Xn2LytkLTJ1Mm82gLmYw
 Ts8jvb8LDzKHaCouYiAd2ZKlonwmeOcRh/hZjuOArzlee97nK5qFv/UiPNdZ0QQS8r6o
 eKGyceyugCGBFsnJ3Jmo9uctjuJE5M7v5pTBsuoUp3W9nBdKoddt9y/RUdu+BeHXfvAG
 b+PJYudCboPHR5F1eXA4rdUMB7ydY2J5OXhZt6f8gYcFOPoa5x4enmPVlehitYB0qPDa
 6zaQ==
X-Gm-Message-State: ACrzQf22mSk7TzR1ATkwJoNW0nw8M4VkTP6xa0FnGBQieTkbfC0dxBF4
 OPa8Tc+F3S33N9wjbqlnpAU=
X-Google-Smtp-Source: AMsMyM4CeMF+FWlKQHR6ahubKPavPSTtOPjY6lPwR0Qf8AfPI7S7r3HKAM3mYLCn5ekrmops6U4IEw==
X-Received: by 2002:a17:90a:e7d1:b0:200:94fd:967a with SMTP id
 kb17-20020a17090ae7d100b0020094fd967amr5818437pjb.57.1663884065168; 
 Thu, 22 Sep 2022 15:01:05 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s18-20020a170902c65200b00172751a2fa4sm4535825pls.80.2022.09.22.15.01.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 15:01:04 -0700 (PDT)
Message-ID: <117a872b-7e54-4e43-7d6d-91317eac5e5a@amsat.org>
Date: Fri, 23 Sep 2022 00:01:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v4 06/22] include/hw: document vhost_dev feature life-cycle
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 Jason Wang <jasowang@redhat.com>
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
 <20220802095010.3330793-7-alex.bennee@linaro.org>
In-Reply-To: <20220802095010.3330793-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.893,
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

On 2/8/22 11:49, Alex Bennée wrote:
> Try and explicitly document the various state of feature bits as
> related to the vhost_dev structure. Importantly the backend_features
> can advertise things like VHOST_USER_F_PROTOCOL_FEATURES which is
> never exposed to the driver and is only present in the vhost-user
> feature negotiation.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Acked-by: Jason Wang <jasowang@redhat.com>
> ---
>   include/hw/virtio/vhost.h | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

