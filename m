Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA8A3956BA
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 10:14:55 +0200 (CEST)
Received: from localhost ([::1]:52012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnd4Y-000775-33
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 04:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lnd2a-0005Qe-6h; Mon, 31 May 2021 04:12:52 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:32773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lnd2V-0004M1-Ra; Mon, 31 May 2021 04:12:51 -0400
Received: from [192.168.100.1] ([82.142.27.18]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MxVbb-1lU0mW0PEH-00xoCa; Mon, 31 May 2021 10:12:41 +0200
Subject: Re: [PATCH] hw/display/macfb: Classify the "nubus-macfb" as display
 device
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210531073255.46286-1-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <97f211b8-5a9b-dd08-d18e-6b7c4009429a@vivier.eu>
Date: Mon, 31 May 2021 10:12:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210531073255.46286-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:uDdJflZ77h2KrhGtaKD9wJotCl0zTM5S5vufr+QfRpD2CIGEMPn
 UukC7/1UjBjmNWbJUNY8p1V9OWfy/Jnj+5V6Xfx2KDQE7jWOvazUFQvg2wbOscAcDcQhL6a
 sFnBzg1x1ir2a0kuRRB+H+VVlrad1TueM1NQqL7k75iSqUvH6SbZ/wTZdwBCeQQT9hNRDmK
 zz6bqkjHW5xZHidwFNj9A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9LmL27Yvfhs=:wbshM2ihcPkEXj5qFow+Y+
 qON6okP3MbLiHKMYBA/grgo9mpVkD/cmZqvMPgF2pCBqukfqpAmgHWqdUnyxL+/y6yz5ktlFy
 GgRDaX2d8H6MluLpiPUxRL5a0WqBvRX0ENXhtyK3xVeyGNr52ftjLgVfEoYee4RfNv81hk/8n
 um5uTrsRlBGY8PYL4pRH1/Y25qvrBVfd5ITmE+dIf86Djm2FoL7lgnBKi7WXXge1qKEe/01K0
 cy8XDY9yGe7K8Ko8XNmhitfGaWPGetd98wRudApUyduRX7QFZ9vzoh+22pf1Rv2cRJs5MAd+3
 GTR3mDzSP4NRw9KgaImlv1/U/JlUHcQEYggRtLn+cDC6dKyrYKX3evXZu/s2Khd/w+EMtGYIE
 oMTNIMQZ5UsrZQltjqjJG33akjCudcX/XKOzlSTGL3tnhi35dsfWSyiVBgGlfosrX5b3Fjd65
 Lb3mb3b7Z0mkcgq1p3ZU0CnCawxp7/nsq2RuimlFP8w2sJTJCu71im6z73RxeZuKDhjqnBG72
 +rUbxVJMrjowTtIPVzQcwo=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.618,
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 31/05/2021 à 09:32, Thomas Huth a écrit :
> The "nubus-macfb" currently shows up as uncategorized device in
> the output of "-device help". Put it into the display category
> to fix this ugliness.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/display/macfb.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
> index ff8bdb846b..d8183b9bbd 100644
> --- a/hw/display/macfb.c
> +++ b/hw/display/macfb.c
> @@ -450,6 +450,7 @@ static void macfb_nubus_class_init(ObjectClass *klass, void *data)
>      dc->desc = "Nubus Macintosh framebuffer";
>      dc->reset = macfb_nubus_reset;
>      dc->vmsd = &vmstate_macfb;
> +    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
>      device_class_set_props(dc, macfb_nubus_properties);
>  }
>  
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

