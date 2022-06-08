Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8450A543DA1
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 22:38:14 +0200 (CEST)
Received: from localhost ([::1]:37550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz2RR-0002CV-3T
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 16:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nz2Po-0000L6-Km
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 16:36:32 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:40643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nz2Pn-0000M2-4D
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 16:36:32 -0400
Received: by mail-pf1-x429.google.com with SMTP id z17so19316521pff.7
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 13:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:in-reply-to:content-transfer-encoding;
 bh=kzioIfEAq+h4MU3hIWFLmIACptZ6QuXuyYqa0BMKlEY=;
 b=NYkDsXNG39ZpmwIaA65B/FmSME1m9/3KChuoUb4jrBhs5ebJ2f029NwrW0lz7ZPu+2
 ySyLET4/AGdOVGK25kq+lPtUj8o2t/uOTVntqETTfAtlJN3MGZW0R+5sS8EmMAsY91q1
 q+11jlfOszysy9NhPj+tU4j6EsiFmXTI+3404foLgQdYcyr4IjjHdVhKhJyTFMoaQPF5
 A4PCT2FnnxwHQN6so8vmjnXP2V39BjxfIzeKctMKWXjvjx4yLBShaM8WyyMjtFj/WNlJ
 2739BH6solAjYTQr+jprQ/7upWlhVOxisWOKluUvv5/DlDDcQbIrMrG0z3XdFX1tIGv4
 Zrng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=kzioIfEAq+h4MU3hIWFLmIACptZ6QuXuyYqa0BMKlEY=;
 b=Rzig+DDWZDx/1y2UezAagfIKNL9APHjlgyOFwP7ZswjRr+tuFHnARPxSsyan3D9pNG
 VJQij6N/iWK14iXETkte4qbXiEYfVyoGUG3fVHlILkid/ExGwdTbTxhIo2RWQ4K9nf5i
 qq7MprODlp9l9ZQzqwOUMr8GTENyTrV2a4U1ijBzVowbzA/E5wgOBQGpqmP2DCeL+70i
 SUBEgpxVQDyxjmUHqQBQE2w8tzRbwdsQkSL2HBzHiNSPNMdDb3gVlM2krfhMxUUz5w4O
 GcHwp555sU2nle3rJvbZ+52NjQ0K+MRzVtH+XD/ID9qxoWdSezD0ws8FklHlFdFIELDX
 pUaQ==
X-Gm-Message-State: AOAM53149AefTssRK3sjyCSfQa0i/SQljETGfs8JuQuEjEM5NTVkvaeJ
 JCLPD6yluDwZIZJGM2/HQ1Ffpw==
X-Google-Smtp-Source: ABdhPJzAAopIIRNRbGrdoMbRDsPKoGYfnEbXsq8laYBJZFkc+Y5HKMWqbbvRRkQ5xAbeZVpTUc64JA==
X-Received: by 2002:a63:3184:0:b0:3fc:5893:c866 with SMTP id
 x126-20020a633184000000b003fc5893c866mr31826000pgx.56.1654720588381; 
 Wed, 08 Jun 2022 13:36:28 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:4c43:7957:a690:ed36?
 ([2602:ae:1547:e101:4c43:7957:a690:ed36])
 by smtp.gmail.com with ESMTPSA id
 h7-20020aa786c7000000b0051bf246ca2bsm9786756pfo.100.2022.06.08.13.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 13:36:27 -0700 (PDT)
Message-ID: <17af101c-d8e4-0335-41d8-e54ae67e13a3@linaro.org>
Date: Wed, 8 Jun 2022 13:36:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 0/3] target/m68k: semihosting cleanup
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220607222616.717435-1-richard.henderson@linaro.org>
 <56b31126-41c5-e7b6-5b32-2b64ba1cce67@vivier.eu>
 <8f833280-b1bb-d4f4-6603-5be44ee8e9b7@linaro.org>
 <09f9a931-6873-bd98-74ed-e1d17318d76e@vivier.eu>
 <9c42516d-a238-a1d6-3f01-aaa8fc018eda@linaro.org>
In-Reply-To: <9c42516d-a238-a1d6-3f01-aaa8fc018eda@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

On 6/8/22 12:05, Richard Henderson wrote:
>> But what is the use case of semihosting on m68k?
>> Is there a kernel implementation available for that?
> 
> Not that I'm aware of.  Do you want to remove it entirely instead?
> Leaving it as-is should not be an option...

Oh, duh.  The "kernel" implementation is libgloss itself.
The use-case is running the gcc testsuite for coldfire under qemu.


r~

