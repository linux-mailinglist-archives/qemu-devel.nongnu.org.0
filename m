Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EC04A6513
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 20:36:46 +0100 (CET)
Received: from localhost ([::1]:59384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEyxI-0002t2-LF
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 14:36:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEx36-0005rN-07
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:34:37 -0500
Received: from [2607:f8b0:4864:20::12e] (port=38542
 helo=mail-il1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEx33-0001Ka-NC
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:34:35 -0500
Received: by mail-il1-x12e.google.com with SMTP id i1so14912667ils.5
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 09:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=cHddvGxgqNXxys1EJ5OMfbMHOWHAhniGSdhAQ/JYirg=;
 b=QouOz1pCRc82n9YnYbQb1Mg5jx1WT3q37XNIXOzjaKkpfJom7+xmgJ0mWQBgHdlY8W
 Xq7v1Zn8fCrkSwi8Md2fcCstywDVKXyB4m52iYOuUYzWMfjFyk7D/Lmnnm6+TmB/NEcw
 LH/JdwJFltFmD+LhGC+FvWD6ZFiRtkDi1gWwxSe1BzsCYuK1Q3ob8aD6FREtka4l2dkO
 w+gq6sQOlpVCFpdE0AiSjdOzIXWGBYCZb6pkVDRv0M67ikuBktYA32VDw4Mg3NTOQRdo
 Xb1ap0w/pjfHKizvGwCCWcjaI9bWnxfNw1y7zP25xuisCT/i/ylA1KFpftSiQYjQggor
 WnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cHddvGxgqNXxys1EJ5OMfbMHOWHAhniGSdhAQ/JYirg=;
 b=UL3IL6KdZd4JKKEQ/rdEm6yA/D/BTACACTrQA5gQXB5xQPZbGjfqWyVucMqqssXr0g
 JxdYyF+iWnuai9J4z7Ns71YyB3D1ytLyikwO09N8C1nLFDq5qIXVFm05pw+06YI5Xv7V
 h/ciStRfPgKU+s1KXTXYkBUTXYSsjKqOiXHMMPPj7uHQr0vtfga6o7d0SG0kkejRlPG8
 s1ro4ntFoCij4Jk5vx1A5mOHhIJzusWwc3iCEtgInRJs1UodDzMjt2HJsDRMHQiM9T+y
 /6cYjQ4cMiyNYp754WsHjIogjORs/TUYs8D7Yle0RkfkbmsvI+UcrxQx9Kz2Q5Se5epH
 fnEA==
X-Gm-Message-State: AOAM532u1obmGcECTOGZlyKAn11eazr/rODhjGNGgHDGX2DM6CB0IPVQ
 JTEv1RncKW/jr+hreUTMF7TKQA==
X-Google-Smtp-Source: ABdhPJy4S6YXXw/l07MmPdU1QIb2HUOUB6JOGpLVLeHjerBn+HLuWbTLafWKXpdhjPlAlvV/5MlWmQ==
X-Received: by 2002:a92:3609:: with SMTP id d9mr1944771ila.282.1643736872057; 
 Tue, 01 Feb 2022 09:34:32 -0800 (PST)
Received: from [192.168.62.227] ([172.58.160.76])
 by smtp.gmail.com with ESMTPSA id h3sm4578237ilj.81.2022.02.01.09.34.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 09:34:31 -0800 (PST)
Message-ID: <398586c6-0e34-0ede-2b6a-033198c4c7a4@linaro.org>
Date: Wed, 2 Feb 2022 04:34:18 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 06/22] bsd-user/arm/target_arch_thread.h: Assume a FreeBSD
 target
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-7-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201111455.52511-7-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12e.google.com
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
> Since we can't run on anything else, assume for the moment that this is
> a FreeBSD target. In the future, we'll need to handle this properly
> via some include file in bsd-user/*bsd/arm/mumble.h. There's a number
> of other diffs that would be needed to make things work on OtherBSD,
> so it doesn't make sense to preseve this one detail today.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch_thread.h | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

