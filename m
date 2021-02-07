Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C7E3126B4
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 19:39:02 +0100 (CET)
Received: from localhost ([::1]:39608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8oxX-0000vh-0f
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 13:39:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8owO-0000Up-JD
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 13:37:48 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:43030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8owJ-00021z-3V
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 13:37:48 -0500
Received: by mail-pf1-x432.google.com with SMTP id q131so8266746pfq.10
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 10:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=bIzcM3h3sDv1/YryOWDcENUYj5dBU6y8wRj79XTVLTg=;
 b=bEoIzE5lK/ELANq7aMDJCqBH2MX7N9uLYlXhp0HzsTU5gdFW805vjSqHXRE2T37PDn
 TN9ePyIx3CaQGgISn8Ltfv6ztq60qFf7UEQa97FoT43l904eLIBbIIaofRJf9BMu4CBK
 nhWWUY7JehpYxRubCBRpESeB9VV2lQSayZPOhpcCVhLVwPT502lpsE7Ud4+M8lFs155W
 7Jwc2GdpOEIsgbd8P975t4n3cJyCbEI/xIOsTv7NNayWk4/XKp4jSuX6IwaJ/KdU1VHl
 4HtZEKUAIJ169xYeW/r2dBtusdf5jxxlVhl1HtfQZ7XhFCED+zHtat1c30NeIIoQv+NA
 54MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bIzcM3h3sDv1/YryOWDcENUYj5dBU6y8wRj79XTVLTg=;
 b=FY85O63lazE9XdDAC+yGBpDnH/m67+Xpk7ZN+vx+1M8VxS6aCfp3vJ/yXD6T2VyDYM
 NUZ5c4RgoL9Cs4wEIYWA6N7rF9vCW9s4k9AiYfDxU0rFZvIGYToptW30y3K8NRLW7wbm
 BtoNT9A6VopO35XN8Lzmyui+XbRQRFPN3wQf8Vt369fdwvzWPKC2N3wQWFmrRTl31SVr
 BJmQvLwJuUBP4frPmNVUVuDvuFxLeBLlLImfs+wbAArH9Me+XBDjFxIuuMPDZPD02Shr
 Dk+AT4VAMcuEMtD0PIKSLVWIujOzscLpy5lhaToEr6+9RRigW2rHfkeGMdsApDBKHXgg
 JL2g==
X-Gm-Message-State: AOAM5306PEefc9KQsX10rYzyPb11NTRDc9xzyHEV5WHzyB/xTuQBP3vv
 Ad5xuHVs+oz5GeTLiU9oV5lQnMb/100o9A==
X-Google-Smtp-Source: ABdhPJwRXmnBs3aS9b1181lb0+Vdp6XqGOwjqQ0+Chh3qHoS/TRqRxkmEXe8alzZIqYeownadaCwtQ==
X-Received: by 2002:a63:3e4b:: with SMTP id l72mr13669797pga.139.1612723061359; 
 Sun, 07 Feb 2021 10:37:41 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 9sm15991931pfo.1.2021.02.07.10.37.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Feb 2021 10:37:40 -0800 (PST)
Subject: Re: Increased execution time with TCI in latest git master (was: Re:
 [PULL 00/46] tcg patch queue)
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
 <02ad8dba-48a5-b547-05ba-d7fa1150b1d0@weilnetz.de>
 <95d0b17b-b1ed-6b4f-f26a-69ec6a2e6e03@linaro.org>
 <e5c2d572-f4dc-62a7-8bac-c5968c3b6da7@weilnetz.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <343aa3ac-e8c5-48ca-7c50-dc8f6141f789@linaro.org>
Date: Sun, 7 Feb 2021 10:37:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e5c2d572-f4dc-62a7-8bac-c5968c3b6da7@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/21 2:50 AM, Stefan Weil wrote:
> Your latest code from the rth7680/tci-next branch is twice as fast as my code
> with BIOS boot and qemu-x86_64 on sparc64. That's great.
> 
> With that code I don't get any BIOS output at all when running qemu-i386.
> That's not so good.
> 
> Did I test the correct branch? If yes, I could try the same test on amd64 and
> arm64 hosts.

Yes, tci-next is the correct branch.  I've just rebased it against master,
which includes the first 30-odd patches.

What host do you not see bios output from qemu-system-i386 (I assume that's a
typo above)?  I see correct output on x86_64, sparc64, ppc64le, and aarch64 hosts.


r~

