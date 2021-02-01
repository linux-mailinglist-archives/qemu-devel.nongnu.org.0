Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E935630B1B5
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 21:48:46 +0100 (CET)
Received: from localhost ([::1]:35564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6g7q-0004Pk-0i
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 15:48:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l6g5E-0003Sf-Pk; Mon, 01 Feb 2021 15:46:04 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:40130
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l6g5C-0002XO-TE; Mon, 01 Feb 2021 15:46:04 -0500
Received: from host86-132-83-253.range86-132.btcentralplus.com
 ([86.132.83.253] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l6g5F-0003Nu-Eu; Mon, 01 Feb 2021 20:46:05 +0000
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210129081519.3848145-1-armbru@redhat.com>
 <20210129081519.3848145-2-armbru@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <c448e0cb-f0c4-57fb-20df-077b65e386c6@ilande.co.uk>
Date: Mon, 1 Feb 2021 20:45:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210129081519.3848145-2-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.132.83.253
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH RFC 1/1] hw: Replace anti-social QOM type names
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, mst@redhat.com, frederic.konrad@adacore.com,
 kraxel@redhat.com, edgar.iglesias@gmail.com, mreitz@redhat.com,
 qemu-block@nongnu.org, quintela@redhat.com, andrew.smirnov@gmail.com,
 marcandre.lureau@redhat.com, atar4qemu@gmail.com, ehabkost@redhat.com,
 alistair@alistair23.me, dgilbert@redhat.com, chouteau@adacore.com,
 qemu-arm@nongnu.org, peter.chubb@nicta.com.au, jsnow@redhat.com,
 kwolf@redhat.com, berrange@redhat.com, jcd@tribudubois.net,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/01/2021 08:15, Markus Armbruster wrote:

> Several QOM type names contain ',':
> 
>      ARM,bitband-memory
>      etraxfs,pic
>      etraxfs,serial
>      etraxfs,timer
>      fsl,imx25
>      fsl,imx31
>      fsl,imx6
>      fsl,imx6ul
>      fsl,imx7
>      grlib,ahbpnp
>      grlib,apbpnp
>      grlib,apbuart
>      grlib,gptimer
>      grlib,irqmp
>      qemu,register
>      SUNW,bpp
>      SUNW,CS4231
>      SUNW,DBRI
>      SUNW,DBRI.prom
>      SUNW,fdtwo
>      SUNW,sx
>      SUNW,tcx

My personal preference for the SUNW prefix would be to either drop it completely or 
change it to "sun-" instead. The reason being that the "SUNW," prefix is the standard 
way to reference Sun devices/packages, and looking at the replacements which still 
have a SUNW prefix in captials makes me thing the hyphen is either a typo or my 
fingers go on autopilot and type a comma anyway...


ATB,

Mark.

