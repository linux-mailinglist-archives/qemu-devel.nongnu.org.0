Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE267415C1F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 12:42:31 +0200 (CEST)
Received: from localhost ([::1]:42680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTMBT-0005xa-1C
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 06:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTM54-0004hh-5O
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:35:54 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:44667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTM51-0001AK-E9
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:35:53 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N1Ofr-1msTaI2J6x-012lU8; Thu, 23 Sep 2021 12:35:49 +0200
Subject: Re: [PATCH v5 14/20] mac-nubus-bridge: rename MacNubusState to
 MacNubusBridge
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210923091308.13832-1-mark.cave-ayland@ilande.co.uk>
 <20210923091308.13832-15-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <db1b7f79-1442-a6fb-e1f6-c956f2dd9cb3@vivier.eu>
Date: Thu, 23 Sep 2021 12:35:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210923091308.13832-15-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wrOBh+JHZQeyfp8vsav1qxjQR0FNJ5/JLVdUWUFJeIrhHt95GNv
 S5Da1zuqspH5AWibZbkI3ZcVFQXDKhYC12X56pO6jzXiY6BHTopTmm1Sv/JdKFJISgyAp9a
 bwZwoDPBMIQklqyJ5ANmFjg0KZhnJ8JMeI0LdhxrsZJsCLa5wTKRnkU1MysS0/hb8z/n0np
 VqddBVuYmqFb0WY1Xb7kw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xU7w4d45fEc=:2tbxBpo8MJ0bXMfMgWdML9
 +kUIuywXpxzVhCns1IXLBz8Nf1v5rS3ztMXllL1K9c3jxcFzQAE6zP33bYqC28gmNM5000yob
 H2YfzR/b+M3WtgZEM25bxHMLPCOOX5dcqRZqYISLYYL/ECGYr1Jnrze1+QlfD/J/w6dY7GFts
 rq0SVDg7hWIRpKZ1Bpz7+jSRHvprtQt8YtVNBqNjwaD42Mf7YLNIysZBUuskVcPHujx2XTNXW
 ovJyql8lmVM/+fmkb4+BIuDSNMfQtEKkp8lsfXrGDShpMbI0qjljtyCvYf1bFfumLsvOsi8yl
 Tp2RgL9NItkep++UFEaYyMiAyN08OzHFteqKVYMBhXgMuh1sGt5DqG8DOSeENuyRSuz0cPBV7
 W0UE6oK3bD7U+901eQ2KmuNM1DaQN6n796X3yIxiYbQvniX5/T4VgKUAi2i8UoOtRKwJEIe70
 Q29oMiQ4EEQYQUxsJHQTQmI93ErEeyFSUuz5Jda2TodGC0D4VWKqJxahNiAOMrKaSEM/DoENi
 AujjPf3U75izpRu5VKyqq8CmY5fG1/3fMBw/fXtLskGoOUb4CLXhftlCvT4jyaS8XRe9eILg6
 jgTsDhUGN5baHcVauF5DxOTLKKKODUz8jPYCVUybNj9z1W9F+EoWBOGwDsqnnolMr5lM4CbjS
 bVoDdg8bNk5Hh0TYG1xUHQXIbBLABDHKTfkllFyysllC2INlRRrp8EjiZ4TnvtmXE0Vhxgj5k
 YbSo5jSmH16GCE3I6v6fcPbyqFAvNrCciD9tLQ==
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
> This better reflects that the mac-nubus-bridge device is derived from the
> nubus-bridge device, and that the structure represents the state of the bridge
> device and not the Nubus itself. Also update the comment in the file header to
> reflect that mac-nubus-bridge is specific to the Macintosh.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/nubus/mac-nubus-bridge.c         | 8 +++++---
>  include/hw/nubus/mac-nubus-bridge.h | 4 ++--
>  2 files changed, 7 insertions(+), 5 deletions(-)
> 


Reviewed-by: Laurent Vivier <laurent@vivier.eu>

(it could be merged with previous one)


