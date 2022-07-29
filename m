Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2A8585439
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 19:09:17 +0200 (CEST)
Received: from localhost ([::1]:47940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHTUC-000435-1k
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 13:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHTRS-0002My-Gf
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 13:06:27 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:33432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHTRO-00005l-BH
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 13:06:26 -0400
Received: by mail-pl1-x62f.google.com with SMTP id w10so5176517plq.0
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 10:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NbaY1A1u38WRc4p99n4U3RkhdkyQklxQ26MA0/dqPKM=;
 b=ruqYXGq4gFPJIoQ7Ev0pejx/ZcESi/c2H2GEoYfLOwO71B5IOxk/y5wuRip45iT+3J
 CELUO9xL6CJV+Uv3EVq+iQMLs4BZHnYnwAJsjP2cnb4HXp21wxua3eIYhtrcHyOhouyW
 5KUxEZynwJ9gjtKw0d9J59ES/uOIoKUD9QqrDUt+FuRjforYKcbGz2JYWGheWdt6eeHz
 dA2XTIPkGFUfmHKUBxuNGnabol73ZX2KVmLmQsBK7hVnlG0cF6ni+lePR3XhlK/plqy+
 2dHBpx2TOWjshRgZYXpZve4jI9S5Nm8QqyifTcgV1fkQBM/1uj2Jv7xRhKRlQinAJGlR
 xjCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NbaY1A1u38WRc4p99n4U3RkhdkyQklxQ26MA0/dqPKM=;
 b=c0sJOKiKKrKLvkl0Aux4JOPP16o1Y8VwqlAGUULuZDbVdkeXxly5gQ+EfZ9Z7ZYCr5
 ozMdrhmroKR5kf4VV9fxXv9Y3HwARXERYQeavF2kochVVnMwLghAQx4Y/8iToqVoIEc8
 yJM3fs3qT8Pt3ifJgbp7flUaY8h8pa0b4uPzs9lnzKpvFVpJsERe32zYXgvH0eDY7Bxo
 K4vu54EFTaO04KegM1XbJ+f92md87dVnoKhQtMNk6iK2rqkx05lIyy03VAFknp7Nglra
 +B+zAFZtQho0NJ3CAmaQ8dysQi4l3NaiP2MjT3wSttusHBjY8+g/JadKxK8fhE60WHMZ
 NEdA==
X-Gm-Message-State: ACgBeo1tKJq3wFpIi5ICJGwdSci585+l7z9G4/K9jov5l5KjUXy/AcWs
 tBb03x9PF/7UOj6xzPocy5gckg==
X-Google-Smtp-Source: AA6agR7FLcAk4dZj10Vh3ICoT07XYuBeE15DNzMfBhg2wuSXnX4S6ZTsDdY3bDbW5RQ9vU/0meMPUA==
X-Received: by 2002:a17:902:f649:b0:16d:22fd:5c14 with SMTP id
 m9-20020a170902f64900b0016d22fd5c14mr4875716plg.98.1659114380244; 
 Fri, 29 Jul 2022 10:06:20 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:51c4:5cf0:5954:aeb6?
 ([2602:ae:1549:801:51c4:5cf0:5954:aeb6])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a170902780a00b0016d1c771031sm3749888pll.242.2022.07.29.10.06.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 10:06:19 -0700 (PDT)
Message-ID: <1085e8df-c0c0-69f9-7257-762182c5e580@linaro.org>
Date: Fri, 29 Jul 2022 10:06:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] Hexagon (target/hexagon) make VyV operands use a
 unique temp
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: f4bug@amsat.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 mlambert@quicinc.com
References: <20220718230320.24444-1-tsimpson@quicinc.com>
 <20220718230320.24444-2-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220718230320.24444-2-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/18/22 16:03, Taylor Simpson wrote:
> VyV operand is only used in the vshuff and vdeal instructions.  These
> instructions write to both VyV and VxV operands.  In the case where
> both operands are the same register, we need a separate location for
> VyV.  We use the existing vtmp field in CPUHexagonState.
> 
> Test case added in tests/tcg/hexagon/hvx_misc.c
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


