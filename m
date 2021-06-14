Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B0B3A5C6D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 07:25:18 +0200 (CEST)
Received: from localhost ([::1]:59982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsf64-0007Nt-Lz
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 01:25:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsf5H-0006iF-QH
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 01:24:27 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:54047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsf5G-0002Fm-83
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 01:24:27 -0400
Received: by mail-wm1-x336.google.com with SMTP id b205so6627284wmb.3
 for <qemu-devel@nongnu.org>; Sun, 13 Jun 2021 22:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AwuXQx5O8d/j/0+uK1yHft/S6T6w2M0OAX3OgAqXAmA=;
 b=q6qBegwAoHVaOaytGvkYSJJJdNvagV7Hfc4jgkIa50ZZrU7p+rk+l8lKecGvfL7CbD
 RkmhrOpejA97cSxDOSptkXK7BbrQ32mMQXEnrrb2bBowVX+Vs2AwkCFB80aYpi46IjoR
 qcxmQu2rwpvpdmOvur3KFu05WAmjOKtUkJHYEMME/ji8mGa+ZxrKEldLdHYi0CplBEaU
 qAH6JkKxrbkPgBOatrQvhLD7nKlZ12rCM06IPFD35hCzPbJGMHv+kM0OLeBgpIYxetF+
 k5jeWCHUC31m01YYmDYj4pHHngFvVaucIJg4gaMOUCn6OmnJeKl1U2mUOR1HJbI1cV2g
 h2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AwuXQx5O8d/j/0+uK1yHft/S6T6w2M0OAX3OgAqXAmA=;
 b=GEDVQNnQvYhetQfoBD+2/6ws5MzVYp9D0duugHSjPImqUl2Ji+3joxjNVqgrUEYBu2
 Vca61/k8Yev1udWLgY1l/gAEeDBbKLkCeUv8GllPMKNPWOCGW9g8sILsceate86eiV86
 D5ihmrwwSTphxxu9GGoICpaMjHTYNfC2bmzRwUyzUiZWxTd/DCjFgpTdAUrDM3gu+C7s
 PAPVJ0egnobdDbLcXZHngl/ESzIZ4VgbSwTzmXDlKN1jmjjPfzE2gkwWHghuBmcR0Il8
 cfsir5Yc8IyH+0odKEDlvR1EpymrUZhZc2oU8MCBcdNY3tqze3deVv/JXh4/REWA7S0s
 PUgg==
X-Gm-Message-State: AOAM530CbmJBU2KihzgG6A3lKIH38WMm0AH1UhoLkvW0Ilpe34Z4JEwX
 +RKokUB2Z6BZHNVg/M3z5Bc=
X-Google-Smtp-Source: ABdhPJx+jYbY8KPg9vaYayLC4eGGSI6bY6Qnidui3/qsuF19gWSHLVbs3tqhkzCVPeEEARXdeTEu9w==
X-Received: by 2002:a1c:cc17:: with SMTP id h23mr14191732wmb.129.1623648264428; 
 Sun, 13 Jun 2021 22:24:24 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id e27sm16176709wra.50.2021.06.13.22.24.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Jun 2021 22:24:23 -0700 (PDT)
Subject: Re: [PULL v2 00/34] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210614012031.1081133-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6036d0bc-49d5-37ad-7bb2-9cfc329eb279@amsat.org>
Date: Mon, 14 Jun 2021 07:24:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614012031.1081133-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.144,
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 3:20 AM, Richard Henderson wrote:
> V2 fixes an error in patch 22 wrt MacOS.
> It's a shame we don't have public CI for that.

We do:

https://cirrus-ci.com/github/qemu/qemu

Maybe it is not documented well enough?

Apparently we could integrate it to gitlab pipeline:
https://potyarkin.ml/posts/2020/cirrus-ci-integration-for-gitlab-projects/

> 
> 
> r~

