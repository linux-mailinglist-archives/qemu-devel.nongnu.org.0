Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99584602513
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 09:10:21 +0200 (CEST)
Received: from localhost ([::1]:58472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okgjz-0003In-Rg
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 03:10:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okgGX-0001dL-2Y
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:39:56 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okgGV-0002VI-DO
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:39:52 -0400
Received: by mail-wr1-x431.google.com with SMTP id j7so21873497wrr.3
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 23:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DV3o+hBLuXZIaibkL7H7Pg88bO0GdazaWANMT3SB/Eo=;
 b=a6M6voaIlTf8itWns5ElITSg3Z4ll5nXDNqVgnx7YKcXUIovk4oBU2KYK/2DfNOv29
 iyoXEnVJDKnNhHnVZRHQzFbZCsI1giKYVFB7QKxAVIljV1aZEn62raG5Xjc7VimE63Zt
 vPjJmIx6UIe7zVCjoRc/WmQpEwpqdhbF62AD7nhNWG87hGBbIgvFj/m8xJE/AxzKR4T/
 Of7aHOJ/KXg+4IZKyoTLpOvS84FUzs8mqzHXQDqgOWLbdibiNgeJn1iDT3QuFB/uAs2C
 naMz+9dZzn3q1bvRcawr1yEBP3Kry6cwdeJbdu7Tr+j+qhiX67PPgRq3rzaz2uM0T+w3
 iPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DV3o+hBLuXZIaibkL7H7Pg88bO0GdazaWANMT3SB/Eo=;
 b=eX7gZXDhRswP+pPYFPjnOhHr0uf9aZj60TxD6+03u3POTfTp/O09j6udVscCywwcpM
 emA3GVy7+76glnDa9YE8wXip/EoHjf9GqAXIJf+5O9fLeFrMJDynZohJuHE+vcgesYk1
 3ZFLdyH5EXOQdCfzVzh3VKeNZuVymFRDw/2gGsBbRcTZQ4twAnApSfyB/6us6reIdc0c
 0/HoFPBvd0eZB62T8XvyCBZ+SQLrPrkLB/ZKyvR4wlfEq2/r9nszRw2k90YEZ20m1jri
 eseDKnJOqA+4sFlS7gZe3yDj5J5I0CZ6fe3GBjobKGRMz/g9BW/ApbLNsjQ2a86hl6HZ
 qJCw==
X-Gm-Message-State: ACrzQf2x/Yq6+bHROkQWeMnIprVq1vueqvRoFtu65+/pSY9K3kdwM7Tw
 FDZ0JxQwOEANRqaNAwKTqgUIPg==
X-Google-Smtp-Source: AMsMyM4R1DofU3Vf0+hTv/6OrD8M0qtastvuAiD5EAIyBvfWRrvENjE19bi/2m+ZF505LGa3Xs77pA==
X-Received: by 2002:a5d:5050:0:b0:22c:dbba:9ab1 with SMTP id
 h16-20020a5d5050000000b0022cdbba9ab1mr796434wrt.341.1666075189832; 
 Mon, 17 Oct 2022 23:39:49 -0700 (PDT)
Received: from [192.168.130.175] (151.red-88-29-167.dynamicip.rima-tde.net.
 [88.29.167.151]) by smtp.gmail.com with ESMTPSA id
 u10-20020a5d468a000000b0021badf3cb26sm12208749wrq.63.2022.10.17.23.39.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 23:39:49 -0700 (PDT)
Message-ID: <42c7abae-7177-8267-7428-3ba0ef7c4b1b@linaro.org>
Date: Tue, 18 Oct 2022 08:39:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v5 7/9] tests/x86: replace snprint() by g_strdup_printf()
 in drive_del-test
Content-Language: en-US
To: Michael Labiuk <michael.labiuk@virtuozzo.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, den@virtuozzo.com
References: <20220929223547.1429580-1-michael.labiuk@virtuozzo.com>
 <20220929223547.1429580-8-michael.labiuk@virtuozzo.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20220929223547.1429580-8-michael.labiuk@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 30/9/22 00:35, Michael Labiuk via wrote:
> Using g_autofree char* and  g_strdup_printf(...) instead of ugly
> snprintf on stack array.
> 
> Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
> ---
>   tests/qtest/drive_del-test.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


