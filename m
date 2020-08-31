Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B41257F9D
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 19:30:22 +0200 (CEST)
Received: from localhost ([::1]:56914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCndM-0006l3-Kj
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 13:30:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCncQ-0006Du-AN
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 13:29:22 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:39781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCncO-0007Wr-DL
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 13:29:21 -0400
Received: by mail-pj1-x1043.google.com with SMTP id s2so154402pjr.4
 for <qemu-devel@nongnu.org>; Mon, 31 Aug 2020 10:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DqIUTNxWUoEzAweSyu+RWnn2bHsc1rANd+HbXPenUyk=;
 b=ovBlTwtMesS0Mh3lsE3rjfEEiY7ZfErjKcepa+PlKVBZySajeJqecr/lrg8Vtc9LPA
 XDzxQ0gSufToRg3R6qVpEeN6nehH8OkzNx2u/wf8CBQ0E+3vpIqOa7Evrws5xJsVPcyd
 kyvWJD4iF0I6PgzAQx5OfM3WWiOIWlVLhs3XyDje+vZf4uaHzQoAmZ3Xy9iEoKOKTD4z
 uQp1Yx3Rr1dhdS2TnPSPMS0vGhgjpPz63XK4l2R04gUMvQiahqK9eVtEWZfHT9FE6BzL
 +0lX49ePgCtwDMyCJDJB5cgtrmQljeIW+6JEqIdyt8ZxxkEoeytRJmhXtJFetGqj9zcn
 c1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DqIUTNxWUoEzAweSyu+RWnn2bHsc1rANd+HbXPenUyk=;
 b=cQNVa/A5rFa6K07cfOqWwicq750xOgjSCCxeNX8X63ZKHz+DjMaxNoQVO1WWmRDPwK
 njuXQjBmrY3rcwK9QRODkSKyAUtnoAYZyZSTA1a0Go4NybtOSYZsp5rM331rHOKRv90/
 Ow9Z5SlgVi85xeRwXEPnvGfBhKcG9OYCjDTAAMDk2tMYEEeuCDvlUG3hipEJuNpr30c1
 fAzzo4DZ9UBqulKOCgxISLLIYPpeBM3fOS5GRlvNVj7ggqkhTsIZBjxgNvbcYR0Cpf/C
 trScH8vDRtzSnubXcQ8nuu4mgnWRHdA/QF4wFBx3wGewhqgF6qFAbrKEOzt1zz1hojVo
 ityQ==
X-Gm-Message-State: AOAM532HRVHwRzrbDwSGd/LlfIo+wupitRk3ufvf+V1NCS3sPrsjJitl
 /ZnUKx4rGG0ol1rHsSJI8/jayQ==
X-Google-Smtp-Source: ABdhPJwT/6AFv+T2sp4g6W+FDZr/hM5hcFEXcGGAIdrUL/zMFXhIw2kiAPLlF/u7ZvexKMw1iCkvRQ==
X-Received: by 2002:a17:902:9a92:: with SMTP id
 w18mr1822103plp.169.1598894958842; 
 Mon, 31 Aug 2020 10:29:18 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id b6sm174105pjz.33.2020.08.31.10.29.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Aug 2020 10:29:18 -0700 (PDT)
Subject: Re: [RFC PATCH v3 30/34] Hexagon (target/hexagon) TCG for
 instructions with multiple definitions
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1597765847-16637-1-git-send-email-tsimpson@quicinc.com>
 <1597765847-16637-31-git-send-email-tsimpson@quicinc.com>
 <10127f7e-a2df-2f19-e897-9a874f9a5d82@linaro.org>
 <BYAPR02MB488691F539AD3A2BFA1C819DDE500@BYAPR02MB4886.namprd02.prod.outlook.com>
 <a0987bce-409b-cd14-7559-c63413ff2b6f@linaro.org>
 <BYAPR02MB4886985CC5CBF78F7D5DBFE5DE500@BYAPR02MB4886.namprd02.prod.outlook.com>
 <fca34122-160d-8c13-d237-a87a917f341b@linaro.org>
 <BYAPR02MB4886D48EDC604CEEF65FDAA7DE510@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1cf57f2b-a2c8-6fbc-2c1c-9945a5d77dd8@linaro.org>
Date: Mon, 31 Aug 2020 10:29:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB4886D48EDC604CEEF65FDAA7DE510@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.13,
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
Cc: "ale@rev.ng" <ale@rev.ng>, "riku.voipio@iki.fi" <riku.voipio@iki.fi>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "laurent@vivier.eu" <laurent@vivier.eu>,
 "aleksandar.m.mail@gmail.com" <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/31/20 10:08 AM, Taylor Simpson wrote:
> There are some assumptions here I'd like to clarify.  When I started this
> discussion, there seemed to be general resistance to the concept of a
> generator.  Because of this, I made the generator as simple as possible and
> pushed the complexity and optimization into code that consumes the output of
> the generator.  Also, I assumed people wouldn't read the output of the
> generator, so I didn't focus on making it readable.

Except, at some point, one has to debug this code.
If the code is unreadable, how do you figure out what's broken?

> Now, it sounds like my assumptions were not correct.  You pointed out two
> things to do in the generator> - Expand the macros inline
> - Skip the instructions that have overrides

Yes please.

> I addition, there other things I should do if we want the generated files to be more readable
> - Indent the code

Helpful, yes.

I wouldn't worry about nested statements within the *.def files too much,
except to put each ";" terminated statement on a new line, so that gdb's step
command goes to the next statement instead of skipping everything all at once.

> - Only generate one of the fGEN_TCG_<tag> or gen_helper_<tag>

That would be part of "skip the instructions that have overrides", would it not?

> - Generate the declaration of the generate_<tag> function instead of just the body

I'm not quite sure what this means.

Aren't the "generate_<tag>" functions private to genptr.c?  Why would we need a
separate declaration of them, as opposed to just a definition?


r~

