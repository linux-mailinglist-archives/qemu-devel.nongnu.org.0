Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C810510D97
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 03:03:10 +0200 (CEST)
Received: from localhost ([::1]:44638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njW5C-0006XN-Ue
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 21:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njW2l-0004pV-3a
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 21:00:37 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:44965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njW2j-0000sz-Fo
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 21:00:34 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 m14-20020a17090a34ce00b001d5fe250e23so460573pjf.3
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 18:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ecdd9MhAthRJNvCDDwksVm+J9cRFuiN+z+frHOWxMkE=;
 b=hZ192mxNnD/dhWZ95R0Kmm33jV1l8YDS5VDgpqs+LTKHoEKlz/+TCIuo1QfG/GKnA4
 jV15fzIXoUtYdjzK0uFQnyIbcej0XnFrgFozAymYxvabdHbd0iOvc9zlmFm8nq13bO1r
 9EjspkE+ED5GvOAIXhVgbJvpU5XaqtEW1bMdDCu4+hr8oUvK27kUxx7rQdnYs22ky92G
 pUEQfyFL0QMLOxJ243FWsXPn/WKcsJA3N5fZyyzCae7u4Pquk/i4r+XhtI0lgRZTbm0F
 O2b956/dEaL2KgZqA44mymnatlvMphKwsTLHwDNACSOTRr5RaP9eigJuqDL0IytgCk1J
 cm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ecdd9MhAthRJNvCDDwksVm+J9cRFuiN+z+frHOWxMkE=;
 b=7vSzrCR1Xx44tB2cRHYihcBsxSusjy6AK7hy0hdRUykYdTWDMfOoEMHinh8xhrBo2R
 wgKFTNoORDzZ+Q/1LnFa065w50VWJCjO6umFRdsYyGdFpz1QvhcpOMWJeKW2w/Kd7G4m
 RiW4sJO2ctPLbDda6w5QEsNn1nQoWp7uOE54+kqLjAZumNfo0bd4QmKrW3IZTy/ntWiE
 TT4ZNOILZcK13i9RCjEqcPw5YVd4l1ZyXsUidUWixOYv8yQpEgjBkgBJoqyW6HRX2+11
 kIg53hP3m5bwLyoLz7QvKaOjy534USyWBN5lMUvR0sHtyIGsCRzyULXc3G5LMCVHrnUE
 07mQ==
X-Gm-Message-State: AOAM533KEMCbFxGCujGfKHySzPBaiO44isQK4gJSbyAQJKLF1WxHQZVF
 h9v+Z98AIjcFdfTG3PMvvSbSeQ==
X-Google-Smtp-Source: ABdhPJyxN3fO16uAmMfVB68/VGHb10kgvKuRDU0gaHM6mry7EW2RoZDhBS2ROR3ReF3RKJu1z6bm3Q==
X-Received: by 2002:a17:90a:5215:b0:1ca:79cf:f3dd with SMTP id
 v21-20020a17090a521500b001ca79cff3ddmr30609788pjh.6.1651021232155; 
 Tue, 26 Apr 2022 18:00:32 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i62-20020a62c141000000b0050d48b96bb8sm6645017pfg.22.2022.04.26.18.00.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 18:00:31 -0700 (PDT)
Message-ID: <2f98ed36-8384-9e7c-7a62-0c52156e7d6a@linaro.org>
Date: Tue, 26 Apr 2022 18:00:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 09/26] block: move fcntl_setfl()
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
 <20220426092715.3931705-10-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220426092715.3931705-10-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "open list:raw" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/26/22 02:26, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau<marcandre.lureau@redhat.com>
> 
> It is only used by block/file-posix.c, move it there.
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   include/sysemu/os-posix.h |  2 --
>   block/file-posix.c        | 15 +++++++++++++++
>   util/oslib-posix.c        | 15 ---------------
>   3 files changed, 15 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

