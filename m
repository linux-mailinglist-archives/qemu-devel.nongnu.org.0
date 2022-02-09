Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 094114AEE5B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 10:43:52 +0100 (CET)
Received: from localhost ([::1]:37198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHjVu-0006gI-Li
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 04:43:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHjAR-0003MD-BX
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 04:21:43 -0500
Received: from [2a00:1450:4864:20::431] (port=36399
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHjAO-0003cp-2f
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 04:21:39 -0500
Received: by mail-wr1-x431.google.com with SMTP id o24so221319wro.3
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 01:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7GDEMTMlsd+2lN3ZNDmvFm22qbITztd8TfPFyou+/Ls=;
 b=DFqBSpx2ospyneBLXBMVBtD21l2q5newfcP0/bvqnM8vKpK6P/vgI/aJHkx7B24mWp
 AG8z3qDD8NisEnoVQGmIzTmlthbqtH1Sg29mw60j/8tyno/Sf78DGoj12/GLhZ8Tonq4
 CpYHgAwMnSbbOBwS8WSYMjDEF6VUDT+9WTE6tVc+OjyqPuiAy65pQXkxmv4ZE8BYLzd5
 PqdwufeROQ25OhmSkwf74U7ysFsb4G9HDCYWXpxp9VhlmxtsS5Q2UGxB4fzg+RhFv95u
 2qIWRxjfTuPd5WEQ3FecBchIv6eif3OF9mrY1e9rEHJSX3HHAPICqaBE3pCI9VtyCnAX
 A9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7GDEMTMlsd+2lN3ZNDmvFm22qbITztd8TfPFyou+/Ls=;
 b=M1XR544NfyMMpGVhZ4NiZQd2qEpwBCHn8xBlvAP1Vf4ybYIsiGL9ia+iHC9Vx9D61P
 6gjC/3QFtmirgx4mZZ3ap2b5Ux1+qbCc3qnj2c4iz/pWHhhbuZJGVFzA3zvS1oYNSHc1
 0QAZI1n5f1sGvDfrG8c/QZkCRO6PrDjSwvQrmdEtVRyoNacHE5SEZj5qASjgFldqExb6
 ZrTwzwLTdvEUDvyYp7omnGTN4UD+HzCRkDPETTpkvaskB8G57c6eRK2DE16irwSwukBb
 pNoXjg/VCCVwlkviNv+BpFS2QfdRzKR/iMJplWqV0fR8sZyYavex+1sLzekkncJNbhKq
 6wZQ==
X-Gm-Message-State: AOAM531XCQ9B1+Trbw2hDJoh4yYYO3fytmlsqCPNcPRmPdmy8ItKqGRM
 YYKdtBpxKZh+Tnn2qnMzW1t7+kH9i2o=
X-Google-Smtp-Source: ABdhPJzi4V6cuZTzKbwLR3CvwwquBFBKiqnjM7UGy63lB9an32NuUwaFRNI5QflBuHw1Ie8s4WT6Xg==
X-Received: by 2002:a5d:564a:: with SMTP id j10mr1219305wrw.473.1644398468290; 
 Wed, 09 Feb 2022 01:21:08 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id l26sm4006667wmp.31.2022.02.09.01.21.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 01:21:07 -0800 (PST)
Message-ID: <fa11bbfe-5e3d-37aa-aff2-26d3cd0b2b1a@amsat.org>
Date: Wed, 9 Feb 2022 10:21:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 0/5] include: Trim some fat from osdep.h
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220208200856.3558249-1-peter.maydell@linaro.org>
In-Reply-To: <20220208200856.3558249-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 8/2/22 21:08, Peter Maydell wrote:
> The osdep.h header is included by every C file we compile, so it helps
> build times to keep it small. (As the comment at the top of the file
> notes, in an ideal world this header would contain only things that
> everybody needs and things where we need to apply a compatibility
> workaround on some hosts.) This series trims more than 130 lines from
> osdep.h (about 16% of its current size) by splitting some prototypes
> that are used only in a few files out into new headers that are
> included by those source files that need them.
> 
> (Looking at the size of osdep.h itself is not really the right metric,
> because the real killer for compile time is going to be all the
> system headers it pulls in; but it's easier to measure and looks
> better for this series :-))
> 
> There's scope for more of this, I think, but there's no need to try to
> do everything in one huge patchset.
> 
> thanks
> -- PMM
> 
> Peter Maydell (5):
>    include: Move qemu_madvise() and related #defines to new
>      qemu/madvise.h
>    include: Move qemu_mprotect_*() to new qemu/mprotect.h
>    include: Move QEMU_MAP_* constants to mmap-alloc.h
>    include: Move qemu_[id]cache_* declarations to new qemu/cacheinfo.h
>    include: Move hardware version declarations to new qemu/hw-version.h

TIL qemu_hw_version().

Series:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

