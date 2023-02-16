Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A679698A84
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 03:29:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSU1M-0000oc-71; Wed, 15 Feb 2023 21:29:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kenneth-lee-2012@foxmail.com>)
 id 1pSU1I-0000oJ-Kl
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:29:13 -0500
Received: from out162-62-57-137.mail.qq.com ([162.62.57.137])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kenneth-lee-2012@foxmail.com>)
 id 1pSU1F-00041c-Il
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:29:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1676514539;
 bh=aeBatCMz0Gbsxa3YF021kV82gYkDsrRutoVO9BWKBLo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=h5SfiSKKxz1dEyUgtcQWU6pR8vOErV1/+NmAwXtTJ7nHbcza4spJEnuYmAPP5m9wQ
 KLbX0pgskXKlYbl9EXiw35yN9xwnT6LK+23QBJb9YW3iIOk3jWjrSLGqRCU0Ex4rew
 zWUEzsmxZlcYA8CslOrAVD08u+xXGAAN+GRf0UMw=
Received: from localhost ([2409:895a:d8f0:d881:b121:5fe6:ac83:96b8])
 by newxmesmtplogicsvrszc1-0.qq.com (NewEsmtp) with SMTP
 id 73A3AC56; Thu, 16 Feb 2023 10:28:58 +0800
X-QQ-mid: xmsmtpt1676514538t8yw5f86b
Message-ID: <tencent_242293DEBEFE0102C8F4654A993A7531D308@qq.com>
X-QQ-XMAILINFO: NLLC220q1X5w8XjY/Q9hkg6/Cyp/N1q/Pr0XM/6unK6pSdl/o6oiEIajz6UcFV
 D+C0eaPQ6hcgQwpDit1H8bkj3xNdA0/kJ4BWJmvdJclnSvZ/PlNtELb0NvegFw07sjrJI+J0PegE
 SRJJE6ExelVd3u2UcAh6zcmMZxBc8qhfV3AaoGUoM+MMAI/tpHAbaMuezO832PvsRidY/BeqUhzy
 TPd8yNrkL76qEysgxRMx8S7lbDvIfZlaGcG+MIEueXyugRDawULznbGm6wDbAZjsPOumb/qLf7Qs
 RkVJ+QCJKmD+rbddv8Bm5UAtrcqSUgvP4GbuGA8InNOVWnBwlBUUfA4v6PI/O+kPvqznsubduZrN
 Hm0c0b1hMtyDCf8Gl/TsgD8OsRg+6LtWXrhu1BXyDnItC/zeyBh4tswJgevbYiLuHSgoZ6+bEarM
 Jj7DrM8nE0jOGQNstK561SKFH1/5Hjbu9pBbAwFhyD0vasbqHvCJvleKTnxZya9KCjQhFQe+AyQK
 m6gXiQ6+dPVqnk0SNnqLsf4FhDWHm0C1OEoNFjuqnEx6pHmm63cpH9+Y1hGYkgX8gPbIb4bkXyMH
 nOmSDnmEy5u/LMfSMCmQmLHTsa5epbXmCMa6P2tR3GXkViQYwNd+jLGa11sLVWgtPYDOcC0Wa+79
 pOPLNshWzHIkQQk7zhBqNLuVqLr9JJalL3i/kWthnx7E8kcJlUGPovY7u2SjZyjyP+5E9y+3xTxc
 mPy6P++FDls+xgoR568uCDtFcQOvcTv36YFoy/NljgMdVKBKUmUu6Q/DmFsLkUVniPJdZIoJ7lLg
 /d9xT6qRJ9sHVSVYGPTakKxOzM0DywcIMZ461zmcuMUI4Ky8oUUrez2X2PJq6s+CCJZZeeD71M1q
 elmTtRj323xhB04OYiRVKN+7Ca3fpe259xkrg/KPjhaMXfpXOO9FvYcyNrtYBl0fFaUwR8U2+Kn4
 CflIc/J+D49UBb6QW1obv91CgbQxrzsxGpxOENz7+3G/fhQP+7jw==
Date: Thu, 16 Feb 2023 10:28:57 +0800
From: Kenneth Lee <Kenneth-Lee-2012@foxmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: Does the page boundary check still necessary?
X-OQ-MSGID: <Y+2U6WfAGEamSTVM@lklp02>
References: <tencent_F8004464D432CD4CABBADFE9E9493EDF9607@qq.com>
 <b2c5dd7c-5c90-9104-5477-b76ed22ea799@linaro.org>
 <tencent_5ED3B1CE709A7A92C2B7264011B9A84C2205@qq.com>
 <2c467dfb-a546-1bfc-a2e6-be30d91c73df@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c467dfb-a546-1bfc-a2e6-be30d91c73df@linaro.org>
Received-SPF: pass client-ip=162.62.57.137;
 envelope-from=kenneth-lee-2012@foxmail.com; helo=out162-62-57-137.mail.qq.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, HELO_DYNAMIC_IPADDR=1.951, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, RDNS_DYNAMIC=0.982, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Wed, Feb 15, 2023 at 04:26:18PM -1000, Richard Henderson wrote:
> Date: Wed, 15 Feb 2023 16:26:18 -1000
> From: Richard Henderson <richard.henderson@linaro.org>
> To: Kenneth Lee <Kenneth-Lee-2012@foxmail.com>
> Cc: qemu-devel@nongnu.org
> Subject: Re: Does the page boundary check still necessary?
> User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
>  Thunderbird/102.7.1
> 
> On 2/15/23 15:45, Kenneth Lee wrote:
> > > > Now the chained TBs have been link with tb_link_page(), the chain will
> > > > be rebuilt if it is invalidate on page. So why is this check still there?
> > > 
> > > Even for a guest which doesn't use paging, and therefore does not need to
> > > worry about memory maps changing, we still enable breakpoints and
> > > watchpoints on a per-page basis.
> > > 
> > 
> > Thank you. So is this the only reason? May I write a fine grained
> > checking to remove this limitation?
> 
> No.
> 
Why?
> 
> r~

-- 
			-Kenneth Lee (Hisilicon)

