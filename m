Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDA7440DBD
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Oct 2021 11:13:26 +0100 (CET)
Received: from localhost ([::1]:45962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mh7q9-0000jA-P0
	for lists+qemu-devel@lfdr.de; Sun, 31 Oct 2021 06:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mh7o6-0007mV-AE
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 06:11:18 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mh7o4-00072t-JQ
 for qemu-devel@nongnu.org; Sun, 31 Oct 2021 06:11:18 -0400
Received: by mail-wr1-x42d.google.com with SMTP id v17so23747738wrv.9
 for <qemu-devel@nongnu.org>; Sun, 31 Oct 2021 03:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OQCy/vnFXWkfN3oDw/8FRYGDYDpFh6vrxVKOVAVaKPA=;
 b=BSq7wr+GgswyaydUf1VlWn9yhIBy0ACoUZSazJrkAoE4qMcN4Ga27ZJmTT2aBlBnU2
 51uIZCHXnzhclQ63x9nLyapI17+PgJETufMY2r2+InZDmMZbSznz8Qb5EjxGSSNdcbzR
 8Xuw+mcFlTz4fDvGrcqevALyJlh+y1VWeJ8ujgHwZ71hK3iFLB6B2u3HCiAtboPjyMS9
 MKKDboPacf2K5ZMGQdgDwniRm2l4v9Mqxe0tMah67besIqpIWjWKuexKWn/NBzsSnA8y
 r51Tm5+/bplysZ8jpYItAc1E+A3TCr+vjZw15vHM9UcRdFKIoHy+B6J36z6OyLtyqRT3
 EwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OQCy/vnFXWkfN3oDw/8FRYGDYDpFh6vrxVKOVAVaKPA=;
 b=Qn9BWRn80kSvIip3XTblcjLuaJnv60iotMEeMaiQLvJK+F18kBc3TCGteRQTZzv4sO
 zXYDwT6RLcFpVpEHQ+AQWFiIsfouWzJvklCASmSXK20CKUIqZp+9nf35YJcECJoQTP2R
 JZDhaQp0wxC+rU62TT9/9xOm4KVilFjnQVJwUbB1JoOYS2WsvYz28lnL5jzUBExRoA8l
 F40EqlZb0Ycpgd9/w7XU4CIkVXIFe+yCIuF4elEWSmcYYVUQAYZEhZBU0HjM/lyoQu+g
 9MKklkKem5DqDnf7xPWT6EXMI7ej++MlFv8F0WfJl4/qMFJ5InjYtgu+zQKorP94GC3L
 a1Rg==
X-Gm-Message-State: AOAM532bkqbUZEPVtj/nLjnrmREVvwIdgnx0ctXcJJRyohAJS6+0iK4O
 2AsA0o9Do32/zGIw+pZbIqk=
X-Google-Smtp-Source: ABdhPJxCgCklGtqhFnHt4Ey0u9KCCSL+Q/djsXt5Reztx1vf/hZNa6Vt+U3M6K69i642RFunn5KqHA==
X-Received: by 2002:adf:fa8f:: with SMTP id h15mr29336913wrr.323.1635675075189; 
 Sun, 31 Oct 2021 03:11:15 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id f133sm7609585wmf.31.2021.10.31.03.11.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Oct 2021 03:11:14 -0700 (PDT)
Message-ID: <9bb3337c-35d9-5ef2-038d-5a2d43656286@amsat.org>
Date: Sun, 31 Oct 2021 11:11:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 32/66] linux-user/openrisc: Abort for EXCP_RANGE,
 EXCP_FPE
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
 <20211030171635.1689530-33-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211030171635.1689530-33-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.426,
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/30/21 19:16, Richard Henderson wrote:
> QEMU does not allow the system control bits for either exception to
> be enabled in linux-user, therefore both exceptions are dead code.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/openrisc/cpu_loop.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

