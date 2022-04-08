Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8454F9978
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 17:29:08 +0200 (CEST)
Received: from localhost ([::1]:42392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncqXr-0007QD-4u
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 11:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncqWM-0006ci-3o
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 11:27:34 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:56121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncqWK-00066X-2x
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 11:27:33 -0400
Received: by mail-pj1-x102c.google.com with SMTP id ll10so510162pjb.5
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 08:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0aLaRclTWevsKQjTpmn/3m0akbziT0JdASgI8bN4of4=;
 b=G0M+a3TXZwqnnOck/rj58iUonxXcIusHm9WxPP6Y5WAm4TUJPgKS4Zg2AQug2hUqQR
 b4o2B5m1qz1EhYt19nAW/xAUqvA6enTIqoVJzhtkbob7MSvm+TH+s5zFLMD06tJzBJkk
 H1IUOUCSxX14VfGM//Z2AcqIKkN6ojFg9jynaEVRURGWfMW1xjukQfFqrEWi3Dx4/jqf
 F/raaZ+UWkXKU3PWJTE9Aj62ZAmWWTEVVQVtxeOPlhq6jWrZotPadaDcAjbtJaDlxzzO
 NctqQSoUHzXL9VrdTmBy03Jr8MkIPq3K7G/e0CVnjGNBjU497t4uTQr6MHu64BpbCG1W
 8lrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0aLaRclTWevsKQjTpmn/3m0akbziT0JdASgI8bN4of4=;
 b=Dyj8UvwkVCMZyBKLzIj8hMEpqeFKQ07ceY0L1x1+641H6p2dPZcI2oiHdQ9i1+kEQw
 enVszwBXkuWYjwSh4juA5MsmdzE3fD/iXLWOPqeMLmBNppMc8oWEf24G9fzh2677vwhk
 IFNT3X3xrpaOjfNWJIJizQGckj7bN9EgDk/3vHbStcpBIUB98KvqLaqK8l/NGrqqk7aC
 Gauwuebi9G8JugqphfnQoFkbg1B556PZYX76tMEQtZuWQnUtRr5Is91f6K62QtY29ohu
 uoMPvBf3iIQqZmFj0yrWNwubNjBil5fsg3cjlEUxE+HN2+epGBNIMfiytn9QAMcR+wrR
 Klzg==
X-Gm-Message-State: AOAM530J1ANbLWZi5UOgpm30Lw/5dZsuZTZo+myyOlBDsJShrAohGBrw
 rs+Frq/K4ASsMODrUdMjUb2QyA==
X-Google-Smtp-Source: ABdhPJw1zy0uf8KaIx8uN2shpvh8jfwmgxNcKj8BSeWLnxe7Jqz4ElHo2EYEIrUYaxNf/AaxOv90bA==
X-Received: by 2002:a17:902:e5c6:b0:155:ceb9:3710 with SMTP id
 u6-20020a170902e5c600b00155ceb93710mr20348873plf.59.1649431650321; 
 Fri, 08 Apr 2022 08:27:30 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a056a001c8e00b004fa829db45csm24044583pfw.218.2022.04.08.08.27.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 08:27:29 -0700 (PDT)
Message-ID: <0567b8bc-b327-9601-9acf-75711b77a1ef@linaro.org>
Date: Fri, 8 Apr 2022 08:27:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Support for x86_64 on aarch64 emulation
Content-Language: en-US
To: Redha Gouicem <gouicem@in.tum.de>, qemu-devel@nongnu.org
References: <648878dc-67c6-d919-c2a0-b7c6c5d613e2@in.tum.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <648878dc-67c6-d919-c2a0-b7c6c5d613e2@in.tum.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: d.g.sprokholt@tudelft.nl
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/22 05:21, Redha Gouicem wrote:
> We are working on support for x86_64 emulation on aarch64, mainly
> related to memory ordering issues. We first wanted to know what the
> community thinks about our proposal, and its chance of getting merged
> one day.
> 
> Note that we worked with qemu-user, so there may be issues in system
> mode that we missed.
> 
> # Problem
> 
> When generating the TCG instructions for memory accesses, fences are
> always inserted *before* the access, following this translation rule:
> 
>      x86   -->     TCG     -->    aarch64
>      -------------------------------------
>      RMOV  -->  Fm_ld; ld  -->  DMBLD; LDR
>      WMOV  -->  Fm_st; st  -->  DMBFF; STR
> 
> Here, Fm_ld is a fence that orders any preceding memory access with
> the subsequent load. F_m_st is a fence that orders any preceding
> memory access with the subsequent store. This means that, in TCG, all
> memory accesses are ordered by fences. Thus, no memory accesses can be
> re-ordered in TCG. This is a problem, because it is *stricter than
> x86*. Consider when a program contains:
> 
>      WMOV; RMOV
> 
> 
> x86 allows re-ordering independent store-load pairs, so the above pair
> can safely re-order on an x86 host. However, with QEMU's current
> translation, it becomes:
> 
>      DMBFF; STR; DMBLD; LDR
> 
> In this target aarch64 code, no re-ordering is possible. Hence, QEMU
> enforces a stronger model than x86. While that is correct, it harms
> performance.
> 
> # Solution
> 
> We propose an alternative scheme, which we formally proved correct
> (paper under review):
> 
>      x86   -->      TCG    -->    aarch64
>      -------------------------------------
>      RMOV  -->  ld; Fld_m  -->  LDR; DMBLD
>      WMOV  -->  Fst_st; st -->  DMBST; STR
> 
> This new scheme precisely captures the observable behaviors of the
> input program (in x86's memory model). This behavior is preserved in
> the resulting TCG and aarch64 programs. Which the inserted fences
> enforce (formally verified). Note that this scheme enforces fewer
> ordering than the previous (unnecessarily strong) mapping scheme. This
> new scheme benefits performance. We evaluated this on benchmarks
> (PARSEC) and got up to 19.7% improvement, 6.7% on average.
> 
> # Implementation Considerations
>   
> Different (source and host) architectures may demand different such
> mapping schemes. Some schemes may place fences before an instruction,
> while others place them after. The implementation of fence placement
> should thus be sufficiently flexible that either is possible. Though,
> note that write-read pairs are unordered in almost all architectures.
>   
> We see two ways of doing this:
> - extracting the placement of the fence from the
>    tcg_gen_qemu_ld/st_i32/i64 functions, and have each architecture
>    explicitly generate the fence at the correct place
> - adding two parameters to these functions specifying the strength of
>    the "before" and "after" fences. The function would then generate
>    both fences in the IR (one of them may be a NOP fence), which in
>    turn will be translated back to the host

This has been on my to-do list for quite some time.  My previous work was

https://patchew.org/QEMU/20210316220735.2048137-1-richard.henderson@linaro.org/

I have some further work (possibly not posted?  I can't find a reference) which attempted 
to strength reduce the barriers, and to use load-acquire/store-release insns when 
alignment of the operation allows.  Unfortunately, for the interesting cases in question 
(x86 and s390x guests, with the strongest guest memory models), it was rare that we could 
prove the alignment was sufficient, so it was a fair amount of work being done for no gain.


r~

