Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 874674D21F1
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 20:50:51 +0100 (CET)
Received: from localhost ([::1]:47372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRfr8-0007Sl-B4
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 14:50:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRfpa-0006my-9e
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 14:49:14 -0500
Received: from [2607:f8b0:4864:20::433] (port=43964
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRfpY-0000OX-Ki
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 14:49:13 -0500
Received: by mail-pf1-x433.google.com with SMTP id d187so263591pfa.10
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 11:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WsFbymmY7wRV7NzaQoiLLcpqD/+gsTRU2MDxWxyLreU=;
 b=gS/fD0WCicgabs4v4NVahAKmJwLkj6p9vbSdVG3frhvzy6kvmgUlOs+9TL63SWcsQm
 ag0LgHz0ipjpKIuxcKivKnHEGC6p8Enh5BmZ+brjaXXzuoigks9FLxx29v5q4j63E+kt
 2eT9rBBGLIp0FfqYzJpXuIslPDxqOx9W5NP7pmlE0YzANUOmmoDu4u7QKaiXz4EFw8yv
 IDCZnfwmPSibva2AN0eRkHZ4iHrn29itP1j7S+yW2gMIsxoyrxE3KltDAjwHi7fim09c
 GTFbiZlMPdZn59mAjYPvhk3jwOn7J27bRgkyWWO7DeYgL9hPdRI3wsnQWvIPGwAg0hfg
 rZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WsFbymmY7wRV7NzaQoiLLcpqD/+gsTRU2MDxWxyLreU=;
 b=fSM4rLcU24jwLMDU1+Qbq4vKA70HjSysgcwykCse8OJhSyChvG468tV8G4sBSHPbTA
 DOpVyxxuRwKBOPFHQJ8S5VauH9EEw75qLkD52pKZfk7q2lmgbTzeAH6xehN0JqIsjKaz
 04qkpMGO20vkwZNE6CkjEG0812RsY9shS7UESoMvQ1zfZXZekcUqvs1oA3aoJDDO18ch
 g9eTweVknRwSjBbeV3BVcbecik0WzD+r0TzfNkHwilWYBCquhN66vmqaVhD84zFUY8vd
 /iKgg1qcm1UUpMTa8iQx0IQei11Ht7dbzlq2Hhj6EwECUJrl2AgP+FI0B0Vz6pBxkOBC
 btxA==
X-Gm-Message-State: AOAM532Wzl3d+jNSSWCvwFT1Ttj+wiTsWwggO4vNaRW6SM91hYXmgNtb
 Ax8Z8Y3WRsWQ6LRm/szEC01Xeg==
X-Google-Smtp-Source: ABdhPJyVPwWgLN7R2ze5VSjqTGJ9ZTNL9n81dapdgOwd0QQ99/GGvnLUGSsy5/XUFfuRz23JWqj1VA==
X-Received: by 2002:a65:6d0a:0:b0:373:9242:3a13 with SMTP id
 bf10-20020a656d0a000000b0037392423a13mr15999255pgb.452.1646768951306; 
 Tue, 08 Mar 2022 11:49:11 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 f15-20020a056a0022cf00b004f3b99a6c43sm20866153pfj.219.2022.03.08.11.49.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 11:49:10 -0800 (PST)
Message-ID: <0da08a42-dfd7-ef7e-3f99-34fd1fb8f22d@linaro.org>
Date: Tue, 8 Mar 2022 09:49:07 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 17/33] target/nios2: Prevent writes to read-only or
 reserved control fields
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-18-richard.henderson@linaro.org>
 <CAFEAcA9MOa_GfzYM7PmhspY_4kaZhFpZ--eJdny7jf8b=WpQUA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9MOa_GfzYM7PmhspY_4kaZhFpZ--eJdny7jf8b=WpQUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/22 00:57, Peter Maydell wrote:
> On Tue, 8 Mar 2022 at 07:20, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Create an array of masks which detail the writable and readonly
>> bits for each control register.  Apply them when writing to
>> control registers.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> What's the justification for this extra machinery? Does
> existing guest code rely on writes to r/o bits being ignored ?

During review of a previous edition of this patch set, I asked myself: why isn't Amir 
changing the shadow register set on WRCTL to STATUS, as the CRS field could change.

The answer is that the architecture disallows this, by making the CRS field read-only from 
software.  CRS can only be modified by interrupt entry and return.

Then I looked further and found more read-only fields, and lots of fields that are 
reserved unless the appropriate cpu options are enabled.  Again thining of CRS more so to 
PRS when shadow register sets are *not* enabled -- we don't want software to put us into 
some weird state.

I probably should have put all that in the patch description.  :-)


r~

