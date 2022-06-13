Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F6254A272
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 01:09:13 +0200 (CEST)
Received: from localhost ([::1]:44132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0tBI-0007VF-9U
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 19:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o0t9r-0006oT-Ku
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 19:07:43 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:38588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o0t9q-0000y7-5G
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 19:07:43 -0400
Received: by mail-pl1-x629.google.com with SMTP id n18so6335770plg.5
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 16:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Fa2gMIfFKOiBxvbgHpVR/sURMnBNgW4LqSuSae9eH6o=;
 b=WRelj2DjLlzKHknbqNyFBN4hB9qipTKI+pk+4jHNxczobfFJOpDlUvf4YDsAI5eiRP
 WRKfmyyhG6sWwNhwbAFxDEiLRCeEuxPzVwqmwRbwxABREJKGcvAdPSsMFr0N9UBtMPQu
 offnMW64LFeHorn0wKerSclmVAgtf0qPhlYnGv5mNhDE77M17bRLSwmXVmKY5j2N3TJ+
 fRG1lsKjIcJFmOV3T7mUtibHeT6jMFMI6Qr+Z0ugWsRbh6HlBNAEku7kJ3sc1m6gu9gN
 ylx+kMYFrjgNtPsPHqe2/2Mnf0qJMy+CuAaCGxdWa2JhY5ho0PGzRFxwrWmH+Q8tB2Xe
 /xjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Fa2gMIfFKOiBxvbgHpVR/sURMnBNgW4LqSuSae9eH6o=;
 b=MOJZIQN8nFaHZf0OtzOsatJ3IH3JmYRDcX0vDWqZ1lGlfMgaa3A402mSzuSHecQa+R
 EKLb6dsBzGn/Q5y890x/weG1ErLE2YCw9/nDKSyelMfcd+rEB6B14ODpv0I0jMGYxz+u
 SeuL38pGEtjT2TAV7IcCqzsCd4uFDBB49mzuKBa5vLe5S92KzbiPvc9ZjBLrV9Z1KOnv
 mfl9pEijgA8Ryu5ZenzLV71kqsiwZLAfa414UZL6dJgp8XC+K6C9fLxyQIM3STcoEfGj
 aJlNi/eoPX1uyivaxqsrNy+JwoUHb3udBNQZt8oYOx2DUBSIc59vJHgr0UwOgARYp1dR
 PrFA==
X-Gm-Message-State: AJIora+ubDShKZFBOOpQmeuyVUbWN4qknQsEsGZad0RyPSS65g7hpw7p
 6n9Qe5eBL3mpjF6Lf+veqBE=
X-Google-Smtp-Source: AGRyM1spChLwMZqoPROTUM1eOzD+UsYowR2P0QBqXggHba/tzIzoY529cgbFau0/RiuIoWB9As/hgw==
X-Received: by 2002:a17:90b:4d0a:b0:1e2:c0b4:8bb8 with SMTP id
 mw10-20020a17090b4d0a00b001e2c0b48bb8mr1148726pjb.94.1655161660340; 
 Mon, 13 Jun 2022 16:07:40 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 jc10-20020a17090325ca00b0015e8d4eb1c6sm5667535plb.16.2022.06.13.16.07.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 16:07:39 -0700 (PDT)
Message-ID: <74b09826-30a4-8a42-e964-44899d4d5fa6@amsat.org>
Date: Tue, 14 Jun 2022 01:07:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 03/11] bsd-user: Implement revoke, access, eaccess and
 faccessat
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: jrtc27@FreeBSD.org, def@FreeBSD.org, arrowd@freebsd.org,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stacey Son <sson@FreeBSD.org>
References: <20220612204851.19914-1-imp@bsdimp.com>
 <20220612204851.19914-4-imp@bsdimp.com>
In-Reply-To: <20220612204851.19914-4-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 12/6/22 22:48, Warner Losh wrote:
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/bsd-file.h           | 53 +++++++++++++++++++++++++++++++++++
>   bsd-user/freebsd/os-syscall.c | 16 +++++++++++
>   2 files changed, 69 insertions(+)
> 
> diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
> index 3e0f160e312..37b3efccd2c 100644
> --- a/bsd-user/bsd-file.h
> +++ b/bsd-user/bsd-file.h
> @@ -262,4 +262,57 @@ static abi_long do_bsd_closefrom(abi_long arg1)
>       return get_errno(0);
>   }
>   
> +/* revoke(2) */
> +static abi_long do_bsd_revoke(abi_long arg1)
> +{
> +    abi_long ret;
> +    void *p;
> +
> +    LOCK_PATH(p, arg1);
> +    ret = get_errno(revoke(p)); /* XXX path(p)? */
> +    UNLOCK_PATH(p, arg1);
> +
> +    return ret;
> +}

Out of curiosity, what is the problem with path(p) here?

> +/* faccessat(2) */
> +static abi_long do_bsd_faccessat(abi_long arg1, abi_long arg2,
> +        abi_long arg3, abi_long arg4)
> +{
> +    abi_long ret;
> +    void *p;
> +
> +    LOCK_PATH(p, arg2);
> +    ret = get_errno(faccessat(arg1, p, arg3, arg4)); /* XXX path(p)? */
> +    UNLOCK_PATH(p, arg2);
> +
> +    return ret;
> +}

