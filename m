Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2737D629442
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 10:26:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ousCV-0004jx-2u; Tue, 15 Nov 2022 04:25:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1ousCF-0004jU-IC
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 04:25:36 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1ousCC-00086Q-6K
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 04:25:34 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id AEFA9402A0;
 Tue, 15 Nov 2022 12:25:20 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 1909E3B9;
 Tue, 15 Nov 2022 12:25:20 +0300 (MSK)
Message-ID: <ba8aee1e-4b53-4c28-d77d-41782b56a5e0@msgid.tls.msk.ru>
Date: Tue, 15 Nov 2022 12:25:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2] capstone: use <capstone/capstone.h> instead of
 <capstone.h>
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, "Daniel P. Berrange" <berrange@redhat.com>
References: <20221113200942.18882-1-mjt@msgid.tls.msk.ru>
 <CAFEAcA_aGiukDWQBAjj=Ln_u02wEbMNxOsHRZcBOm+jOz6HU2Q@mail.gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <CAFEAcA_aGiukDWQBAjj=Ln_u02wEbMNxOsHRZcBOm+jOz6HU2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

14.11.2022 14:59, Peter Maydell wrote:
..
> We can do something like
> 
> config_host_data.set('HAVE_CAPSTONE_CAPSTONE_H',
> cc.has_header('capstone/capstone.h', depedencies: [capstone])

This doesn't work, because has_header does not have "dependencies"
argument.  And without that, it doesn't take pkgconfig's --cflags
into account.

> Dan: is there a reason why in commit 8f4aea712ffc4 you wrote
> the "check that capstone.h really exists" check with cc.compiles
> rather than cc.has_header ?

Maybe that's why.

/mjt


