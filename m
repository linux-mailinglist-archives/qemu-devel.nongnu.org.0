Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9DA397D3A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 01:52:15 +0200 (CEST)
Received: from localhost ([::1]:44928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loEBC-0007YV-4m
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 19:52:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loEAJ-0006t8-H8
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 19:51:19 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:41973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loEAI-00015C-31
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 19:51:19 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 b15-20020a17090a550fb029015dad75163dso682148pji.0
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 16:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bTp3HYeoTEOCu0QICE7Ie4zKxeheLWPBiOV7LKJEgK4=;
 b=NR/aOBOCaHF29NNy4tPnaUPORYqZbmhvW22n++pZ3lM4o1QM44bfCNGacEde3Zqiru
 bYEKgwNCrEYa/M8a6n0gZKmbhTzLjb1VqThiFL9IBZUdVuPxABTGjfMQug8SU/AKfa10
 2yQQEw2nD78iJM90nyjE+IXokoxgGa9/4VGMQsPrZJB4QWIhnzvXgPCJW9SM1gNXgnt3
 XsEBjeF25juFEw/1LoA+vmG7FlrZFh+LR4JnJKMbYaXNiO9VfmgbYMVwuIu9lxbhagZp
 rHfe2ZsGLapVfhorGLiRZiweMLQxJIEcXKhy9iVK9Cde3XSnn8YxLrbwfRbTQA1+l2DJ
 FJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bTp3HYeoTEOCu0QICE7Ie4zKxeheLWPBiOV7LKJEgK4=;
 b=Zn3PbOktBsHb5W3Lj2X2Rr/UM85DgYwccUgNJG8KBPjONHRVUOaM7M0QAWmc+GPFdZ
 cGuUKWJh4yhJJcLFwP9jb62P/iudfNDWqUcYaKwA2wNjtKP7ZgYTsPsCNeilWvh8JFD0
 g+63SGr0y2c86a2OqFWsrULGoikEcoHqwTUIZmq1LZryxW/nivhlnO20zDO1VsWeVABL
 zZF/PaU8yffOzmiLkQCir6UVJEU6LU+SFBHtn/Wq7DqE/Hdm9z7lQIziEi/kUiTo8wrj
 KnietrwEmwdzOVwsqm1OUjJ4MP3MIqiuSl9MMhUBzAmDDHts4P659+YESUdHEQbpsCFt
 JbXQ==
X-Gm-Message-State: AOAM5314y/+y34ilMWGkojhN78UvO9Re+mm96uSUK+fG6jKLSnLFYUe/
 0n1uTrbBIsYEd84JcKhfkwvnew==
X-Google-Smtp-Source: ABdhPJyKs2sfZXl/LGen5TixyaeUSLpVj3wI4Cq8bCvyRdTAOKfiv+bKtiDs8ffKifdgrvZaJ0vXOA==
X-Received: by 2002:a17:90a:5990:: with SMTP id
 l16mr2455947pji.175.1622591476619; 
 Tue, 01 Jun 2021 16:51:16 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 15sm14463445pfy.15.2021.06.01.16.51.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 16:51:16 -0700 (PDT)
Subject: Re: [PATCH v2 4/4] Hexagon (target/hexagon) remove unused TCG
 variables
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1622589584-22571-1-git-send-email-tsimpson@quicinc.com>
 <1622589584-22571-5-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <51e266ec-16c0-7e3a-e296-e87f19c9bc26@linaro.org>
Date: Tue, 1 Jun 2021 16:51:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1622589584-22571-5-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.613,
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/21 4:19 PM, Taylor Simpson wrote:
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/genptr.c    |  6 ------
>   target/hexagon/translate.c | 11 ++---------
>   2 files changed, 2 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

