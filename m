Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4217F4B1B11
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 02:17:26 +0100 (CET)
Received: from localhost ([::1]:42184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIKYu-0000eX-W1
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 20:17:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKVl-00081p-C2
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:14:10 -0500
Received: from [2607:f8b0:4864:20::1032] (port=45859
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKVi-0003PD-I2
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:14:08 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 q11-20020a17090a304b00b001b94d25eaecso2808709pjl.4
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BZf7uAxDvsqQ2vblXHbFO+0ZLeedDZDF344ilm5pRbI=;
 b=h2oq343vpcOkOk2aIv/955un/Oa+nSj2eSBJ4GBtEnfT+ADVpaBOVrY3B8ZNLSdmpf
 PuO3PlmdrZAvlKPJEOKnlNgZ7W3E5F3LI7ANqvq+F7lVQ/LHD2p3s/Nt6XqQmW6nwHKZ
 knLfgyUY+euN4qq/OdwwtlpTywDMZ8TUzj1qermTc7kNswXbWl2NOpF4In+EN+flGGQl
 uxTrMLQmtQ0FWU64yeuTeNd/H9ztkD0cZWyQjZfnn5bc18KIzoZSk7sMTBymTncwU5QZ
 LaEwIHqYqzXuKpdUJXTDnLQt3dXtl+Cbh8tksFddqil5Q23xdi24yk6/mNHQBSeTPVOe
 kPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BZf7uAxDvsqQ2vblXHbFO+0ZLeedDZDF344ilm5pRbI=;
 b=kqmIBGae89J9NVWEWB/yP2xshuMB8Q5k9i/ubHwsLqjBInq+VCvf+1sLKRzqSq8ynq
 xdYOM+cRtL/A2jZNKH7LFRmHdWS8Mjedd9utxG9RzehfmCgJGM66mEf+qredlnnc48hS
 uDk0hygjaPGnI3E3Ll59NpJGw1SlhiWIN4Uy0DRhOie3CIFeezveh9X/RFN6LLaf75gz
 fpbGerA0YRHD9cZqFvu4Z8DCMYNZJgPcOc/Pxydfv5RV3uK/sg/cK5sU+OCahsaGSs/y
 dfuOHTGUzGHrC4Nbv7l4BV2unT/bGFeFIiosVk6eK256U54Bxxj/nw1rG26ouWsMYd+k
 585g==
X-Gm-Message-State: AOAM531YHN0F4UoJKwe5C4WvbcmNxNTIWFPKrrPJ/jWbTdhl+NYsTIj/
 aiLW/TMfjKOdR+PJwPZP2VxrrQ==
X-Google-Smtp-Source: ABdhPJxIzPoLMILigDiApT/P5Rvdu1Myg+o+vPDKFVehbZFqcOqb3QxRK24KStNRyDyj5e0CEK0wVg==
X-Received: by 2002:a17:90a:bc81:: with SMTP id
 x1mr133361pjr.119.1644542045129; 
 Thu, 10 Feb 2022 17:14:05 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id t3sm26782714pfg.28.2022.02.10.17.14.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 17:14:04 -0800 (PST)
Message-ID: <97f84066-bf81-c4ba-2198-5a2faa1a70ae@linaro.org>
Date: Fri, 11 Feb 2022 12:13:18 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 12/12] Hexagon (target/hexagon) assignment to c4 should
 wait until packet commit
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <20220210021556.9217-1-tsimpson@quicinc.com>
 <20220210021556.9217-13-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220210021556.9217-13-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: ale@rev.ng, bcain@quicinc.com, mlambert@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 13:15, Taylor Simpson wrote:
> On Hexagon, c4 is an alias for predicate registers P3:0.  If we assign to
> c4 inside a packet with reads from predicate registers, the predicate
> reads should get the old values.
> 
> Test case added to tests/tcg/hexagon/preg_alias.c
> 
> Co-authored-by: Michael Lambert<mlambert@cuicinc.com>
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/genptr.c        | 14 ++++++++-----
>   tests/tcg/hexagon/preg_alias.c | 38 ++++++++++++++++++++++++++++++++++
>   2 files changed, 47 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

