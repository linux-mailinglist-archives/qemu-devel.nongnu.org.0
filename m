Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 695B560A540
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 14:22:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omvs0-0000HW-Gy; Mon, 24 Oct 2022 07:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1omvrR-00086Z-1U; Mon, 24 Oct 2022 07:43:20 -0400
Received: from mout.kundenserver.de ([212.227.126.135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1omvrP-00052T-5Z; Mon, 24 Oct 2022 07:43:16 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N0Fl9-1oyoNV1cYB-00xIq2; Mon, 24 Oct 2022 13:43:10 +0200
Message-ID: <01d737a4-96a8-61e3-d0e5-b798c8e51299@vivier.eu>
Date: Mon, 24 Oct 2022 13:43:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] ui: remove useless typecasts
Content-Language: fr
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20221022141204.29358-1-vr_qemu@t-online.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221022141204.29358-1-vr_qemu@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1U4+H6JG2c13uMhGcNc5N/e4hxUtO4GlfDeMl3FMoTj4jP7O/Xh
 seGfLlAjkXBniJnl0sn4PXzo69HyS85rp/zWk7WiutyqOhukeKSc0Xn6hcY63NUt1GCH0wp
 HgpoYKICyKtk1l/vHH4DY0HDowCE7DphOEc1+qRYeCN2DpuQ+gRM8Qp3X6nlwMkdBCbfvo5
 AoCmgGUmAlsNlFXB8PqfQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TrtPyIB4r8k=:Z3yTEVP/hdBBuLmupUG6ol
 4hZBkO0d07AWsjFtvFw4Mi8QbOaMeUkzKztQk8bv8LUf4e5BO9rKpI6IiCnxhHWl5XtjjO5Aa
 ZhNKlu9lkUiW9coIF6F2iUWKVzmEabThMsUj7tVlD8mAKmPIuArusiDZZCm1jaQuAUS3NczzK
 I/iz+mHh80kZg7Fas9m5vZoRbOkCdlzl3ojDz+C/4paeEsD2zknc3DhMp16yczDNKb5jV6pmQ
 CULIRxwFVZETggvW72FP/ijnz5CJr3RA/wx4ikoNijthpQAS4awiV1YDvboxli2qglxWVuaOV
 KnexKNailX5kJB61L1YAJJ02W7qOYae1SzIw3V8BlYyZummQCELGcq8S4FRWgm8V/mBepEvuJ
 fDwZCQ7V8v/KEFWwzs9EI56dzxgyQinNcU0wZRnXKZ3zAYgsrAnb6ESR4s64NvFSCu6HsqabI
 CVUYkLvox1nMdZ5jjiWWqMZ20hoQ2Cz3TrsyyfQYr5SeE1XgBBoKgOj5t8XJNY3fM+oB9r5fi
 h4SXTrKYyrellel2E+s9JGsS3NXwnUyK3HXEVKp0ErgIlyqY/m2p4nRsPbkBWbQM7I56toHCU
 ssBH7x4N3TkoMGfVRjHZns5nw86bCVz8n848nWIe69sDsJWIJSf44Rbix3MiD+iWcba9YlrNg
 G5d1ZPtcTKztnhIn6kclqKe39eVFVC79k6R+d1OH/oUioo5I/blDAXcT5cirDffyovgz8hmr5
 pmfRaSzDHQ2uUl/d0OAYber6H6XZ6Z7HVMfkDn9t5lurWpaC1XaMost6slDW5YHrEm8MxU7ig
 fk9YuN4
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 22/10/2022 à 16:12, Volker Rümelin a écrit :
> Commit 8f9abdf586 ("chardev: src buffer const for write functions")
> changed the type of the second parameter of qemu_chr_be_write()
> from uint8_t * to const uint8_t *. Remove the now useless type
> casts from qemu_chr_be_write() function calls in ui/console.c and
> ui/gtk.c.
> 
> Cc: qemu-trivial@nongnu.org
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
>   ui/console.c | 2 +-
>   ui/gtk.c     | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/ui/console.c b/ui/console.c
> index 49da6a91df..65c117874c 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -1297,7 +1297,7 @@ static void kbd_send_chars(QemuConsole *s)
>           uint32_t size;
>   
>           buf = fifo8_pop_buf(&s->out_fifo, MIN(len, avail), &size);
> -        qemu_chr_be_write(s->chr, (uint8_t *)buf, size);
> +        qemu_chr_be_write(s->chr, buf, size);
>           len = qemu_chr_be_can_write(s->chr);
>           avail -= size;
>       }
> diff --git a/ui/gtk.c b/ui/gtk.c
> index 92daaa6a6e..7ec21f7798 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -1763,7 +1763,7 @@ static void gd_vc_send_chars(VirtualConsole *vc)
>           uint32_t size;
>   
>           buf = fifo8_pop_buf(&vc->vte.out_fifo, MIN(len, avail), &size);
> -        qemu_chr_be_write(vc->vte.chr, (uint8_t *)buf, size);
> +        qemu_chr_be_write(vc->vte.chr, buf, size);
>           len = qemu_chr_be_can_write(vc->vte.chr);
>           avail -= size;
>       }

Applied to my trivial-patches branch.

Thanks,
Laurent


