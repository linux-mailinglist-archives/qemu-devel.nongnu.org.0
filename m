Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A2838F4B6
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 23:07:05 +0200 (CEST)
Received: from localhost ([::1]:33704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llHmx-00012W-A7
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 17:07:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llHlA-0000Eh-8k
 for qemu-devel@nongnu.org; Mon, 24 May 2021 17:05:12 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:40537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llHl8-0002dr-Ln
 for qemu-devel@nongnu.org; Mon, 24 May 2021 17:05:12 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 ml1-20020a17090b3601b029015f9b1ebce0so2662224pjb.5
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 14:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=O7XSdiAwO8bPsGZV5pAAdwaHuCzqFznnKZPsTSQTrLU=;
 b=IFXsNZkQFnKkc1FrEC/bSibAESNjpDve1sXbqz+CH/AX1aaMXd1PGveD0xomtfU2vz
 v6Xn/+OqJzmtU8qjPptpKtDVVOeaPvrUEcznncuIaNywMKdCnb4VhPYTv8mrjrYEG8Bu
 MWkKnTpxA0EVXNA4nHX3QVCjttLQu6+t0KwKCu+qMXZCqEBUh8+xnQKmkPvLwGVWsusk
 cHDSZ7uAiHBrQfrQtYNcVA+MtsPbY0mAzV/8HpUglgspi//CoiItBbXeRujUa9pb0eXX
 VD0CA9bX/YSEOjnrN6oKJL7X2K7yaRyW+jgtDo9sISzzAO2P3BK4r3nvV3O0iLSVF5H+
 aDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O7XSdiAwO8bPsGZV5pAAdwaHuCzqFznnKZPsTSQTrLU=;
 b=mTb0OdzPe3iOIcluSWjQoMEtNmgJ1ubT8kO7wvPjkKc7/pNCIJC2wuv82hZwlgud4I
 ZCCEM7h4TD70LghU+rn89vaq8ytQGboKej/ykBUo9srhqKJAAdx6HnP/1WdEJdN7ye/g
 Sf4FFH6+YjxXmrzy8Gveq+L+/lcOCE4iVBR28fG1FCh4gct0QaC3yov4Cqb4tdiI3IA7
 4uWR9bLJQUEQZtuUbY/hNb6BRXZFrFIfwDMaGFb9jPyzDms/XNBrozmFHKw3dkXmKzb1
 A70Xhc3oMWaIq+MMcbsZc54yNKXiirdksVFwp9Wd7NZSWa1kMrf8Tbpm5d3xV1sGQ60s
 XanQ==
X-Gm-Message-State: AOAM532/6oK9pq3rc/h9pmsGOjrj5D1iLg78i4tNO+RZWVg63M4+BcLr
 NdI70MRi4uonSpaFA4SaDmQOIA==
X-Google-Smtp-Source: ABdhPJx2kDkDGh8AyEVgJghQIfcgzA2vl+L26hS0VBSdNHk9GnjEIhA4XI/PHYeJncRDI+JR5eKY3A==
X-Received: by 2002:a17:90a:f2d1:: with SMTP id
 gt17mr26641947pjb.95.1621890308973; 
 Mon, 24 May 2021 14:05:08 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 h76sm12593098pfe.161.2021.05.24.14.05.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 14:05:08 -0700 (PDT)
Subject: Re: [PATCH v1 1/8] tests/tcg: add a multiarch signals test to stress
 test signal delivery
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210520174303.12310-1-alex.bennee@linaro.org>
 <20210520174303.12310-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1da1030a-f9c2-bc9b-88de-9bf3b80fc53e@linaro.org>
Date: Mon, 24 May 2021 14:05:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520174303.12310-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/20/21 10:42 AM, Alex Bennée wrote:
> This adds a simple signal test that combines the POSIX timer_create
> with signal delivery across multiple threads. The aim is to provide a
> bit more of a stress test to flush out signal handling issues for
> easily than the occasional random crash we sometimes see in linux-test
> or threadcount.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> 
> Message-Id:<20210504100223.25427-29-alex.bennee@linaro.org>
> ---
>   tests/tcg/multiarch/signals.c       | 149 ++++++++++++++++++++++++++++
>   tests/tcg/alpha/Makefile.target     |   7 ++
>   tests/tcg/multiarch/Makefile.target |   2 +
>   tests/tcg/sparc64/Makefile.target   |   7 ++

Alpha and sparc64 should be fixed now
(since c313e52e6459de2e9064767083a0c949c476e32b).


r~

