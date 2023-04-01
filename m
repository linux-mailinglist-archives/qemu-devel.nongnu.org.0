Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A636D2F1B
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 10:44:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piWpl-0003AM-Es; Sat, 01 Apr 2023 04:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1piWpj-0003AB-Uq; Sat, 01 Apr 2023 04:43:35 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1piWpi-0000gB-BV; Sat, 01 Apr 2023 04:43:35 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 01E6F4000E;
 Sat,  1 Apr 2023 11:43:31 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 6D50792;
 Sat,  1 Apr 2023 11:43:31 +0300 (MSK)
Message-ID: <f3ce4948-a24b-e466-653c-2159b76adfbe@msgid.tls.msk.ru>
Date: Sat, 1 Apr 2023 11:43:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: qemu-stable final release process
Content-Language: en-US
From: Michael Tokarev <mjt@tls.msk.ru>
To: Michael Roth <michael.roth@amd.com>, qemu-stable
 <qemu-stable@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
References: <e2788576-8a0b-0027-6483-d5fb4aa02925@msgid.tls.msk.ru>
In-Reply-To: <e2788576-8a0b-0027-6483-d5fb4aa02925@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

Ping? :)

30.03.2023 13:18, Michael Tokarev wrote:
> Hi!
> 
> Michael, there's the final step to do, after having the branch and increasing version number, -
> this is about to make the actual release. I see scripts/make-release which apparently does what
> it should, hopefully anyway. What's the final steps?  This tarball needs to be published too.
> 
> There's a branch published, https://gitlab.com/qemu-project/qemu/-/tree/stable-7.2 , which should
> hopefully become 7.2.1. I haven't tagged it yet though.
> 
> Thanks!
> 
> /mjt
> 
> 


