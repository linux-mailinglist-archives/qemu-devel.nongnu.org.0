Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 572DE442E6C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:48:10 +0100 (CET)
Received: from localhost ([::1]:36430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhtCz-0008Hu-3w
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mht9K-0003LS-8s
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:44:25 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:39569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mht9H-0000Il-Qu
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:44:21 -0400
Received: by mail-qt1-x836.google.com with SMTP id t40so18672921qtc.6
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 05:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Tm1IemC3nMnYsYlECCYnjZoNr+ZSiZ4XDmbyCAfX4qs=;
 b=cjPKAbq1NXTsfy4Cv+E85G4Bmw4yPTTXHGv83to0J0PHS+r5f5sxNrubPnZEIzP3I+
 AYrLPbNt1cNVwM0ygRFTBJ9GBKgQSoDxTP68jNy0ZuFtK6owgopatmHqAddrGLvsGhNG
 vFZ3wdALNli8OO0CgFP4/zn74HC7TY1OwGIxDzKLPQJwJL4AJDhc0//8p1LCahG4cIBW
 0O39FOG8MI4nEOo5yZ4BtpVnxCC/1FOFtcjPnlcgRZI1R173hu+06+jG/LkTi4D90CRp
 c7GTVVecrOwhnM079QIFkwBSu6XLVOuX7nIbYGbsZVCJCQtUIA6Ea4WYAJ40fQR22224
 aJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Tm1IemC3nMnYsYlECCYnjZoNr+ZSiZ4XDmbyCAfX4qs=;
 b=4kPCyE1W3uOSlGxHM3c2gQxvWxZQub4VnuYPdLaCb89JLs0oa55ZC99aAqfPevOtb4
 fN02DnzNL5QsGS6LdU3TxMv/oHcIVgMjYAar5eGMydcGP6lPoiH/7FCF0WmAnau9fYC7
 0XAuhtPj0DTbNs6nt/oEP3yZmdKQzuXU0V5Feo2px9OS8IpdU4ynIyyS7ZjHLXWn1ib+
 3xaZB8SEpUzJT5skHwzlEi+yIf9xCTgHB19Sl52HpmEauZZeVsiB7/xbOPo3JvyCulWx
 WnsSrjJf/YJS491djQtOV2UnXME0M3LmaJBlUIWIqnLC2M9fg/xkaPiHk9ZPwOh8708n
 F9/Q==
X-Gm-Message-State: AOAM532Sz9cB+x7Nd68WGnjOf8T8+R9JQkebwQRuQwsDTY2BmAkas7az
 R32u7f4VV+Rut+DMefboCnIdow==
X-Google-Smtp-Source: ABdhPJyt5ZNd6sEyNlRK6l7wePmQ49RYPbsf5Q6yKL/qatQ3XP9LIb6E7tu780HJ+JcIKLIMU7ognQ==
X-Received: by 2002:ac8:5a4b:: with SMTP id o11mr38713937qta.59.1635857058890; 
 Tue, 02 Nov 2021 05:44:18 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id d23sm12119635qtm.11.2021.11.02.05.44.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 05:44:18 -0700 (PDT)
Subject: Re: [PULL 0/2] VFIO update 2021-11-01 (for v6.2)
To: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org
References: <163579674962.3486201.2525541279968158386.stgit@omen>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a0ce88df-b4cf-533b-a59e-c9c155a6fe6d@linaro.org>
Date: Tue, 2 Nov 2021 08:44:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <163579674962.3486201.2525541279968158386.stgit@omen>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x836.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
Cc: Kunkun Jiang <jiangkunkun@huawei.com>,
 Nianyao Tang <tangnianyao@huawei.com>, Qixin Gan <ganqixin@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 4:01 PM, Alex Williamson wrote:
> The following changes since commit af531756d25541a1b3b3d9a14e72e7fedd941a2e:
> 
>    Merge remote-tracking branch 'remotes/philmd/tags/renesas-20211030' into staging (2021-10-30 11:31:41 -0700)
> 
> are available in the Git repository at:
> 
>    git://github.com/awilliam/qemu-vfio.git tags/vfio-update-20211101.0
> 
> for you to fetch changes up to e4b34708388b20f1ceb55f1d563d8da925a32424:
> 
>    vfio/common: Add a trace point when a MMIO RAM section cannot be mapped (2021-11-01 12:17:51 -0600)
> 
> ----------------------------------------------------------------
> VFIO update 2021-11-01
> 
>   * Re-enable expanded sub-page BAR mappings after migration (Kunkun Jiang)
> 
>   * Trace dropped listener sections due to page alignment (Kunkun Jiang)
> 
> ----------------------------------------------------------------
> Kunkun Jiang (2):
>        vfio/pci: Add support for mmapping sub-page MMIO BARs after live migration
>        vfio/common: Add a trace point when a MMIO RAM section cannot be mapped
> 
>   hw/vfio/common.c |  7 +++++++
>   hw/vfio/pci.c    | 19 ++++++++++++++++++-
>   2 files changed, 25 insertions(+), 1 deletion(-)

Applied, thanks.

r~

