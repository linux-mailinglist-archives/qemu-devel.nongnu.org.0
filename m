Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD844E5882
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 19:36:17 +0100 (CET)
Received: from localhost ([::1]:44172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX5qC-0004YK-1J
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 14:36:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX5kZ-00079D-Tj
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:30:27 -0400
Received: from [2607:f8b0:4864:20::52a] (port=36669
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX5kU-0003cO-5p
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:30:27 -0400
Received: by mail-pg1-x52a.google.com with SMTP id t14so1836846pgr.3
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 11:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7NkIskxhjyK/IrNVXYcRxW1RZghULoNclzQ99g4R/+M=;
 b=ngEAOYnU8+BnC9KBEayFU0InCCFGWb5zlyLSvADRa8Nl99u9ZA4FIsKdscthQkdR68
 weZkYgbzTv7wQIGlgynWF2e4RDNs5SvsDfpPbEyChtP83B17W7YUxMv/UDik/gV0rmfl
 BtDKO6DguGvlyYwC/+sqtJEFRJx7KPKcWoRSk0Bd0lLS5FkV6LRx1cr8f93BN3FhQkH8
 0btyhCppaWeaIrck1cpKAbxXVIy/UH5pKaH+BNftkABC6PYGLR8CVTbN5tEMq2nkPV9k
 NSF2gzyvscafShjp87UdmII/zRWn93VETOVtuCD+9xZbQXoYtNpAlMmQUa7N9HTaYRxi
 09nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7NkIskxhjyK/IrNVXYcRxW1RZghULoNclzQ99g4R/+M=;
 b=n209mx2siTABWuthIaitPzPhHfDdhgaa0fKQWQ/85PoxihzEE44w+LlIkFSKOVQh60
 yqfodCwVlwkp/kFUHLdT0+96R5133MSH7CNdT8/lGlqEyZRleWyEVakG4QVBoq09eQj5
 X6tM12duiAfdDtY5dHUP71q5UV9cKRcwqOOTRGAEV70RpgOUGDdDR0M1mrQNC2WXJv8C
 Fk33Ej3LNsJHoXF3Xn8nBiB++UAYE9APruWjPMWCTN1K3kSpY6LWvqsB+7JXhKuoF3P6
 PZDLddOG8jQKJwEWIGQt7N4+8ajNcTxLz/Lm44EmoCoQZziWp6VONg1/H/Lhxg7N/EFK
 nfpA==
X-Gm-Message-State: AOAM533PxZ+7SPgZsUIZ6glBk/ymqAEaXDLyqGbviPca4//xctKjTvpo
 P6u3Xz7WTUTUOpY6mRylzFpZ8g==
X-Google-Smtp-Source: ABdhPJzuZk4i+dHu4kNkV/IjK9a/iHnZQMFqaNDdQQ8VhQxgkoJ5XZVYAXAggAZT7fRd7vurvJA4Cw==
X-Received: by 2002:a63:445d:0:b0:382:6cc2:5ca7 with SMTP id
 t29-20020a63445d000000b003826cc25ca7mr903456pgk.295.1648060218006; 
 Wed, 23 Mar 2022 11:30:18 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a63be4e000000b00382800d1528sm452568pgo.21.2022.03.23.11.30.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 11:30:17 -0700 (PDT)
Message-ID: <27c90acc-4e53-1340-b1b7-22ee9720e9f3@linaro.org>
Date: Wed, 23 Mar 2022 11:30:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 24/32] include: move progress API to qemu-progress.h
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-25-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220323155743.1585078-25-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/22 08:57, marcandre.lureau@redhat.com wrote:
> +++ b/include/qemu/qemu-progress.h
> @@ -0,0 +1,8 @@
> +#ifndef QEMU_PROGRESS_H

All files must have copyright header.

r~

