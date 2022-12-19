Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EA7650953
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 10:29:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7CNL-0000xq-9h; Mon, 19 Dec 2022 04:23:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7CNB-0000uj-3k
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 04:23:49 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7CN8-00062r-Rm
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 04:23:48 -0500
Received: by mail-wr1-x431.google.com with SMTP id h7so7967175wrs.6
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 01:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XeFWpkabHi6XLO38Ez6FXB7VArsI+zR8L8c77wz5LFE=;
 b=hzm3SOlom6b1oCBOvdVED8q83mm0TeILh0tWHxcCuSh6e2g57F1sf/k/qIoMauwjN7
 1/3hCdKSpDjnXjCnH3DgQDp1E2Df0KaAOZh43Qfz04f1y12P7R95ZG70mjphkqR7srm6
 14gipk/Sgy9Chbm+TKuvDqES3i3kUVzX/RziD7p+pqXMyIwYrG2Pqxkds7HwHleOzVwR
 nEcUv7PuKzBCs6q2la9ZgzJwH6CB9IS5AUTF83PHTH/mVHbV6X1GirlVRVoR0RFstYI3
 TAZjOtdIFyT9/b5BgOlRZexQTYAVEVEe66rFHr2a20KmV5y6QepLTJHsmqkgk/9JXkab
 o5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XeFWpkabHi6XLO38Ez6FXB7VArsI+zR8L8c77wz5LFE=;
 b=scpLgOF5FuXym48dfXDbV5/Alc4O1NvxhRWIJVJS6h2DqVpacNMjJ8WnBdZlOuwGxn
 gFrkdQzbcQYiyqi/Tb0jgi7/pfRE2fsNSKr8Q6w40d204S20lOUcCgnhpxA+v4EBE/2X
 j5YBrgpUhKyO7IW7KpOtOd6AZCAEHn9SzObnw3JYyQmXPdixOhEWKfSZNtdTL55iERc8
 AaiUB2xL4i1POZ6QX6l/wAUpdSskGT3B2GqIfFxckSHJkuoMq22EYCvfKqA286dvCVFi
 EqBirEqoq3hohL7Odlhxg750AteogJYpYyCFLa7IdhqHPj7BW8pKEgOoI/MpOFafHW43
 EavA==
X-Gm-Message-State: ANoB5pmJGn0wVSflhiFRXXCnffJyol/KKQLxYreWWiDMXOVSyYQgLbfq
 wlTTQXfiHfZ8YanZkEXGo29Yxg==
X-Google-Smtp-Source: AA0mqf65tPzZkZ1XeClWUhSglR742qk5M1xbRvM3SCI2Vd0ErIA+UwsFDz5JkIP1EXZc9eD+TSEY5w==
X-Received: by 2002:adf:fa4c:0:b0:242:4990:b751 with SMTP id
 y12-20020adffa4c000000b002424990b751mr26555183wrr.34.1671441825275; 
 Mon, 19 Dec 2022 01:23:45 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m16-20020adfe0d0000000b0025d9d13c7e1sm6132269wri.105.2022.12.19.01.23.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 01:23:44 -0800 (PST)
Message-ID: <66c9da37-7096-894a-d21d-4db50b27c194@linaro.org>
Date: Mon, 19 Dec 2022 10:23:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] chardev: clean up chardev-parallel.c
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20221219091729.690645-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221219091729.690645-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 19/12/22 10:17, Paolo Bonzini wrote:
> Replace HAVE_CHARDEV_PARPORT with a Meson conditional, remove unnecessary
> defines, and close the file descriptor on FreeBSD/DragonFly.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   chardev/char-parallel.c | 15 ++-------------
>   chardev/meson.build     |  5 ++++-
>   include/qemu/osdep.h    |  5 -----
>   3 files changed, 6 insertions(+), 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


