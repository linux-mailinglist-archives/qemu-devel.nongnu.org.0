Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 174B742060F
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 08:52:03 +0200 (CEST)
Received: from localhost ([::1]:56700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXHpR-0008RN-Ut
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 02:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXHnu-0007kC-NP
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 02:50:28 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:51065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXHns-0003PM-IF
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 02:50:26 -0400
Received: from [192.168.100.1] ([82.142.3.114]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N3sVq-1mxa953kLg-00zkin; Mon, 04 Oct 2021 08:50:20 +0200
Subject: Re: [PATCH 2/2] nubus-device: ensure that name is freed after use in
 nubus_device_realize()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
References: <20211002123101.14675-1-mark.cave-ayland@ilande.co.uk>
 <20211002123101.14675-3-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <567db8f4-59cb-cbef-6cfc-503088300e09@vivier.eu>
Date: Mon, 4 Oct 2021 08:50:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211002123101.14675-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1Az96oFG5oqFUwwuX1sFGDMyyNZoB0IShWm8kuOD5cQ+3pb5oCc
 e15kgx91NhFNyZhdYl13lKu/ZH+xa2rcPyLXrx3iXr70tI0B+52FKLdYwNA+POElAw+G8TR
 7dH4ySUE9Ip10vy55Tw+E0YT+w+Sg7UsO7L27+bdDuqXl955LqqGFXZzUjyQuuR14W5bMx/
 3BrC9skjojJSPZTJdeWqQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dFWEUYHgP40=:dMrZftZyDheBHOj5JbxRbi
 quHarEZUS8sGM+Zr/pSL1BBUobUnKZe0VSqyhVwSgUBDjeyWUW95x2SHC+HNpPJ5JOcETA4qh
 1dnxrv4cYFUNmmi+0gKFb49JXErdcQX+fVlgGdKsl13eBA58SAHFM4EpU6RhNmWm3qCjBeDR4
 248apTn3H7J2v8noz6Oez3N1jYG3bNjGzoH07iAkepWBPe3cLhaqjUnNSekFPUYMmu2h7Z7U1
 Iyry9Ub8zXS1yGz+9zoeryGEbB8XoeUzdRhu5Q4aa5pAS+6zgrrj27FFlEixSJiZ521AEZEMv
 TMnXPkGzOALkfZ9DZWTf9BeHcFHGzTV9x9eoA/UICW8vD1azNg9ur5pS1PCSphpyr2Uy91FZT
 MyDs3KfZqcJu2LYB41BP0eksQd0Qz4/QHTCw0vz7iSea8xBLIbak90EHXa2dL9rU2PeZsiysg
 GO52el3AtkJk4brV9zN3y5iJmh589rPMW/KrGPtXsGdstsHc7AijAJXPIOjhRAa8GBncn0q0g
 5Xm8FukoGwOj90R62HzpGSryBTiJ+mWuYU69e38vQZhNQxcqNNpJBRmfx/E/n2QWn9lR6Np2N
 3O0kHLWI7tEBb1se/blsW3jHneTk6CbfWefAw56M2wSkg9VmCDEh6PoXMqW/1P0ws5BqzodFp
 G/9nkpfbn4jlxNsZtLh9jf4tp2bBS0KtV2mz+5WLiO4F3HYUTMeQvjybNOuv1PkRseuF8Yw5t
 qE3J1ynn4urzswR3zgRMC6O4InaFKXi3n4nYFQ==
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

Le 02/10/2021 à 14:31, Mark Cave-Ayland a écrit :
> Coverity points out that there is memory leak because name is never freed after
> use in nubus_device_realize().
> 
> Fixes: Coverity CID 1464062
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/nubus/nubus-device.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
> index 0f1852f671..64f837e44d 100644
> --- a/hw/nubus/nubus-device.c
> +++ b/hw/nubus/nubus-device.c
> @@ -78,6 +78,7 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
>          name = g_strdup_printf("nubus-slot-%x-declaration-rom", nd->slot);
>          memory_region_init_rom(&nd->decl_rom, OBJECT(dev), name, size,
>                                 &error_abort);
> +        g_free(name);
>          ret = load_image_mr(path, &nd->decl_rom);
>          g_free(path);
>          if (ret < 0) {
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

