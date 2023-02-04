Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A72568A9C4
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 13:35:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOHju-00077N-G5; Sat, 04 Feb 2023 07:33:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pOHjs-00077F-Lf
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 07:33:52 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pOHjp-0005jA-PN
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 07:33:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4lIOpyv4pvRWXFk8H4A0H31LpIhsBbFbOciCqrUuuws=; b=U8zeSsgSzsueCENFBR6E4G+G/h
 ur/jYW0FsDhBouiAYnYyvsEeGnt/UsJvvFKLTrOv9WzBQkjEghiOxySecPBQRKihaGl8PfiSi3Aff
 wjbVXYueMG+8IzHpLU9Gxjuscz7d/TCnYBhR3UhipqcB0n3H9EM+gmWO+W6BaIX9N+Fs=;
Message-ID: <f984b2e3-95b6-6fef-e445-1ba7d40a5f06@rev.ng>
Date: Sat, 4 Feb 2023 13:33:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: ASan reports use-after-free when running munmap-pthread
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: "ale@rev.ng" <ale@rev.ng>, iii@linux.ibm.com,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <b7de2f25-c6a4-d053-2e27-ed8f13996182@rev.ng>
 <18e96c58-b6e5-9837-9753-a263f3b15918@linaro.org>
Content-Language: en-US
Organization: rev.ng
In-Reply-To: <18e96c58-b6e5-9837-9753-a263f3b15918@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  anjo@rev.ng
X-ACL-Warn: ,  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 2/3/23 22:18, Richard Henderson wrote:
>
> The fix for this was merged today:
>
> 4731f89b3b cpu: free cpu->tb_jmp_cache with RCU
>
> I'd forgotten about this, since the pull request was pending for some 
> time, while we waited for CI minutes to refresh.
>
>
> r~

Ah that's great, thanks for taking a look!

-- 
Anton Johansson,
rev.ng Labs Srl.


