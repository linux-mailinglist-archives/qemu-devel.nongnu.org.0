Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF75242082C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:24:02 +0200 (CEST)
Received: from localhost ([::1]:44586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXKCX-00040B-Oi
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXJir-0001eC-Bs
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:53:22 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:45327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mXJim-0000nc-9M
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:53:21 -0400
Received: from [192.168.100.1] ([82.142.3.114]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MmD2M-1nFD6v3kX2-00iCoe; Mon, 04 Oct 2021 10:53:14 +0200
Subject: Re: [PATCH 03/12] macfb: fix overflow of color_palette array
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
 <20211002110007.30825-4-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <ce177c34-4e97-a26f-1408-887e091195bf@vivier.eu>
Date: Mon, 4 Oct 2021 10:53:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211002110007.30825-4-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HXU9ghdQeDsF7D9pv+itPAr1fsj8qZrZzzj/r5NjpYJiVd/6Qsa
 j7SnQoOJHfzFAh03iABpK65pGziJoq6NIy+mTXf+7b99YAhZSoAVpYwf5hpVCLSMemBhNap
 5mrSyc8lVuI1GJjG5xc6YWp7Nebp+rzIXmM6JA5y1TPIjqFOGj2+2oIlmeN8CnVPbCj0T37
 9U8a0G+1bxq9QXfc2cyiw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IWVLaRATNe4=:s9jgO7Yv3zbtmb5FKgoFtX
 m5CNO99xAibRNZ2hJT2Y5Xs32RYLqXCI5YAXltMFGcag65+xy1SJwPh1HdyXvBD00eBy/iDdZ
 GsPx8xUbXNPXKG1CZe7yDiFw5lCZ/+bgn6X0IICVFcuHSD17irMAyvtSSS6gR4YE/c9bUY5nB
 ufiPVGn3inuFZQE0LKOVO78uZ/y/3HGiQ3SlE8v5aR1XLNcCVyQtIjzRc6oOjI9iIofmfUZZ3
 M19kckjzbl+0tEoVPsPVQac2oXbjnMQlkluLyf2LeP4x+n3LUZXSxaOJ0kUYrIHvPPCqB4Eok
 Uxrpp8z9JCbPWJ0Uq/iK8c4HC7DgmRxru/G/2qRbBM3VOybn5MHKxHbZuELIUjocp/aBRPHQW
 iVf8XRAPIpLEOXJKqVGazKIw7Qs3VMpAjkq7lGAp3LR/qy6yaPXonjRQYb4I4ZiPif6mW/jnP
 OBYj4aiB+/avS6xbPFdl3BBGpq7gBSRtaRoKKAHUI9NXVN0CEacL7HX+YeJeUCIIFivW7pJ1g
 LY+NUUADV+tlUzy8M/JOva/moDM5zIs2M6Hnp27nDRbDm1BIYaWZfVFUR8halO3usBLCvY3OJ
 sfGv+kj74tk4kXqSmQkRrWaXENXVK9YOaWEKJHxFH6crTs56VELn6aK6mX9m8olse55bPqZrc
 ZzLMr7S5phi/EylMTT2wXmRT+N7JAAxo6rU4Y4GvM1N5d8GQUHSzTW+3k8SWwrodCHF30oVok
 Xp83jIvYKGhOedr5B2K26HEVOIuFfEBozDn7PQ==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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

Le 02/10/2021 à 12:59, Mark Cave-Ayland a écrit :
> The palette_current index counter has a maximum size of 256 * 3 to cover a full
> color palette of 256 RGB entries. Linux assumes that the palette_current index
> wraps back around to zero after writing 256 RGB entries so ensure that
> palette_current is reset at this point to prevent data corruption within
> MacfbState.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/display/macfb.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
> index 815870f2fe..f4e789d0d7 100644
> --- a/hw/display/macfb.c
> +++ b/hw/display/macfb.c
> @@ -307,6 +307,9 @@ static void macfb_ctrl_write(void *opaque,
>          if (s->palette_current % 3) {
>              macfb_invalidate_display(s);
>          }
> +        if (s->palette_current >= sizeof(s->color_palette)) {
> +            s->palette_current = 0;
> +        }
>          break;
>      }
>  }
> 

What about "s->palette_current = (s->palette_current + 1) % sizeof(s->color_palette)"?

Thanks,
Laurent

