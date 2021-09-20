Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C995A411E2D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 19:26:51 +0200 (CEST)
Received: from localhost ([::1]:57782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSN46-0006TA-Oy
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 13:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mSN0h-00030V-MG
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 13:23:20 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:54557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mSN0f-0002cr-VW
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 13:23:19 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MG9c2-1meXAk2LSm-00GZfa; Mon, 20 Sep 2021 19:23:14 +0200
Subject: Re: [PATCH v4 01/20] nubus-device: rename slot_nb variable to slot
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210917075057.20924-1-mark.cave-ayland@ilande.co.uk>
 <20210917075057.20924-2-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <1d9f7e92-d3b7-6bd8-89cc-0adf92e6c7a8@vivier.eu>
Date: Mon, 20 Sep 2021 19:23:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917075057.20924-2-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PLnmU9rt3hk4WR9ELVhAqtff1F/MwviO+r7uvd4eWY78csylUz7
 pt3kCD5T3bSOmtGQhj3K1JX4HSWtt1qVFDFnQsk7p1rt5v4CuAOaB49cOEXplw0vkt/+62G
 JPQl3H/gWiB++DUj3dQ0/qYsdFnMjkKk12yQBy+JMQcpCP5Nq6WPMBeY8Vsn3DpaWoF0nY8
 vax4pFn8tewe+GIyvswSA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lcPxTCCTA5c=:2pb9IrLxkv7xho27/KzwYX
 Cku3IcmOpA/xMIxbzUQzzzKDJuLaRN29s6ozyJLRZogG20pdyKB0iEKMMjTv22T4k5HC5Kbrp
 jucqZ+jWXlj+UeI9iXO4876uT/A4eiG4hQ8tCnTGAfOPr7RPz80M1E2Cux5bydtQDy/x6PqXy
 3wVWh5ktRvM3rwZT1fXpC5OzGAMQlwkP8etfZkVBukWW7a8bKSpfWw5KQoAHXAV46f0y4ZVok
 EE2zLIfE7IHwKasVfEv2yTuZ5fRiQPsLz6keBvumbGaPXDnERX/ttfigzFIfadcdinZASq7HP
 3Xxuhvff4zBdMfZ1TlnLS/bok0+TwTSBzUS7iiHEzB3JhbupQLxTQ9sjaezWW3TYrq2niYHn5
 Ndby09IfOfycuuZzD8W0NHlYIelKntpDNQynLO/cWo9LszyeNPk3I0+atFCSIRYT3vYhYn36P
 YI/pWi0k44rYRIiFOvvL7wuGCo7XQ5vp+1BDsPTY4LA+B/ZFnjSPDYjqV1KRn3e7fiYxCbtWH
 o4JK5XwE8MnDq4jxJVwPcCbxagtHPHfJZoGdwkbs13hxd5/tJamyx+e03fE/hnWPqleb9vAV1
 kZlt4tAB/STIdnvznTyUt7GN1AS6kiesAnBUDe0/SrJIr4lkdRvYJG22tU4w0lhLLp/vGOuXa
 iWAJzikh02oS24/EBz44QlygpB+HX7MtWu5FQrJZFBZZW1mojnYjqbAXLmEg3sJn7zRDJsMdv
 FejkK7ah2RAgO/wkFWww17rfiwpVP7pavrS6GQ==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

Le 17/09/2021 à 09:50, Mark Cave-Ayland a écrit :
> This is in preparation for creating a qdev property of the same name.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/nubus/nubus-device.c  | 14 +++++++-------
>  include/hw/nubus/nubus.h |  2 +-
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


