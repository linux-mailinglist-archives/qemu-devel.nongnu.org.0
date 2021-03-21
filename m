Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1948E343407
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Mar 2021 19:25:16 +0100 (CET)
Received: from localhost ([::1]:35556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lO2lG-0000R9-H5
	for lists+qemu-devel@lfdr.de; Sun, 21 Mar 2021 14:25:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lO2jH-0008Fh-FI
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 14:23:11 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:34553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lO2jD-0000F8-Gc
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 14:23:11 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 k14-20020a9d7dce0000b02901b866632f29so13764562otn.1
 for <qemu-devel@nongnu.org>; Sun, 21 Mar 2021 11:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Pj1PAyxsiuUEPDDgb2yHswzTVjSTyuDVe+SG0k7qMU4=;
 b=bsOTQU2+MfPaiGGGjEvk1gQvM2hai+UDXAxSqYtBrQ+un+ZfPCdOyJ9lSyrq6l1ev4
 2XWm2FklY0hA1PL0WeKe0R3eVSPLB8jtu1D0H6s3DHPKhTH6UkqFHwa8MkWnP8AYZsQc
 2lhem8bcrqu3JD4klKaSBSYOAxK3lxo9MrXOLIN0IBL32kPC4NS5sh1n0/Pel1ATCWaI
 Q246ivLbCrT8XJwOBDKEijvbijCjlbx4OtNcOapBZNn1UTsRW9S4X+u10WqzOhq7hjXF
 XSEXP56RpzzDvrukOf/M6Ym/Ln64G/+Rvs6koG0/MYsEf2SmAShiZwh/cFVhVUsf8bGX
 DPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pj1PAyxsiuUEPDDgb2yHswzTVjSTyuDVe+SG0k7qMU4=;
 b=dSTsxhJ5xgs0AKq8MKiOQfMBvKF7qIoqMx5qjqCOUWwAITjqy/j22KaVkQtsEImBlm
 WornXjdwmZWqYAzCtYDzyKVsxYe8A8x+7QxyKjwPCve8clc1OHi29+k39aodML2xetBl
 vuReEnVL/0+9v+V4MwvDNarf/Pts4JunwmtO9dF3raswCv0cFmUV5eH7mzdz6v+9mwy/
 blpn3M7ZxDKGBo0wejmw0C07FkNzmnVFpJidxjOmPw77uhf5Zfk04Zg/iRI50L4bh6Ow
 xlDWYRPH/dsY2/dQwZSQ8yB8JUqFQrx2z4lwNBwu1tIfTBGd62nB1bxLQf2ZQHeusm+R
 Lo2A==
X-Gm-Message-State: AOAM5332gMSaD6rBBJJv+CX+hN7YzBfKG81BdrdpJFlOA58GzTHhWEPC
 JtVnAJznLRoQdadVKq65XMiDlg==
X-Google-Smtp-Source: ABdhPJzbTELCQ7oaCe7WXX3Vwh3GlmN03pyiin3zbmCcDpV+KwVWhhA5deebIwjRbzJVi8uyTvCYXg==
X-Received: by 2002:a9d:129:: with SMTP id 38mr8803443otu.50.1616350985590;
 Sun, 21 Mar 2021 11:23:05 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v22sm2568508oop.4.2021.03.21.11.23.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Mar 2021 11:23:05 -0700 (PDT)
Subject: Re: [PATCH] configure: Improve alias attribute check
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20210320042753.69297-1-gshan@redhat.com>
 <5a6e5d96-7b23-7a56-3096-fb80155cac26@redhat.com>
 <107a73a0-aafe-bfce-7c28-8ed5fe6c022f@linaro.org>
 <4c8d854e-a8a1-2a44-5a02-96a5ce5598bc@linaro.org>
 <CABgObfafUvCAriWa+mFQKL=Js4GGuMrNr3Gw8v2Z+Z=J3xT7XA@mail.gmail.com>
 <fefde0c1-5670-7cd5-4f7c-ab11af6aeb62@linaro.org>
 <CABgObfbG701a-_TB2v7irYe1DpPY-_zExgJ4SPMfyUEJD_2uXw@mail.gmail.com>
 <CABgObfazrLonuARgBUOfOC-13qQ4riKQx14x7uDbWnVba9xzSQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0cad2de8-1150-be7c-237b-9f3ddea52473@linaro.org>
Date: Sun, 21 Mar 2021 12:23:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CABgObfazrLonuARgBUOfOC-13qQ4riKQx14x7uDbWnVba9xzSQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Aldy Hernandez <aldyh@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gavin Shan <gshan@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm <qemu-arm@nongnu.org>,
 Shan Gavin <shan.gavin@gmail.com>, Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/21/21 11:46 AM, Paolo Bonzini wrote:
> HRM, what about biting the bullet and making exec-vary.c a C++ source?... Then 
> instead of making it conditional an attribute((alias)), we make it conditional 
> on having a C++ compiler.

Doesn't help.  The gcc bug I filed talks about c++, because that's the closest 
analogy.

But set_preferred_target_page_bits is called *much* later than a constructor. 
Though still before any use of the variable in question, for which we have an 
--enable-debug-tcg assertion.


r~

