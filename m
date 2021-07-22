Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6A93D274C
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 18:10:07 +0200 (CEST)
Received: from localhost ([::1]:50336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6bGw-000816-Uz
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 12:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m6bFt-0007Eb-Qo
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 12:09:02 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:39834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m6bFs-0007qq-E3
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 12:09:01 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 o3-20020a05600c5103b029024c0f9e1a5fso1613319wms.4
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 09:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EpOCQBYdU7mz7vQvuvodLx5VuK85C/cL/fnfl1Ehe+4=;
 b=jgRm9/IEEuOJEydmq8X8SMhdCDFc8WxKETPBOHj05vemz8T1Z3w9PLs3GqAYzeBB18
 nKqCS0AqOp5Uy24WLJ8zEder52YPAOf6X7/VNRmy2q5FyzMyliDacXZB7NpMyv5NUgHZ
 hZ0aDBEAoLI+6QDl9MkTVWewN3b+3kOzG83UHa2d8FI2EPFtJaUxcC1KJCzOSkBBU/7/
 UrTpIEE7wmL5Cn8Dve6BklVKvgsCjUPZ+hKVBVDvf8HCZaSYMmHGeGmQAAR6OgXmAz4d
 cQfvQSef3ppVCSVNFtqy97jvd2KHxLbVDhJIv5bFa4KTanKT04/JT4gvJuH4CDmLEHca
 Usig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EpOCQBYdU7mz7vQvuvodLx5VuK85C/cL/fnfl1Ehe+4=;
 b=mm/0NwMYIOCmUckxdIs3eH64yfDKYe2L3EHf8GNJYQ7eLvx6YwDerxKXyaH7iNgnVC
 rBxpg23mFsg40TQG20/kmcnhdm+QLj+L0RlEnq9VVJlI+fAslK2dKj9Y3xFRY0/rVUqX
 O7O7KocB1UM+7upHHh7LnZuD09A4dYajeed+e9rduP/36f+qu+wFSTUKlX0/CnPKYNmw
 jussGlz9sevgLaSvdX68qBiBGpWF2/hX535JkGnNmm9FlnCf28akqIV3i4V21kH3XE4t
 HMVMzY/ysBI2d57D05YF/jQy5CesAFKwtDEWKQHRsfxozUgpGI8vqxvrMCcekA9sEXTg
 7kDg==
X-Gm-Message-State: AOAM533RK3PynopBKpmnbEMgLjirwEsh4gcxMLI1YqYLGvKEJqpbyQri
 wCqP/EWcHWilWdIqj4hFgW0=
X-Google-Smtp-Source: ABdhPJwKIb7lzUzBApJvL3WekPVC9VA0+3ySXP7kzcqEeluFSkK/8mEYvm/QQbuddP6Ez3G2lMmnTA==
X-Received: by 2002:a05:600c:1c08:: with SMTP id
 j8mr364487wms.50.1626970138514; 
 Thu, 22 Jul 2021 09:08:58 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id f2sm30206941wrq.69.2021.07.22.09.08.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 09:08:57 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] coverity-scan: Add accelerator and sysemu
 components
To: qemu-devel@nongnu.org
References: <20210708155735.1805767-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d5b87a24-5fa3-eb9f-4105-76342f24f790@amsat.org>
Date: Thu, 22 Jul 2021 18:08:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708155735.1805767-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.203,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 7/8/21 5:57 PM, Philippe Mathieu-Daudé wrote:
> Add 'sysemu' component for issues not related to TCG.
> 
> Since v1:
> - add accelerator components (Peter)
> 
> Supersedes: <20210619091342.3660495-1-f4bug@amsat.org>
> 
> Philippe Mathieu-Daudé (2):
>   coverity-scan: Add a component for each accelerator
>   coverity-scan: Add 'sysemu' component
> 
>  scripts/coverity-scan/COMPONENTS.md | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 

