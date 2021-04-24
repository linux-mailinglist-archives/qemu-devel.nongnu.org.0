Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A378736A280
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 20:10:32 +0200 (CEST)
Received: from localhost ([::1]:59972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laMjf-0008Ii-Ow
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 14:10:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMht-0007XB-Jm
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:08:41 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:44789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMhB-0006gt-EG
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:08:41 -0400
Received: by mail-pf1-x42e.google.com with SMTP id m11so36214458pfc.11
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 11:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lQsjG8gWOgTGRe0XOIPy+lcabKSfBr39HmQl0aBBPBc=;
 b=IQAtFV/9VOSQ0SD0jPEabVwAwMgk7EsD15GrKErlwymGmRN9D41L4yp7OW6dJM/Hm0
 F6Pt+5CvfmRY1MyYXnTa92kV2T34HLgZr3KLUf7C7bPEkkoWZkKDQRAXk19OFW5d+gtP
 cSQ16QR7ir6Cu3ilfvajiXBNSXTzhpqBh0mIi885TDf73wnDKzSrYQLl0m3eKvKWdhsu
 IbC7UqOWXqHboVeBbKWnnDgkWeC0aAWor+ACpAyb/hK7E0IxRqZhIKLR6yGSXs8Qg237
 vXG5WkuOZLxqZUttXooY5o4K7EyriLRD00JB3DTd5XENwwlhpO/K3MG5CdAHNlu62W/U
 cA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lQsjG8gWOgTGRe0XOIPy+lcabKSfBr39HmQl0aBBPBc=;
 b=oRrxN9omo7Mqk1LZnAksZ61akHdhlg3PIwrzcvnmNHyY6QGvGB3lvx2IVrtLdWxcO1
 6hOWSf08FgIgOxbsmJV0AU6nBf0Jfb1VZ5nwa6Zv7Z9XBESVPpc3zRpDhRPNmppENXtk
 bG6O4582iW5RaYo0P85dRkyJCFkBh0fK5J1mDgjr4CR+nByJRVgCXrHu+ZbAjnvH6k6G
 GU3cdMjYdwKGgWyymUUXycH2ibV2cfpc+9WkaU2tcSGXDyBGLS9YxMV52M+Wk+SWR1Ui
 kz/tGeWi4epaN1GcVoYmqv8Juo+XSORoAYTh7OfKfH9oGSPsO4d+HcnJb3oftnD84KUL
 v3Dg==
X-Gm-Message-State: AOAM530rXewQWcKeqWuVHolBENqqZu+oLh8pLKyOOAz1YnO2MxFFHxSj
 aSPb1UujO4IzI7z6hq6V8TTX+v/XF60H9Q==
X-Google-Smtp-Source: ABdhPJwTv+YMDVjaKKLu6iE8ig3U8+L0TvbT42oehuKDnXLPdFpeJvbOIOousrLAEMiSPQnIqAhuJg==
X-Received: by 2002:a63:1357:: with SMTP id 23mr9501379pgt.284.1619287675869; 
 Sat, 24 Apr 2021 11:07:55 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id w21sm10545726pjy.21.2021.04.24.11.07.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 11:07:55 -0700 (PDT)
Subject: Re: [PATCH v2 33/48] bsd-user: style tweak: Use preferred block
 comments
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-34-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e9f369bc-3d44-49dd-6e04-21796d443e97@linaro.org>
Date: Sat, 24 Apr 2021 11:07:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-34-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/21 9:00 AM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/qemu.h | 74 ++++++++++++++++++++++++++++---------------------
>   1 file changed, 43 insertions(+), 31 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


