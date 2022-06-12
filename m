Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA2D547877
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jun 2022 06:17:41 +0200 (CEST)
Received: from localhost ([::1]:54718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0F2i-0003p3-E0
	for lists+qemu-devel@lfdr.de; Sun, 12 Jun 2022 00:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0EyJ-0002uL-U1
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 00:13:08 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:36692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0EyI-0001a9-AZ
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 00:13:07 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 u12-20020a17090a1d4c00b001df78c7c209so5837589pju.1
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 21:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Eh9/sfeIGMlI1yqYXzPWViCqf/c+0/5AiTnG5vsTq4s=;
 b=nNdbMDPupJ+fglNxUdqr2jByCy5R/F258ziMQANn9bPq1V6xv5ShD2ejDHUotXkIR/
 Pd2sP/8KICRQjfq4Jkke4CuAQydYYakTEKZLloZH//qmkPiTSy8+2Q7yP7rUCsMvUubj
 owz5n5v90dIZ+jPnT6P2n2DdJKaDJ99vw9y3+uu7dIyGlMKOI84AgfaqydU0NUVzD4Ro
 bmpYxNRX+7CVjo2U4qVYkK+Ck+jCG8r4jxVjAZW1Yfp7dD8qdOdtvXEZYzFgzCvR/ibt
 cVl2GkXRPyN335GTjx2DhutEIDmHj9rjMsYFN53fG2h2l74jeiDy0F8dPCOYX77QB3QL
 EBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Eh9/sfeIGMlI1yqYXzPWViCqf/c+0/5AiTnG5vsTq4s=;
 b=ZgJshIYGQbTZ7eIZV1w1q+AWbU8TrpI7dB4P5CRGo1kJec5aadYfWK6fqC09DsVFIy
 P4KmPVa3HUloZ8mSGN+CmzCni+LHbvdCfA+nmxhaSM8z+6lRqeBkLTFVpGuvK/yfN3Hi
 Ta+frhb9vfR9ex5oVosCBiul0AlsRF4R/qgjFeU/EcnDFy/4/3pwcWGQcVOHxMAqJjz1
 dm1jbqgYe616Wddx5AlUBK2UsCLCd97uF4C4YR4MZyc51XXZ5zvzMd5t345CdgghgO81
 GWpEo8O8G5dY6QYcOY/QTKIWJIR/LFU1dq7XlU/0H9PHTTXM6qv17MLXcfZGW1Ll/bqr
 iBTw==
X-Gm-Message-State: AOAM530Lgr5Vz9R5i9LLsQEUOryQeCjEmRbYYE6u2bjCt2NDGK2ssgP1
 N1uFMsn4i/BkybiJ4S3GqinQCA==
X-Google-Smtp-Source: ABdhPJwFJ8gexB0UbT4hY7g3j55XTR0H70l3+Ps64SYqVrBW1qYaHukQRdGpj5HM+owzyg2FRfdcfA==
X-Received: by 2002:a17:90b:4a92:b0:1e8:2ba1:64bf with SMTP id
 lp18-20020a17090b4a9200b001e82ba164bfmr8208379pjb.41.1655007184395; 
 Sat, 11 Jun 2022 21:13:04 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a170902650a00b001675991fb7fsm2284468plk.55.2022.06.11.21.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Jun 2022 21:13:02 -0700 (PDT)
Message-ID: <a4c83d84-25f5-13ee-5e36-a2fba2b17a2b@linaro.org>
Date: Sat, 11 Jun 2022 21:12:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 0/6] Bsd user preen 2022q2 patches
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: def@freebsd.org, arrowd@freebsd.org, Kyle Evans <kevans@freebsd.org>,
 jrtc27@FreeBSD.org
References: <20220611135514.92882-1-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220611135514.92882-1-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

On 6/11/22 06:55, Warner Losh wrote:
> The following changes since commit 2663c41cfa2c3be34c62de97902a375b81027efd:
> 
>    Merge tag 'pull-target-arm-20220610' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-06-10 13:16:48 -0700)
> 
> are available in the Git repository at:
> 
>    ssh://git@github.com/qemu-bsd-user/qemu-bsd-user.git tags/bsd-user-preen-2022q2-pull-request
> 
> for you to fetch changes up to 9554d33076771dcc284dc3fa1a87cd0e24b91d9d:
> 
>    bsd-user/freebsd/os-syscall.c: Implement exit (2022-06-10 22:03:50 -0600)
> 
> ----------------------------------------------------------------
> bsd-user upstreaming: read, write and exit
> 
> This series of patches continues the effort to get system calls working
> upstream. This series was cleaved off a prior series to give me time to rework
> based on the feedback from the first time I posted these. read, write and exit
> are implemented, along with a few helper functions and tracing.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Warner Losh (6):
>    bsd-user/freebsd/os-syscall.c: lock_iovec
>    bsd-user/freebsd/os-syscall.c: unlock_iovec
>    bsd-user/freebsd/os-syscall.c: Tracing and error boilerplate
>    bsd-user/bsd-file.h: Add implementations for read, pread, readv and
>      preadv
>    bsd-user/bsd-file.h: Meat of the write system calls
>    bsd-user/freebsd/os-syscall.c: Implement exit
> 
>   bsd-user/bsd-file.h           | 163 +++++++++++++++++++++++++
>   bsd-user/bsd-proc.h           |  42 +++++++
>   bsd-user/freebsd/os-syscall.c | 217 +++++++++++++++++++++++++++++++++-
>   3 files changed, 418 insertions(+), 4 deletions(-)
>   create mode 100644 bsd-user/bsd-proc.h
> 


