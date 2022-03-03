Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA664CC6B8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 21:02:26 +0100 (CET)
Received: from localhost ([::1]:58754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPreb-0004aL-Ev
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 15:02:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nPrYL-0001pB-S9
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:55:57 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:37609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nPrYK-0004km-B0
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:55:57 -0500
Received: from [192.168.100.1] ([82.142.17.50]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1ML9i0-1ni59s1MSg-00IG4i; Thu, 03 Mar 2022 20:55:54 +0100
Message-ID: <802cce21-f927-2859-9e34-65ba8bc56f89@vivier.eu>
Date: Thu, 3 Mar 2022 20:55:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 08/12] mos6522: add "info via" HMP command for debugging
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20220224115956.29997-1-mark.cave-ayland@ilande.co.uk>
 <20220224115956.29997-9-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220224115956.29997-9-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:XDaOL8YryBPiZySg0evXU5YrsbvEG4kOR2SwApg4To+REAEB8nx
 s9XZdjwEVrSCDbPqaUQ8GPts5cIECj3TRivADk6UjiBqlaiIDwK4jFPjcS45bHbGF+l1ddV
 4TfgLtjTTAtipqElFNMvVJSAzeA1VZ7DK0SF5htEUMWKB5QLSJDpdZbB3r3Y8AChI1o+Sk/
 oduF4MvkCEP24w21wLJ+w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xurhrzxzPco=:dNVxfjioR+m233ARJDSVeF
 YMVGfig24Nla24swoO2N+wbOsZBgFfo6zTIm0GNtqn/yCCPZxQssHuifVfMUy6kODybQT2JCR
 jawlJjWvuFOzD7mX/eJdNnF4Fsr1dUtT9JVBEP09JZX1qzWAcHsalm7qVK6IQG+93m6iMRmup
 quLachdivV0+yIaOCqHhJR6HeF/EERgwOtWFosXIvC3TPd1Fvjuu1rWuSmQR3GE1saMRJ5jNo
 o2gJDOg+7JVqrJd6tBlRMOcxmw3Gg7MyK8O9r6LmDxb6L3Zq2POcKQdULH5q5Iyt96k7sRUzd
 Hmbg/cZR50i97rwY32osHsSTKST3xSsTWFVoHi1MYq0J/ZX85UM7caiBcQY0YM/sIrfrYhgqY
 UxmX3wAvXY/I50NLcgc4O5GYZBXku3cvPCs0VG1n0fsdpUyLFcJ2NOo6t/gOHzPzMTd8Ctx+Z
 tsvDDLWYAwHAmF+1QrRnlxVJWUO83ZdDs1dUvxxB8KejASoH00X1GBRlgbg+FlaCDTe/+jisJ
 Fmpi5ITcHl8gP3JPMvk+0zpSHAzFn2fVfSWWAU9W8pPi43McJ8WuRYQjiiwwQoPiQyyXXQ7tY
 hkbUhNyA8zAcumfNWX37QopQxw/6dA1vKnt18rZDgik4YNo7bOQ7caaJIb95VM39l4r4DxJnF
 lHt6yiWqjXrvFLa1y0Dtsq7rwVAdH6TWZXvPr1p/nkS+Yb+7u2kpddZEOQHDVpassRc0=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
> This displays detailed information about the device registers and timers to aid
> debugging problems with timers and interrupts.
> 
> Currently the QAPI generators for HumanReadableText don't work correctly if
> used in qapi/target-misc.json when a non-specified target is built, so for
> now manually add a hmp_info_via() wrapper until direct support for per-device
> HMP/QMP commands is implemented.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hmp-commands-info.hx         |  15 +++++
>   hw/misc/mos6522.c            | 103 +++++++++++++++++++++++++++++++++++
>   include/hw/misc/mos6522.h    |   2 +
>   include/monitor/hmp-target.h |   1 +
>   4 files changed, 121 insertions(+)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>



