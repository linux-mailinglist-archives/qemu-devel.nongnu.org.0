Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DAE403471
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 08:48:40 +0200 (CEST)
Received: from localhost ([::1]:39746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNrNv-0002da-10
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 02:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNrKP-0000ej-6J
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:45:01 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:49191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNrKN-00049M-PJ
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:45:00 -0400
Received: from [192.168.100.1] ([82.142.27.6]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MnagF-1mpo561Ngb-00jbBG; Wed, 08 Sep 2021 08:44:57 +0200
Subject: Re: [PATCH 02/12] mac_via: move last_b variable into q800 VIA1
 VMStateDescription
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
 <20210830102447.10806-3-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <c3d222a6-4486-b1b8-aa76-dcf56e1988e1@vivier.eu>
Date: Wed, 8 Sep 2021 08:44:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830102447.10806-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qQg3rZAhdFLTEyjIn84HtcpxuZYe88G5Opd1Je9mn5tjMREEUq0
 VU5i5aiU4TNRk/ftA1wSGehRvdwPDujJVZsFdUBRmcjdRnW9ZIzzM8jota0nOZyZ4262K8y
 3if1Ufn4K7GZBMzzOaqaMouj6z8hTMuYbKp//3y802kb6YdR+PwWhzlq7G8r6k9t2QG3dKf
 iL0p1BuYfI6dlZqeYglmA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4hxhZZGXO0Q=:MpMDbBJeRa/HicpbXjqIr7
 4Mekydk3KVdgigZYawAfnTaVEHLEJACFtC2MHoIYatKJdVuXuwDGV5Xw56sSWXdy2Zmxe0ROf
 PmuVmSU2NtXcdRHPttvohUDSRHcwDAjAJdz+TtsHsPFjRCxuDcktg8cnjmUUHv5a4JhiSvuvo
 Ak5x9UHCy7hHiHpxKw7Ka03DgZ2w8lHIDHbPTJO5rCTsO48hfc5PJc57Y1RwNykLVWb4y9yEb
 p+1/CUf3nNBeJq9+2fUyAfiOzOS0sDI2RoTIg9qcoqGvavc/VrK6Mx/MEryGeuxDyS4sjdrtf
 IxIVnBJec2kqqPGTZjjfs9CahRlS4kEFb4b5fMB6ByiCrKzldJkKTw83CYrRHGKxLeKLyHnow
 S7072ApVXWzExPCrnR7syHeQDsBWUQZ6dgz4HSLZK3es5Ugf9Adwj7KyxMWAvWmuO4hT/GGF8
 pFmQ1xLwqYdfPyhkpYki2lkaKH3xnCrmqf4VRJAkYB7sC7EDQ2+At52Y+c3GkhnJlI5G8OAMF
 JPpoyWko2UtfxK7SsjRrNmpPfPKxSYKEG4+ZHg8TkYI4Gs5xyYrDScTtd+H/hU7hCOlQqqN7z
 cshbnjKfvRATZ9Wh8MgUFmQ8jPNxhhU+XuQBv6j93C0ioVnFV7PL93Ot3gJbCX8u8MAc1+3gi
 VMb685cWlPb6Q1LFqZtz6znScdXAWFM0+wbiU1gsPyooYMG5HLZe3AzkK8hOcvIDdqXGhxcSm
 zQGnvFCjJPc0kjw5Om9H/i9HN61H0uX8cZ0cwA==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.332,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
> This variable is already present in MOS6522Q800VIA1State and can be moved
> immediately into the q800 VIA1 VMStateDescription.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/misc/mac_via.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


