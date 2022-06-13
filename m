Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E7C549E39
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 21:59:17 +0200 (CEST)
Received: from localhost ([::1]:55666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0qDU-0007ew-Ok
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 15:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0q4B-0004h5-5g
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 15:49:40 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:41852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0q49-0004tS-5E
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 15:49:38 -0400
Received: by mail-pg1-x529.google.com with SMTP id e66so6469702pgc.8
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 12:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4Qph+h9KhykbXDr+d9CngHsFGly4/46QsHlvEeNCeUA=;
 b=vJ14/MmjCBKJaxLMDVQiUO0V/0GsPyzxVsaph9pCKh74ABv4eTviHllc8PbjkzAB/Z
 pcqxN1K5Bvriq/yt7tuMOi3wuqFYhs21YLRF4V5A8LJGABFzPLqDfoEYfvx6G0hq+5Az
 9stJ1h5mlru2XeSeR0XhKbSrpgBJhb7qscXbkoinzAqpuJCrFwnFGLZc9PcdhqCS7/aD
 giJwIu4ojJC/b9MRDqlx3OeNWhk0Tdgd/pHO43n2LgpH3Bii8ravpXSG1UpXFx3Fvuqf
 XyiszzLnKBh/I9t/RRe0dvjc/RJDlA/wqn5CenhtSks7Ed8qiyvQpRvAQPS/DF/RFfQ8
 /QrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4Qph+h9KhykbXDr+d9CngHsFGly4/46QsHlvEeNCeUA=;
 b=P7xZpoOGAhARnwHfpge/U7TWoZUm1NhEL5316TWH9LKBViA7elYFuF24ZxBQhW9Pqn
 U3tNDWwT+E5h6EvXV3IsXu7F1NJBuV4o7h6ARhQJ3K72WpQRstVb9q3SNuk1RR4QqSe6
 oWLbEQKPGpquMVrpgrM84JrtfjnZ6XFW52amBwMMD1BGdH5bgjnv3ZT2e3Ic8Wz/zN8C
 CWK3PqhLLPqEt3/J4kZfQcmboQqD1Ieum0zdRESk1QyQBAJtf9M95tkUIgPWnn+3Q5EN
 tetX7WToBs75bQka14w5B5wGvm4biEt0uJ65i6py/IjFwWOjLOeKyJci4xUJdK2/IEwJ
 oNbw==
X-Gm-Message-State: AOAM533d7otXBV2ewtZTOpcWx3I+uNRLcxrDa4SqAoSMh4+bzknOBC+Z
 oIzTS7APLIL0CYfjlT5H+7KWEhH0NEuZ2A==
X-Google-Smtp-Source: ABdhPJxV0xJMZ7cOx+l+TYEOixppOkFdeQNx4ue4LQOOjBnSvVsJybYb2jyeBSB9O5/Noj7tXzkEoQ==
X-Received: by 2002:a63:85c3:0:b0:401:9819:8fb9 with SMTP id
 u186-20020a6385c3000000b0040198198fb9mr1048177pgd.443.1655149775670; 
 Mon, 13 Jun 2022 12:49:35 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 199-20020a6300d0000000b003f24d67d226sm5857242pga.92.2022.06.13.12.49.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 12:49:35 -0700 (PDT)
Message-ID: <8ab3ce94-6d08-339f-1de4-3bfff2b06b62@linaro.org>
Date: Mon, 13 Jun 2022 12:49:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 06/11] bsd-user: Implement link, linkat, unlink and
 unlinkat
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: jrtc27@FreeBSD.org, def@FreeBSD.org, arrowd@freebsd.org,
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 Jung-uk Kim <jkim@FreeBSD.org>
References: <20220612204851.19914-1-imp@bsdimp.com>
 <20220612204851.19914-7-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220612204851.19914-7-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Jung-uk Kim<jkim@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/bsd-file.h           | 54 +++++++++++++++++++++++++++++++++++
>   bsd-user/freebsd/os-syscall.c | 16 +++++++++++
>   2 files changed, 70 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

