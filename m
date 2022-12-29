Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB52658956
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 05:09:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAkDi-00021V-PM; Wed, 28 Dec 2022 23:08:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1pAkDf-000217-IT
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 23:08:40 -0500
Received: from mail-sender.a4lg.com ([153.120.152.154]
 helo=mail-sender-0.a4lg.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1pAkDd-0006iT-7A
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 23:08:39 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 42685300089;
 Thu, 29 Dec 2022 04:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1672286907;
 bh=IqgAbx8Os0g3VR0MAdsUugLGcCQNWq6o9tVM+QZS6Zg=;
 h=Message-ID:Date:Mime-Version:Subject:To:References:Cc:From:
 In-Reply-To:Content-Type:Content-Transfer-Encoding;
 b=honEROClzK9qj2hY/0oc8tcPo18MJbQCO62TE/1vw9v0efjH/+IJJ9ssGBvp0HvxX
 ENGFXA1RO1yR4ZhnccipAbhyUNcghwqIwIsXbF6l326Du5auREE+LYddXX4+3GXzAk
 EZOM39PZ9O0kKjUlIrCyeboh9fbvJEqFehQ2qmA4=
Message-ID: <1b9fb2e5-6b2f-59fa-d684-2491e389fb32@irq.a4lg.com>
Date: Thu, 29 Dec 2022 13:08:25 +0900
Mime-Version: 1.0
Subject: Re: [PATCH 06/11] contrib/gitdm: add Tsukasa as an individual
 contributor
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20221219121914.851488-1-alex.bennee@linaro.org>
 <20221219121914.851488-7-alex.bennee@linaro.org>
Content-Language: en-US
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
From: Tsukasa OI <research_trasio@irq.a4lg.com>
In-Reply-To: <20221219121914.851488-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=153.120.152.154;
 envelope-from=research_trasio@irq.a4lg.com; helo=mail-sender-0.a4lg.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Alex,

Sorry for being late.
Yes, I'm an individual contributor (I'm working at TRASIO, a Japanese
government-funded research project using RISC-V [and the corporation
built for it] but all my QEMU contributions are not a part of TRASIO's
work).

Thanks,
Tsukasa

On 2022/12/19 21:19, Alex Bennée wrote:
> I wasn't sure if you want to be added as an individual contributor or
> an academic so please confirm.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Tsukasa OI <research_trasio@irq.a4lg.com>
> ---
>  contrib/gitdm/group-map-individuals | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-map-individuals
> index 53883cc526..e2263a5ee3 100644
> --- a/contrib/gitdm/group-map-individuals
> +++ b/contrib/gitdm/group-map-individuals
> @@ -37,3 +37,4 @@ akihiko.odaki@gmail.com
>  paul@nowt.org
>  git@xen0n.name
>  simon@simonsafar.com
> +research_trasio@irq.a4lg.com

