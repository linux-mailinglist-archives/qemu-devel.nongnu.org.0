Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD21A49DC78
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 09:23:33 +0100 (CET)
Received: from localhost ([::1]:59394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD044-0003zn-Mj
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 03:23:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCzP5-00029J-JM
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 02:41:12 -0500
Received: from [2607:f8b0:4864:20::1034] (port=42719
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCzOz-0006uK-Mj
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 02:41:10 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 my12-20020a17090b4c8c00b001b528ba1cd7so2100471pjb.1
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 23:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OBHFjE8bJrvLvvVsVOHTMZ2PDy7T1aU3o+Vpgo0zcAk=;
 b=I2q2BOjgPA3J53f5gbJvXRU6YMYUdlh6twPeKx77D0S7AzQMv7qYb66BjgJNWjWUVx
 XInHKn64n/wcUwOs3u23kQsn/UhcrmDM3NcQb3ycAqCeXUx1lhPw11O0uGbtSVcOXmKB
 mxkJB+m1lp5ocyn2RgeCC5YrQQVlFkmg0WnWgUUTrqsy18JTfMOD5a/I08p0cDAFvC9B
 omFQrqEIFGgJO+D4jNb+eo99vNpjD4Q95cscG5iDbjtl4wAjjdz5sEoKQUdbQLb4tgL5
 TyURrtUQ9bZrHooKCK8M+csc/ptN3iFYt0IC0u0uAAgiZs227bjIdXfBF0QlHZPmjAS6
 oAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OBHFjE8bJrvLvvVsVOHTMZ2PDy7T1aU3o+Vpgo0zcAk=;
 b=7PR33BQTkfs18mpcwNfXkPv8fe4uJ76ORWVBBqSak2ggN6OzvAJ8B/lHW+Pbp8H09Y
 3O7NvrtNSb8Bc/tf6RXgV8/PncxeNZrrU6JSEYzXADXkRbgdAGL2svXEBjKNHsS4y9UT
 Og5OkILtpeLT6oAUJnsZVRZvHVM47yo286zB4XPkKIn7t7qVyUUeZadWUSAY/m2OQ62j
 A2+hpJBnFln8mmBwf8Z8RnQC2q1T2u/K7Z/Pz17KuoG+yjVzyUw4O8rVbYDIvZaUSme2
 MHtWB29XROsfhYxCEtVNi3OJAD7ocpWAFlIZ+7uqfUstvQW/mrOUuBbSVIPDeTlNkPMT
 19rg==
X-Gm-Message-State: AOAM532sPj0W/5ivLpLJW78CIhUKf+F/du1BfOlZvJwzY5ZG4E1yUsE6
 dR3lne7zOROBNNIIXWlktjHsrw==
X-Google-Smtp-Source: ABdhPJx0Fc1hS+FgDmI5DX/7/7Lk5AfqS1ryGqRpd8UdlXlesajdk9WPPVEjEBEPWpClOU2f45BxWw==
X-Received: by 2002:a17:902:9a88:: with SMTP id
 w8mr2800336plp.20.1643269263197; 
 Wed, 26 Jan 2022 23:41:03 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id n22sm4188399pfu.77.2022.01.26.23.41.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 23:41:02 -0800 (PST)
Message-ID: <2ed4a5e2-42ad-9010-b990-bd91ad0683a0@linaro.org>
Date: Thu, 27 Jan 2022 18:40:55 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 24/40] bsd-user/signal.c: host_to_target_siginfo_noswap
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220125012947.14974-1-imp@bsdimp.com>
 <20220125012947.14974-25-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220125012947.14974-25-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, def@FreeBSD.org,
 Stacey Son <sson@FreeBSD.org>, jrtc27@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/22 12:29, Warner Losh wrote:
> Implement conversion of host to target siginfo.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Kyle Evans<kevans@freebsd.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/signal.c | 113 ++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 113 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

