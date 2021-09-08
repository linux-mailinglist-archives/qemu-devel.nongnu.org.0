Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF43403486
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 08:52:36 +0200 (CEST)
Received: from localhost ([::1]:48226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNrRj-0008Sw-EW
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 02:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNrPc-0006KK-Gk
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:50:26 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:50451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNrPZ-0000KH-9M
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:50:24 -0400
Received: from [192.168.100.1] ([82.142.27.6]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MDgtl-1mH1703kpj-00AoAY; Wed, 08 Sep 2021 08:50:18 +0200
Subject: Re: [PATCH 05/12] mac_via: move ADB variables to MOS6522Q800VIA1State
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
 <20210830102447.10806-6-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <abe89618-8fba-e8bb-6348-66dc0c1bf770@vivier.eu>
Date: Wed, 8 Sep 2021 08:50:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830102447.10806-6-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:7Ogm3KvpOvfbGiLVoecZGESFwcrPuQH+SB9ELBmFUSesqEyIjjn
 kD7LrZGcR5sdPTnKYUpyBy64sFsq8XfluwNuce2MLEK+c22RVQzgL8tnWXL2aJTF3u6pNnP
 g27RgqM6qMj6ArXLg0xNSyuTjfETsK5OMbqTnpPqlXWQP2XmCnq2k/7tpAmvD49qI+d8/bN
 Xan/YkWXANUPrQ0e3IMfg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OqFNCctfeTQ=:fpmyuuVz1eZuMDNNXgqehW
 179tCJaxQjj6Ih8ADzAwu1gP+k7KLB8Tvvi+gioBfz2bAigoB0tX080D1FqGhwj1xTVYnoQgB
 v0DsmWc4lIo3eI4iZu7dj5MGHOH1pjJyfryYrckzojaBjTZ2KZQc8k5Lii4VCODPHqgtj4qfF
 TwH5bpjnzF0iqGvZhpdNxCgbX1mtZ4gX5GX2XMboQlSY/S1RVzMTZO5sFAWblN5y44MDhdjrh
 Ift7aNWED6HrmAqNg7Inyo/lsnXtZtCjRA7ee/IpzXlIWpUneV2niXGUFQD8PAI+XgUccJZQG
 IvHhy6kAnDMpd3VmJC7TS0LjLiclAumfWd2VyvPg39VVf82HS/uyRWWg3lepf5f4HXzkR58BR
 WMrjgVnjJTO9pirWVH3Lb31wvbgt73Q8AyCZfP0GxWzYb7FCLhBuuzjAu77dhmZn5RSh8otGx
 L/dMxayEGgEZD4aTV8UxkF/2EKq9hreF6s0Vc1KC+eBDnd2UbjZnTers7lKzR+2QGFiUw4508
 +oQmp9z1D4xTNmm1H/keD/hjhm2KKsyf7+HvQ3MAGapHRaHpwB+e7oBbTaVNrbJ09dT7wUT3t
 ts3SuxcWNZNsDP6ixGhZpWyGp7XcECfnwcOTISkqqN9t74tZb728DNA71JX+DbwppC+9hp8i1
 FkAQKtF40T22tiwUMGnFmv6UDOFUdUKOrVZlrM+AjkI5/kZhRzyx8JsfM7UUAJk6RkByJ1j2l
 4IqymupSgZgVyBPUs7V99j6jwiY+dEUzo2KXhQ==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) NICE_REPLY_A=-2.332,
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
> The ADB is accessed using clock and data pins on q800 VIA1 port B and so can be
> moved to MOS6522Q800VIA1State.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/m68k/q800.c            |   6 +-
>  hw/misc/mac_via.c         | 169 +++++++++++++++++++-------------------
>  include/hw/misc/mac_via.h |  20 ++---
>  3 files changed, 96 insertions(+), 99 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

