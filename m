Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B99A4CC6D0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 21:09:00 +0100 (CET)
Received: from localhost ([::1]:45960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPrkw-000747-QP
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 15:08:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nPrf8-0006rT-H7
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:02:58 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:38475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nPrf6-0000KD-U6
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:02:58 -0500
Received: from [192.168.100.1] ([82.142.17.50]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MFshF-1nP2hs1TBf-00HO1C; Thu, 03 Mar 2022 21:02:55 +0100
Message-ID: <8129cd1b-b6c0-c8c6-7aff-1dea2ca5816d@vivier.eu>
Date: Thu, 3 Mar 2022 21:02:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 12/12] macio/pmu.c: remove redundant code
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20220224115956.29997-1-mark.cave-ayland@ilande.co.uk>
 <20220224115956.29997-13-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220224115956.29997-13-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:IsL7WBIQ69doBjQABMgdiOy6anI0zqahf/rpJbhr++6110Oyp6+
 y3/8muex5IGqBZcPkZSGitEHLp8wMqbbFyiSkKn12A56iTgh3mGtILkRaWEaLFJBSjXJgpH
 xoi1tXelp6qCGf6wVHhf8/XUxqCLbbJamPaLejFaM3JSVAtv2Nib2VlTRFcQY1IavqMPK+2
 vAMTKggKlSb7biWaR0EDw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XuQXxgKmGvE=:m2WeDrdU0jkkcsjLBEVG+x
 /M+io3pfEw9R6eJqnQ8SupGvILFeECGchjd+M7ZLWZGQHmV3nkpviRn8AOyddTyYtXs7iQcwe
 k9rFo/YSq4wfEN1mSaxY60MaSiqv5M6gzpBtdo9dmWNpkpLKS6MX0IY68kIzVo7wNuquIwYsl
 an6TQVOTn7XSiEgvenA2Ysg6ntEL4rQcv6Sn9P3AVmzH9Hi62fEeGUpaREskWMpx28YGPsoIa
 QODcFwFEq9yPgTcouG3p0nMXF3pLEZy6oNz74xcbPoLyO9OWsUIxxNxyN9DCyiQAvYVFzeJTT
 WHBbAepax7lD7G6KSnDJ2TZGmDqty5vqe6hsqCkLveRVNcv/d470wCGw2BnE+1DwXiQqEK46u
 md3xqP0EBDwor9HIlo8weI8CCNVGdxsDR52Q2v0ExoVf4tdi5YFWW9JuatJBhuMYAFeGfzmsY
 KD7kbZEfZoasrloz0tiJ4iCRukeFYnn9HodEG/aihTZGjPBRoCv0lKKQjaDyduKUlvCVqOsPn
 WG7jOWq3J0jzjRntqlKoi6D9nvj9sfl6OtvP5IqTTDCiljT6aZflPpa3fj3vegnzuRLNs9U0Q
 rAiqJs6VH12oC2vW3N2RP/I3KfmwszphnIQYtLmAD059tkZR2snj2TrbG/vgAmwhfy+lKh5EP
 Rkocw2nc8NXTVoBe4kx+T+/pGTBjtNWB716x7e9CGdx0pi3Hb9LDdUwZn139UW93pCjE=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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

Le 24/02/2022 à 12:59, Mark Cave-Ayland a écrit :
> Now that the logic related to edge-triggered interrupts is all contained within
> the mos6522 device the redundant implementation for the mac99 PMU device can
> be removed.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/misc/macio/pmu.c         | 33 ---------------------------------
>   include/hw/misc/macio/pmu.h |  2 --
>   2 files changed, 35 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>



