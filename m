Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C6F5E93D1
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 17:04:13 +0200 (CEST)
Received: from localhost ([::1]:57330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocTAx-0000DB-Gz
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 11:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocT7e-0007EY-Nu
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 11:00:46 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:52671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocT7d-00032o-1u
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 11:00:46 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MrhLu-1ozgSR192S-00njGh; Sun, 25 Sep 2022 17:00:39 +0200
Message-ID: <81d87bcc-1878-513d-90ca-d690dc88e835@vivier.eu>
Date: Sun, 25 Sep 2022 17:00:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 01/12] linux-user: Add missing signals in strace output
Content-Language: fr
To: Helge Deller <deller@gmx.de>, Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220918194555.83535-1-deller@gmx.de>
 <20220918194555.83535-2-deller@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220918194555.83535-2-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1/FfhQohDNJUNU4zuqMPnTanGe+wOFkzVDbpqPL914SdPolyAX/
 qgSzqpWLUExqkJ2pIxeN7P5Plj5o9gjU11K2Whde8iDv4vwyFMC1mnWfk4EFb53ZoKB1Y9h
 AvFvrQt3g79dDCVywKVEbHtijDTtsBLoC0eirgSILXWd9rYSSHZ9N7fyr3Ew4M+6C1l+fXF
 k9OJw1dwd4aVNv2Ond5Vw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eYwFesA3eoY=:stovdBKe2KJaFzS+XCrt1E
 vQwW7YGnWFZWNQNKlysvMjIBKFcLjlsqYlZGqZJzhSzi2KIRaO1gSUjgzCefncMskdiHC6mtH
 sFwDnW5n4qn1xwdGiTifr65kDj8UJO4e98OMxrIlrg9qtJH5gqpfciaQ2ulOIqt4rScL5TgsY
 cbl81G7+9FfSn6JPpG82kiNN/GfQaT0bQ8W43A+p5mFeixYmFhJNm747GXy/8Eq3Yz/1fF+J/
 fVcEWWUFObh5+46bGXN96rugDwGEFMGDkpmQamfio2kDB4iDKbCnqlob14C5SHO+srUFRxsiX
 6rZz4g5Mq54AfnhdaOi9syCHHUXl3BVToXbqqHY0IteCYFxQPLc/pZpMRSBHgOGEFOQjsLLbj
 XQosYm+VMYmguZXNHU4GVTEoCJUo9/0uEqWvm4SXmIyal/Z97Iw9aWZPFSC46Tjmq2gPY07JD
 Rtiqy2YU411Thk6lhcaVGoc4Brq1y3oq2lYkxHibtZYyvbpTaVbqIUbsZVVZvjP7HNgHxMYRB
 qTXNFoJcCWt7KzwH1QodBlAQ+zvkFUnREIQwibMWXs3DKkhulHw3M/hnVqdWEGEy1mwrWsPqt
 SsxlgsWe7l9irzsLomkxSJCda2ciQmwnJ4eRpzzmsaDfX/eULEDkIGZKFCERH55evCXEgFbN9
 1Unaa0LJjufaJEuYqMqKRH0f0bppMrmPQQ90qBl6bbgGSvc3YlOmQ9HX4XGRYMLEOL4eH6Nb2
 5XVqtS60w30xyOQf/tqNvWCdz7377+sOZZl4H0l4FWQG54RE0IAwZiI+Wy77nIZMMoKbZR+on
 VO3us8O
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.766,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 18/09/2022 à 21:45, Helge Deller a écrit :
> Some of the guest signal numbers are currently not converted to
> their representative names in the strace output, e.g. SIGVTALRM.
> 
> This patch introduces a smart way to generate and keep in sync the
> host-to-guest and guest-to-host signal conversion tables for usage in
> the qemu signal and strace code. This ensures that any signals
> will now show up in both tables.
> 
> There is no functional change in this patch - with the exception that yet
> missing signal names now show up in the strace code too.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/signal-common.h | 46 ++++++++++++++++++++++++++++++++++++++
>   linux-user/signal.c        | 37 +++---------------------------
>   linux-user/strace.c        | 30 +++++++++----------------
>   3 files changed, 60 insertions(+), 53 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


