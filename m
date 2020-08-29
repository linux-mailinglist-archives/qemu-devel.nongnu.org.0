Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D47256414
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Aug 2020 04:03:33 +0200 (CEST)
Received: from localhost ([::1]:48920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBqDM-00063m-SS
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 22:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBqCh-0005eO-Uk
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 22:02:51 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:35514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kBqCg-0005Co-6i
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 22:02:51 -0400
Received: by mail-pj1-x1042.google.com with SMTP id g6so377477pjl.0
 for <qemu-devel@nongnu.org>; Fri, 28 Aug 2020 19:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eb/QSNln2gvty3yqgN0kmbPLfUGQJkxG4tpmjUuCHaM=;
 b=GI1Dao3Kw9WrSRUaYiGVGKmGJ+Kml2M2QSbcg2Oa0RVYYtHMsv87kpBXCs08c2rfCW
 ePLGYsPP+99iz9YBvwc1lB1QuVErY2U58etr8RWJE43V42nSnRhuNORPhfDpBkPGgPmX
 hfKdLUfzglQu7c7rB84gFxDqrwplvekG1pIHlAC2xCL66ZUtzxYYXg8gfcMilXw+yAFp
 Ex16GDFYv+0OpjYRU0MjwockGc38l+NpZt+IF+2nUSGML1lmGAQ9MhwIg48rxbxQUOQN
 d/tZk6cXHsA0h28CXMJfGMu+NNU+MPjl1egqVNGemogjbKWoSgQH4VakRUFD015wa7kW
 j7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eb/QSNln2gvty3yqgN0kmbPLfUGQJkxG4tpmjUuCHaM=;
 b=JkJuCrR9TO8+zEqlhHxsKf0ArqlnFuAj7Z9ldjC9LUz3rFbc7sEuLqr26M/MSv5E7S
 2IIgWX3LwGJI3pD50FF3q6C+jlJ3tmC5elD5yIGCVBDrMemuEJTOUCMINqJ4FlSF0cNl
 qF12Q89KdJI9nptnoqKCiljfB67FzHjf3OfWHczMsewo3OSp7mth3VqsSJArR4Ecyt09
 uXLaMRZGBYlYQFGJytzKV1Uq7J0E8ZvLUG/+i4KGH8/nnVZDeM1yufQYs9wlNP0uraa5
 oQOgfMdlXdOTdw1qaksuH5HirndcP2lh5lZMHXc/bcW1WVNHZrt8AXqcoROJGQOe4dy3
 kJRw==
X-Gm-Message-State: AOAM531JtJAJailZ66qTYAE4Zbbfs2nLR/wCt/I6t4YsShPtWpekKS+t
 hcWd5Ef7lb7Vcr9yf91xGMDbOw==
X-Google-Smtp-Source: ABdhPJwhL6XoWdOiM0XJrGl+nGLQxYMXSYZ6Uuj1NPHOwW+ry5cjfX3ROsbwO2x0Cdz02otjXTxKNg==
X-Received: by 2002:a17:90a:bc94:: with SMTP id
 x20mr1389324pjr.45.1598666568755; 
 Fri, 28 Aug 2020 19:02:48 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id h65sm709790pfb.210.2020.08.28.19.02.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2020 19:02:48 -0700 (PDT)
Subject: Re: [RFC PATCH v3 30/34] Hexagon (target/hexagon) TCG for
 instructions with multiple definitions
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1597765847-16637-1-git-send-email-tsimpson@quicinc.com>
 <1597765847-16637-31-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <10127f7e-a2df-2f19-e897-9a874f9a5d82@linaro.org>
Date: Fri, 28 Aug 2020 19:02:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1597765847-16637-31-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
Cc: ale@rev.ng, riku.voipio@iki.fi, philmd@redhat.com, laurent@vivier.eu,
 aleksandar.m.mail@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/20 8:50 AM, Taylor Simpson wrote:
> +++ b/target/hexagon/helper.h
> @@ -15,6 +15,8 @@
>   *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include "gen_tcg.h"

Why would you need this here?  Definitely looks wrong.


r~


