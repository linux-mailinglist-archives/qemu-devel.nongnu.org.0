Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDF85E6F62
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 00:08:18 +0200 (CEST)
Received: from localhost ([::1]:50218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obUMj-0006xp-Qv
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 18:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obUHt-0001tW-Ar
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 18:03:17 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:39487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obUHr-00057g-Gx
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 18:03:16 -0400
Received: by mail-pf1-x42c.google.com with SMTP id u132so10601477pfc.6
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 15:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=DU8gFheSsrpKkiNsxy3PT0LAYy5/7+rfwgC1hrQ4cU8=;
 b=KMtw2kGclpcp0dorlECQVOWvW9hD/VCIc5mmQTCb089V0W3SG38TMYCWrVTTjcXjB5
 AOqxG0xT3QMt8QOny0qdMb3si+9alLPt/939lH5OX99U4Ctq8h1tDDCBlgsXR6PKhTOH
 GWqgrizjXpbrZfXCplsfph0ditzozAiyZ+yXSowo5e+TOyzS0ort69RmhdZKTVEVdjSl
 uIBK9CHUFWBUglW0MFLz87q766s5MXDGznrc3Trwd77oyGmDAG6egKl7H/FUjNMrB3oh
 5mUcYMgk2OCAec2sUfQEnixXKYyBjw2K+qrz+pT3l90+u90awXv0KmMKzzdrCZ/Wum7E
 KVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=DU8gFheSsrpKkiNsxy3PT0LAYy5/7+rfwgC1hrQ4cU8=;
 b=qSBTmQpOaLtXINvkZo+wc2na3vr4C8i9ldmIS1pbPBIPmYfcToBfAoCrw8b6GFJA2n
 g9EKRT8duxW7oHIgHlYcaHQsQtd1NwxIeWySr2fNCSS7YDwZuVI9iK/56nS+teb6r5TY
 2t3B1UfQ3RJjVOgypKXrIcO/79yPXgMmn7wERTLx2Gdc0+XG5bfZhxtE/c64hOI7Ukcd
 iFHK2k82gVH07qlXmbVyT9ub+6XLSOj3u5hxWUMHub+1hYLlYbIcplQbfdkHiKv+9T1A
 jIYp2S/iIyxTQ5uAd5ws1eerxmk/l+PLJvsLGWO2O0UMcmEX4lP2SbJIa6BEcuhUMpyx
 yUMg==
X-Gm-Message-State: ACrzQf01dINBk76oOlCOMtU43OgH1rKEWk4YxAXf6kNPCdsaQFbJ20XA
 B/LBaA1yUy7FXy6Ke+REbDf5kaircF0=
X-Google-Smtp-Source: AMsMyM5e2/QF4S3+H2TpTnPYKchl0l4iXpewzTWF52boDa5wiQOh3a9aiBOEeRCLqd84K+f3QJTNWw==
X-Received: by 2002:a63:e906:0:b0:41b:eba0:8b6d with SMTP id
 i6-20020a63e906000000b0041beba08b6dmr4708497pgh.501.1663884194332; 
 Thu, 22 Sep 2022 15:03:14 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a170902a38800b00174ce512262sm4515122pla.182.2022.09.22.15.03.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 15:03:13 -0700 (PDT)
Message-ID: <872dc56e-b0f9-ef72-ecd7-dbe1da0a7948@amsat.org>
Date: Fri, 23 Sep 2022 00:03:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v4 15/22] tests/qtest: add a timeout for
 subprocess_run_one_test
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
 <20220802095010.3330793-16-alex.bennee@linaro.org>
In-Reply-To: <20220802095010.3330793-16-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42c.google.com
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

On 2/8/22 11:50, Alex Bennée wrote:
> Hangs have been observed in the tests and currently we don't timeout
> if a subprocess hangs. Rectify that.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> ---
> v3
>    - expand timeout to 180 at Thomas' suggestion
> v4
>    - fix merge conflict with earlier patch
> ---
>   tests/qtest/qos-test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

