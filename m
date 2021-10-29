Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6CC440318
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 21:25:12 +0200 (CEST)
Received: from localhost ([::1]:57354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgXV1-0004IY-4S
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 15:25:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgX4o-0008C7-Ii
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:58:06 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:46659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgX4m-0000Ce-Lz
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:58:06 -0400
Received: by mail-pf1-x42d.google.com with SMTP id x66so10012752pfx.13
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 11:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wLvN5w19Y/+lzbHsFtjw46PQ6rrW7ZRhmkjCj4bPFRg=;
 b=pidz5xtdCQk+ePxXIL9yeK4BRGFO9oTMdZ5JWhDQCcdYZ71ukN0mdg9angoC7v8g7f
 hEu8Oq1CvFJP7Ht8MksptSSlXZ6aoICDIsnXEv9XO9vyccIhM07ASg9Ju5MNzkNzUj6y
 lebE7hL4OOcKZLmyqvqn0rFq8mYk/O5O3n15rjqnRf/WQhwdflQWvkdi6Rgb9iL0dNir
 OvqdaOEpwgYPJomccXxGlrld7Mb2ThNBUTxPzY78mYufDhF+kl8mGNq1i/chzZxIkqoP
 elg6QTkb/fc88lrjzAGRFgW+VnD03thMfiWDNyPOYn3lNlFIz2F31tJgBlgjZMqPaNly
 JPAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wLvN5w19Y/+lzbHsFtjw46PQ6rrW7ZRhmkjCj4bPFRg=;
 b=GvOnkeJbii4ljkj5/dg6xdVWlUhWTeLTwA6+AQKbgiEi1fHV0emfWb5KnnHEbTLXGG
 t6ArJPpdBOyHdZo6Bz46Ukci/+rRDPHSWjHpwAU3fDAzymF7x5wiOaCddq3arybQgksJ
 jZBti3CYLOeiuBY+QEZCwalGbNSBH7FYtDGkNDofsqpIDwl0H4LH8DpQV/D6d2uDaTHk
 i4KGO1pnGijpTRqFPctHIJnL3cAOyWRZouBS/e5pZarcywbIwEH44zT/YDtQxild3QnE
 Vs/UUBZgcIJNIwG3k7GzvUfb4j1NDJgoT48TfMpwBm+rP8oKxsw51zsJyM7NBJZ08GV1
 0dBw==
X-Gm-Message-State: AOAM531sjErqxJQ3pEzhGYSf3v5hya5JDmGGsA7FGbK1vlEyrxs39j2+
 onuh+g1i4SbAwn3yTqiPkljjcw==
X-Google-Smtp-Source: ABdhPJx/Pslh5pgqCAKnAhUMbiKInvPicYjQwi9E4v9ogJ+CUERM1gIBzvTKOpIFiisnS448Lwktjg==
X-Received: by 2002:a63:1415:: with SMTP id u21mr9407559pgl.165.1635533883304; 
 Fri, 29 Oct 2021 11:58:03 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nr14sm6374374pjb.24.2021.10.29.11.58.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 11:58:02 -0700 (PDT)
Subject: Re: [PATCH v4 11/30] Hexagon HVX (target/hexagon) helper functions
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1634033468-23566-1-git-send-email-tsimpson@quicinc.com>
 <1634033468-23566-12-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <57e5049c-1dc6-ffb2-01aa-e2dc459033f8@linaro.org>
Date: Fri, 29 Oct 2021 11:58:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1634033468-23566-12-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
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
Cc: ale@rev.ng, bcain@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/21 3:10 AM, Taylor Simpson wrote:
> Probe and commit vector stores (masked and scatter/gather)
> Log vector register writes
> Add the execution counters to the debug log
> Histogram instructions
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/helper.h    |  16 +++
>   target/hexagon/op_helper.c | 282 ++++++++++++++++++++++++++++++++++++++++++++-
>   2 files changed, 296 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

