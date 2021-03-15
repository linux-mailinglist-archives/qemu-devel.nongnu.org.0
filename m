Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B2733C73C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:57:57 +0100 (CET)
Received: from localhost ([::1]:44696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLtLg-0007Nn-LA
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLtDq-0005ly-Tw
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:49:51 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:36421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLtDo-0004AH-6Z
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:49:50 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 g8-20020a9d6c480000b02901b65ca2432cso5729887otq.3
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 12:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0ozITQ24C5/Y0Gxoo84ECI2meMKE1n44aSWbfuyAAfM=;
 b=qMaZ9G70VhcRkn421+CyJc6Js3YBC+TZdjZVqhLa6kHRF25CCdAz4x0Kssc9qa+NGb
 JvsTiafA5UW8jGlrwuRzM7IkUHmhfcixJiiTH2ObmWfjics/eJpmYaG72pSki3VRWX1U
 59JrxLdKNfhVQ18FIDAbiOUbg+v62OzTsAVITyNYtjK2Qbmvdc8H13K8Adhv1u1DxZ6P
 52EuiXMwCN7++ZjqWlLldHEVnGjpFCTL1LKJqxFQx4QxBCI9pPzihG417gA2SLpD+jRs
 d4goiblSm4u6w32Xu8eGvDJMe4Zd/UAu07EfF2Ao2qj1jnYznkjhl0+qa//iWxhqKqA4
 0Unw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0ozITQ24C5/Y0Gxoo84ECI2meMKE1n44aSWbfuyAAfM=;
 b=EkYZ5N2QgtpTUds3SPeIBzJtEE3dok8L3W7EilAZQq+cemLJZdBSE4j9BjNPM1hPQo
 yuFUYWQgezTL1Y7u/JuSaXOeTaNNub6NOgYTf5mIRStEtF4PifsXWap8s3AdtS0gjGY/
 k09fbajSHxXJW591B7aHKT+By8fFviHQDUcdqY3vI+9BiTthdiO5taVXD8EwjRDsOi/r
 dklooXBDFWk0sJjhEzspBkdM4BAjYcSt8j1tl9qWYC0sOEKlhzx2IaTRKmOoGF4aA8f+
 CKf2L3mrRXPYTrjmXVupPlHd5Jp1IJx+z+JE8bkx/pfm/EpkhCF4VY2I2Fwp6Szfs7TV
 XBQg==
X-Gm-Message-State: AOAM5338YPFRFp7wNMNOJxfYFCD+VLcMfWTyHXewJslYPrxs8Id71m9J
 PoVO5KUFvXhv1w2mBVweYfC/ng==
X-Google-Smtp-Source: ABdhPJyDB4zIF0YGChSqRzVHYih7OhWd/ysiSg1M1F3Rdk68OKxQEsAibtYwCCVPZqJp7BC8025RDw==
X-Received: by 2002:a05:6830:1c6e:: with SMTP id
 s14mr573954otg.17.1615837786933; 
 Mon, 15 Mar 2021 12:49:46 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id r13sm7212980oot.41.2021.03.15.12.49.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 12:49:46 -0700 (PDT)
Subject: Re: [PATCH] Hexagon (target/hexagon) remove unnecessary semicolons
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1615784100-26459-1-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ef3a9f0f-7873-94d4-bee7-4b1519aab8c6@linaro.org>
Date: Mon, 15 Mar 2021 13:49:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1615784100-26459-1-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/14/21 10:55 PM, Taylor Simpson wrote:
> Address feedback from Richard Henderson <<richard.henderson@linaro.org>
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Queued.


r~

