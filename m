Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 453266735BB
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 11:38:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pISJW-0002ds-Q8; Thu, 19 Jan 2023 05:38:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pISJU-0002b5-NV
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:38:32 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pISJT-0003kB-6v
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:38:32 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso908676wms.3
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 02:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F0HBHX3hyypBYhXigsY26PuMsCMCNOc5/9wqYOiHA6U=;
 b=aKfzLKP6yG1wCb3Rplcc8IDAO4pGWAuVupnuLFpcvd8FsZU7LQAq/SN8lqV+hzeGdz
 jvflIebRkF19xdnANkb1iQCYpOwpvnLMRluY3y/un2niEhaPCveWnR6z2XPzc7C7zuRk
 Cat4b9KNtWmLjKkm/Egq9Kva7Zrt1P7VbziZBTejW1QotuchrqswQtlfmPZtOvyscZCq
 FjZ5Q7HS34hQ3Vn6oxEHOdz3+0bMgWgg5HgEE0p6ILsN8rcQLzw4/sF4EPctUw0CF9+I
 B6scmW/LvSCib8C9RPSw2XUzOORZ2tb3Ym7yMqNsuG3fiSarpTRqqRZQdi1tC5RTSER2
 AOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F0HBHX3hyypBYhXigsY26PuMsCMCNOc5/9wqYOiHA6U=;
 b=1W8zD8Y/upHZWMoIa79suH3kQt02SV4wMtXUR7GXbjXbhf0Yd+WLEYAmkYRlEf4pVP
 l1952y78lTNtOJOPqL92HTTzmjh0dTCdahtUA6IOl9DDURtzvimck7Az3hA6ASv6shsh
 jXU53Qc9b6YBURGM9+0tVdaAGU2LasTfto7jy0BJcuV8OdP32MUit4dXosaIlnafz0hL
 Z5/po0ItqeiYRTLhg37XOaaOkqsKfBhKZKtuf6jqzcgaqVcY/59dr3zUhpJ2ZniQQKGP
 ZAVX/HvbYEyjMXehHHBigdU4NfAGMZw1zusT7p4muI7GoQ7CSzPbZFylyTDf/dL+6tbY
 doFA==
X-Gm-Message-State: AFqh2kq2oXNeCu04uXy8md24R00dF/jk31P3HEf1X1NVhqJ7wfv4XTyH
 4M55XmQxnXfJWkPkf/fg4PWQFw==
X-Google-Smtp-Source: AMrXdXsbNu4mnwt4U5TAktxnZtxJyvxbWtLiJWFIN/PwAZGOxodDgDxgDKVSZgC6MOF/Ociek5mdOQ==
X-Received: by 2002:a05:600c:1d22:b0:3da:f66c:795d with SMTP id
 l34-20020a05600c1d2200b003daf66c795dmr10106071wms.9.1674124709291; 
 Thu, 19 Jan 2023 02:38:29 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 w1-20020a1cf601000000b003daf681d05dsm4483347wmc.26.2023.01.19.02.38.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 02:38:28 -0800 (PST)
Message-ID: <802eb2a3-e7bf-ca38-daf2-75275980e865@linaro.org>
Date: Thu, 19 Jan 2023 11:38:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 13/19] riscv: Clean up includes
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com,
 peter.maydell@linaro.org, alistair@alistair23.me, jasowang@redhat.com,
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de,
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com,
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-14-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230119065959.3104012-14-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 19/1/23 07:59, Markus Armbruster wrote:
> Clean up includes so that osdep.h is included first and headers
> which it implies are not included manually.
> 
> This commit was created with scripts/clean-includes.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   target/riscv/pmu.h | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


