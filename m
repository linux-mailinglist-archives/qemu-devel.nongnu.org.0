Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA975079D0
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 21:08:26 +0200 (CEST)
Received: from localhost ([::1]:33332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngtD6-0001wx-Gw
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 15:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngtAu-0000Q9-No
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 15:06:11 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:33497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngtAt-0005t7-1d
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 15:06:08 -0400
Received: by mail-pf1-x429.google.com with SMTP id n22so8886853pfa.0
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 12:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oqehHGE/ueEJr/PDo6QZi494sIXSzvCv/Gi/GNiDYao=;
 b=s9LR8XAPYsh31PxAkq+yzBWVdFY/tNLL5iGazYtchF3s/Soy9bGcVs9zj0SsbJ3BcG
 RJuriKjgW5Hy67o2HcTIYdogVbGN2wOzLYSBVy68si1v34WVgAEq2F8nH2J3iNc/248Z
 Wtgyml+D+b5vKEWqLzokHomx6kbRa9tvd33BwL7ZoaTjf7dI6dRSFEbc03r4i68iat1V
 oPUkdyff/CpsQglPja/nToOB2dnKfKkkehIFGy9YSq3gu3CTcEB06FGGMH8p3/E989B6
 K39ui3ihxiBxyJAWLehiNUM8NfE9BUBt1aIxHpuXLhOE5GMcaJ0qcXzPh2mFN7yp2Hss
 POQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oqehHGE/ueEJr/PDo6QZi494sIXSzvCv/Gi/GNiDYao=;
 b=W6xZunSM4LkQqGMoyBz1HrGu0/qZwUsoSFUhRS++Gj+CffEVP+u5JemTrd+Z86+CCx
 9hFlpGCTHP5iPcGAPDINgO3pFybBigrfSXj/7khgY3jjDdiCzhmANFsd9qD9brW33tQD
 gdi9Ax3zihZXF/CdXqhY2Emlh79LDwKKr8v+wOh2WPBCLDu+4qrjyVyWIH/VLby4iXLh
 OVBNvBVwJfjyl6x9bNwzFYc88YXNFcE08wxYqzb3oNayoOhzsioVjnLLcZAFbUMK+QzP
 /i028VAVs4IJtV8t0eN4qRlQ2XaqB7zsce4U3cWUUJR+i2Xflr6Klh31z8mwQPNhY56o
 7igQ==
X-Gm-Message-State: AOAM5315L4ogvq4RCMTm1Zkqp8GpeSVmzmJ4Z1jYV34GZlOKbxrycu+2
 ZaRx+846MkPaOvbPjlmzGTAk4g==
X-Google-Smtp-Source: ABdhPJzYHDLVEM4pDxX0kTDEFbCFSXrhvs3z416jpOluEoLrQsIELXm16keERw02Svz98D6xw8H+ZA==
X-Received: by 2002:a05:6a00:24c3:b0:50a:8151:9aa6 with SMTP id
 d3-20020a056a0024c300b0050a81519aa6mr9305108pfv.78.1650395134648; 
 Tue, 19 Apr 2022 12:05:34 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a62bd15000000b00505b8bad895sm16620471pff.106.2022.04.19.12.05.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 12:05:34 -0700 (PDT)
Message-ID: <a09a72ca-553b-72fd-d570-bb83f6f2c73f@linaro.org>
Date: Tue, 19 Apr 2022 12:05:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 18/25] tests/tcg: isolate from QEMU's config-host.mak
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
 <20220419091020.3008144-19-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220419091020.3008144-19-alex.bennee@linaro.org>
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/22 02:10, Alex Bennée wrote:
> From: Paolo Bonzini<pbonzini@redhat.com>
> 
> Do not include variables for the QEMU's own compiler, as they
> are not necessarily related to the cross compiler used for tests/tcg.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> Message-Id:<20220401141326.1244422-16-pbonzini@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   configure                 | 3 +--
>   tests/tcg/Makefile.target | 3 +--
>   tests/tcg/configure.sh    | 5 +++++
>   3 files changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

