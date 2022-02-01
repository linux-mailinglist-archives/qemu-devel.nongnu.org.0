Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 822414A6796
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 23:13:37 +0100 (CET)
Received: from localhost ([::1]:40284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF1P6-0006Su-5L
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 17:13:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nExBh-0002Uj-Rh
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:43:29 -0500
Received: from [2607:f8b0:4864:20::136] (port=45685
 helo=mail-il1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nExBg-0002xJ-AP
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:43:29 -0500
Received: by mail-il1-x136.google.com with SMTP id m17so1762454ilj.12
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 09:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=clst3blIVjsf+pRg9uuoiknLwineE/vA3Uy1hIG6U4E=;
 b=ySsbKcFzLS3sen2Z333AQUc4Fm4XDSFKVLuiA1y04ucQwhrMrzKKBQl+wKzl4tnOAI
 sIX72Ro4K7TtiXcsGw0TGzZ/NtizibRquRnQkJ6OI9wQ9NsLl7WfwWgkyDvm/BuZOFCt
 hiTtFQdliWn6FskOzuvwUvCBYa58wSRFNPSz5elhGjxno9n459GfvDw17rYXHHashDMy
 EJoEIjT+IlcCbiQ110R1ovqjUdCSqknbo5Ano2sXvShcFezBLBX2uvXvQcMEgzRC748o
 +zy7XAhhnUh0ukkPp+8VcJ2ekO/py/h61txhkhLDbPTCsEb+5k4Khki+uCZGmH4L0Y6C
 g7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=clst3blIVjsf+pRg9uuoiknLwineE/vA3Uy1hIG6U4E=;
 b=Rra4EbmoUVTPTs+yieHFJpIW59FTgxFMCTqYqLobuGtPQnYTfCIvbs24OdTSE+sAi+
 A+5bNr4caVH4T/xzBOhHTA1F1XyY5gmB7zTAeHIDArAIrgNYLZCkwaQFkL+Q0cd5NRc8
 Y0vZ4jadZ87yaAjSyP2YjMhrnSPBvkYyShjJmkHBcFigPxew/NO5eDpWfp2DCcEeQ/Wv
 09NF9o1o7Iw5f+2fGQ+ppa3mFx9+9SF4ZjDN79RxnDxhQmLpWh7C3RbcCRkDbh9nPTOV
 CkbJte51Ku7V5FbvFFxqA/26qjJcHhkaZ0GB3Ia6jG8JMkH5pikQg5iEsnDS6vuDOXK7
 kpsg==
X-Gm-Message-State: AOAM532xbkAh8T6BbhBVxUUllXiYFr8HXfJ6nc4Z4l6Qusj/ZMQ2FycD
 MtABhVPnyN2pkAqXUbs/XPKzlg==
X-Google-Smtp-Source: ABdhPJyGU9uX97vU/JU9CtQ19lsiusup1qDpwFxmcM8wHpTThkyefE+NgUYAjA7rKbOkpcjO4F2SHw==
X-Received: by 2002:a92:c685:: with SMTP id o5mr8715287ilg.153.1643737406443; 
 Tue, 01 Feb 2022 09:43:26 -0800 (PST)
Received: from [192.168.62.227] ([172.58.160.76])
 by smtp.gmail.com with ESMTPSA id x16sm357937ilq.71.2022.02.01.09.43.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 09:43:26 -0800 (PST)
Message-ID: <021f966e-b664-b27f-f24a-fc6dc9f960bb@linaro.org>
Date: Wed, 2 Feb 2022 04:43:12 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 13/22] bsd-user/bsd-file.h: Implementation details for the
 filesystem calls
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-14-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201111455.52511-14-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::136
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x136.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>, def@FreeBSD.org, jrtc27@FreeBSD.org,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/22 22:14, Warner Losh wrote:
> +#ifndef BSD_FILE_H_
> +#define BSD_FILE_H_
> +
> +#include <sys/types.h>
> +#include <sys/mount.h>
> +#include <sys/uio.h>
> +#include <fcntl.h>
> +#include <poll.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <unistd.h>

Many of these should be done by "qemu/osdep.h" already.  Otherwise I question putting them 
into this header, as opposed to as needed by other syscall handling c files.


r~

