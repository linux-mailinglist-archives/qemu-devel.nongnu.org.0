Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE02243FFB9
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 17:40:29 +0200 (CEST)
Received: from localhost ([::1]:52414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgTzY-0005Dr-Uw
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 11:40:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgTy6-0004WE-3f
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 11:38:58 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:43945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgTy4-0003rX-H9
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 11:38:57 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 k2-20020a17090ac50200b001a218b956aaso7651999pjt.2
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 08:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mEc4PGo9T0QT6F/Lkt60baVWMOfPdM0YyvzTVwIaeFM=;
 b=vCFIWygyVsW5IKOjrCAOFyBE5ku+uWoKLKAhpa/kOO/SxZp4qa26/nXoeVHYFBcs7e
 2KB419Oyuo8qsH/2gRE5fy6riMjU9dkaSgCy/aEZFrTQ9A/LNp1W7kFhPiIfffBYSTU0
 1WGDwg23hno6pj/RcOzWpVMI1P13NIyWgTXBcRQgux8fhQiq+VJf44MfgcthZElsjdyG
 5Ob5OpOIQfYXSsGZwf6wxFd+qK1VJwkGToQLXsrKSik5LRpWt5lbA4ODHvQnaxpzUATt
 WfOAvbUfoYe07ehba4bugdoDR31IYvqCJWuGXgKES9wl4sLMGnFAJZ1yiHAuE8P1LiqF
 qacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mEc4PGo9T0QT6F/Lkt60baVWMOfPdM0YyvzTVwIaeFM=;
 b=ICVxbFCmeIhqwXD77cU/FSnKONLXx1AlPLor5Mixn65KuP0qWrQRpMTEKts9tMB2To
 lbiPxq1gGRIFqTqzaUtQfy/HbOeLpaetEr6UuSmSK3NvuyCM33RZeaFqkpYDsOD536uO
 jFNkhlypkMla+DgOSRuu95Fy0o+DyYyFg4BgtfiowfylglQqBlpK4GL7K02D+A5npMmn
 30JOwwc3CvA7/E5l6Z98gsNkCachY/qauzgimrBdZUURt+ogKYhJpxeQifAGq5KSOchO
 FuqIljLCmsYfXiyw5gIKXHIMOsDYJSyb6uvO812JBvjIoDBSvZAL+3ft8rAVD1soBj7n
 n0ag==
X-Gm-Message-State: AOAM5312f+LnYCISUlJYLReJoxWFFmqNNV7W3nFTbeH52zCxatOhJDP0
 Ft4bGJaFiHJFA/ugxe8V8uULSg==
X-Google-Smtp-Source: ABdhPJwyL1VtV+6D/Hi5vCSorPJjc/D2gyYvF6QHhaITEcuJUlTkUOicKAVK7gCZmtMgyGfQAM/rcw==
X-Received: by 2002:a17:90a:4bcc:: with SMTP id
 u12mr12438833pjl.180.1635521934876; 
 Fri, 29 Oct 2021 08:38:54 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id e8sm7743370pfv.183.2021.10.29.08.38.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 08:38:54 -0700 (PDT)
Subject: Re: [PULL 0/2] Hexagon (target/hexagon) cleanup and bug fix
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1635480178-26461-1-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f211d551-887d-e887-5a64-bfa49c5121ee@linaro.org>
Date: Fri, 29 Oct 2021 08:38:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1635480178-26461-1-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: peter.maydell@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 9:02 PM, Taylor Simpson wrote:
> The following changes since commit c52d69e7dbaaed0ffdef8125e79218672c30161d:
> 
>    Merge remote-tracking branch 'remotes/cschoenebeck/tags/pull-9p-20211027' into staging (2021-10-27 11:45:18 -0700)
> 
> are available in the git repository at:
> 
>    https://github.com/quic/qemu tags/pull-hex-20211028
> 
> for you to fetch changes up to b9dd6ff91d29b9e38afd7facf1d683f34bd1ec10:
> 
>    Hexagon (target/hexagon) put writes to USR into temp until commit (2021-10-28 22:22:49 -0500)
> 
> ----------------------------------------------------------------
> Followup to replace more tcg_const_* with tcg_constant_tl*
> Fix bug to delay writes to USR until packet commit
> 
> ----------------------------------------------------------------
> Taylor Simpson (2):
>        Hexagon (target/hexagon) more tcg_constant_*
>        Hexagon (target/hexagon) put writes to USR into temp until commit
> 
>   target/hexagon/gen_tcg.h          |   9 ++--
>   target/hexagon/macros.h           |   9 ++--
>   target/hexagon/attribs_def.h.inc  |   1 +
>   target/hexagon/translate.c        |  12 +++--
>   tests/tcg/hexagon/overflow.c      | 107 ++++++++++++++++++++++++++++++++++++++
>   target/hexagon/gen_tcg_funcs.py   |  11 +---
>   target/hexagon/hex_common.py      |   2 +
>   tests/tcg/hexagon/Makefile.target |   1 +
>   8 files changed, 129 insertions(+), 23 deletions(-)
>   create mode 100644 tests/tcg/hexagon/overflow.c

Applied, thanks.

r~


