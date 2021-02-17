Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C15531DDD3
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 18:02:55 +0100 (CET)
Received: from localhost ([::1]:32882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCQE2-0001JD-1N
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 12:02:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCQAF-0007i4-Uy
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 11:58:59 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:35569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCQAD-0005yK-Kg
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 11:58:59 -0500
Received: by mail-pl1-x62a.google.com with SMTP id g20so7731838plo.2
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 08:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QxwmLtM2LWnyErJ2tUrRV0dIrIRn+bBG11isUZszGm8=;
 b=vCaqxCxYDcYs0ZrdShlpUPrATRhz5fqZHRi86Ue4SoacmcJp8Te8bScU/h2sNMK2XM
 9ISpX0Qnu3XALYYGmkT8FkUMWeqCEa/kEM9m+hvbq61MriIod8cIf146olh3dLS7OUwg
 OppTucbrjZUvWqJwFU1q48GfJvFTHliwd8QrJ5tHr2u7F27CLi1CzsJmGA73H6Gs9WmT
 1Ta/mAg9uhMYaH4TPddsTA37xmpj0itqRe7XMIiQK802kJAIQi+UrPNbx6qMAP6f3B0W
 OiAtN5a7U5Xy0FK4iejJA4ptBFQasR2MYj5QhUQlLjAocGJeb6phrBJpHsYJIRdjQ+bq
 2gsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QxwmLtM2LWnyErJ2tUrRV0dIrIRn+bBG11isUZszGm8=;
 b=qQrHzlP3Pd1yX+NMcPPKm49tVS0AKj4UQ3ftplf1RiSePKpIDkQSFGDmscSwhOl9uq
 QaUEYrllwboTS9x7ZjuYSp1sVLXd1PdnxJQirFZXrEJudll8trummZfpKkgF5o9fdKJn
 0v+Tie1lCEaApxNo7XJ5mzT4wZiwnylouQDHd410LGV4CbTm7z1tiSKJVbPG2j4L0PjE
 I6JCUcMT+NVgsn0uUK4qUhaakZr+0vpcHms+SHB4etUTwWGRz0fd/P/mIc2Odi+RLY8E
 d/QpDRxrx2Ox0W9Nf3O8sUayOjwsptQmlcOnXkjlx39yGYPEoxq+XGrnUiilb1yq6GI6
 uTzA==
X-Gm-Message-State: AOAM531HHH6drJ6xGlhTxIJEA96NT9O6bagF/pXNC8cYQmcIA1Ecpb7J
 UOLK+piKZW8LdfzSjFwlWd95eA==
X-Google-Smtp-Source: ABdhPJxKe95SdqBgZ+QyetOZY+Mt0GsQd31bYu8KzGYTB4oxyj/lkODfu4fEffGxbqssQuY7fQ2CtQ==
X-Received: by 2002:a17:90a:1503:: with SMTP id
 l3mr9936043pja.41.1613581135985; 
 Wed, 17 Feb 2021 08:58:55 -0800 (PST)
Received: from [192.168.3.43] (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id a136sm2978639pfa.66.2021.02.17.08.58.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Feb 2021 08:58:55 -0800 (PST)
Subject: Re: [PATCH v8 00/35] Hexagon patch series
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <27b85311-3161-eebd-8e00-95ac87f7376d@linaro.org>
 <BYAPR02MB48861D2450B42859C77DC86DDE879@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2b37f15c-eeba-9cf9-6a5e-6e15a5bf485b@linaro.org>
Date: Wed, 17 Feb 2021 08:58:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB48861D2450B42859C77DC86DDE879@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: "ale@rev.ng" <ale@rev.ng>, Peter Maydell <peter.maydell@linaro.org>,
 Brian Cain <bcain@quicinc.com>, "philmd@redhat.com" <philmd@redhat.com>,
 "laurent@vivier.eu" <laurent@vivier.eu>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 12:59 PM, Taylor Simpson wrote:
>>> This series assumes int128_or() is implemented.
>>> https://lists.nongnu.org/archive/html/qemu-devel/2020-10/msg06004.html
>>>
> 
> What's the status of this patch?  Could you go ahead and merge it ahead of the rest of the series that it's in?

The fp patch set that created this patch has been rewritten and no longer uses
it.  I'll queue this to the branch that will include this pull.


r~

