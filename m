Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6376A482061
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 22:12:57 +0100 (CET)
Received: from localhost ([::1]:51592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n32jI-0002wg-3K
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 16:12:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n32iK-00021r-EL
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 16:11:56 -0500
Received: from [2607:f8b0:4864:20::1031] (port=39463
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n32iI-0004sW-Pf
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 16:11:56 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 z9-20020a17090a7b8900b001b13558eadaso28965071pjc.4
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 13:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BQ5IkQyH9xddVjcUP8ZikZ/0ClI5qbgwegVhZhBuX+E=;
 b=VMWJe6nNP3v4vGMccUfO1kWoxH4GxJ/PGDyJlEQU/db+3UfxMK2yv6E4U4DmeRTTDl
 XeWHwDPiwFnh9leNQ4BpiekA7aVMsL1zQay9haqkC2ILieEfwriCRp91kYwXYlLLAm4u
 U38ijeTXKco8K8ktE7yeKfY4atF1/r9kD/cc6R77VZUjs2W+w6pEo903Rk0ISKej5EEa
 0mGj2B4kiwH0jmod2LVo/WjVaXyQl7pEG/7D/wGMDTmn5VotNXD6+2Q7FP9JvTsCEVs9
 E+xruxes8glndXvj4uICXTA43c+u9cUPMK5043Ir0AQsgGkGGFfvWQvsd/pD+upgE4Z6
 7f7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BQ5IkQyH9xddVjcUP8ZikZ/0ClI5qbgwegVhZhBuX+E=;
 b=D0xjRvmaY74gf7aWtJ2VcTFkJtr5qNnDNnONqpwCJbxu3WdaEuSVEw6s/mkR9o5qCj
 WeuGalpsLC+uMjbNt58va3U29NMhpzJjCuTjty4EukzCZLQAFROpJ1Qk056daeP05xwI
 NnDQYQ0MOhduUVHCZ5Xwc5I/6oOwpGe+VrbOSG6LNthqbVyUvb+mkctBXpN4FFjIsnT5
 eMeJI1LhY4iIjOZCBNm4bzabtVpRcXiMnm6WtZWVtMRTMS8AXvVZqrRGGFINuXd0Br66
 4Thppfzzk79Cps0FNZyez7jsenryTRN9jqI/M7Mr8hlUu/eMyPoJExakpCEA0no6fjaO
 1oqw==
X-Gm-Message-State: AOAM530JcEjSFytGUuqF7uDgVQyDs+uVr7J0r6sIn/rRvgRK9aZa8IpN
 YnIbb6fKNUkID1x/+LAMLo74yQ==
X-Google-Smtp-Source: ABdhPJyJmS1Br8HDpp2Yl36vw2EbzrlrUEPRT/MI9qeDjkrafX9ZBVCxY/2pXhhtvobcwjTMtyviOg==
X-Received: by 2002:a17:902:6b83:b0:149:7cb1:9582 with SMTP id
 p3-20020a1709026b8300b001497cb19582mr21389180plk.29.1640898713020; 
 Thu, 30 Dec 2021 13:11:53 -0800 (PST)
Received: from ?IPv6:2601:1c0:6101:be80:23dc:65c4:ecfd:93ff?
 ([2601:1c0:6101:be80:23dc:65c4:ecfd:93ff])
 by smtp.gmail.com with ESMTPSA id t143sm10091523pfc.205.2021.12.30.13.11.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 13:11:52 -0800 (PST)
Subject: Re: [PATCH] MAINTAINERS: Change philmd's email address
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211230145822.441358-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <25755045-b1e2-428d-44e2-7658b81a882a@linaro.org>
Date: Thu, 30 Dec 2021 13:11:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211230145822.441358-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Kashyap Chamarthy <kchamart@redhat.com>, David Hildenbrand <david@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/30/21 6:58 AM, Philippe Mathieu-Daudé wrote:
> Thephilmd@redhat.com  email address will stop working on
> 2022-01-01, change it to my personal email address.
> 
> Update .mailmap in case anyone wants to send me an email
> because of some past commit I authored.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   .gitlab-ci.d/edk2/Dockerfile |  2 +-
>   .mailmap                     |  1 +
>   MAINTAINERS                  | 18 +++++++++---------
>   3 files changed, 11 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

