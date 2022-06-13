Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C781549E09
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 21:49:48 +0200 (CEST)
Received: from localhost ([::1]:37532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0q4I-0003ce-Hk
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 15:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0q12-0002AW-Rj
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 15:46:24 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:40526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0q11-0004aC-0Y
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 15:46:24 -0400
Received: by mail-pf1-x42b.google.com with SMTP id z17so6635197pff.7
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 12:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OMp+piy3Z95fks8JAw8WSba0LQmLIkIPRLlSSxevNLE=;
 b=oDP7YdkxG3TibpvvyRPCUXJEqd2sat7oLnTeE0FtlYNRjCPESHSO9cisZDthsgiCMD
 nMYsWV7qMCO3AcTc2Cufi1bXKZRnEaU0l7/TOj8oin34eNBkx9AXX4y9W1XSVUqCXAsE
 Fz5HIbBz2RoixA2G18W5xRa7grnFmturgS7MaBLxmOEaXEhtVgEG1RW4NuuhpTJvHO1J
 UM+BD4zhmBxOG83EKLqh1Azsyd4QuQYzsrpdNRfSMoI4/Y8tgHu798cg2c+wgF1Gqted
 qda5FHSSnNGYZXM8RGtRYXCvQqVrErBEeBbde/fCLBo3xhyCEcHelNsrzoTv/wVhBRVA
 UiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OMp+piy3Z95fks8JAw8WSba0LQmLIkIPRLlSSxevNLE=;
 b=GMMMUejVeIXATNwZJeSXEWizF0V8NhAJaeXs0ex+f7VyBvcwsMcmtwjTuiO+MQzEj7
 8nc7ULJ1C+KBcG2fYT/OY734iI/Qb/PuCx5oyHnJyBWe7B8PaRYLcXsH7PQx3F99BKKP
 o32oYTk/1wxXDb6AOoF33HQTFfmu+xR9AyiITScUXSkTFzMuT23FeoVmsWml775GHBj/
 SNRO3gVvnuByXRHlgAJiKlNHy8JO/Tp8TxKf7/nn+Cndi9ClPIqG88q0p5FxvX5gzyTA
 zL7tFOwqi09YCIMFEG9fOL07rGatvWltjvart+TrFH03A/1NMIDUYqARMb3Uf9T5hjft
 aBuQ==
X-Gm-Message-State: AOAM531Ni4j9mYzFqi4+TbR3/a/NZtVlTQ+115EWGiRSKvRIDIsGfBGL
 ayvRYm34mFNAHk333oqgcOUe9g==
X-Google-Smtp-Source: ABdhPJyEZxe3vrY+VgDEZmAZf+mMMt4n4tTDDlxQ9Dpv/PZ1q9xD9zlHM2bqV9RiWXMSkwB34O+ztg==
X-Received: by 2002:a05:6a00:1946:b0:4fe:309f:d612 with SMTP id
 s6-20020a056a00194600b004fe309fd612mr944823pfk.10.1655149580089; 
 Mon, 13 Jun 2022 12:46:20 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 a12-20020a1709027e4c00b00164097a779fsm5498670pln.147.2022.06.13.12.46.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 12:46:19 -0700 (PDT)
Message-ID: <fbda3754-1a53-8c7c-c770-ee6f583f78d7@linaro.org>
Date: Mon, 13 Jun 2022 12:46:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 02/11] bsd-user: Implement fdatasync, fsync and close_from
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: jrtc27@FreeBSD.org, def@FreeBSD.org, arrowd@freebsd.org,
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 Jung-uk Kim <jkim@FreeBSD.org>
References: <20220612204851.19914-1-imp@bsdimp.com>
 <20220612204851.19914-3-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220612204851.19914-3-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

On 6/12/22 13:48, Warner Losh wrote:
> Implement fdatasync(2), fsync(2) and close_from(2).
> 
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Jung-uk Kim <jkim@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/bsd-file.h           | 22 ++++++++++++++++++++++
>   bsd-user/freebsd/os-syscall.c | 12 ++++++++++++
>   2 files changed, 34 insertions(+)
> 
> diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
> index fb54905b46f..3e0f160e312 100644
> --- a/bsd-user/bsd-file.h
> +++ b/bsd-user/bsd-file.h
> @@ -240,4 +240,26 @@ static inline abi_long do_bsd_close(abi_long arg1)
>       return get_errno(close(arg1));
>   }
>   
> +/* fdatasync(2) */
> +static abi_long do_bsd_fdatasync(abi_long arg1)
> +{
> +
> +    return get_errno(fdatasync(arg1));
> +}
> +
> +/* fsync(2) */
> +static abi_long do_bsd_fsync(abi_long arg1)
> +{
> +
> +    return get_errno(fsync(arg1));
> +}
> +
> +/* closefrom(2) */
> +static abi_long do_bsd_closefrom(abi_long arg1)
> +{
> +
> +    closefrom(arg1);  /* returns void */
> +    return get_errno(0);
> +}

All with extra linefeed.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

