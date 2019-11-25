Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D3F108BA7
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Nov 2019 11:29:20 +0100 (CET)
Received: from localhost ([::1]:42104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZBcN-0004GJ-IH
	for lists+qemu-devel@lfdr.de; Mon, 25 Nov 2019 05:29:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40618)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iZBbG-0003qR-Eo
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 05:28:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iZBbF-00080B-EP
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 05:28:10 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37590
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iZBbF-0007zz-A7
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 05:28:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574677688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=KH8affNRYx+ULyPBZk+H2qEqB/bCTX+HUhIaSD5Y1j4=;
 b=Gm9AzJuK+XEXKKqqh0GA4De1Abp9V4qI9psu3a3aGJrNMzK7y9u1LXfgMwayDQvtBNjAgj
 LGkZj/wSI1GnUv0X2W2qFVsuvtEkuP6Ano/IBI7OS1F9peaabRYQO/OC7qLsM8H2pkZWRs
 WqqXspAre6fv9xY0MpROkz1HsnNrxGM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-U8l-nfv5OHyLYh395Hl8eA-1; Mon, 25 Nov 2019 05:28:07 -0500
Received: by mail-wm1-f72.google.com with SMTP id f16so4395092wmb.2
 for <qemu-devel@nongnu.org>; Mon, 25 Nov 2019 02:28:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KH8affNRYx+ULyPBZk+H2qEqB/bCTX+HUhIaSD5Y1j4=;
 b=WMUycTwsJDs0bn/5QLHcVGcXyrCtKNUVbTFKch31vgEiQfhapouyxC3U/9KQ09nem9
 9GY5OMEecxF4mdw19nPdW3jR1T7nLwSdNoBZj76KiPq2WYq31SBvasfJAozavGphqTO3
 NrwnOJlcJ4ddEILsY4LIYrmg+pdo4gTV1mhh+7uO8FZlehZLcJJoIafdhvPXYwMnasus
 gpKxlEzEjcovl1ZJQjKDNIWi9xI2yx0l5sPjqn2KGLgrGDJXMueJlY4fQHFztaZy7kby
 r0wUzKwTwQZuRBvVMa5c0g2d9nLNgiB50enGC2s/ifAPqLwsX2pznQHO03giVVuh7bx7
 7Sbg==
X-Gm-Message-State: APjAAAWPzQBV6cpg+/U4DfMtJy/2PftSizS5VwnvV8ovkBdNUmrVJcAH
 RrI9+6ysCab5uFbT5S9eLJJs0JcuRWkdn6Dnqzi5Vwqeb9OJ23/f38+DU2QjBs5Tb7h1v7J7JeD
 tgjhavxtqvVOuqcE=
X-Received: by 2002:a05:600c:212:: with SMTP id
 18mr28996192wmi.93.1574677686240; 
 Mon, 25 Nov 2019 02:28:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqwvtyIk39DLW2VxXY4MGlQF5EZ4pN95lJ0rEmprBqikYAzkx0grR/8x9dKTUGHy+c8GQNEQbQ==
X-Received: by 2002:a05:600c:212:: with SMTP id
 18mr28996168wmi.93.1574677685944; 
 Mon, 25 Nov 2019 02:28:05 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5454:a592:5a0a:75c?
 ([2001:b07:6468:f312:5454:a592:5a0a:75c])
 by smtp.gmail.com with ESMTPSA id a17sm9984305wrs.33.2019.11.25.02.28.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2019 02:28:05 -0800 (PST)
Subject: Re: [PATCH v2 0/5] hvf: stability fixes for HVF
To: Cameron Esfahani <dirty@apple.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <cover.1574625592.git.dirty@apple.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <78511040-b432-c456-b737-50ec839bde30@redhat.com>
Date: Mon, 25 Nov 2019 11:28:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cover.1574625592.git.dirty@apple.com>
Content-Language: en-US
X-MC-Unique: U8l-nfv5OHyLYh395Hl8eA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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

On 24/11/19 21:05, Cameron Esfahani wrote:
> The following patches fix stability issues with running QEMU on Apple
> Hypervisor Framework (HVF):
> - non-RAM, non-ROMD areas need to trap so accesses can be correctly
>   emulated.
> - Current TSC synchronization implementation is insufficient: when
>   running with more than 1 core, TSC values can go backwards.  Until
>   a correct implementation can be written, remove calls to
>   hv_vm_sync_tsc().  Pass through TSC to guest OS.
> - Fix REX emulation in relation to legacy prefixes.
> - More correctly match SDM when setting CR0 and PDPTE registers.
> - Save away exception type as well as vector in hvf_store_events() so
>   they can be correctly reinjected in hvf_inject_interrupts().  Under
>   heavy loads, exceptions got misrouted.

Certainly no doubt about patches 1-4, while for patch 5 I'm wondering if
it's masking another bug; I'd prefer to have also some assertions that
interrupt_injected is never an exception and exception_nr is never an
interrupt.

Peter, can you apply patches 1-4 directly?  I cannot even compile-test
them right now, but they are obviously bugfixes.

Paolo


