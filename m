Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0915E6F54
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 00:06:18 +0200 (CEST)
Received: from localhost ([::1]:53192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obUKn-0004NQ-Hr
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 18:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obUG7-00007w-19
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 18:01:28 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:38517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obUG5-0004yt-4e
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 18:01:26 -0400
Received: by mail-pg1-x52a.google.com with SMTP id t70so10511793pgc.5
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 15:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=l5VOaWWUNGMv62e1WgKJCe8TRyq0SeIetDDIyhprLdY=;
 b=HMbVNPkEHWvpt//BVv3KVPAOg2b/canQQ0H+kCPZql/H3rWY+PfKGu7g83PUJKvJhp
 puoVRnnKZUlaML8VjNdjg44YBOKEaF/GB+x74AC04ioqoFyD5zT8xqQi+bppVk87UBwQ
 /66xiRQ2TCxSXvTJbRH2R2hD3vNElLYo7xnQH/0oTXZwC8HbzMHSd9teX3cdz5p7WSH2
 ioAdzfWew0QVtRYsmTvtxtKWHNXVaceSYdb2V1NKea/5hpfOW5R0b1YhTBL+W65ORIBT
 8usa6o09/JwD9sk2oY+g4IYoWJP4GAstAdaveAdgPWsgWy0VIZ/PMy6qiWC5MVr39AWY
 a+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=l5VOaWWUNGMv62e1WgKJCe8TRyq0SeIetDDIyhprLdY=;
 b=KP4z0VQGZx+P2yROj0n4V0YnnmvulkvJsbXh0CuWBR0Lm4s6QhEjnYMKjpHtnscsWc
 T/7ZAE+obfeypua3lUPCzBsamkg7wv4s+tXvvAm9CUk5Sa6BgCfH18HldWmsLiX9bbt/
 szbwxvES+p+zkRXgVwWg5n9k/PcND+SmvIEehbCVt7V//T1y0a9kVY9EYymhtf/6OzhH
 nhJ4nX0YwtQ9EcqRHQ3pRCUfGseNb/ZfiYd4yT0GesLlt23w4QmcnAyRFSHVWZSY7Des
 0NLeDEpu6y28LmostowM4v2kQ77kWrpWkTbG1cjXnRls0wQ+XA8kuAnKvN+uQwnWcEaG
 XctQ==
X-Gm-Message-State: ACrzQf2a6IOPF7kjl4aN/xpedG4iTND+jFWmK7GHauBCynCWktEMa+hb
 PrgOjvOMOx7zIpVQSe0DQWmCOE++muU=
X-Google-Smtp-Source: AMsMyM6P6hcrrabsLl50ibdr95DCTOaXmfZCMel2j2Ww9rt5Flz3uevOs7Tk+N7yg+ho3HzlzcgTSA==
X-Received: by 2002:a05:6a00:150c:b0:545:cdc2:94e5 with SMTP id
 q12-20020a056a00150c00b00545cdc294e5mr5763512pfu.37.1663884083478; 
 Thu, 22 Sep 2022 15:01:23 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i193-20020a6287ca000000b0053ea0e5556esm4944867pfe.186.2022.09.22.15.01.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 15:01:23 -0700 (PDT)
Message-ID: <59bb387b-91cb-8006-1efd-6a6869afa2c5@amsat.org>
Date: Fri, 23 Sep 2022 00:01:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v4 07/22] hw/virtio: fix some coding style issues
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 Jason Wang <jasowang@redhat.com>
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
 <20220802095010.3330793-8-alex.bennee@linaro.org>
In-Reply-To: <20220802095010.3330793-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52a.google.com
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
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Acked-by: Jason Wang <jasowang@redhat.com>
> ---
>   hw/virtio/vhost-user.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

