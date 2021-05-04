Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 049823731F0
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 23:32:26 +0200 (CEST)
Received: from localhost ([::1]:57758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le2eR-00041q-RQ
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 17:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1le2d9-0003Zb-QC
 for qemu-devel@nongnu.org; Tue, 04 May 2021 17:31:00 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47566
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1le2d4-0004in-PV
 for qemu-devel@nongnu.org; Tue, 04 May 2021 17:30:59 -0400
Received: from host81-154-26-71.range81-154.btcentralplus.com ([81.154.26.71]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1le2dN-0005mh-5h; Tue, 04 May 2021 22:31:16 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210503171303.822501-1-f4bug@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <abe0c759-23d3-5341-2a0e-4af47a5567d3@ilande.co.uk>
Date: Tue, 4 May 2021 22:30:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210503171303.822501-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.154.26.71
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 0/6] hw/sparc/sun4m: Introduce Sun4mMachineClass to
 access sun4m_hwdefs
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
Cc: Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/05/2021 18:12, Philippe Mathieu-Daudé wrote:

> Missing review: 6
> 
> Hi Mark,
> 
> This series QOM'ify the sun4m machines.
> I need it for a further memory maxsize check.
> It is mostly code movement (and the diff-stat is good).
> 
> Since v2:
> - use static const variable for hwdef (Richard)
> - added Richard's R-b tag
> 
> Since v1:
> - Full rewrite after Mark review
> 
> Philippe Mathieu-Daudé (6):
>    hw/sparc/sun4m: Have sun4m machines inherit new TYPE_SUN4M_MACHINE
>    hw/sparc/sun4m: Introduce Sun4mMachineClass
>    hw/sparc/sun4m: Factor out sun4m_machine_class_init()
>    hw/sparc/sun4m: Register machine types in sun4m_machine_types[]
>    hw/sparc/sun4m: Fix code style for checkpatch.pl
>    hw/sparc/sun4m: Move each sun4m_hwdef definition in its class_init
> 
>   hw/sparc/sun4m.c | 459 +++++++++++++++++++----------------------------
>   1 file changed, 186 insertions(+), 273 deletions(-)

Looks good to me:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

I've also queued this to my qemu-sparc branch.


ATB,

Mark.

