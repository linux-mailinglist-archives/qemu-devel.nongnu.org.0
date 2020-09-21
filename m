Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7AC2718D4
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Sep 2020 02:33:05 +0200 (CEST)
Received: from localhost ([::1]:34556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kK9lQ-0000tX-B3
	for lists+qemu-devel@lfdr.de; Sun, 20 Sep 2020 20:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kK9il-0008KY-0p
 for qemu-devel@nongnu.org; Sun, 20 Sep 2020 20:30:20 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:32967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kK9ii-0005NB-PA
 for qemu-devel@nongnu.org; Sun, 20 Sep 2020 20:30:18 -0400
Received: by mail-pg1-x541.google.com with SMTP id o25so2478034pgm.0
 for <qemu-devel@nongnu.org>; Sun, 20 Sep 2020 17:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=sAsDAkc2XvHXAao3VB9ec+iRXsZ+X8ERm90zQvN20+w=;
 b=AhmpkXszpbqbKVXhVXpD0xkkEWgzPhS/SdUh4pxaecyOE11L8312MW1Q8pBhpx18YD
 JOyvlVfsXpSQrw6iXdlTWBq/8NDZAaqtmT8h5+9Whc1s+7PTYVMi/Bkmr416tBErX4Fy
 1bTbjrTTYz6qIG05FMluROaIlTndXPC2XOJHaqGQDfKn9UvRZOi4ys30Ntnf/7uXYEO1
 Xas7LXLlVb5GdsHxGdJ+ZHHhRpU2Zv41n0FJkv7PcOQ72RXZOGT4BKKUkH0ILYhgwmeh
 4xC98SbPQNYX/4dA/5tebfto5ldvaxuP6FSqyU4BFdW5754+x+uUnroKYyCH5uDeF1zC
 8f/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sAsDAkc2XvHXAao3VB9ec+iRXsZ+X8ERm90zQvN20+w=;
 b=QHwF58IOOeGCAK64ipk3xgCTI05srdmBBqp4rTWTB7zuJWW7qD0HR9OaBpOmltBd84
 RiR5ydWz3bPqAzOPutBFiKwko+pwySPYmdqhFMCRp/Kdeo+0U+V8C155qVqbR2R+wGdJ
 wssanlr1A1qoH816qpkeIa7I2BaTf+KZH8brWAaTEC/scRokhk246QI+/xX8sTSfToFz
 crp1pOUpjS2hWUyP47vOWkRLIlch4XT0GsFOrbEIP5iso66W+BqnGk+lOHC+V4FXukp9
 cShRiJxQn3UUnKYU18nwqATe2ilNghBni8A/XkICPYkH+jq1n39HtfxoiJ+5Tod+ycJy
 BJWA==
X-Gm-Message-State: AOAM531d6GZKKVrtBJmddbPAblrnlXXV5TXP7IAPLRPaboDsCBQC8JGW
 BE0y++ZibYtEBte4W0lgTW66JeO4+Ym0BQ==
X-Google-Smtp-Source: ABdhPJwRHC2bilUjejpQtYi5i/zWwarp8djqDzkscHP2fQcLVgHJ8mYwgA0MNM61Dg6WjtC/Js4FPA==
X-Received: by 2002:a63:1f0f:: with SMTP id f15mr18050278pgf.312.1600648213534; 
 Sun, 20 Sep 2020 17:30:13 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id l1sm10168153pfc.164.2020.09.20.17.30.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Sep 2020 17:30:12 -0700 (PDT)
Subject: Re: [PATCH 9/9] default-configs: remove default-configs/devices for
 user-mode targets
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20200920130708.1156310-1-pbonzini@redhat.com>
 <20200920130708.1156310-10-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c1a5ec98-51df-da2e-7679-d1e5355da850@linaro.org>
Date: Sun, 20 Sep 2020 17:30:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200920130708.1156310-10-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/20 6:07 AM, Paolo Bonzini wrote:
> We no longer need dummy files to detect targets, since
> default-configs/targets/ exists.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


