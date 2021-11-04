Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 220B444517F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 11:17:33 +0100 (CET)
Received: from localhost ([::1]:51588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miZoJ-0004YJ-Pk
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 06:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1miZms-0003bp-Rd
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 06:16:02 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1miZmq-0006nf-Qs
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 06:16:02 -0400
Received: by mail-wr1-x431.google.com with SMTP id i5so7783459wrb.2
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 03:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZWHsYv7stjzWBw/g4w05wfcy2GpEKY14JEahxADqQsM=;
 b=qmoby00Galb+5PAEq064x1qJX1m/NHKG6W8gK7C/aTkgfNmkyXXNS4ckXA1ChugyOx
 t4JLm5kDxBLNsa+KzlR7qUfZmuJdqA+RG6kv75bL9wZpe4NaT6ZjRflnCG7E4wgan3UD
 4NUYflhdRgNxWtgwRsFixFtlkPWX2XJ8KUtaZE7KuvaksyS0clf87svmUp8aiXI7S/cT
 IwuC63ojb2Lh0ZcKGGvrSE48bpp3/913Ax/pFYqhsyj2LcmFwA6gcgVOyfPtu1TxuXnb
 gx0bGAXAue8ybttHVJX8FgZJMWXelurm3yUp1meeJpIOXGqEr5rdgBUW1ZrohL5KLm7F
 0EQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZWHsYv7stjzWBw/g4w05wfcy2GpEKY14JEahxADqQsM=;
 b=vpHgws2oQM2zXwRbvV1upzFIDyvwWTKUq9XjcoRlKiia+4eSgji9f9oRemDU+/hEDc
 GLrTt+LbNesM9Li6jxYhRQ5DkDYHd1r7E9lPS6qwaA+yjnazxSl2kqvgh4Qyi/zRdJa8
 gD+5yByINO/wuKkktabxaKAjGNiH5mxnF9EqmKX3RIKCDK4NWYGGVUdI6gTKX/sL/9vs
 C0u4X3G5Jbw70nlxmadpj8EB5xh5d3pJeguLia8mFsaHhyXtjJNQnSubNi6Efe3T58BI
 pDUwk5G+x3lCFFFfH+T5oWL9m6y9VskMw26tTvswQ0OsZ3BcaYHe0ZAKQSQ2TkkIh1I7
 Vd3w==
X-Gm-Message-State: AOAM530iP95/IZt6qTu7Jip2bgrjR7RH8qyqMA1SU0z1RBcFaA2GbOeZ
 gdWrqvVmwatscP6zZy8Jrw4=
X-Google-Smtp-Source: ABdhPJz/52SJc4o+32tjSf/F+LjYUYMcntlwXYRhamrZjEM7GiyytRgmAxCChnFbIDWqYC+txQVKKw==
X-Received: by 2002:a5d:4281:: with SMTP id k1mr66718417wrq.89.1636020958823; 
 Thu, 04 Nov 2021 03:15:58 -0700 (PDT)
Received: from [192.168.43.238] (73.red-193-152-127.dynamicip.rima-tde.net.
 [193.152.127.73])
 by smtp.gmail.com with ESMTPSA id w7sm4722209wru.51.2021.11.04.03.15.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 03:15:58 -0700 (PDT)
Message-ID: <891bd73d-771a-1463-ff2d-5885a6081cd4@amsat.org>
Date: Thu, 4 Nov 2021 11:02:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] linux-user: Add GPL-2.0+ SPDX license identifier
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211103203146.3630550-1-f4bug@amsat.org>
 <YYOirmDXpPq16ZMi@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <YYOirmDXpPq16ZMi@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.528,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/4/21 10:06, Daniel P. Berrangé wrote:
> On Wed, Nov 03, 2021 at 09:31:46PM +0100, Philippe Mathieu-Daudé wrote:
>> Use Qualcomm License Identifier tool [*] to classify linux-user/
>> files per license type, filtering those matching at least 60% the
>> "GPLv2 or later" type, and manually add the GPL-2.0-or-later SPDX
>> comment.
> 
> When you say  "manually add", can you confirm that you explicitly
> inspected every license header yourself to validate that the reported
> match truely is GPL-2.0+, before adding the SPDX tag.
> 
> Adding licenses tags based merely on a 60% match, without doing
> human inspection would be questionable.

Yes I explicitly inspected every license error before manually add
the tag, but I am human, so prone to errors, which is why peer
review is important :)

This diff is generated using 'git-format-patch --unified=4' because
I thought it would ease review, however I just realize reviewers can't
check from the diff whether there is another license in the file.

In v2 I moved the tag to the first line and generated the diff using
'git-format-patch --unified=20' which is better because in almost all
cases the full header is displayed. I might use '--function-context'
in eventual v3, but it is slightly more verbose (it displays everything
until the first function, so all #include / #define after the header).

