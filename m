Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 788526D8FD8
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 08:55:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkJWR-0001Sz-TN; Thu, 06 Apr 2023 02:55:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pkJWO-0001SI-Tx; Thu, 06 Apr 2023 02:55:00 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pkJWM-0000Vl-HK; Thu, 06 Apr 2023 02:55:00 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 1130D4000C;
 Thu,  6 Apr 2023 09:54:56 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 91DE8DD;
 Thu,  6 Apr 2023 09:54:55 +0300 (MSK)
Message-ID: <199575b7-b4ce-b502-a1dd-d5f1174c0b87@msgid.tls.msk.ru>
Date: Thu, 6 Apr 2023 09:54:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: QEMU stable 7.2.1
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Michael Roth <michael.roth@amd.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 qemu-stable <qemu-stable@nongnu.org>
References: <62db7253-9cd7-e095-6b9f-ffcdecfa9bf6@msgid.tls.msk.ru>
 <20230405135818.52ggpbvumybryvr7@amd.com>
 <ce3bbb93-2534-e2bc-ece5-8bc4e2943bb8@msgid.tls.msk.ru>
 <20230405185720.2yxd52njk3tcsauk@amd.com>
 <20230405210658.yg2i6grklgqp73rr@amd.com>
 <9d2a753d-0b50-8fa4-2a71-590fd5ffd22f@msgid.tls.msk.ru>
 <734b7b91-0305-1358-15f4-f63d7d272e7f@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <734b7b91-0305-1358-15f4-f63d7d272e7f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -82
X-Spam_score: -8.3
X-Spam_bar: --------
X-Spam_report: (-8.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.355,
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

06.04.2023 09:48, Thomas Huth пишет:
..>> There's one minor caveat still, though: it is missing in the
>> "Full list of releases" for whatever reason.  Dunno how that
>> happened, maybe that page hasn't been (re)generated yet.
> 
> FWIW, I can see it on https://download.qemu.org/ now.

I still can't, no matter how many times I hit browser "Reload"
button, or try another browser or even another computer.

It's available as a direct link but not in the listing page.

/mjt

