Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C906B56ED
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Mar 2023 01:46:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1panLv-0005yT-C2; Fri, 10 Mar 2023 19:44:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1panLs-0005yB-2q
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 19:44:48 -0500
Received: from mail-sender-0.a4lg.com ([2401:2500:203:30b:4000:6bfe:4757:0])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1panLp-0000ds-00
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 19:44:47 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 91959300089;
 Sat, 11 Mar 2023 00:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1678495473;
 bh=8sHWaf6wS6sAXi+LDAtkPkH/jiIT/YIXcV4Jf5/sQuo=;
 h=Message-ID:Date:Mime-Version:Subject:To:References:From:
 In-Reply-To:Content-Type:Content-Transfer-Encoding;
 b=TVVHEMTZyEbSXmV4CGBYSvQPCDfpEV5llDkrTQ8wwg8v26DMecTISag0TOV7y70Bn
 gdZUHK9kdb3Av9MGgr1jWmr5Vm2robDjH/7tewq6VgX5ufrnNL0iUrCppyrhXoEG5/
 lTHX4340Wfvc77jGN23Kl7vI0bx8vk82J2/hrm/c=
Message-ID: <2a7f3f7e-31ed-7ab3-f229-5f981be7f22d@irq.a4lg.com>
Date: Sat, 11 Mar 2023 09:44:29 +0900
Mime-Version: 1.0
Subject: Re: [PULL 3/5] contrib/gitdm: add Tsukasa as an individual contributor
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <20230310155726.2222233-1-alex.bennee@linaro.org>
 <20230310155726.2222233-4-alex.bennee@linaro.org>
Content-Language: en-US
From: Tsukasa OI <research_trasio@irq.a4lg.com>
In-Reply-To: <20230310155726.2222233-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:2500:203:30b:4000:6bfe:4757:0;
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

On 2023/03/11 0:57, Alex Bennée wrote:
> I wasn't sure if you want to be added as an individual contributor or
> an academic so please confirm.

Individual.

> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Acked-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> Message-Id: <20221219121914.851488-7-alex.bennee@linaro.org>
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

