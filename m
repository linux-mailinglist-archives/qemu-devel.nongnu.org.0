Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAA14A62C8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 18:44:00 +0100 (CET)
Received: from localhost ([::1]:42212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nExCB-00013y-Iq
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 12:43:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEvVA-0000FE-6K
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:55:33 -0500
Received: from [2607:f8b0:4864:20::32b] (port=36840
 helo=mail-ot1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEvV2-0001z7-Hk
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:55:22 -0500
Received: by mail-ot1-x32b.google.com with SMTP id
 d18-20020a9d51d2000000b005a09728a8c2so16626407oth.3
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 07:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=f4CZ5ngb2w5ORzk01kjNIQqQ7kSg2fa2aFjUe6sICD8=;
 b=OV6bgXvP+FgRGKOiHLbq6H/CW84Oarvp0LeH45Ol1M3E+8o/iClP2mQpf0zPWMMNGf
 /WTTqFccGU8uYHSK/OogwsNouMZZ39ck3TViBj3GS2Oig1YwC8y/UEKnkvBLs2f92PdS
 JN14MwScz0py218YTkp13RXoV2jTugZ7VSMRNy2mZIG9drUdgE3M9kLf6RrkOBP7Kmpl
 RPXlb9BUMdGEd7HlxanQduyhHX1FFxsX/lEPNx2vz46v/JhPPZmjWSfIza1aeBBGA+aA
 P1RRMP54FbELIkMN1qvKqcLgBxkZFtyNuX/ZSQGVOUQnYl5PUIEjyTtQXVa6VO/lfmIL
 Mmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f4CZ5ngb2w5ORzk01kjNIQqQ7kSg2fa2aFjUe6sICD8=;
 b=76uNit34OK5Y/MYrqQN/aTIrE1m2Lg9uMP+pTvJwPcCe7S3OQiXugEdxAK3/b8oXKH
 flooREsRJxcuRSkzl0oz2GdPsja31ZrOioLfBBF9sCMikucwW2o/Zk9Fki0+0evXfrqo
 RA2B9l4vn4cNLG7cD5wATjAtLbiugJxF9VffwjT9Gm/JaAT4AWPdYY5CFrfKp8KVQWAA
 1vOC3REMwYAoFSk3c7r69huOSFdsIidhwvRbVhDz3AfYbr9cDOe7no7CfODku2Fs5Q3V
 ogJ1+vA1KEmqwsOa0BLpjMbRBPiyLyRX0FQXMfFbZkaSARRVNo95vI8lp8JGqmMkUMeY
 5xKA==
X-Gm-Message-State: AOAM531Rr7YVFMD0VLSgEqwH2jmIIoUDsTgBx8rEr6S/8nR0SvRSN2g4
 HjcJek8lz5AvnEHDnLDOBpzItA==
X-Google-Smtp-Source: ABdhPJxhNSSRlJW2mkD7WpGCThV3tDTCwt3Yq0kYRN0DZ3vLkNxUmiTyrXJo0T9Bh22fzou+75dyUQ==
X-Received: by 2002:a9d:7382:: with SMTP id j2mr11229913otk.291.1643730917154; 
 Tue, 01 Feb 2022 07:55:17 -0800 (PST)
Received: from [192.168.62.227] ([172.58.176.212])
 by smtp.gmail.com with ESMTPSA id a8sm8427304otj.47.2022.02.01.07.55.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 07:55:16 -0800 (PST)
Message-ID: <efed4bb4-23b7-13a2-2926-d3af6cca0b32@linaro.org>
Date: Wed, 2 Feb 2022 02:54:58 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/22] bsd-user/main.c: Drop syscall flavor arg -bsd
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-2-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201111455.52511-2-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
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
> We've not realistically been able to actually run any bsd program on any
> other bsd program. They are too diverged to do this easily. The current
> code is setup to do it, but implementing it is hard. Stop pretending
> that we can do this.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/main.c | 12 ------------
>   1 file changed, 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

