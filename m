Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A01B4403470
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 08:47:14 +0200 (CEST)
Received: from localhost ([::1]:37126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNrMX-0000lL-Ch
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 02:47:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNrJX-0008Ba-Tp
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:44:09 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:44145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNrJW-0003PO-2t
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:44:07 -0400
Received: from [192.168.100.1] ([82.142.27.6]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MsZif-1nDKyP0AAt-00u0KL; Wed, 08 Sep 2021 08:44:02 +0200
Subject: Re: [PATCH 01/12] mac_via: introduce new VMStateDescription for q800
 VIA1 and VIA2
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
 <20210830102447.10806-2-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <9654c805-9836-f95f-79ba-8196417b2a44@vivier.eu>
Date: Wed, 8 Sep 2021 08:44:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830102447.10806-2-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xxA89eSn6Js27msWj9lfHA3RbdhuEscdAjg1f6BXKHzMmrMRINl
 zZYm64iErLOSXGN/MvFmsYaYNfRizUth1dDs0xEycCSRkklF9RpvQhetsn3I8altjlejn4b
 +QeZjSWZM5zHrahMXbLOVPdvUMH0mq9a81+EguZKuGaASym3DRoMxrAK6BoRCwTDo1aQL9S
 qBjn09pKvX8kggcgZG1cw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5Ro2b80jSXM=:PThQx2f4sKDYg44l42NV3d
 iBLi6NluB25NLrHwDZnXnUVJRL/LqYMcBpO+aKimGXPrc78xSsBieZ1QXlXjS4rAci0hI2j20
 Mwv5tt8vNdLrFa4/KXpYU6sFoNipAX2igjSOSqbvKJzduCL98eu/HTBZ7Huc9uiZDo9AOmXTG
 q8Tu7KCBKshftqqG8ze5Fte/yhYVQx4W2xs0HuoW3lasCF9UI+HTJQq5E40RHYIMRzynlnU1s
 Pttp8HvI53DTcDgvXutmquqT2Dvdv3BwppjH8plGFP5VwxN+TDd735hHnZEcOMDv+ChQaq+SC
 w4ZbTpWVw6nYoBPpFM8hqKRXo/nFF+l0NMjfZ9bzeKZ7Z0/J+gW9BvFnwuvoHGtuidWAR1O7q
 QjEy97IthEsxWAj9gYWt4qA4eofNtfhUUQqO0rq9K0RgbKR418XmtrrGnNlYGUbJLFJnCCO5A
 JMXoOrMLDXjRcE40leENrftD+Is1KI0DRG4iYTYKF8wOBoh5aUR9G43Ns4Kjfp/q0wJgzSfS5
 i8867NZJupDROygkZv4xv5c8sG49+pRQS4BIW7HxDdh1NMoAXmg/APcQjCT4jjoTyHJotF1bK
 eo2WZ1y6GOjak24k3TCKKl+7+uJWT3sJRUAlf5tLSbxsX8JClNDJHRAv2JrDlgjexWIkS/xNM
 Gr0TvbjJIQAJpW3jGq+fShsAa90Oj4nnUxP/N4Hn0FJA7fCLhra0IaRifm3xkypaWM0lFOFEA
 N0NUsAhb1+43hVCSZGiULVHvmv2oGYnYA3B3bg==
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
> Move the parent mos6522 objects from vmstate_mac_via into the new VMStateDescription
> structures to begin the process of splitting MacVIAState into separate VIA1 and
> VIA2 devices.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/misc/mac_via.c | 28 ++++++++++++++++++++++++----
>  1 file changed, 24 insertions(+), 4 deletions(-)

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


