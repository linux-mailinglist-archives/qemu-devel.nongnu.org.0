Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB4040347F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 08:50:24 +0200 (CEST)
Received: from localhost ([::1]:42574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNrPb-0004YI-Mr
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 02:50:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNrMW-00028W-Q0
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:47:12 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:51881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNrMV-00062y-9u
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:47:12 -0400
Received: from [192.168.100.1] ([82.142.27.6]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M1ZUb-1mMTmY43H1-0037DU; Wed, 08 Sep 2021 08:47:10 +0200
Subject: Re: [PATCH 04/12] mac_via: move PRAM/RTC variables to
 MOS6522Q800VIA1State
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
 <20210830102447.10806-5-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <f5d0c395-d2da-ebbf-21fa-b114fe2589b8@vivier.eu>
Date: Wed, 8 Sep 2021 08:47:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830102447.10806-5-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wILW9x/iTAd7LZgwujx7njpJ34bieK6QeYDFrO41TsyXWydbb2H
 5nTDiGJpArmrcUfXF55zdM7urq+jkifYsUpfCQ7WFpezaBqforP641kI9UTv/V47A6ehc0/
 jnv7aHUf1idJJ/Ny3mYahUjkE8t12ull92x5WFIMOhyjbQpdkRa6ofwr647lOp5U0Byvf9y
 j/t8lqdqJbUkg9DnM6GMw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qF23hOh9flo=:F1AYwY5RZGOty6vjkNxSYs
 jNu6NC/sHNf4vyy8LvFaKO0Px/uQ1MW4PVxIr5e6zy6W9IP1h4ttz74o8xLCXE5VWXK+DzbX2
 uERUK6GM8SlcdPzOq/dJe5ZjEXKivYOrcQ7WO/PDzDBBVxgvhqia7XtaL/lNbhlcNEDjye3Br
 US/QqrVzyfJIHCyKJlt7R5/t/4avRjmA5q2B53axvKnR7oXvdGAgDx6qiiqXUiPn6TNAp7CI1
 UBqC0CSiXjbRkEKg+9dZ01lBN/M3odX6DK8r74SOC/ZHwTyNfjI7ZXEWDzPB6Tw7ZhfxkpDTl
 wvEgvJ0B8eFZtiC1GlIBFBWyGM/icgGBPSbaqOELUqDq2YFNN40XCxHc0RQkV7V6+DdW7NrbA
 eRBKCPc4d/dRXkIudvKo799fr2N1UzHv4i2qSetP4wm1JzHryUy9r5bNducylq0YaxD32f5wS
 3G2Rl6WYnrrcehSElkYEg4NwGxl3kXRJtOwORispCkACiNoarUzKhQ2N3Ij4k5D//3Zvdj+0s
 9fyqckaQ8awY6f690tXwcp/8FXwBz/dVRG0v5ith2E3Gdg+hjQTWh6kLp2fxdEn30LwXTxZwl
 V0ZNvviYrxJWXJ3G4BK7XhetrnTzPNuHlxC0uiqnSiUvhf+ZlKOYhkkt+sT87bakLK/3covYM
 3x5tP3vh6kaFvGqn+aq+5/+yeR/74xaoPwUhLvdrMRQcbryQU8CJj7NJM4X9qIKJFhw4UQ2KN
 yEJR9cXu4h8WIP3fcfvZRQ9OhYjEMZIGUg2BNQ==
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
> The PRAM/RTC is accessed using clock and data pins on q800 VIA1 port B and so
> can be moved to MOS6522Q800VIA1State.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/misc/mac_via.c         | 135 +++++++++++++++++++-------------------
>  include/hw/misc/mac_via.h |  21 +++---
>  2 files changed, 77 insertions(+), 79 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


