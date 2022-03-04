Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBDF4CD281
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 11:38:01 +0100 (CET)
Received: from localhost ([::1]:34034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ5Jv-0001Rw-Gn
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 05:37:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nQ5G2-00046v-0l
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:33:58 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:57105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nQ5G0-0001pl-Go
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:33:57 -0500
Received: from [192.168.100.1] ([82.142.8.122]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N0G5h-1oMT4T0k0V-00xLjg; Fri, 04 Mar 2022 11:33:50 +0100
Message-ID: <e58208a0-f412-c399-b35a-1d9d3304ca66@vivier.eu>
Date: Fri, 4 Mar 2022 11:33:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 10/10] esp: recreate ESPState current_req after
 migration
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, pbonzini@redhat.com,
 fam@euphon.net, qemu-devel@nongnu.org
References: <20220302212752.6922-1-mark.cave-ayland@ilande.co.uk>
 <20220302212752.6922-11-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220302212752.6922-11-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:piKyvs5vNMsBd5Abwu7h1reGzHWvFqRTmFAtvc9QxuseFvx+SkH
 44R5lTRuFNqNzAW814dLDtUkBS3CYeWEYvVMwW0AjdF+3rWLxPqBITwyMaAZbKpRrnJePMq
 dlErBH+YD2eOSt4KOi73cCkE/IeAKMOw8lxHzoXRzPgdSPIOvCMLxS0LDOG9PV7QTNsjKRR
 ZIrPbf6I65pzNo0DGWsvA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:w5ZpEQ2f2dk=:UcmKkCGx7xaUON9au2R6tG
 uJf+6uavKZTvUFz6mh3t/y1KUYPZJg2qhC22qCvJzabU7pfYha+gvKXms7PmmZ5RctnEBpZMc
 /KBC7IBJL1XCCS2KPZ0ER1Js2MJtKx6Aq6+Xi9ynRnFTuFtnqDxBskcptdIbCLT1uYgW0ntrm
 C5qulu+W2fzSPCkVvtZJLoKRh6Dj2PIkBciAZjOfxjQv86No078kU28V1kITh1jH/NnGuvuQH
 9KjyS0fPDtga7jO6Td8YvMBsdj1iXCwsXBmjcNVKP7YRv3fhARFeEgPocEzxtghtG/g0o4ul8
 /vR3ChDAiWlugI92lYXAirHc8nrQ9hZL/oakC19yiQ7LXg3UXB0zPcD0DuN0clH/amWTIpXva
 JWHL56dvXvDbdDHvQKLj+BuFRcSxVNVkf8KuldE+DQ5tllaTIo5dDVHK4IwWPJ3VeKnRdcG3b
 LQ8rVy8bAmE+wBPO5rARW1irnJZREiVEFzNUQ57YAUNVjTnCukumpEshIKc5tyznw4BjPIM/q
 4md1oJxrDycCxu5WS85MWoDTElG2QCVRFHtI5GhtX0kBJMjKRc4h4fkbvF1fjgeCFi7u89SRa
 8WnbsGwimMdDy5SvB64+7+wzQLyJD69cIgWwscl7r0fvISPUz/BCJVFqSuEGB+5Vi7Z+L6K0k
 sMD1Gy77SpLW1bOU/wAr1HJS+dukvdfqylA5yOl5OpsVCd0C2qZc1IMsoZRHmmhwrWdo=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 02/03/2022 à 22:27, Mark Cave-Ayland a écrit :
> Since PDMA reads/writes are driven by the guest, it is possible that migration
> can occur whilst a SCSIRequest is still active. Fortunately active SCSIRequests
> are already included in the migration stream and restarted post migration but
> this still leaves the reference in ESPState uninitialised.
> 
> Implement the SCSIBusInfo .load_request callback to obtain a reference to the
> currently active SCSIRequest and use it to recreate ESPState current_req
> after migration.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/scsi/esp.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>



