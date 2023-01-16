Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CB866CDEA
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 18:48:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHTaL-0002aX-RJ; Mon, 16 Jan 2023 12:47:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pHTZm-0001ZE-5X; Mon, 16 Jan 2023 12:47:20 -0500
Received: from mout.kundenserver.de ([212.227.126.135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pHTZc-0006wH-7V; Mon, 16 Jan 2023 12:47:13 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mi4un-1omHTs3x7B-00e7xb; Mon, 16 Jan 2023 18:46:58 +0100
Message-ID: <5699c001-cb9f-08a1-9dfe-c1b3fe3f2509@vivier.eu>
Date: Mon, 16 Jan 2023 18:46:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 01/10] ccid-card-emulated: fix cast warning/error
Content-Language: fr
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <20230103110814.3726795-1-marcandre.lureau@redhat.com>
 <20230103110814.3726795-2-marcandre.lureau@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230103110814.3726795-2-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0p9R8GYX/u43gt5WKBHMdm5nWfmlv2Yxc6va99ih729xVvaUrfR
 N7EIwtEa+XH23IQL5jZDnEHRrjbJqkUpwvH+bRL5HUMhb7OqSMd1T5K8kT0YWYwfXn8/QH4
 o7h61lCjroFGhKQaUcaBnBEZ1bmiihrnWsfDqR0g9F5WRDJQfOUnVQJa6bhbDY4Qpccz/X3
 QSq8FZWH3EF8gsNlJfS9g==
UI-OutboundReport: notjunk:1;M01:P0:C6GOTzr/OtE=;+eh5WbdwMhCwV4j6em14MqtVypR
 dijDvUhPM79dAkTY8zLg4+aMqQJxI9qYBFTm8Iz7SG7nfWZQxs9fSVfbHG3j8ATOo1L3HoQ/6
 4r2QGQW8xpwx1Ajo3RT7lZVbJvpzCwfkZgUPiivMmmMglHAmYpvExGxqER8iIqvpM+0SXC0TW
 nOfzFdC6E7gRoeCcekndFBMfWnSYy3t780Qo5xVlD1LcPd1WCSwVUaDr4QgE482Hj4Y8Q9PKa
 wqiu0EvSo0TB4pr/sDCi04fELsr0seGVyfG21AuLFL9E+6MASWAG7v6+mytFRt4FWMSRm6Jy/
 qsK1ocrtqwXyiJzddLgs0eLx+xlM5/4zuP2VHwTgnZlOO21yUXp3t9zKW0eyXu3Ryy5X3TlBu
 gNEpnsr6LRhqePBJJ3fG7wERt3h0bT/VM7fUeE5tH49NU0zLfbm+ogEga2ZnjDKHpf8UMl4ta
 dxKlHWSmDUt6H84lhPEG885DmQBLWBDiY161pA1bGr/yAYfozFADFL9XW2/kirrlMn1SfYWR2
 Sj1mcTjkiMCXsfEvGQpwPwdvEClfnkzX8EoIYQItqGJhnGapsALCUEiRbvcNIJbW1XVrYn7pN
 kLs2q/SHEIccB8v9TFTcJw89qBuFQZyQuNe8zdy3AToFRUS6tGF6o6hxTJDkw5zYMokZ0tcvB
 kg9+204dVckTmG4mf88O6jiaU1KLfZAV/EXZv66PkQ==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 03/01/2023 à 12:08, marcandre.lureau@redhat.com a écrit :
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> ../hw/usb/ccid-card-emulated.c: In function 'handle_apdu_thread':
> ../hw/usb/ccid-card-emulated.c:251:24: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
>    251 |                 assert((unsigned long)event > 1000);
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/usb/ccid-card-emulated.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/usb/ccid-card-emulated.c b/hw/usb/ccid-card-emulated.c
> index ee41a81801..c328660075 100644
> --- a/hw/usb/ccid-card-emulated.c
> +++ b/hw/usb/ccid-card-emulated.c
> @@ -248,7 +248,7 @@ static void *handle_apdu_thread(void* arg)
>           WITH_QEMU_LOCK_GUARD(&card->vreader_mutex) {
>               while (!QSIMPLEQ_EMPTY(&card->guest_apdu_list)) {
>                   event = QSIMPLEQ_FIRST(&card->guest_apdu_list);
> -                assert((unsigned long)event > 1000);
> +                assert(event != NULL);
>                   QSIMPLEQ_REMOVE_HEAD(&card->guest_apdu_list, entry);
>                   if (event->p.data.type != EMUL_GUEST_APDU) {
>                       DPRINTF(card, 1, "unexpected message in handle_apdu_thread\n");

Applied to my trivial-patches branch.

Thanks,
Laurent


