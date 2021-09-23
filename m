Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E76F415C1B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 12:40:26 +0200 (CEST)
Received: from localhost ([::1]:37644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTM9Q-0002Nw-PP
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 06:40:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTM3D-0002K9-GD
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:33:59 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:33405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTM3B-00084I-N0
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:33:59 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N3sZs-1mtrCG073A-00zk30; Thu, 23 Sep 2021 12:33:56 +0200
Subject: Re: [PATCH v5 12/20] nubus: move nubus to its own 32-bit address space
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210923091308.13832-1-mark.cave-ayland@ilande.co.uk>
 <20210923091308.13832-13-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <5b407986-515f-4403-3ece-cfbfc9699b0f@vivier.eu>
Date: Thu, 23 Sep 2021 12:33:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210923091308.13832-13-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qn8UeR/LlEQf2U1SoOvVi0w4A/LMPwtXhGzB6wThoGxfuCWXa9j
 0p18wmd60qSiucioWjsqHG2MKnwxG6WONW4JsDdiLp1y3QTEpb90kScI8m2N3qlht/tblKD
 EC8hMu++pe6Me7SFrtFLvMOFGdt8Y8Q7FGHcx5EyS2UzK4tW6/KHwKbUljtSd3BKa6LjzTm
 qdd4nuFEQPyQFGblBBjDA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xCVKYBnaCRs=:ym9Uyhlm0UXk99siZEPbdT
 3NOt4Pwo+U4grgDzyb5BlckP5eeDv59RgIPNMadXCWK+OHqbQb2FwJ3Vqs/0p3EBfp3O2gnko
 92JHyU3KTPrGHILhFwXbQnf1gzmwjDbw4x9vpX4jIPrbQko64y/uvVHsBgPReAfZpSq9OlwRo
 N9xHRii/S0YBokjpa2Vn2pQBoyXHGgOXAs26fJrW1HzNxMI6VCCOSNzzeWElRu4GvSGUR0HZb
 TXWYUykGshKXpHVa32MpfKW5jCOuQru2t7aCkfrNj1HG1F/kMlUAZjpg7ursS6s7dX1at63Uz
 F4xNy0G1Aq0Ftk2O58W4RKpaEDq3TUHrt71ZNeGEtTFnCqV6D2H5UBp9UyMQ8SSGE4KoO0a2j
 l+BYms/qCfMGSQjJ8gaEh9CSzpPSdQdbG17HIu2QBar448PsR0PIocD3Jkv/wexsdgIrEGfJg
 q0cEnlyiSu5V4jVLJCRFdRhtXMA2Ervb5WY5cQm8OqVTfmty6Qma+/UuuendFsTt9xaaNnLvs
 hSw8qxBcLkEpIexdPsbzEjHvKRg0TksCfdbyd7BDP16T6mxGWi59Y+O4ovIQ6UjyYJGFNQJYa
 FpheDvkKxN+b0ZWVqXgmvp1rdKlflICwym9tGZXLjtDFV1RAdv7vmYVS+KHiLJr6r0cJTba/N
 cxTqX+kshEZgqvkIhCECiVEGC15G7vebHSjcBZeYAW0OfKz8j7+M4mTxYGdo//Dc0/hLAXsIz
 4Wv+zndgTTTpC+qEWLROONqVRnhWyGATT2NJXQ==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Le 23/09/2021 à 11:13, Mark Cave-Ayland a écrit :
> According to "Designing Cards and Drivers for the Macintosh Family" the Nubus
> has its own 32-bit address space based upon physical slot addressing.
> 
> Move Nubus to its own 32-bit address space and then use memory region aliases
> to map available slot and super slot ranges into the q800 system address
> space via the Macintosh Nubus bridge.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/m68k/q800.c                      |  9 ++++-----
>  hw/nubus/mac-nubus-bridge.c         | 16 ++++++++++++++--
>  hw/nubus/nubus-bus.c                | 18 ++++++++++++++++++
>  include/hw/nubus/mac-nubus-bridge.h |  2 ++
>  include/hw/nubus/nubus.h            |  6 ++++++
>  5 files changed, 44 insertions(+), 7 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


