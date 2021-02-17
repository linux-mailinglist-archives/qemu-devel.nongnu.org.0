Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1868031DEA2
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 18:53:14 +0100 (CET)
Received: from localhost ([::1]:42142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCR0j-0007et-6q
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 12:53:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCQyr-0005dj-Vb
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 12:51:17 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:36142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCQyq-0005il-2Z
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 12:51:17 -0500
Received: by mail-pl1-x631.google.com with SMTP id e9so7809608plh.3
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 09:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KcKQ99M6R6f1Bp4zroAXGiTrSkOSnVIiIFbYZm6gdP0=;
 b=rVgclSjAFguta4QHUkrIz0eSA41mJpeONPjP829NUh3yMSv/voC81p2SFUPM0jd0YY
 wna3Exv+5o/UeS+qcPSxoFLqECxsOO+UFTf+6hkJr9ZrSSMAmMIKDAkdS7vEDGhGqlnQ
 zZdMGOEqyMYQaYg8BPic2zI8ullwQdrD42VdXVD17d5FizAALn0om7hrdvRqP4fGJZlA
 YfSPt9KGU9Z2jP77NYGd2d/arXE5ylEHg9eU2JgoJiwrJk6WMMKS2MDIkI2oc5jSn3Cw
 YB5YmXUu8Xgx/jEVJ1h95FA49d1AkfjBIjM2/OyNG+Kv/KTmpn/rL2DlBjUtObFkMn5Q
 zHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KcKQ99M6R6f1Bp4zroAXGiTrSkOSnVIiIFbYZm6gdP0=;
 b=CRneOZ7c8px779rGQVVStNLnmOlPAuChfFn1RJpuu1HSCCt25iTzlELWJwwRuGnM2n
 vUrs3gStF8JdSLHO+tnVvAmSrONcq+hZt20hNJ/Ks/7mGiNI40a3M6uKxpRxO4Cj98Jr
 SsKUCsGFQ+w39jKWpTOlV+rig5ZVf3/adZWlGkEcFJviIWqSffHHcU/6hqmJnbk5mzyV
 +fM+0dHuo1skI8g854xDOTS/x5xCPQAoHPFHgatc7C27PI3dsgh5DpNF7vQVIsiKu1MS
 rgZIqZjujlZhPRADsFh6gsUZZ3PZBjhEqNYJdhW/jvOo/CnsWpWzn3+e5xpLZGv4RHko
 fYww==
X-Gm-Message-State: AOAM530rhNvcbsvS6rEEWmS9EU15TCzSWiCNK/tp0zyTnQx87ag0uRur
 ehwwQaXCOfYiIcUOcW8p9osnfg==
X-Google-Smtp-Source: ABdhPJzlYC/U2MWFuE+kCVd/UY1bZWQd7kThIXrdrTTh8vonNiyiJcKJTiYxaaKNBu1b02Shr9vdpg==
X-Received: by 2002:a17:90a:8c98:: with SMTP id b24mr6558pjo.70.1613584274434; 
 Wed, 17 Feb 2021 09:51:14 -0800 (PST)
Received: from [192.168.3.43] (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id w9sm3148077pfc.51.2021.02.17.09.51.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Feb 2021 09:51:13 -0800 (PST)
Subject: Re: [PATCH v1 3/6] gitlab-ci.yml: Run check-tcg with TCI
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210217121932.19986-1-alex.bennee@linaro.org>
 <20210217121932.19986-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <235c8acd-67d2-e3df-0ba3-7be628f03e5f@linaro.org>
Date: Wed, 17 Feb 2021 09:51:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210217121932.19986-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 stefanha@redhat.com, pbonzini@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/21 4:19 AM, Alex Bennée wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> It's now possible to also run the non-x86 TCG tests with TCI.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210127055903.40148-1-thuth@redhat.com>
> ---
>  .gitlab-ci.yml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

