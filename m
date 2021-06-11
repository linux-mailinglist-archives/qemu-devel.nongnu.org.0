Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 692AD3A40CA
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 13:08:04 +0200 (CEST)
Received: from localhost ([::1]:42534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrf17-0006Pa-NB
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 07:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrezn-0005YR-Gu
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 07:06:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrezh-0002Ob-Ky
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 07:06:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623409592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z0xDiPXFFjStcUvDTfMCQL5J0pVkNoaY5Tg5Foz7DtE=;
 b=bvtbDvCWHYY6T/pPaVyEcSIYDi5G16g1lWRZEpDTs97PPdj3QHLt/73cEC8UrMwxsY993A
 vdDlVP99rdjw7CcY/1yIokvDhBGjFEZEERUhtGhCxW+I/OwEy6JKt2UOj+EcTOQMRk/o6O
 GamryDcLPEwyPV+3y7pdH2HUm+rFNiA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-ZBH_YosLPpyYwTgWHCadag-1; Fri, 11 Jun 2021 07:06:30 -0400
X-MC-Unique: ZBH_YosLPpyYwTgWHCadag-1
Received: by mail-wm1-f72.google.com with SMTP id
 n8-20020a05600c3b88b02901b6e5bcd841so1619082wms.9
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 04:06:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z0xDiPXFFjStcUvDTfMCQL5J0pVkNoaY5Tg5Foz7DtE=;
 b=WcHjaXBm7znD6jFIELL8+GR6rOd9HjffUqxAMxBEMeWUoJ03M94QZ6Kn4Mf/FWW/iP
 1d6n+FWOmOdM/8GYp+nHbCeX3NCN1BbuIQWSqTYnef5iw1LtZSnfuggymsWbBnTIOgJN
 ji5WQnuNs4sAbe7cCZtSSCMlBrYe02BFfWU1U7xEuf2lRHymKfe8p54k6/gLTu0VniXU
 fUcSg009/FaIQoi9ElUKkTf3/QTqdRkRkXVncbBsFbl6uywWcuSwoGndbZ2ba+a1GLyf
 SWrA3vQbtbHLg/1FwfgOJhKzLzV4LPpE77htlkkD2BbMKqHA8wyLHL+pQ+4mZYmzWltc
 OBCw==
X-Gm-Message-State: AOAM530CdkhtZ1wt52nYIhRvxxOyWrFlbWesLo66qJvRjgVVnrNCqxep
 +up4BWhFDboEh1neZQsUl8NH0QcWq9wFuXDR+CCOJfUzRiktLZaAQabEftuDRhPokPZwjskJIWy
 TQqL9VQDlN81Z3zs=
X-Received: by 2002:adf:cf02:: with SMTP id o2mr3345396wrj.365.1623409589648; 
 Fri, 11 Jun 2021 04:06:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzreZ59hqPbwc8oqHVLP6i1f51fnLdxV2g7sZ6d2ukGMbyhZO2x7DKrA0mc9wBdbFpIXdMxvg==
X-Received: by 2002:adf:cf02:: with SMTP id o2mr3345383wrj.365.1623409589481; 
 Fri, 11 Jun 2021 04:06:29 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id q11sm6436675wrx.80.2021.06.11.04.06.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 04:06:29 -0700 (PDT)
Subject: Re: [PATCH] util/oslib-win32: Fix fatal assertion in qemu_try_memalign
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
References: <20210611105846.347954-1-sw@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <dd332a3f-888e-a238-9ee1-f1651b630fe4@redhat.com>
Date: Fri, 11 Jun 2021 13:06:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210611105846.347954-1-sw@weilnetz.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/11/21 12:58 PM, Stefan Weil wrote:
> The function is called with alignment == 0 which caused an assertion.
> Use the code from oslib_posix.c to fix that regression (introduced
> by commit ed6f53f9ca9).
> 

Oops.

Can we replace '(introduced by commit ed6f53f9ca9)' by:
Fixes: ed6f53f9ca9 ("util/oslib: Assert qemu_try_memalign() alignment is
a power of 2")

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  util/oslib-win32.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> index ca99356fdf..7b318ea835 100644
> --- a/util/oslib-win32.c
> +++ b/util/oslib-win32.c
> @@ -57,7 +57,11 @@ void *qemu_try_memalign(size_t alignment, size_t size)
>      void *ptr;
>  
>      g_assert(size != 0);
> -    g_assert(is_power_of_2(alignment));
> +    if (alignment < sizeof(void *)) {
> +        alignment = sizeof(void *);
> +    } else {
> +        g_assert(is_power_of_2(alignment));
> +    }
>      ptr = _aligned_malloc(size, alignment);
>      trace_qemu_memalign(alignment, size, ptr);
>      return ptr;
> 


