Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 771A869DB01
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 08:14:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUMq8-0002H1-4T; Tue, 21 Feb 2023 02:13:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUMpw-0002ET-BY
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:13:17 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUMpt-000317-UU
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:13:15 -0500
Received: by mail-wr1-x432.google.com with SMTP id o4so3297040wrs.4
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 23:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=46RysuGN8xU320Q38c2My5s4wYieJAYf0mHZ2vGaWoY=;
 b=G3UwzlprcV7SkMQKW8VfGjuNtHV4robfB9QS4c8hqR0aDddbbGq1DPbi4uuI2FWq10
 66han9XAF6FYhEnxU1sRceHvRztTHoFOp0nZBJ6vEl9SvE234N5M8Q13GChLDs1aV2Hq
 eDtsq2045mCb61sCKv0xx/G44SWEvPrc/ZSymDGGWcO+grpRHCaYGnGhs/MRN+k0+cbJ
 9x8XVniwEpyV2cUZF45pNOnwzYzxc2iyDVYi+UYUspNsfytpiBsWNM87MXp+dn1oT+LC
 uMNWi1QZdgzVP6+/3swyxdfrZBj73NyoHt4BGWAlG/G6n9XbJ30eMFmVGU9pbeelDz1f
 PFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=46RysuGN8xU320Q38c2My5s4wYieJAYf0mHZ2vGaWoY=;
 b=YsJmi6DbT24REBphB0TKjcipmFYGvxb+33ZjdHxM5f9wzmjmEsgY8A753MrEjbqHPH
 AC4fExml5evfvDwLW4LqwcWkYQeVAaYZ5dgTW0nf0zUPmd+Nb2fBHMUuBTR+BqkooDni
 T4r1UJgIZIwCANovJ8yr3+ef7GUT5kn7Cl/lLaGKj08Q1+PPUdzdvJKw7t2mTXTAII9y
 wXZe2zqPK2yCYUTNIKfLpx6ZZnu+d2cSnKsQfIZT84Dv86ZFVd4V9vm8KnBO3vcqjmwC
 dwdvQU3yYE/f0ML+Sm84YL1jujFL7hsT30clJilUEE8H/Onbm2y1oWVKT2n2cfvgpMKB
 2zBg==
X-Gm-Message-State: AO0yUKXHKj/3TbcdxPa6lyI4ui6n8+xQzvDlRkf8/Myopl5dAO33FTe0
 xO7MSC7nPM06/Z00IyIqDG/rFA==
X-Google-Smtp-Source: AK7set+XGxJ/P5eCZ3eYmZYzECaiVFJyzUS4djwOnEuaGxDxM4mgzpppipEJ7VlrE7YSeYAnutyWnQ==
X-Received: by 2002:a05:6000:1815:b0:2c5:5e33:b293 with SMTP id
 m21-20020a056000181500b002c55e33b293mr3692861wrh.43.1676963592232; 
 Mon, 20 Feb 2023 23:13:12 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g4-20020a056000118400b002c5544b3a69sm681564wrx.89.2023.02.20.23.13.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 23:13:11 -0800 (PST)
Message-ID: <b39e9b80-8137-18c4-75b1-de2ebc09d527@linaro.org>
Date: Tue, 21 Feb 2023 08:13:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 01/14] target/arm: Normalize aarch64 gdbstub get/set
 function names
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
 <20230221021951.453601-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221021951.453601-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 21/2/23 03:19, Richard Henderson wrote:
> Make the form of the function names between fp and sve the same:
>    - arm_gdb_*_svereg -> aarch64_gdb_*_sve_reg.
>    - aarch64_fpu_gdb_*_reg -> aarch64_gdb_*_fpu_reg.
> 
> Reviewed-by: Fabiano Rosas <farosas@suse.de>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h | 8 ++++----
>   target/arm/gdbstub.c   | 9 +++++----
>   target/arm/gdbstub64.c | 8 ++++----
>   3 files changed, 13 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


