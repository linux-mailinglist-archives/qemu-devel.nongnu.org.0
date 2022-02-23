Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FB14C2037
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 00:46:45 +0100 (CET)
Received: from localhost ([::1]:52796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN1LJ-0003gn-1g
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 18:46:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN1JC-0001ol-7E
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 18:44:34 -0500
Received: from [2607:f8b0:4864:20::1035] (port=56054
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN1JA-0003vE-K4
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 18:44:33 -0500
Received: by mail-pj1-x1035.google.com with SMTP id gb21so430936pjb.5
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 15:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=Bvd/1yYAbAjGvblVepNDOBOAkDj2/ZftCBfKQGXiTp8=;
 b=G3GGZ3UOVyOpEJH4LcGK17BXTvKsLDepGcM7neml32GoKzUwQLfAVLj7D/tElgG/JC
 NuRz9aA2Hd8K2rLYWsBnAnnfFwUPFjRvKb9VQwukEYtxlo6uaG4CNqGxy0ASkfYCacNb
 BmBknDKySsxNbB4/fyeobHNUb0A+l6mGoPqEvB3IvEMWw977wK1ZH07NanBCP48lNKbP
 ehwTngcsAVCqYOyVghsZATpm9Cmu9ckX/cyHDSI+MAo1+jDjSjVAE/JG8uYhRVK7GAeT
 4H3l3UoR3MzidNGxK8rzgbadytSxKlupt5H9Vkl6lTw/T3GSyFWVjAwFlVjWdy5B781E
 EvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=Bvd/1yYAbAjGvblVepNDOBOAkDj2/ZftCBfKQGXiTp8=;
 b=p86R13UMtGZMCZUxnQDpJp1aFs+HvN1r23ZSOqV6+B9exALaMQXBsE0pUAUyjVGSE8
 wwQnwtnuAEZLiKXKMo7rHzhgFnibSHCPJXpYDxVcjp/LbKP1nXWVY40h8JbWR2NBs+LF
 hRXUVlZpgLTV2Q671Rs4D+u84EL4TYYa88pYcmp4Xa6T0KMugw1bzYpeqHJeDNkMxhXL
 1nTvLxd4R6wUdckTnN1EFRWtZyIey6gNGALv6BignZcJADGzyFthXp1YynL6hQhViZ7o
 NmrxEl2sQ1OAolEzg0XTDE3tY1NeHBfs/DoP6RJzvNe828d16vrnvRkUdIyIcidkx7q0
 J3Bg==
X-Gm-Message-State: AOAM531aoY5p2I/xyxWA+Lb8iMpfYCn3Sj3eSKmHxzeVw526RCGfcGmM
 BnP778gZQg/aZgQ3gHaWWeSI1A==
X-Google-Smtp-Source: ABdhPJwduwuKLaYvoowm8HOJcB8QdJHySqeYsN30e9HvsTs/pH8TRxRN2dFs9nON98kjnVuuqP36Uw==
X-Received: by 2002:a17:902:780f:b0:14f:d765:b6f1 with SMTP id
 p15-20020a170902780f00b0014fd765b6f1mr1906532pll.85.1645659871099; 
 Wed, 23 Feb 2022 15:44:31 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id p1sm623024pfo.212.2022.02.23.15.44.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 15:44:30 -0800 (PST)
Message-ID: <6d3c7045-f99a-22d0-46e3-f1020f1297f3@linaro.org>
Date: Wed, 23 Feb 2022 13:44:27 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 3/4] tests/tcg/s390x: Tests for
 Miscellaneous-Instruction-Extensions Facility 3
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20220223223117.66660-1-dmiller423@gmail.com>
 <20220223223117.66660-4-dmiller423@gmail.com>
 <382e2a24-6483-ba0d-08d3-ced00173dc1a@linaro.org>
In-Reply-To: <382e2a24-6483-ba0d-08d3-ced00173dc1a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com, farman@linux.ibm.com,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/22 13:43, Richard Henderson wrote:
> Although none of this is going to work with .insn...

I beg your pardon, this is incorrect: .insn does have fields for the register arguments.


r~

