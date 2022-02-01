Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E944A678A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 23:09:37 +0100 (CET)
Received: from localhost ([::1]:59570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF1LE-0000G6-9x
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 17:09:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEx5h-00070R-TB
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:37:18 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=44944
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEx5f-0001tq-Vs
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:37:17 -0500
Received: by mail-io1-xd2a.google.com with SMTP id p63so21305951iod.11
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 09:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9QKK1HxanD1BJlpNfaL+WOKyuJxG23wBlbjOZ6EFKnc=;
 b=HwG/OZ3T46wFJ9ckXDv2Ho0G3lSbyFlOnfhKFXHST5Hkceh5VR7+T4N+MgD8QfqBtV
 Sjc0zuQLs7bRCMwGax3AAQj2coNpZlC5ywsc8kTavcTs1G16eef5zAggpwXF0Y7rAnp1
 GDOLMQLkB5WsOW7BQWv22vu4Ay0M2kIYgRzNRkKQWzlaAqPa6Y1EmAoiA2VznII6jJie
 ilWMBMc+Mcq3MFSrXQgrUHc305dyCMVIFHDQ8ksj0LLWSRdPQ3RU9wz37rBBXktSPfdO
 jc1hXRb8Ur8pC2dXB2hJGwVUOJeZ3S2Wr/uTSrFgvPliwx/FT4upxlOQZ3yoNJqV/cyr
 EW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9QKK1HxanD1BJlpNfaL+WOKyuJxG23wBlbjOZ6EFKnc=;
 b=FLXJWflnPiuQndrCqgh33NuW3slMQnxmO3LITidAE1V3LR+qKB4Rvl/RYUCQ/eYrDd
 u+Amoe7bGdC34aYr+/+E39GKUG0hmC8pN4UpJ385iXea3WjOBIdCImAE3sA3kFqf6O6G
 CIxNju4SyXV/AT1UNEM/H9V/AIl9ylNo3e0y6a6GRZitsNFAVy7bxFWUgvRRAMyYa/qn
 oBlZ3WoXHkEQyChgo9Fh1I3eQZPtUP+KkNTHtwIlgKpunL21svz8gX1CsCROxrROPmb+
 zm7AtqGZaDg6lhv5Z9iRYnrQ5lql9Tmjaa47IL9Eh3FvesCtUU4dH1VztU8X3B2rYhcs
 UrvQ==
X-Gm-Message-State: AOAM5334OELtCKBRWTaY+ygfoOrv0lvrwWKo6hgd1a/cya5nS89Tm7to
 ELskB+kylzzKHW4qhlwW5ARUTg==
X-Google-Smtp-Source: ABdhPJzHATILVAij07V1chUbdDF+mJlbFRL2QMSdB6+wOR5yCngX8SSYK5dzanM25wFPBAGLbMRZTQ==
X-Received: by 2002:a02:6309:: with SMTP id j9mr13454099jac.57.1643737034754; 
 Tue, 01 Feb 2022 09:37:14 -0800 (PST)
Received: from [192.168.62.227] ([172.58.160.76])
 by smtp.gmail.com with ESMTPSA id q14sm14420261iow.1.2022.02.01.09.37.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 09:37:14 -0800 (PST)
Message-ID: <c19f11a7-c9f0-0738-7e57-cac795aba5dc@linaro.org>
Date: Wed, 2 Feb 2022 04:37:02 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 09/22] bsd-user/freebsd/os-syscall.c: Move syscall
 processing here
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-10-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201111455.52511-10-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2a.google.com
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
> While there is some commonality between *BSD syscall processing, there's
> a number of differences and the system call numbers and ABIs have been
> independent since the late 90s. Move FreeBSD's proessing here and delete
> it.
> 
> The upstream implementation is somewhat different than the current
> implementation. It will be much easier to upstream these from scratch,
> justifying the final result, rather than working out the diffs and
> justifying the changes. Also tweak a comment to qemu standard form.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/freebsd/os-syscall.c | 68 +++++++++++++++++++++++++++++++++++
>   1 file changed, 68 insertions(+)
>   create mode 100644 bsd-user/freebsd/os-syscall.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

