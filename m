Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 802403D4D9B
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 15:14:10 +0200 (CEST)
Received: from localhost ([::1]:50452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7dxJ-0007Rb-Ii
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 09:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7dwI-0006Vv-Cq
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 09:13:06 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:52737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7dwG-0003bI-VI
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 09:13:06 -0400
Received: by mail-pj1-x1036.google.com with SMTP id m1so8997222pjv.2
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 06:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ryYY7gozF47AcuHnBKHaSkgqiq2O8RDVh/Vpc60ZRl4=;
 b=SBOEf410BHX8c0w8yz0uHge4n5CYsyT4u64lE/9m8JEeVaux2y0TjaZWNBdjxKNm2n
 flkQTL++AqaitBoc6gm11ioXm20HHdNvBA+6KnihgrkvBv5ctPHhhr4KIZxnBl0ys2cO
 JmDyHU/oYX/NbqhP+ZmPQp16eXu6ZDIAFVmg2cDavRpmnkoTGsuSOduVjZ4XS/tCVSma
 d/Gd5Y/3MviCzJtDHGpC0z/h3QIMknqzznimMPY/Z/72/EDw80LyQ3fapl7vzTkvXATM
 OAnjCW6FjwjZ7v1uB2E8JsoydFLdeVwnazCfXp/GNjaFpDgpIjFS7oHca4d5OT0EJgo5
 I0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ryYY7gozF47AcuHnBKHaSkgqiq2O8RDVh/Vpc60ZRl4=;
 b=CvT44ybS0fawgGizAlZZwtrzN4FghU9yIKEq5q86PwGvVkhmjFsUuy01ahRFdeVcgS
 d1lPgjwKAmJzDMjoi1PptEaGscHWmVrHmWytoUizzydZco+5xFSw1I2F7LfhCDqfmc04
 jZowbrMlBYMM3F+VNrKduY3+nJ8BwHeYtT0WwqVGMQUtjyLDRL834LuEjo0CnxDpMTmV
 RLsEyFCqKrV08Ooj+rrdXlRWSUV3urfpxS/aU1QKmSEDVAXaeYdCTOQY792CnKMZw9ti
 vlzVV5W6/EsWtVFxOKl5l877zOouJf/cisUY1Lr15nipY/smQfdT0ILRDVwcSgt9TzjF
 owEw==
X-Gm-Message-State: AOAM532Bolty8BNE1fcwfkuZMV6tPpoNRyKdPS2NEw1FgUI57pb9inve
 hbwS3vHcKBRFk5AGnzJ18tbO0w==
X-Google-Smtp-Source: ABdhPJweFZI/GdPGIJVCvbkvHF9CumIXOJAZSq0ZUyAwSl91C24e0yTTVcc3cONmLWRgfhuOjBnXQA==
X-Received: by 2002:a17:90a:5a4c:: with SMTP id
 m12mr5407067pji.15.1627218783550; 
 Sun, 25 Jul 2021 06:13:03 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id b2sm44828203pgh.9.2021.07.25.06.13.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 06:13:03 -0700 (PDT)
Subject: Re: [PATCH 06/20] Hexagon HVX (target/hexagon) macros
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1625528074-19440-1-git-send-email-tsimpson@quicinc.com>
 <1625528074-19440-7-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <77d517c6-fb28-0512-7f3f-c96ad2125f43@linaro.org>
Date: Sun, 25 Jul 2021 03:13:00 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1625528074-19440-7-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.091,
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/5/21 1:34 PM, Taylor Simpson wrote:
> +static inline MMVector mmvec_vtmp_data(CPUHexagonState *env)
> +{
> +    VRegMask vsel = env->VRegs_updated_tmp;
> +    MMVector ret;
> +    int idx = clo32(~revbit32(vsel));
> +    if (vsel == 0) {
> +        printf("[UNDEFINED] no .tmp load when implicitly required...");
> +    }

No random debugging printfs please.


r~


