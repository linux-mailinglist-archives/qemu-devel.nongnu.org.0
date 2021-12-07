Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBD446C353
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 20:06:20 +0100 (CET)
Received: from localhost ([::1]:53990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mufn9-0008Oy-0W
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 14:06:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mufkh-0007I0-2v
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 14:03:47 -0500
Received: from [2607:f8b0:4864:20::632] (port=41512
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mufkb-00071R-M3
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 14:03:45 -0500
Received: by mail-pl1-x632.google.com with SMTP id k4so10103560plx.8
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 11:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=DsdpBzGXhljKBIS7NKFcOVqGQOIzimorvsiO1zfOydc=;
 b=Jt2T3DJ8QqMFjayz1VTGqgXjO0zS2+TKWFS1qPQPbi4M8ivedY3WTObJ53CsZF1jdH
 txsoesIgJCnmMwIPsJI6TGgv1OTp4Kk9r5Au2nMreVLW7gnA0RS5eOK6BO30sd5dctjC
 BH3q/sGoyY9YFiRJ8kMG0hl+c74AdNLvAvV2hrEfir6t0bB7S2MT7xiaE6TCDBg0RrB2
 xxu6cev1Y07O3e0zlrZt1hG8gEuU6UN0EPU2+Si63WzTmz/gDZdOdLYoc+vmLvr+j9D3
 t4Gcgy+RKQRNI83KxMIOl4pPGY7wKbCDbicZqgon5nDx/sycUFWj4gUPFZWe55KErOHN
 P8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DsdpBzGXhljKBIS7NKFcOVqGQOIzimorvsiO1zfOydc=;
 b=pYL59b2x6IMtbDKtmTXcX821cuhjDC+vBFV/aK8qILi6JkUSgFeMGkbMN0AElYUpzJ
 UxmNYr8DiazHEcuYGnM+SpQpWQGM/wqVDwT80iyceoeacGBdoNqKBkKs7aQtDog8dg8A
 sDnCH+EJ9qN3QerpAI3z33N1w1cBqYIln/sdyHtBBL7vkhSDmfp6edFQzRENs4Du6VA+
 z1UwAfjOMfYufuc/meLqr9wd7DH2VM/VK3ALRavd9GxrU7Y9Se9EqrEAK37ynpswtd/f
 vB5VbdG0OHl/W5ibopdOA3pkbco0gUyilsSz0JyN7uJwWUGsVlEojR+nTY+qXnbzdsqy
 xQ9A==
X-Gm-Message-State: AOAM530zLv6dwjTbysqQA/cdo+mgFRBf9QFTcX2dydQ8dXHxPY5KCLtP
 AEUzmTeOo8Z7yvg1wZM/4PUX0rQnRcSfGA==
X-Google-Smtp-Source: ABdhPJy7Tn9doVll3tjGiYxfkQk5DX/22DVt1f/wQh+5i5YPbSSv+PVO3f6paF3CkYp247tMkAsmnQ==
X-Received: by 2002:a17:902:c404:b0:142:4c7e:ab8b with SMTP id
 k4-20020a170902c40400b001424c7eab8bmr53748682plk.10.1638903819419; 
 Tue, 07 Dec 2021 11:03:39 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id h1sm439626pfi.217.2021.12.07.11.03.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 11:03:39 -0800 (PST)
Subject: Re: [PULL for-6.2 0/1] target-arm queue
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20211207172533.1410205-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5507d9e9-8d25-8472-ebe3-28c7777383b3@linaro.org>
Date: Tue, 7 Dec 2021 11:03:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211207172533.1410205-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.44,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/7/21 9:25 AM, Peter Maydell wrote:
> Last minute pullreq with one patch, fixing the GICv3 ICH_MISR_EL2.LRENP
> calculation. I went back-and-forth on whether to put this in, but:
>   * it's an effective regression from 6.1 (the bug itself has been
>     present since before then, but it was previously masked by the
>     other bug which we fixed in 9cee1efe92)
>   * I just realized it could cause a screaming maintenance interrupt
>     even for hypervisors like KVM that don't set LRENPIE
> 
> On the other hand this is very late and we haven't seen it be a
> problem with any guest except Qualcomm's hypervisor. So if you want
> to decide it's better not going in that's OK too.
> 
> Tested on the gitlab CI and with a local test of nested KVM.
> 
> -- PMM
> 
> The following changes since commit 7635eff97104242d618400e4b6746d0a5c97af82:
> 
>    Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2021-12-06 11:18:06 -0800)
> 
> are available in the Git repository at:
> 
>    https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20211207
> 
> for you to fetch changes up to 2958e5150dfa297dd5a51fe57a29156b8744f07f:
> 
>    gicv3: fix ICH_MISR's LRENP computation (2021-12-07 15:30:08 +0000)
> 
> ----------------------------------------------------------------
> target-arm queue:
>   * Fix calculation of ICH_MISR_EL2.LRENP to avoid incorrect generation
>     of maintenance interrupts
> 
> ----------------------------------------------------------------
> Damien Hedde (1):
>        gicv3: fix ICH_MISR's LRENP computation
> 
>   hw/intc/arm_gicv3_cpuif.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

r~


