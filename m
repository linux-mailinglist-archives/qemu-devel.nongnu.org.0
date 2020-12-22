Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD45A2E08A6
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 11:17:12 +0100 (CET)
Received: from localhost ([::1]:57772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krej9-0002Wl-GZ
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 05:17:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1kregj-0001dr-08; Tue, 22 Dec 2020 05:14:41 -0500
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:45144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1kregh-0004kj-0d; Tue, 22 Dec 2020 05:14:40 -0500
Received: by mail-io1-xd2d.google.com with SMTP id n4so11484594iow.12;
 Tue, 22 Dec 2020 02:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GWm0IArsIsWtOxoX0B6WgQRSLc6shUXnS7+qBR9mty4=;
 b=ll7xqe0RavJEGnLnYj1ntmt50L7yZd0+OZ1bP4yNcgQXPTEcnJRFS7faZZTfF5AAQi
 aOSAD3xf2DJAYk4fJaz/PcpqdobbfQ3UMI6aN/wkq3fffZoSpxkoBYg7bQeIe4jRU8Zb
 PtZqSkqdC6zxcFOh0L3KK7yo8viRTMXpgG5g0cYSzlkOJsgIZLQQz8v74vzfng7mR4cz
 wQD6tXBGUPiGXRmrgz5NPOOntyj7RymvsMPdFdxJJ56ajLv5U9RKZmcQQ4R1oaakbAVG
 Is3zuvGbwpT1JlHoYNbINq6K1NKL5ctlBuz2cHo8gjp987sjYHloohSZYUcuuVB8Mvn0
 9qWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GWm0IArsIsWtOxoX0B6WgQRSLc6shUXnS7+qBR9mty4=;
 b=hxgIGvDA7/8Zwa0/ketX7pTSJ9+PHUU4JfzIUAJVY2yn+bRnmvN/30pWaUdNyJHRBo
 lSPq5a6dL4usqB4+GEjt7A6eNgGFenU1MW6ScwonyRpdokstbpZPRPGsbtmvhGLIfWcg
 J1PK58ISv2q/tetbjMxUq0ZjhbczP4YckaPWJ3AiQa7BLllN58pJktRBh0PmGcwrrqpc
 mTqnxp40dU6XdNNCqmSuHC8K5NGnJvWymQKzqPElF+H/O7wcyAfiFV7DnYe761GJnAWn
 fzOqLnmhZjkGRbDqyecdRi5JqKg2uYF7aDnm/QMFf3LBgHVjZK8aJEzy4nRtmZ30hwuJ
 pGdw==
X-Gm-Message-State: AOAM532EOn9IDoiqEqzRKAlet+vme+Naa8xUpZDuxrx3LSpqnS+yRP5p
 hqCecJQ7agOio0SQuhPsLrk=
X-Google-Smtp-Source: ABdhPJwVml3aEYQT2p2pA2JejXO8A1SJ+ChHi6jVEZ9YfwYdAbKap8qPsNQg1jRv2UoTBZYSvZXqGg==
X-Received: by 2002:a5d:8a1a:: with SMTP id w26mr17251297iod.112.1608632077302; 
 Tue, 22 Dec 2020 02:14:37 -0800 (PST)
Received: from ?IPv6:2804:431:c7c6:556d:fa44:43b8:486b:f066?
 ([2804:431:c7c6:556d:fa44:43b8:486b:f066])
 by smtp.gmail.com with ESMTPSA id v3sm14778944ilj.28.2020.12.22.02.14.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Dec 2020 02:14:36 -0800 (PST)
Subject: Re: [PATCH 0/6] spapr: Fix visibility and traversal of DR connectors
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <20201218103400.689660-1-groug@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <4c99523f-7540-7518-7ad0-1750257d2491@gmail.com>
Date: Tue, 22 Dec 2020 07:14:33 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201218103400.689660-1-groug@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=danielhb413@gmail.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.233,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/18/20 7:33 AM, Greg Kurz wrote:
> Setting a high maxmem value seriously degrades the guest's boot
> time, from 3 seconds for 1T up to more than 3 minutes for 8T.
> All this time is spent during initial machine setup and CAS,
> preventing use of the QEMU monitor in the meantime.
> 
> Profiling reveals:
> 
>    %   cumulative   self              self     total
>   time   seconds   seconds    calls   s/call   s/call  name
>   85.48     24.08    24.08   566117     0.00     0.00  object_get_canonical_path_component
>   13.67     27.93     3.85 57623944     0.00     0.00  strstart
> 
> -----------------------------------------------
>                  0.00    0.00       1/566117      host_memory_backend_get_name [270]
>                  1.41    0.22   33054/566117      drc_realize <cycle 1> [23]
>                 22.67    3.51  533062/566117      object_get_canonical_path <cycle 1> [3]
> [2]     98.7   24.08    3.73  566117         object_get_canonical_path_component [2]
>                  3.73    0.00 55802324/57623944     strstart [19]
> -----------------------------------------------
>                                    12             object_property_set_link <cycle 1> [1267]
>                                 33074             device_set_realized <cycle 1> [138]
>                                231378             object_get_child_property <cycle 1> [652]
> [3]     93.0    0.01   26.18  264464         object_get_canonical_path <cycle 1> [3]
>                 22.67    3.51  533062/566117      object_get_canonical_path_component [2]
>                                264464             object_get_root <cycle 1> [629]
> -----------------------------------------------
> 
> This is because an 8T maxmem means QEMU can create up to 32768
> LMB DRC objects, each tracking the hot-plug/unplug state of 256M
> of contiguous RAM. These objects are all created during machine
> init for the machine lifetime. Their realize path involves
> several calls to object_get_canonical_path_component(), which
> itself traverses all properties of the parent node. This results
> in a quadratic operation. Worse, the full list of DRCs is traversed
> 7 times during the boot process, eg. to populate the device tree,
> calling object_get_canonical_path_component() on each DRC again.
> Yet even more costly quadratic traversals.
> 
> Modeling DR connectors as individual devices raises some
> concerns, as already discussed a year ago in this thread:
> 
> https://patchew.org/QEMU/20191017205953.13122-1-cheloha@linux.vnet.ibm.com/
> 
> First, having so many devices to track the DRC states is excessive
> and can cause scalability issues in various ways. This bites again
> with this quadratic traversal issue. Second, DR connectors are really
> PAPR internals that shouldn't be exposed at all in the composition
> tree.
> 
> This series converts DR connectors to be simple unparented
> objects tracked in a separate hash table, rather than
> actual devices exposed in the QOM tree. This doesn't address
> the overall concern on scalability, but this brings linear
> traversal of the DR connectors. The time penalty with a
> 8T maxmem is reduced to less than 1 second, and we get
> a much shorter 'info qom-tree' output.
> 
> This is transparent to migration.


Tested in a P9 host with a 512Gb initial mem RAM guest in regular mode and P8
compat mode. Without this series, the guest takes on average 35 seconds to
start booting. With this series the boot starts in 5 seconds for the same
guest.


Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>


> 
> Greg Kurz (6):
>    spapr: Call spapr_drc_reset() for all DRCs at CAS
>    spapr: Fix reset of transient DR connectors
>    spapr: Introduce spapr_drc_reset_all()
>    spapr: Use spapr_drc_reset_all() at machine reset
>    spapr: Add drc_ prefix to the DRC realize and unrealize functions
>    spapr: Model DR connectors as simple objects
> 
>   include/hw/ppc/spapr_drc.h |  18 +++-
>   hw/ppc/spapr.c             |  15 +--
>   hw/ppc/spapr_drc.c         | 181 +++++++++++++++++--------------------
>   hw/ppc/spapr_hcall.c       |  33 ++-----
>   hw/ppc/spapr_pci.c         |   2 +-
>   5 files changed, 106 insertions(+), 143 deletions(-)
> 

