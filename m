Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95870679F06
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 17:42:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKMLT-0007kA-WA; Tue, 24 Jan 2023 11:40:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pKMLK-0007js-Pl; Tue, 24 Jan 2023 11:40:18 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pKMLI-00086f-KK; Tue, 24 Jan 2023 11:40:18 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1F2C1746361;
 Tue, 24 Jan 2023 17:37:44 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id DF076746324; Tue, 24 Jan 2023 17:37:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id DCEFF74635C;
 Tue, 24 Jan 2023 17:37:43 +0100 (CET)
Date: Tue, 24 Jan 2023 17:37:43 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Howard Spoelstra <hsp.cat7@gmail.com>
cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org
Subject: Re: [PATCH v7 6/7] mac_newworld: Deprecate mac99 "via" option
In-Reply-To: <CABLmASHE7iiqHnOZxCfaqvz5zwUipG5vunHG_UK8krXu71HOgw@mail.gmail.com>
Message-ID: <d2ca3316-b8fe-3714-df03-62e51938c40d@eik.bme.hu>
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <4162db13bd1da9c6ddd77f185cef738e44790467.1672868854.git.balaton@eik.bme.hu>
 <b821c773-a443-c70b-5d4c-787284028f8a@ilande.co.uk>
 <389d8398-2b77-a64e-7034-79123da6cb86@eik.bme.hu>
 <CABLmASHE7iiqHnOZxCfaqvz5zwUipG5vunHG_UK8krXu71HOgw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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

On Thu, 12 Jan 2023, Howard Spoelstra wrote:
> My 2 cents about naming:
> It seems less important how the machines are named when their name is not
> covering their definition. F.i. the powermac3,1 never had adb, could not be
> equipped with a G3 cpu, did not run at 900Mhz.

True it never had ADB and makes not much sense to run it with a G3 
(although you probably could, just nobody wanted to; but the other way 
around, i.e. according to https://en.wikipedia.org/wiki/Power_Mac_G4 the 
first PCI only G4 PowerMac1,2 had a motherboard from a G3 Mac just with a 
G4 CPU). But the G4 AGP could have a 900 MHz or faster CPU via a CPU 
upgrade:

https://lowendmac.com/newsrev/07/0330.html#b
https://lowendmac.com/newsrev/mnr07/1029.html
https://lowendmac.com/ppc/power-mac-g4-upgrade-guide.html

These links are from this page:

https://lowendmac.com/1999/power-mac-g4-sawtooth/

also may be of interest:

https://lowendmac.com/1998/beige-power-mac-g3-1998/
https://lowendmac.com/1997/beige-power-mac-g3-1997/

Regards,
BALATON Zoltan

