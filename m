Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B857E415C20
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 12:42:32 +0200 (CEST)
Received: from localhost ([::1]:42720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTMBT-0005yw-ON
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 06:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTM6A-0007JL-9n
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:37:02 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:60317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTM68-00026g-Px
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:37:02 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M5fZ4-1mW57h1O38-007Cf8; Thu, 23 Sep 2021 12:36:59 +0200
Subject: Re: [PATCH v5 15/20] nubus: move NubusBus from mac-nubus-bridge to
 nubus-bridge
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210923091308.13832-1-mark.cave-ayland@ilande.co.uk>
 <20210923091308.13832-16-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <3aa9380b-6613-4613-80b2-e908262c543a@vivier.eu>
Date: Thu, 23 Sep 2021 12:36:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210923091308.13832-16-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:eBNZ0D7Lcq3R5oCl9smOahu52IckKu5FHWt5YmIq5Xd7DwHNUcI
 A9TYcIVg5C8+XE9ie8hXA0iA6WyF5fcryDl70QIInRJZ/O5uKS4z4ZknMsr3ckMXs2lla0E
 hnr9gEFHIaidgMCziClOsFHwpGeagq4rrvOP0IoW3EHQsIrI4E5Wv7hNdF763TuIROLIlaA
 e1WJsb5nbdKMuOb9JrqcA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:k6nGYtDcRHk=:jEjoR6rYipz4xi+LyNdAbh
 fhindOPUdX2jgrUXHeiYFHwNLYTPnjzqGE+jWek5RlMlMoggPap2DZLzpRcZwCiR2QGwwwx3r
 1S+50UVYqV8MC0jzeCr+cWsmEuRa/sQB90dPE3IEJcJy6u2yRuSrNrfEoohYv9N5gMAur8Awp
 RP1i4O3G64iUnIhGkL9AjunsBzaoP669iWeo7jjPK6q8aTwH8rE6wvrTx158KOaeH3kFJ+9iL
 +qTkkhDEOxXqA6/VxFEW8ScwVlK+Tb0WjLrofcNfEDTtKcf780QCbXuSIjvuBS1IqDT3zUjrP
 HgEVWRoYXXeU8kC8tk/Sm2JuXD6k62qGR24ls/RuuS6I3RfWAh72BXhl3LYjitOuBn7ysZ+QI
 nzPhoO2dynKWZjjmtLN/QgDxSa16OMiqLL+FqvSXvgFhu5eA6DOgbg/qotq5Wkt+AeiwCICAs
 sfOxTaK3GxFoP7xq8+9qBDvTK1LJJRWFYlFgHKpH/VCjFGvmY8dJj8Bkv0IP4CpYFv4lHbjLM
 8fn4xYCaLouxZSN94R2x2m9dVYW19whtvYEWRQrdeXf1YI/wOdLY+XV8sgIo/0IOwQMUsqBuK
 b6xZ947gJTwIVLQZnpeVRGjN2mpIsnNo6U5sdb6SGDIhcsMaS8bDU2VmzjowiobymkcAuFOiY
 LGbJWHDwAspRFVsCVE3is9eYs3flSF0FI43UqmM1y4Q2vfGPRRWFqGjThDLhULUVRxfQ9PH7/
 3M+s+prj0QMM8Q2MuNGf87lYE2T2i9WRPQceyw==
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
> Now that Nubus has its own address space rather than mapping directly into the
> system bus, move the Nubus reference from MacNubusBridge to NubusBridge.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/m68k/q800.c                      |  2 +-
>  hw/nubus/mac-nubus-bridge.c         | 11 +++++------
>  hw/nubus/nubus-bridge.c             |  9 +++++++++
>  include/hw/nubus/mac-nubus-bridge.h |  1 -
>  include/hw/nubus/nubus.h            |  2 ++
>  5 files changed, 17 insertions(+), 8 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


