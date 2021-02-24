Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90049324480
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 20:18:50 +0100 (CET)
Received: from localhost ([::1]:41802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEzgP-00088b-IG
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 14:18:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEzU2-0006c6-Fb
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 14:06:02 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:50967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEzTr-0006Cq-9V
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 14:05:55 -0500
Received: by mail-pj1-x1036.google.com with SMTP id b15so1946888pjb.0
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 11:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W637nTXwMuJRCteMAZc+ILdQvbjzwS2EWJUyupIJYXs=;
 b=CV8/8g0lrwXRXc6DbhoIZANdBL3UCW6hQlAQNAkyzim28jJNGxLrWN9Z7Zq7jKLXRW
 3H+JTQIefiIJoXtp1sLiknwkSRIV+B6kA4+1+HNW6RdVqvs+0Kaq6+6SxZpmMr7/FyLU
 Crs/T/p77AMuuZc5edIfAG7SDbyPpAEc889PTyB+7eWz+siAH5zv7FzeLCz1WLve1EIn
 J2vaFkwO41P0KZhIeqxbwHIy1ghHjobAfT5tu8+J7dLMeZ/YPBR4a4oQqMgj6S+t9mGX
 ABoqLZeLYUKfTAFU1HnLM2LzBnzaqLmE69JV2TMdsSu6o7BXVuUts4doRvTFcFkwUdmz
 IdZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W637nTXwMuJRCteMAZc+ILdQvbjzwS2EWJUyupIJYXs=;
 b=WrSTkETTp0x5Pgwb9vNxoG/gp9vVjBUAz+KSZ3REK5g/Od0hraFb8TRBU8DmZrLnH9
 qzF1lxcTN2MKHJnAJm7C3CrSX7D+7XfSJgPKB4GulrXQLp/EcNsge6G5B6vW9q4N/zKt
 zArrExr3p1ta1ZDF3aNMkNLOzyL2+SkZSrFHrQEM0agKfYa3o7NdX5CCyPDC8MlFcfW5
 W6vvikoMnfUpyZl7IZnUv9sQ/zuAnbhQQBBD4atN95A0IZNUwIXcT1ROqGkIhg9fm87f
 aN+eacEFXvvzhZElv2eRKLwbq4L5bBK2q9Jb8NiuXXPruzex/Y7A5bgYCa3KoqbqHcsT
 /yKA==
X-Gm-Message-State: AOAM532MMLybqAe6p+8i8EGXCupK8m9Q6OBYNoACzjZOnw2InkGWNDRa
 aTfk0x2R6u4cRQNScsYZnmt73g==
X-Google-Smtp-Source: ABdhPJzdvYZfG49Mjrb8vg5bKABUBiUkNTjuHP2Fmx+s9Z2tWNyVi+s44afdx9AXA8OoLRBF/PiYNA==
X-Received: by 2002:a17:902:c114:b029:e3:b2e7:d410 with SMTP id
 20-20020a170902c114b02900e3b2e7d410mr30930121pli.16.1614193548350; 
 Wed, 24 Feb 2021 11:05:48 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id h123sm1234230pfe.115.2021.02.24.11.05.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 11:05:47 -0800 (PST)
Subject: Re: [PATCH v4 02/12] target/mips/meson: Restrict mips-semi.c to TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210224185706.3293058-1-f4bug@amsat.org>
 <20210224185706.3293058-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2a892133-d2ff-7ff5-cae2-7323c88c154b@linaro.org>
Date: Wed, 24 Feb 2021 11:05:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224185706.3293058-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Craig Janeczek <jancraig@amazon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 10:56 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


