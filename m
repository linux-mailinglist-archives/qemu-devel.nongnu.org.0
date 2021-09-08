Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8604034A5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 08:59:17 +0200 (CEST)
Received: from localhost ([::1]:33754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNrYC-00015j-BG
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 02:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNrTN-0003Co-Li
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:54:18 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:45231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNrTJ-0003Vk-W1
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:54:15 -0400
Received: from [192.168.100.1] ([82.142.27.6]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MfYDO-1mqZW002dU-00g3Pg; Wed, 08 Sep 2021 08:54:12 +0200
Subject: Re: [PATCH 11/12] mac_via: rename VIA2_IRQ_SLOT_BIT to
 VIA2_IRQ_NUBUS_BIT
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
 <20210830102447.10806-12-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <0bcd3785-9619-17bb-cc8b-75e14e7f3966@vivier.eu>
Date: Wed, 8 Sep 2021 08:54:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830102447.10806-12-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fiT+gZB/TxhJBalICGk43zgqW5P32i2QusFDRTrJsv/PAUV968T
 v8v9xqPCKl6mxrb6zFVQUWG0udTsEu+h9MkfFa6zggpJLDmPcF1Z3Up5l8FTQFv1FwfAGH4
 Da3ZjQI1vjNPlGOxedu3aw466G6kG+3TvZImC+8rPjjgUW/AxVyMGKmFOmPRdAsFvSMZziw
 R9eOVfiQXrpUeMghmMn8A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:chBy5ZbvFGE=:rqSLemeCRBGq/SNNmqUqoC
 XFfntpTdRdn7uGFEEEgNtDq6KdWc/fZ/jvYr//N4IJtwChUIm5S8qUI16oyDjP7y8S+eHGSPH
 c8GXm5qeUseWLziKk5R5NiDb77H5yytd1C6CcStduXUdlR/i0IYWKczPKrGA1Ka1++fM/NfIa
 thk5iw5maoFb9oMpOdzZE7ajt1PJulDn51dc+dG72BQz7ZMeCDsHlUJ6x/kvhfjsPw64yfXkd
 ApBAmvk1Nc8/YxGcGzyGRC08+WMQ9yc/MR99dv6U2OPyqL5scLnMYFNNUyZIqql+KAQ1GtUgM
 5I0B0uUIOKzwkba1SwwIOB2mKKWmgEkPsTTEACme0FxkB2oTV6PlRwnZy9FaVF7rG9+5Qx89v
 tFzFE7VT3To3p8TLEHmrWtWHsSzLb/sr1fDtwJDGGbUycXzV2eURDW+BHu/VvEmgh2VH1rHrL
 RK4IDbCG/1S9Glj4OetuaJgcx40s9iIS52ydyU9yCngtbZv5jGhdIk8OwP1JIZwOZfxwpktKd
 h7UOV9URKOe43eY48MRG+fKkvJYjDfkZJLmZciX4g0tT23knMcrOGHcRKIsn/WhYZAyHMZTEb
 4qPae5IXtnBY4B9P1qaqkXIZtr0FW83TEuMgumcqW1IbehnUln768dxC/tYXtJRrLELly5bIU
 VmoAFcl2G5gHIpOabMVxeYh1urT+m9YMbDVFltnX3v3E2e24lXfSoLv6t2b1v2kGyHEHd0x8Z
 B/qR0qwR7FxVMG8lpbIPcWtvIE41TeC/zc2QCKJlrumVP8S19c3PdHqL5lwAn8Z3fGQxzn+mp
 NhxzDV7IprUqkAmcBCR6eIb9JykJp0n3/sqlnoEgr6Jr1maMH/Rlid35t5OuzGU2mFVzUhW
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.332,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Le 30/08/2021 à 12:24, Mark Cave-Ayland a écrit :
> Also improve the alignment of the shifted constants.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  include/hw/misc/mac_via.h | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


