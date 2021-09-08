Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6BE4034A0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 08:57:49 +0200 (CEST)
Received: from localhost ([::1]:57664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNrWm-0006cL-9a
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 02:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNrRH-0000gK-5b
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:52:11 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:42499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNrRF-0001o0-Ki
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:52:06 -0400
Received: from [192.168.100.1] ([82.142.27.6]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N3sZy-1n5xeG0wWu-00zlP0; Wed, 08 Sep 2021 08:52:04 +0200
Subject: Re: [PATCH 08/12] mac_via: move VIA1 realize logic from
 mac_via_realize() to mos6522_q800_via1_realize()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
 <20210830102447.10806-9-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <c843db7f-b74b-d227-9b6d-78669b2e82a1@vivier.eu>
Date: Wed, 8 Sep 2021 08:52:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830102447.10806-9-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:SnD4PYOj+69Kc85ji75P5tIyNSCm/htgM3BkGsZoaP+UW8L2HIi
 eGqiwUkp82nxUuK4H29xbTfjOIM2sRDJs0lVqUEm+EWD41z9lKVBwi1aukdkdMGscYXnkAp
 +C3f7Sg26a7QjCezspiKoO5UUFpFccLPhYH+U4xGRwgqFocW8j5nvhAn2f2IUi+0RqwNEtS
 iXdEkeLGOevC8dybc5CWw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KOq1Zw5Dyyk=:HvnzQYK2VrdwcTTkzrdn4M
 jciTUssKysWBWEfHnTrwR/48JnkHkt5QiDmFAy8zxecXe8Necona0aH6+z8Fy9UDV40WEcSTt
 9nHKYxL81FTfvFfSdXsqisJRibC+PbNUgrVx2PS4ZQ4P3FzAcv6ZUgyPldQr6jnkZD7hNqf1i
 4TA85W3tU60LZQdMiDQBYOmyEBIlsuDGAye4FWZj8/yYcIaOU0Mn6ZPmUb75rezsW4aTbMhY3
 cX49dnFrv5TwRjd/DGUKEXgeLocD1/EqPR/p9UxSj4Vn693k5mbgtGj6HCYVsu6w6Ml9v7gPM
 mvQhEjbjS15zj1NQoBBpTWALD80P+rhmZtUhAt0brJSME1ZAvRCKns4/7KWasdLMGo3/jBD8J
 8j7t4BC88QW1e1Py3ICiKsackBz53S5guRUPhwwZebD4lQxeq5BuQdX3E4tPH4ZC33ESlsFoZ
 1d1SnERc9Pb72hpAlqlkoqSTYoHX16HZw2pwFCyrLqxiHFQInS5ozhAJD0KIJPxrWDbOjl4Za
 iRZIpY6rPDq3Q4nyyEYDb1YqWjLZK9aVi6w5gRWIvxl25fZVsqDEs9rrjYz8qVwsDuN4p+Odb
 E5BvP0YOzHiYwXuHB9v7D3Cjrc4yofxE/VcmDP43vIQ7rhu46WBW1FXz1acKDcT6txqbkBrrI
 JezmCeeXfLI9OUT0++yfgj8z8s4TB+yEKU0Fy/3nyMrPM1ct4ikSOH8nAGQTYha+f7Qgk6wx3
 o4pV+Co05kty2mXtcRvNaqWrGzqLwNMGY9I1Kg==
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
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/misc/mac_via.c | 86 ++++++++++++++++++++++++-----------------------
>  1 file changed, 44 insertions(+), 42 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


