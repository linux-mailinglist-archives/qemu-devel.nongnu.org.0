Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA716887E4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 20:58:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNfhb-0007Q5-GE; Thu, 02 Feb 2023 14:56:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pNfhX-0007Pq-4V
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 14:56:55 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pNfhV-0000xy-8I
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 14:56:54 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id AC2764004C;
 Thu,  2 Feb 2023 22:56:42 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 32ACCC8;
 Thu,  2 Feb 2023 22:56:41 +0300 (MSK)
Message-ID: <24044405-2916-7a7d-a9dc-366609e92dbc@msgid.tls.msk.ru>
Date: Thu, 2 Feb 2023 22:56:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Candidate patches for Debian's 7.2 release (and backports)
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Michael Roth <michael.roth@amd.com>,
 Remi Duraffort <remi.duraffort@linaro.org>,
 Anders Roxell <anders.roxell@linaro.org>
References: <87edr8kqqq.fsf@linaro.org>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <87edr8kqqq.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
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

02.02.2023 18:10, Alex Bennée wrote:
> 
> Hi Michael,
> 
> As I mentioned on IRC the LKFT team use Debian's backported version of
> QEMU to test a wide range of kernel configurations in the cloud.
> Unfortunately 7.2 shipped out with a few regressions which has halted
> some of the testing when they upgraded from 7.1 to 7.2. Fortunately I
> think most of these regressions have fixes in master.

Thank you for the reminder Alex!

I grabbed all patches in master which are tagged for stable (had to
tweak two nvme patches) and another which was pending in pm215 pullreq
(target-arm-Fix-physical-address-resolution-for-Stage2), and uploaded
7.2-2 to debian unstable. bpo11 version is ready too, I'll upload it
once 7.2-2 is built on unstable, hopefully there's no further regressions
in the changes I picked.

https://salsa.debian.org/qemu-team/qemu/-/blob/debian/1%257.2+dfsg-2/debian/changelog

Thanks,

/mjt

