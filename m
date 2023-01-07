Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 738C1660FFE
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 16:36:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEBCD-0004E9-I8; Sat, 07 Jan 2023 10:33:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEBC7-0004DC-JK
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 10:33:15 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEBC4-00009G-JS
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 10:33:15 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso5564680wms.5
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 07:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rhCgwoyqfa1pvTgbhUwrbvg2wRCwwT77J7RpV3zS96c=;
 b=BTNgD0S0l6WCQ6AF2mDzUdFpeeXONIVUNpurwRa/AI6mSMWA6Jw1zCECr6qQIKgCr5
 kZ7vUostmx+eklBJhf0ighaPKQU30EZWswphKCYo7hITwlwlB3cB+2yIajcZY3lRXs8D
 njg/1SWSzVcRXfPgBn5iTIMzlvw6aMmgB4QaElW/766xtJM8STbPi9FGZzZoeNVr/jio
 l8hPSvYXbcbDYhl34VsygO5zTAFL15fnllqzOPLyVoxFm5xsoigDV8MYn61JxnGy+46Z
 7ZRLArdWo702zJlt4tWPaO8Cp/DBLsvnePcEu1eoJrW0Hh7n2ffcCxHp+/aNEi4OOL6P
 dFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rhCgwoyqfa1pvTgbhUwrbvg2wRCwwT77J7RpV3zS96c=;
 b=nn2bPlYMV3ZU/ROCzRBubCDaktwYfs7wZ7fh2MOj7dVohInk9d999q7VTVqY10vlgg
 z0tew64tLHybuLJrUC6V9gcoMf7/1wwINLXfjZtRWXZmvk++4y+1MRJ8tksCR5XSTuOQ
 FBvQNiiLevsePzm+BR4MfLzANG85tYXJ0B5xnc5OnK3po3sX44OqBV6DkZbU9HwIhPiF
 sZqqPlcoMBYlMMykHlZgBiO1BcMHVZ0L8eHM6URFg84ly9qDsOmIXMUXdqCCtHv0VSEX
 yvqThWyW1GVsweCIfi+6Hvp7UdP5IEPLHyKQpoSE5qLgdhew9BhbvU3Pl90xRSB3kPkD
 8flg==
X-Gm-Message-State: AFqh2koOFZcXA75b1Lbp9v3Gxrdw2GMUkgUWs12kFtoC992VxUkKSUA8
 wvP2ph3ei1Whod3f1zNT/7vptQ==
X-Google-Smtp-Source: AMrXdXv8NnBXV7gUbRHWl4P6mq9aRXYyic98PWNVVJFK1EmACDqxOu8yB0gGodYy8X/g1tkeMOaJgw==
X-Received: by 2002:a05:600c:16c5:b0:3d1:f687:1fd0 with SMTP id
 l5-20020a05600c16c500b003d1f6871fd0mr42296361wmn.12.1673105590699; 
 Sat, 07 Jan 2023 07:33:10 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k30-20020a05600c1c9e00b003d9b89a39b2sm6182512wms.10.2023.01.07.07.33.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Jan 2023 07:33:10 -0800 (PST)
Message-ID: <23d47b64-879f-2dfa-cf25-5fb698bfc5fd@linaro.org>
Date: Sat, 7 Jan 2023 16:33:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] configure: fix GLIB_VERSION for cross-compilation
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?B?0JLQsNC70LXQvdGC0LjQvQ==?= <val15032008@mail.ru>,
 qemu-stable@nongnu.org
References: <20230107133258.110125-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230107133258.110125-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.114,
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

On 7/1/23 14:32, Paolo Bonzini wrote:
> configure uses "pkg-config" directly so that GLIB_VERSION is always based
> on host glib version.   To correctly handle cross-compilation it should use
> "$pkg_config" and take GLIB_VERSION from the cross-compiled glib.
> 
> Reported-by: Валентин <val15032008@mail.ru>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1414
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


