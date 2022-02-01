Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EB14A6697
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 21:56:55 +0100 (CET)
Received: from localhost ([::1]:60230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF0Cs-0005Et-2L
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 15:56:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEx5R-0006GC-0U
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:37:01 -0500
Received: from [2607:f8b0:4864:20::136] (port=42858
 helo=mail-il1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEx43-0001Zn-UZ
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:37:00 -0500
Received: by mail-il1-x136.google.com with SMTP id x6so2386374ilg.9
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 09:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qOvBd+bZMwceGdxENbpJubJ8QyW/rEDHU7XaiXodI/s=;
 b=zZFHzHWhYdeV3XdIvd2moTVKjhSrk0HqrBg3RsU17AZJPreleLAW3xH78Uk2cpIV/r
 tYhNduAzVTjLn1TZ9XDXTYLZsRUmAUAtlZ3tfvCOOoKcB0aIU+ek+pHJYkjsIB1S8r3C
 FQB+8E5NcEUYcoWyobEWmXs+DNzzZG2OgFCXbZgUJh4dEK8Zl5W6nDWEfpoIKxM/J2iZ
 4enNYi9abAta+vghMsL/EAoBvEZMZK6jjfIrNc+sf1oNX8/YZQkOsxYIdLQuZ7R5A+TL
 Lfc2Wn5WLOyWRiUYPdKACZOx4YrSBvGiEOI29MVeb0VbFX0oQtgiUxpTFsrP05sNri/k
 imOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qOvBd+bZMwceGdxENbpJubJ8QyW/rEDHU7XaiXodI/s=;
 b=UAynhHkO91xEpOqRpjvLrHkECDlOAjr/MfyqYza2KysqwLAVibIRdDOicXz8M2R4g+
 71UaBnmx6NhQKduCIroI+kDpM1rGYVFy1RJBVfsHUEjhzrtcO1dqrZKg9h9K0mCbDRzq
 IwGNy/+gGwTLdoc4yy4VBNllnVJVRXW4Dp4OvlQG5gGdMJBxBUajVvEKq9re56rTg999
 8EoNBzTP+1GPlz5IJBTSNtCFLul6L7Q881MHVuECi6E0BWGHEPWl0lo6KwZw9ZBg1rRS
 +Yx8tYY22vt3XSrmQS8nFlxDJycLRmfpibDndkuE5OjYYMcjPjppHsl7a15IS7ifWLEp
 gLuA==
X-Gm-Message-State: AOAM531pyNKjtfx12WaUvLUHQpOXmx0kTZOsWV1+BMEPMNiP1vLMs6Os
 mIJ2Ds6bbaaJkmyl++WwISWwWg==
X-Google-Smtp-Source: ABdhPJzMggZxBGhUH1vRqrVe+ri3RpCtcbPVidiKURGj7emcMQpYUnVfheTKRQz9nZabhlHLUHUTRA==
X-Received: by 2002:a92:d387:: with SMTP id o7mr16541181ilo.26.1643736926012; 
 Tue, 01 Feb 2022 09:35:26 -0800 (PST)
Received: from [192.168.62.227] ([172.58.160.76])
 by smtp.gmail.com with ESMTPSA id u17sm8918319ilk.49.2022.02.01.09.35.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 09:35:25 -0800 (PST)
Message-ID: <f8dc5fb5-ab9a-ae59-d327-61567019aed7@linaro.org>
Date: Wed, 2 Feb 2022 04:35:12 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 08/22] bsd-user: Remove bsd_type
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-9-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201111455.52511-9-imp@bsdimp.com>
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
> Remove keeping track of which type of bsd we're running on. It's no
> longer referenced in the code. Building bsd-user on NetBSD or OpenBSD
> isn't possible, let alone running that code. Stop pretending that we can
> do the cross BSD thing since there's been a large divergence since 2000
> that makes this nearly impossible between FreeBSD and {Net,Open}BSD and
> at least quite difficult between NetBSD and OpenBSD.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/main.c | 2 --
>   bsd-user/qemu.h | 7 -------
>   2 files changed, 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

