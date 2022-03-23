Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C84A74E5A25
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 21:48:15 +0100 (CET)
Received: from localhost ([::1]:54446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX7tu-00010t-Ei
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 16:48:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX7sN-0000DK-6M
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 16:46:39 -0400
Received: from [2607:f8b0:4864:20::62e] (port=46732
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX7sL-0004cD-MT
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 16:46:38 -0400
Received: by mail-pl1-x62e.google.com with SMTP id w4so2685826ply.13
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 13:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+73ItPzcNOeokWhyN8RJCRTvEWkL/iECJKv8dAriwpg=;
 b=mx3m3b1tUxc+ywmFOeERRGDQOcu6PK5MmF+oz/ON1ua1cRQR8TeDQHUlMyKGY+ZRk9
 AjdZwBfUVXbNmoWFwQBR6WNp3BFwh6HPVz9Uw6ktYD7EtZQiQmAMQ2t62fnwQmx7ADk/
 GAaLVtgu5bO5eEWw80DBTRQ5t5P37swbYaiE0CKs34kmXfxuMvX461jOv0SwE5zJ1qIZ
 HWheIxfihm2cXJfu6dZcFpIm1RnHfbuK5+UFK8Gsftwp9Yoiu5P3DSS2LBZL71zkksJz
 TvEmcA9KTsqlc7p/ztsHXOFLnn/Czwm5BYtUihysgwyJmZydnA644cW8K1wvQyjV5o+K
 A6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+73ItPzcNOeokWhyN8RJCRTvEWkL/iECJKv8dAriwpg=;
 b=lUDivQC9RbcyC7/BX1ESZYfJqVEaK/uOdPej1iV9rWbNGB/0o3xw4Ao6u9y3a/dXos
 Cwlc7t+hs2ovndEgsl1hfIaERnZoB2vb52YsxfU16MkJmcZbL84DZfZl2LgYvPewajW4
 Q5yuaOEFJp/NMhMyrQrwXK5nnO1P7GI8QRlS2ag8k9uZXV0hZdB++aU3S4JGYj6mUc7m
 cNjuI5nMwkR9AySxb2IesJcz7rGcCTos2noRUZRVVRzc0GUIuywjIzcVfDIPjaUV8NB4
 TuPXBAu4csqVSa1Aq9nv6DwFV08mkb4ZHMsBUC3cFWT9+43LedVS71GXiZBS66ayhrhV
 ZViA==
X-Gm-Message-State: AOAM531TZu09hjkIQ1C55L+/ndOkgqigUXXQURw38IudB/8oMZDGouR6
 dHPZQ2dhE+aohlWKbfl7pjSrrg==
X-Google-Smtp-Source: ABdhPJwHdPaHj6lLyyYCV7GS2Gae+myjeNOozgJxIu2OeSjiMvOC3hXvs5iswq5F625LJIR3YuJybg==
X-Received: by 2002:a17:90b:3e82:b0:1c7:2920:7c54 with SMTP id
 rj2-20020a17090b3e8200b001c729207c54mr13918478pjb.2.1648068392835; 
 Wed, 23 Mar 2022 13:46:32 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a056a000b4d00b004faecee6e89sm15114pfo.208.2022.03.23.13.46.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 13:46:32 -0700 (PDT)
Message-ID: <3df76126-e4ab-7821-831a-c1a21e31fbc5@linaro.org>
Date: Wed, 23 Mar 2022 13:46:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PULL for-7.1 08/36] *: Use fprintf between qemu_log_lock/unlock
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
 <20220320171135.2704502-9-richard.henderson@linaro.org>
 <87a6dg4m2h.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87a6dg4m2h.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/22 10:22, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Inside qemu_log, we perform qemu_log_lock/unlock, which need
>> not be done if we have already performed the lock beforehand.
>>
>> Always check the result of qemu_log_lock -- only checking
>> qemu_loglevel_mask races with the acquisition of the lock
>> on the logfile.
> 
> I'm not sure I like introducing all these raw fprintfs over introducing
> a function like qemu_log__locked().

There's no way to implement qemu_log__locked with rcu.  The lookup itself is what needs 
the locking; the return value of the FILE* is then valid until the unlock.  To lookup the 
FILE* again would require more atomic operations.

And I do prefer the printfs over repeated qemu_log.


r~

