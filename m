Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 425616871F9
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 00:33:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNMaw-0002Y3-5p; Wed, 01 Feb 2023 18:32:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pNMas-0002Wv-Lt; Wed, 01 Feb 2023 18:32:46 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pNMaq-0006wU-Gv; Wed, 01 Feb 2023 18:32:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C63VuXjb2Db1WmbWi6rtU2AzhaF8DCwIrP6VwyvHHI8=; b=P6wbxQPuUuJSgrHYiHPtF8TOhN
 7TuouoApQ3+W/5Iba+4gWxApx5eVerXxt1/ErkrHiJ9SMTLMOcFYx3G4J9/mFmsR2HML0E4CwRz8r
 XjXb0miMuEMAkZBKttLA3ZQYFOEMbI1z5fCoRde4sY3aobuth52fWYr+qp/DQ1+AgjIp3aAaFnceo
 LRTgWiiepQJIUikLPrj+UjXaVFnvgQkzE3fFD6mx+F0wo8aRh05rd9My4w3JgjRFkZ4hop9BcqWfE
 nF3lNRifw6fB9mBSWhH6DmasYBJalNfQv+e/uNPUcqLILR0mvw3J6sGSa8sqQSG43cbKj/iG50RtP
 YcqKnB/yBg51hhm4eSD9Iyv5mxviLd7ZKnITpTcxcLEPhJ2gl7khQ7yG2ggIJbC99fCd4wo5Y9bzz
 CrTrhAwr7ljcyrwcsDMa+mWHCoYLYZcfz2h902MAlewUHedFh4aoUg9C2VxuJC6h45w2Lpd+/iY0E
 0JbF5mapufU/y0xQ2l5Tp33wIgO3GOUPOR7tWKgCicG7R8FWoIr+oSjC1o4TiQscZcQ79sv8vxlhG
 7uGPMJn9uJKaoMZZlYnxf8MNG4GyLai91cr2B/j0eNILyjBI2OKGfsV6cQ3dA7HoAzM2NVelPqOgB
 KCxldCB2kwH2rCdo5/aAqCUNyxG4Y1ErvZGdM4uZI=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pNMaN-0005ko-2e; Wed, 01 Feb 2023 23:32:15 +0000
Message-ID: <a267d69d-ac4c-d123-d4a1-d1c501be61fb@ilande.co.uk>
Date: Wed, 1 Feb 2023 23:32:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1674001241.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <cover.1674001241.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 0/4] Misc macio clean ups
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 18/01/2023 00:32, BALATON Zoltan wrote:

> Just some small trivial clean ups that I've found while looking at
> hw/misc/macio/macio.c
> 
> Regards,
> BALATON Zoltan
> 
> BALATON Zoltan (4):
>    hw/misc/macio: Avoid some QOM casts
>    hw/misc/macio: Rename sysbus_dev to sbd for consistency and brevity
>    hw/misc/macio: Remove some single use local variables
>    hw/misc/macio: Return bool from functions taking errp
> 
>   hw/misc/macio/macio.c | 167 ++++++++++++++++++------------------------
>   1 file changed, 72 insertions(+), 95 deletions(-)

Thanks, I've applied these to my qemu-macppc branch.


ATB,

Mark.

