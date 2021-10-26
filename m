Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FC143B51C
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 17:07:54 +0200 (CEST)
Received: from localhost ([::1]:35358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfO3N-0002uM-5U
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 11:07:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfNxm-0006Y8-Ql
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:02:06 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfNxc-00029a-JM
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:02:06 -0400
Received: by mail-wr1-x42a.google.com with SMTP id k7so15165607wrd.13
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 08:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yQ1pY1Mmingi4LLKKtit2eHBSdtqmoM3yWilwqAuX/U=;
 b=EVDrs1ZLTTJFWF1jDipllntet7iY/Zz8AIqOduwTbusfpJ85UGL61HVt3IFH26ZLi6
 BmO6VOOQgvq46LEZCI909I7u1uBXzq/YMs47cfcmrFGxpshkQRa0PT4suHRSn60ByJRQ
 NhmVO98g0Abb7uGEG6GTpwLR8Y4h2tr6MYsEzNl0sgXevugxUCe9zlQk6NwZOBh41GJU
 988EHvJgEPGX8BPTSXzEB7vjmq331nuBl6pd1D1Penvt3tSGSCXrV756rxZJ9tjjnXYx
 veywvHswN/CMY5Dxffy+fdkOv/xhXNBQB/opafTouc+AYZ1+3IM4obDKepd7fQ9gGDRM
 MTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yQ1pY1Mmingi4LLKKtit2eHBSdtqmoM3yWilwqAuX/U=;
 b=cXW++ZvsXyl+6CO4aTogbY+7dyHN66JMksRe7GKOzn08lm9CV6y9aBWerUO3+89fSL
 POiEs2uhBEv0gB+l5xPhu4uiIwhCYUVrBMLkHrDg8KPL4ct5+xyDQltEUo2t77I3OoEa
 EKLckyZuRBxOpS4lkezbLfIRABdnk4TOm/LW2le6nivzdW0z9EKfv5P49fE5dntKlHos
 fs0dwWxTVhqlwSDem0mJIBxWxoehSzDGm1hoqFc29EvUdJ0UzijPNFtv05A3TfcPfmGD
 R0/r+nyZH7ZMMmSEAbTefi4YU8xxCfuZHOTvn32CareyKqSHCBPlDSYTI10wJ7UH3qw2
 bzEw==
X-Gm-Message-State: AOAM5324stYKkBcV98i8O0StuLj3LEQLcZkd/aFJo9A2qQKxeyOwmxpi
 Y/7wc+qnzR2Ltki61gaGUg4=
X-Google-Smtp-Source: ABdhPJzb/bJq15+PxA/Wc+K+JqjSNhhFD8dMVJH3piEeV/DKshuYZ06xXDJ7AMBZWDaO8i10CsVd3w==
X-Received: by 2002:a5d:5258:: with SMTP id k24mr22036392wrc.239.1635260514986; 
 Tue, 26 Oct 2021 08:01:54 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o17sm923573wmq.11.2021.10.26.08.01.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 08:01:54 -0700 (PDT)
Message-ID: <eec1880c-bcc5-dadc-a506-85542b73001e@amsat.org>
Date: Tue, 26 Oct 2021 17:01:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 05/28] tests/docker: Add debian-nios2-cross image
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
 <20211026102234.3961636-6-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211026102234.3961636-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.215,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Marek Vasut <marex@denx.de>, Thomas Huth <thuth@redhat.com>,
 berrange@redhat.com, pbonzini@redhat.com, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 12:22, Alex Bennée wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> Build the entire cross tool chain from source.
> For this reason, default to caching.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> [AJB: honour NOUSER in cached fetch and build, update MAINTAINERS]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20211014224435.2539547-6-richard.henderson@linaro.org>
> ---
>  MAINTAINERS                                   |  1 +
>  tests/docker/Makefile.include                 | 25 ++++++
>  .../debian-nios2-cross.d/build-toolchain.sh   | 87 +++++++++++++++++++
>  .../dockerfiles/debian-toolchain.docker       | 36 ++++++++
>  4 files changed, 149 insertions(+)
>  create mode 100755 tests/docker/dockerfiles/debian-nios2-cross.d/build-toolchain.sh
>  create mode 100644 tests/docker/dockerfiles/debian-toolchain.docker

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

