Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 935655B56E9
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 11:02:37 +0200 (CEST)
Received: from localhost ([::1]:37880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXfKu-0003tg-C9
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 05:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1oXfHV-00026t-Ed
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 04:59:05 -0400
Received: from madras.collabora.co.uk ([46.235.227.172]:56562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1oXfHT-00036c-5n
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 04:59:05 -0400
Received: from [192.168.178.42] (host-79-51-37-159.retail.telecomitalia.it
 [79.51.37.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: fahien)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E84E56601DBA;
 Mon, 12 Sep 2022 09:58:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1662973139;
 bh=7DVWfT5wm9bXhB+N95J7KqMeuCnCBwKGsIlHliG2BWU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YAsp+X6fZV2px2OgbYp+bkmMJwbvYwTy71HzV2smQCzRolqXmeapw5cWIuu2hEG/c
 Fm+4/f+jCLzn58fkhz2NorsSLfkNCA7pp8VwDWOFbj2aMZJr+GCBxt9vo83iJO8Flb
 5dWqXs4Blie5dp+ayrPi1T8kKbwdkBIDzeyrQkXhsQB95zGZdm9Cne4fd9aORM+Ysh
 xKyJAjC91QwyulyY3RYWGQarD3c4jIB430/sZ33DIVsmyTOGFfGLcasF3tCXuVgizl
 1Ol7rEP2NAT44X4PcA7MItj99sXadv8K6dbNutafz3sBxZfWXZc7BStPfLDel05HS/
 zsyu4Cb14tyjA==
Message-ID: <efeafcb1-a9e1-28dc-cd92-516c22f96f8d@collabora.com>
Date: Mon, 12 Sep 2022 10:58:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 0/5] virtio-gpu: Blob resources
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, gert.wollny@collabora.com,
 dmitry.osipenko@collabora.com
References: <20220829154058.524413-1-antonio.caggiano@collabora.com>
 <CAJ+F1C+zNq7uVn02BLWVvL6E+3gRL4PbqhUMP9rqYr73cCJ2xQ@mail.gmail.com>
From: Antonio Caggiano <antonio.caggiano@collabora.com>
In-Reply-To: <CAJ+F1C+zNq7uVn02BLWVvL6E+3gRL4PbqhUMP9rqYr73cCJ2xQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=46.235.227.172;
 envelope-from=antonio.caggiano@collabora.com; helo=madras.collabora.co.uk
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.101,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marc-André,

On 30/08/2022 13:07, Marc-André Lureau wrote:
> Hi
> 
> On Mon, Aug 29, 2022 at 7:46 PM Antonio Caggiano 
> <antonio.caggiano@collabora.com <mailto:antonio.caggiano@collabora.com>> 
> wrote:
> 
>     Add shared memory and support blob resource creation, mapping and
>     unmapping through virglrenderer new stable APIs[0] when available.
> 
>     [0]
>     https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/891 <https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/891>
> 
> 
> This is merged, and will be part of 0.10 
> (https://gitlab.freedesktop.org/virgl/virglrenderer/-/milestones/9#tab-issues <https://gitlab.freedesktop.org/virgl/virglrenderer/-/milestones/9#tab-issues>), hopefully soon to be released.
> 
> The series looks ok to me, except for the few comments I left. Could you 
> please update the documentation too?

Which documentation are you referring to?

> 
> thanks
> 
> 
> 
>     Antonio Caggiano (1):
>        virtio-gpu: Handle resource blob commands
> 
>     Dmitry Osipenko (1):
>        virtio-gpu: Don't require udmabuf when blob support is enabled
> 
>     Dr. David Alan Gilbert (1):
>        virtio: Add shared memory capability
> 
>     Gerd Hoffmann (1):
>        virtio-gpu: hostmem
> 
>     Richard Henderson (1):
>        Update version for v7.1.0-rc4 release
> 
>       VERSION                              |   2 +-
>       hw/display/virtio-gpu-pci.c          |  15 +++
>       hw/display/virtio-gpu-virgl.c        | 169 +++++++++++++++++++++++++++
>       hw/display/virtio-gpu.c              |  25 ++--
>       hw/display/virtio-vga.c              |  33 ++++--
>       hw/virtio/virtio-pci.c               |  18 +++
>       include/hw/virtio/virtio-gpu-bswap.h |  18 +++
>       include/hw/virtio/virtio-gpu.h       |  11 ++
>       include/hw/virtio/virtio-pci.h       |   4 +
>       meson.build                          |   5 +
>       10 files changed, 276 insertions(+), 24 deletions(-)
> 
>     -- 
>     2.34.1
> 
> 
> 
> 
> -- 
> Marc-André Lureau

