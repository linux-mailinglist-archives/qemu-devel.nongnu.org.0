Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 322516E1650
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 23:05:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn46P-0005ED-1i; Thu, 13 Apr 2023 17:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pn468-0005Cm-B3; Thu, 13 Apr 2023 17:03:16 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pn45E-00057K-O6; Thu, 13 Apr 2023 17:03:15 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 7C9E240107;
 Fri, 14 Apr 2023 00:02:19 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id EBC3F95;
 Fri, 14 Apr 2023 00:02:17 +0300 (MSK)
Message-ID: <bc40563e-ac10-3c45-6972-84468324549a@msgid.tls.msk.ru>
Date: Fri, 14 Apr 2023 00:02:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 00/21] Patch Round-up for stable 7.2.2, freeze on
 2023-04-20
Content-Language: en-US
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org
References: <20230413203051.2344192-1-mjt@msgid.tls.msk.ru>
 <CAPMcbCqDEtMAQdzdryuiwj3afwoj5RCEC+nAhmCi40pF4kG9pw@mail.gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <CAPMcbCqDEtMAQdzdryuiwj3afwoj5RCEC+nAhmCi40pF4kG9pw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -79
X-Spam_score: -8.0
X-Spam_bar: --------
X-Spam_report: (-8.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.083,
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

13.04.2023 23:50, Konstantin Kostiuk wrote:
> Hi Michael,
> 
> You cherry-picked one of my patch qga/win32: Remove change action from MSI installer
> but it is part of the CVE fix.
> 
> Please cherry-pick one more patch.
> 
> Original mail: https://patchew.org/QEMU/20230303192008.109549-1-kkostiuk@redhat.com/ 
> <https://patchew.org/QEMU/20230303192008.109549-1-kkostiuk@redhat.com/>

I planned to pick both but somehow ended up with just one.

Thank you very much for this, picked up now!

/mjt

