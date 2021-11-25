Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F1445D4CD
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 07:29:17 +0100 (CET)
Received: from localhost ([::1]:44176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq8Fw-0001Xm-99
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 01:29:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rob@landley.net>) id 1mq8DX-0007uW-2Y
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 01:26:47 -0500
Received: from [2607:f8b0:4864:20::332] (port=37744
 helo=mail-ot1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rob@landley.net>) id 1mq8DV-0007oA-2V
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 01:26:46 -0500
Received: by mail-ot1-x332.google.com with SMTP id
 h19-20020a9d3e53000000b0056547b797b2so8007054otg.4
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 22:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/ZqZmF+q1iwRbg9wNdhq1jqh+3PguSzbZtWn7yBzt60=;
 b=VXJK1TU4jtMYNycpca5aWKzvU2ukuz5F3VcffWGQ35/7f5+0a5nkSfmje3P5MmNNEh
 Nk1NVVjwGiXgvwlILu4bS1RdSTlwvfUCho51xcj5F7NATF1zXfminVNZVln4nVrlDs7P
 MUMjgTdSUmhvorKebKb5NeZO3Yic2TdikmqGtQ30C/jKg1mbAd41pTbJgEIdLLxeLc+/
 q9dcj67TjFjA7DVwJLcBAK226K07md0+lMmDnKmsJLNTfRu7zGptcMHukdZ4yqcvvcOz
 LthwSHLoLRB7GZCwDqpzfGgzlbVWO83k4/tModrYJzr9eQ5qCwWYJDxZWxmiC9EkxvWz
 QfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/ZqZmF+q1iwRbg9wNdhq1jqh+3PguSzbZtWn7yBzt60=;
 b=uyj3yfsMkAZXG/ua5HSXUTd6vDt6ff73kBnVw7HYIdIk6R0DmJNOu7emsVi3c1yTyl
 bXqgY6CK3l++q9A5gxFjeKy1ZxmaKwYRUcW4243jAOunIYtqAulrn6cOPMoG4z459jXA
 Bab9knLSy4ozhi++Fpm/BIuP/e7slZ5V8fUrcegR+xpM+M3rpd+cCYmM8giLYc7Gsrmx
 FZfAGfzGkkjtNbtGHSjCabBss7kYZzZrS8XuM4sGlvhLoozLXW2gFcjJgyX89RZCCpFk
 yymqFLaDSdU0kk9aO2Xt8Yk+bGKSjSze8KDNqE9YmTCvDdxOxqvPI0efrDGEUEqd/pSE
 jdGA==
X-Gm-Message-State: AOAM530yQ4ryKMgKQNoU3ZQVWOHPpHQ/u4wOQjA93jPsrh2Egfc5guNo
 PH0qK6N2a+2VeD3VEQsFjXnPqQ==
X-Google-Smtp-Source: ABdhPJwxe15CfBYTPAm6MvjSJ3XBxtkRHNRT2cSEX8f+3r5Z3D0Uy6nf6uzlcL/4gtVAALCKD2n8Vg==
X-Received: by 2002:a05:6830:1008:: with SMTP id
 a8mr19252926otp.373.1637821603040; 
 Wed, 24 Nov 2021 22:26:43 -0800 (PST)
Received: from [192.168.86.163] ([136.62.4.88])
 by smtp.gmail.com with ESMTPSA id n6sm392870otj.78.2021.11.24.22.26.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 22:26:42 -0800 (PST)
Subject: Re: [PATCH 01/20] Hexagon HVX (target/hexagon) README
To: Taylor Simpson <tsimpson@quicinc.com>, Sid Manning <sidneym@quicinc.com>, 
 Brian Cain <bcain@quicinc.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>
References: <1625528074-19440-1-git-send-email-tsimpson@quicinc.com>
 <1625528074-19440-2-git-send-email-tsimpson@quicinc.com>
 <1b632e88-43d4-3034-cf7b-d42be056d842@landley.net>
 <SN6PR02MB42054B50C60ABA378256492DB8159@SN6PR02MB4205.namprd02.prod.outlook.com>
 <553c32e8-188c-5b2c-2f4a-a8cfd7b903a9@landley.net>
 <BN7PR02MB4194007550E66EBE877625A6B8E19@BN7PR02MB4194.namprd02.prod.outlook.com>
 <BYAPR02MB55091DE5B976956075B46FADBEE19@BYAPR02MB5509.namprd02.prod.outlook.com>
 <8845de00-ddc7-86a3-600f-6ede81e168c2@landley.net>
 <8192e9bb-a0de-1b2a-271c-ac7323be8244@landley.net>
 <BYAPR02MB48863186EDD71439C60792A0DEE89@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Rob Landley <rob@landley.net>
Message-ID: <ee0ee7c5-22e5-2c79-695d-e66ae39bb5fb@landley.net>
Date: Thu, 25 Nov 2021 00:26:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB48863186EDD71439C60792A0DEE89@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::332
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::332;
 envelope-from=rob@landley.net; helo=mail-ot1-x332.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-4.1, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: "ale@rev.ng" <ale@rev.ng>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/26/21 8:59 AM, Taylor Simpson wrote:
> We're working on system mode support for Hexagon, and we plan to upstream it when it is ready.
> 
> Thanks,
> Taylor

Any progress on this? (Is there a way for outsiders to track the status?)

Thanks,

Rob

