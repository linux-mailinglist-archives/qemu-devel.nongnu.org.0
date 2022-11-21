Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE61632953
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 17:23:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox9Zp-0007ww-Ol; Mon, 21 Nov 2022 11:23:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox9Zn-0007wT-SY
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:23:19 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox9ZI-0000b6-BZ
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:23:19 -0500
Received: by mail-wm1-x329.google.com with SMTP id t4so8827639wmj.5
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 08:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+0/4PY94tTG4r0N/wjGfidzviNOu4tWECM39y2a7f4c=;
 b=nM24U+3v/l92NZ0J5yuH3nA66uMJCXd3rAUXLHSK6bFlHowoyNbYka62ChZRZ6Vsql
 wSQLNjPS0W6QBIdOtGyx8ZNJYU5bt0sIhqLDPYsUwFT1QDFGsW1a25BXkMi/i4fIw7rq
 bQ1rdZh/Yw0CtXz/+iMy08sv+XhZ7km6jitTW0n12tOUfY3+VxLccGB91Ei0UOX2jbik
 zwPIo9OtDNHkATw8v57u78DO7smmk+sXC7AghxZnGZHSbqxesKGzxec7+DTSsqEfYMX5
 Mc7nIJxQg2B39lZkENT01rmPHm5H6ZLOYATr3Ery+C7K7qd668mt901QM2jMYd5tHTuo
 Yarg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+0/4PY94tTG4r0N/wjGfidzviNOu4tWECM39y2a7f4c=;
 b=GmAWaW9Gn0leKBl9BKhSyrE0hPlJIe12qcXERRduhK1F6JDJzS77kycIZC/jm8cxKf
 zhuHnt4G+glrNf+iaTrp0UF75cMeeJfpZbNxnkI3oLUUnglJM4B7+HzcaSetF6eLwR9S
 zDmxXuSJNsNT7W+G3kxoavqv/ANbA0QqlVouE+yfNxYVSHdBDEquhaeyphh0Sq3i5MBu
 v+tQGWHQwKqvlpiDb5MxiP4IBrnUfZY1fuF+o6J2Q0lDCwFVsH2UxpwqolGGWWEdLEmm
 /WE/PtWDkK3VX1O4MI00CI3WSlGn3Hg64r4QR71zkjiw6YrvDkwZT7tkXWzyTO4bmiLe
 ey+Q==
X-Gm-Message-State: ANoB5plch4d4UnMoDDyfA4WMsJxa5JkMTPq2OWTk3kC3lxMqrVJ+0O71
 xK4+W9HKU43gkpU+32xzmP+7yw==
X-Google-Smtp-Source: AA0mqf7GISd1MCU9rOnFonLg4eIUmSBE1DXx/ZwJ8c6muJ8gmEHGdNenALoa9oEYfyvcGDZLuXkUIA==
X-Received: by 2002:a05:600c:688:b0:3cf:a18d:39a4 with SMTP id
 a8-20020a05600c068800b003cfa18d39a4mr12973839wmn.125.1669047766018; 
 Mon, 21 Nov 2022 08:22:46 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k18-20020a05600c1c9200b003b47b80cec3sm20099905wms.42.2022.11.21.08.22.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 08:22:45 -0800 (PST)
Message-ID: <20a6a943-81b9-6956-931d-a0ee9b3e4354@linaro.org>
Date: Mon, 21 Nov 2022 17:22:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 22/29] tcg/i386: Introduce tcg_out_testi
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221118094754.242910-1-richard.henderson@linaro.org>
 <20221118094754.242910-23-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221118094754.242910-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

On 18/11/22 10:47, Richard Henderson wrote:
> Split out a helper for choosing testb vs testl.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/i386/tcg-target.c.inc | 30 ++++++++++++++++++------------
>   1 file changed, 18 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


