Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5796F6AB749
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 08:53:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ5dt-00076l-Jo; Mon, 06 Mar 2023 02:52:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZ5dn-000760-Ur
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 02:52:16 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZ5dm-00047z-GW
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 02:52:15 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so7520525wms.2
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 23:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678089133;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y4ee8hSyJZqmawNxd57kXc6bsgIl7bGlycye1FvtCOE=;
 b=h9z/zjKll2LcA3pgp19xZjea/bbL/V0N7c+eI0c0EqIhZsF8wt7uM0ZbyScwlcx0uq
 bHtVbDd9qnJMlU3FsL7qNuIeh6ZEBj7pQjGiB6VzYdDLmSPzJTLj/M53Ml0oFBfN75en
 4OAQWyg6OPUsnHBYsxqVoSsM3+mJzgLr1Ar6fo+ryvSwMNsJK2mp2qd2f/a9LeNY+q+8
 soGen5dCe6XVvRWPGZNDd+J8Gdi4NdbW8LKLS3P0+mTQpcFkrGUVFvIrpqFGM0qmITpd
 mer3paX0clhh74gDiis5Wwt+kD7XbSugBmHVjPoJPKIuK7aq8QyzPc5RKNSkCi30+pKC
 X7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678089133;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y4ee8hSyJZqmawNxd57kXc6bsgIl7bGlycye1FvtCOE=;
 b=o7h2mxH8sUQyr0Ljz0Hi4WpSeeJU3l9zIjPvIJ22pzjIXev7DPT+IDCuU76KcIuxKg
 yQdG4GMg/bXERkfZuAhgmNlBP7cMUHfqjdBPGFq7JMvMaMV+l+RdyejowLs7jiRepBhk
 wUhj3PkEtQhqVJtiL9/KL3pv6kxugfd9aEEso6mcquMYrB0q5dtWTZ/Ute+EjJgPYr6n
 RKry32PmfvgwamwiNnMrA6OP6JltfoMRK1W5Th+Y8Et44KdFrqN10V9Kue4V91n0AaMy
 ccLAwOiRHcIY++huormH5FlVZRJalS5Wles8qrbvazxsQGCgHrT14xtFHt81A1S2KlKf
 iVJA==
X-Gm-Message-State: AO0yUKW7NMibj8+Z8sJXEH1YUY7asK2WBsbXBodgas7DBVS1hJN2CDtd
 ZKT/lHxkBX9MO2TIAzXXhbH0Nw==
X-Google-Smtp-Source: AK7set/sx2kwfkIpDZ5VPsoKVc5zwGp12N3qewlThCXf/n0P4l2iVPGgJ2zKm4DWzFkhZIRgWj4yzA==
X-Received: by 2002:a05:600c:1c12:b0:3eb:389d:156c with SMTP id
 j18-20020a05600c1c1200b003eb389d156cmr8355727wms.37.1678089132859; 
 Sun, 05 Mar 2023 23:52:12 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g40-20020a05600c4ca800b003eb3933ef10sm9191236wmp.46.2023.03.05.23.52.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Mar 2023 23:52:12 -0800 (PST)
Message-ID: <a74fccd7-da32-4968-ef16-0581b07bb070@linaro.org>
Date: Mon, 6 Mar 2023 08:52:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 6/9] accel/tcg: Pass last not end to PAGE_FOR_EACH_TB
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230306021307.1879483-1-richard.henderson@linaro.org>
 <20230306021307.1879483-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230306021307.1879483-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 6/3/23 03:13, Richard Henderson wrote:
> Pass the address of the last byte to be changed, rather than
> the first address past the last byte.  This avoids overflow
> when the last page of the address space is involved.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/tb-maint.c | 28 ++++++++++++++++------------
>   1 file changed, 16 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


