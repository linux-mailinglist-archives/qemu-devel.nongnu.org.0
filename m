Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0626238E062
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 06:37:39 +0200 (CEST)
Received: from localhost ([::1]:35588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll2LS-0001J7-48
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 00:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ll2Kg-0000TR-KG
 for qemu-devel@nongnu.org; Mon, 24 May 2021 00:36:50 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:36656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ll2Kf-0000Mq-7K
 for qemu-devel@nongnu.org; Mon, 24 May 2021 00:36:50 -0400
Received: by mail-pl1-x633.google.com with SMTP id a7so5301744plh.3
 for <qemu-devel@nongnu.org>; Sun, 23 May 2021 21:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/VyvJp84HuMk2YKRYlJ3LS+bgdU42NiCt4Vt5foWH3o=;
 b=bCDIS6FYlrN650ELN4KS2GVWoRF5Qu4Z0704gR9fCQ4soMCR6CjwR4SDBrbjrg2y6v
 2R6CziEIIrTFBjFSM2M6fVbF4J2z/vLTz2g5H+sFV0YASngsDhukK2KOXsomXgUOpxDP
 9n/YbqML6RyCgAGwViDh92uE9I/sQY/U/L753C72dfcAFjDv6+80QEzDpuvG7NUqnhpY
 waj7BhDK3WX5eplrolrFuGeoZyKH0m8GmZMDB+BCVX7SR/Tq8UsaoYxOBRS5UKAn3YU0
 C1/etLWArrTVPdtzG+20X1uYK201T/WV3YQNLgyntQeDPS8ZosBtCHrgT8FRxk1lOnTh
 EJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/VyvJp84HuMk2YKRYlJ3LS+bgdU42NiCt4Vt5foWH3o=;
 b=kHkR3q4eWswRBMbKFgXFPYS2TjD6V1UMPLBPeE2UqH7smiKQbRLRN5imGc5DluoRg4
 FRiL1OWUTS/aJYBAexkLihJXxGuMSocgwd0sbmnyD3C7BruM1Fcnl3q2u4ZBWboxm0nT
 0PNscU0f0Nh18vsLVHAmSAmsWkzMc9jst90DU5KfIyDeNSU3UlNt0nTC9/V1axrUj3CK
 2n4vIcIsjBOp8gQsePmcFQSIblnvF7e2eWscyHlwJ8LGetf7UJBR5N3WxwFATfJysRvM
 shhSl36pcBvNjPFe3SpB8AQ1zOSpzPs49V0de945n9kPxE2TSfTeq+yT6wq/HEH4NQO0
 XEWA==
X-Gm-Message-State: AOAM532cHmCWeQ4Z5RQRzYIEba1fk8r2O8ZO+5jA8VU4eLl6PvpGJ+VU
 qBz7CmoOXXO19DIYbxT5ajoMCSyCGus5FiiYwEA=
X-Google-Smtp-Source: ABdhPJyileHGLxqyA6BWVWpKucRbItLrA6yLufqRCpPOEL5ozbvo0xcjiZdd0Q2eQYEutuPkkQPzuw==
X-Received: by 2002:a17:90a:3988:: with SMTP id
 z8mr23276603pjb.175.1621831007024; 
 Sun, 23 May 2021 21:36:47 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 n30sm10440359pgd.8.2021.05.23.21.36.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 May 2021 21:36:46 -0700 (PDT)
Subject: Re: [PATCH 16/24] target/ppc: Remove PowerPCCPUClass.handle_mmu_fault
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210518201146.794854-1-richard.henderson@linaro.org>
 <20210518201146.794854-17-richard.henderson@linaro.org>
 <YKsdQ4IKyLJpGi4Y@yekko>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <52a1be8e-da96-3146-5ab5-e46735f683fc@linaro.org>
Date: Sun, 23 May 2021 23:36:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKsdQ4IKyLJpGi4Y@yekko>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SUBJ_WIPE_DEBT=1.004 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/23/21 10:28 PM, David Gibson wrote:
> On Tue, May 18, 2021 at 03:11:38PM -0500, Richard Henderson wrote:
>> Instead, use a switch on env->mmu_model.  This avoids some
>> replicated information in cpu setup.
> 
> I have mixed feelings about this, since I introduced
> pcc->handle_mmu_fault specifically to get rid of the nasty
> mega-switch, with the hope of eventually getting rid of env->mmu_model
> entirely.
> 
> But.. it does simplify your patch series, which makes a good change
> overall.

Having browsed the mmu code for a while, I would imagine a good change would be 
to have several hooks, and the mmu_model enum, all in the same const struct. 
But the current situation is untennable.


r~

