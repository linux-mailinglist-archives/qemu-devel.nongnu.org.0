Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA35698FE7
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 10:36:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSaft-0005XN-ST; Thu, 16 Feb 2023 04:35:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kenneth-lee-2012@foxmail.com>)
 id 1pSafq-0005X9-Ag
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:35:30 -0500
Received: from out162-62-57-210.mail.qq.com ([162.62.57.210])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kenneth-lee-2012@foxmail.com>)
 id 1pSafm-0003pD-PK
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 04:35:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1676540115;
 bh=dn38jw0rh1rAwR6KsXvTQAMJ8rFHQqrRkdY+GAxGqA0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=gElKjDFj89xU2yZ+J9cUjU3B3HoyXY2vF3J45J/9kwAdRnuUgfa0qJaZ5bZPMa8vZ
 nlqjki2rxjagUiGHUXq65VqmzK47bqsp17dBBLmk9oUyRT4cVjPdA+95bPqM8MP/ST
 72jzO016v24aEQgBFHwG0O0CuZrPfEqgneOIns/M=
Received: from localhost ([2409:895a:d8f0:d881:c14a:533e:41cd:a65a])
 by newxmesmtplogicsvrszc2-0.qq.com (NewEsmtp) with SMTP
 id 8CD8CC18; Thu, 16 Feb 2023 17:35:13 +0800
X-QQ-mid: xmsmtpt1676540113tq5rv5jdy
Message-ID: <tencent_54E4936F65803D325A9942264D1DF9F4D506@qq.com>
X-QQ-XMAILINFO: Mm/8i8/T4yne38vwMxwBxbwx5xOGV2W2tAiqNgbEYwQtdOVbkVVSzMu5fby58V
 qIq1l17xtynizy0kcTOYftqSfE9INMPMUB/GNNNFfgCaVq8Ub3H3bKG0IqnFA06yC/iowje1pA7r
 FmqwTyXmNsW/eMpYxK9/MJsGZGWE6tz2G4sLCcFhbnBA8cvy7uFPqlhYU9OwJLBfK6Fo6E/9gpSz
 tZSCNtJyOdSOH6oezXPu1CTe3WYeJWpzgNDAtavZGjsZw2EArPv3ApJFSPr0dMTyik7sJFoGLTOX
 So0YUkdL7FTidcG0/xvK6HQFkEpddy/cFJ1ktkfIfI0Evay407b7xk+noqIi7iPGGA/KJDaBg2Mt
 UCuGpA6GgxdipF+nwQTq4zgQKvgcMpka2tesbN1foAoxfvXXwIMkFfuVZ4FXMdZBTKOXdgcefQxI
 Ql0SC8AvTTO195B67W/tIp1/uTqNhHsunAJmjr7Q6AOUFSci5ULbNixwArI0/qrirga2YMSc86iP
 ek109Ik0Y1fmRQt360BBxvU0XwP7IvL0dZHQ6QCGtmaMeSQx7I8PC6Z95iamEdvtPmLWhWFFYCrS
 LPQEqQdKY9Qh2/kzCZ+LonnkkI/cKzpA6OkAY4ZE87IC7cgyTKFBJWnee5nrb6B6hkgXm+6HM5X5
 gWWu/gaeCY55S0+qVFbc+OqwiEwktzRfFP59HMd3tjvS7vvrdaRwdFZzzNlGii7BtZYLHoJk1AxA
 MviQZaWHhOI2mIVyEUvox1U/5gpU/dIbQTfhe9qaAnitYq9PhkMw3kPuKlINUMzR+gRswLv8+W9+
 r4iadyjmo1C4qQqLAYMctJ9hOXjVw9aQ9ASd6hWubzL+Hcmn19FbZEsu/kjAOn2bUdAr3Xmeb8MD
 pKXJEs+Uq0imN7tk7SJoc4xu1fiiJVLy8JkdUJBF9VsF/1kZRDZmXSACebg9ojEJO9cAH09d7d84
 KRhHiwViLxWb0wWVatOCRqfAIh4BpV
Date: Thu, 16 Feb 2023 17:35:13 +0800
From: Kenneth Lee <Kenneth-Lee-2012@foxmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: Does the page boundary check still necessary?
X-OQ-MSGID: <Y+340R1J0POb10oS@lklp02>
References: <tencent_F8004464D432CD4CABBADFE9E9493EDF9607@qq.com>
 <b2c5dd7c-5c90-9104-5477-b76ed22ea799@linaro.org>
 <tencent_5ED3B1CE709A7A92C2B7264011B9A84C2205@qq.com>
 <2c467dfb-a546-1bfc-a2e6-be30d91c73df@linaro.org>
 <tencent_242293DEBEFE0102C8F4654A993A7531D308@qq.com>
 <36dbc1bd-cf2d-ad74-8432-c9550e1a0aa4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36dbc1bd-cf2d-ad74-8432-c9550e1a0aa4@linaro.org>
Received-SPF: pass client-ip=162.62.57.210;
 envelope-from=kenneth-lee-2012@foxmail.com; helo=out162-62-57-210.mail.qq.com
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

On Wed, Feb 15, 2023 at 04:52:24PM -1000, Richard Henderson wrote:
> Date: Wed, 15 Feb 2023 16:52:24 -1000
> From: Richard Henderson <richard.henderson@linaro.org>
> To: Kenneth Lee <Kenneth-Lee-2012@foxmail.com>
> Cc: qemu-devel@nongnu.org
> Subject: Re: Does the page boundary check still necessary?
> User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
>  Thunderbird/102.7.1
> 
> On 2/15/23 16:28, Kenneth Lee wrote:
> > On Wed, Feb 15, 2023 at 04:26:18PM -1000, Richard Henderson wrote:
> > > Date: Wed, 15 Feb 2023 16:26:18 -1000
> > > From: Richard Henderson <richard.henderson@linaro.org>
> > > To: Kenneth Lee <Kenneth-Lee-2012@foxmail.com>
> > > Cc: qemu-devel@nongnu.org
> > > Subject: Re: Does the page boundary check still necessary?
> > > User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
> > >   Thunderbird/102.7.1
> > > 
> > > On 2/15/23 15:45, Kenneth Lee wrote:
> > > > > > Now the chained TBs have been link with tb_link_page(), the chain will
> > > > > > be rebuilt if it is invalidate on page. So why is this check still there?
> > > > > 
> > > > > Even for a guest which doesn't use paging, and therefore does not need to
> > > > > worry about memory maps changing, we still enable breakpoints and
> > > > > watchpoints on a per-page basis.
> > > > > 
> > > > 
> > > > Thank you. So is this the only reason? May I write a fine grained
> > > > checking to remove this limitation?
> > > 
> > > No.
> > > 
> > Why?
> 
> When breakpoints change, we discard all translations on the affected page,
> similarly to how we handle writes from self-modifying code.  If you link
> from further away, then TBs won't be invalidated properly when breakpoints
> change.  For most guests, this isn't a limitation because we also have to
> care for modifications to page tables, so we can't allow such links anyway.
> 
> I have no idea what you're trying to accomplish that's different from existing guests.

Thank you for the clarification. You are right. It is senseless to the
current guests. I just consider a guest with some hint to the main
sequence of the code. It jumps out of range constantely. Maybe I can
find other way to solve the problem.

Thanks again.

> 
> 
> r~

-- 
			-Kenneth Lee (Hisilicon)

