Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C8661FAE3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 18:12:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os5fY-0006Rt-UG; Mon, 07 Nov 2022 12:12:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1os5fW-0006O1-BY
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 12:12:18 -0500
Received: from esa8.hc2706-39.iphmx.com ([216.71.140.196])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1os5fR-0007cx-3D
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 12:12:18 -0500
X-IronPort-RemoteIP: 209.85.210.72
X-IronPort-MID: 234468146
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:hTYQ668avPKH7OVNIzkNDrUDP3yTJUtcMsCJ2f8bNWPcYEJGY0x3z
 WsXCmrVM6vbMTP9c4sib4m18RkG7cLVmt42SFQ9+3gxFiIbosf7XuiUfxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yI6jeTQHOGU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNKg06/gEk35q6r4WtH5gZWic1j5zcyqVFEVPrzGonsdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVHmZkh+AsBOsTAbzsAG6ZvXAdJHAathZ5RlqPgqo
 DlFncTYpQ7EpcQgksxEO/VTO3gW0aGrZNYriJVw2CCe5xSuTpfi/xlhJAYkH9wH4OJNPUtHr
 r8xMhEsZRKsvcvjldpXSsE07igiBMziPYdavW05iD+GV7ApRpfMR6iM7thdtNsyrpoWTLCOO
 oxDMGIpM06ojx5nYz/7DLo3mPeuimPXeSAepV6IzUYyyzKIkFAvgOGxbrI5fPShYdRawl62/
 V7hpUnIMj8HK4ebzzeKpyfEaujn2HmTtJgpPKS18+MvjFCNy2g7DhoQWl2m5/6jhSaDt8l3L
 kUV/m8psfF3+hPxCNb6WBK8rTiPuRt0t8dsLtDWITqlksL8izt1zEBYH2MphAAO3CPueQEX6
 w==
IronPort-HdrOrdr: A9a23:2B27uavBp4S7hCIWcJqzmp1C7skDoNV00zEX/kB9WHVpmwKj5q
 eTddAgpGLJYVcqKQsdcLW7UpVoLkmsl6KdjbNhWItKGTOWxFdAT7sSlrcKoQeQYhEWn9Q1vc
 wQEJSWSueAdWSS5fyb3ODSKadH/DDoytHNuc7ui11Ad0VFUZ1B0itOIjqnMyRNNXZ77FkCeK
 Z0JPArm9NtQxoqhw2AaRg4Y9Q=
Received: from mail-ot1-f72.google.com ([209.85.210.72])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Nov 2022 12:09:39 -0500
Received: by mail-ot1-f72.google.com with SMTP id
 33-20020a9d0124000000b0066adf5218b2so5844408otu.10
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 09:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4HSEmnBkKb5QkT06F6XJTULzrQJy+4h9FWzjVV3yIz4=;
 b=d6rLUbJBXlDE4H/QflkWB+H6x1g1MWVYGugBiuXhN9hVUfYtLUKquzHqO/A6dDcPUc
 dpYFu6jtEIOjCVTJ8W/xjhUNclPkBaSY3avYDHTE/BZ3uILoXSWPkHtGbqLTg3hnNYBU
 xKTQICSrjhgmgNC9DjX8de74Ns5K45xdCd1tUIX1onS7Pqx2NG3Vum5IoGWFTOV1Locy
 RLu4EXuYXhx3CXuOowcKVfOE3oefBGnB+6IqEEL+hmvtAUAcERyL3WgaGpNVvG8YH0wX
 bkwNuYdF73FBCR+vJNHT7sqgjG6sUoR1UgcphJUBOzECWgUeaH/XxSu89FDtNPvUPEMr
 um1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4HSEmnBkKb5QkT06F6XJTULzrQJy+4h9FWzjVV3yIz4=;
 b=HooV2qjRlfw2q/R9yGmY18nQ28FY/p1p9iMFshGdsJcJLSC0P0EneZ7VN6YTnR4gLv
 kvLuokdCQOyFnfFb7Bokvd4ibc5cpX42ag3UcUCmSNJTBkBj6V5I5gvRNk8zAngf8g9v
 F4BkFM3YcT6hnl0I66hdEVd/QlGIHkHGbHqsBJjM+wIXNSzT9fWwEnPlMcMJXaFv9uaI
 P5EiDqjH+TfvjMefDGpCaHiK+YQT+wwiL7TrCPsprUz2pQv50WYN6I62fCVxqTwY0EpC
 5EV3XQMv3JEvbXwQ0BB3ARmrXRevFLNYV84CFGGZAEZo5+MwFPEqNyhqgYu2iNnEZAR5
 JcXA==
X-Gm-Message-State: ANoB5pliPryeEvcvlUe10fo9/LDQ4Rv2flSe57VVSpkhBfLxkSzQuhE5
 Yqxo9LbH7IDlRMHB1qiHyZXpND2FUxXD8achekJe0CkQwsLiRSihEA/SGRhxM94N5AwyWcxkP6Y
 BI9wqYMvTYa0GDc/lrEDVsShUctyaWg==
X-Received: by 2002:a05:6808:1b08:b0:35a:89ff:1c70 with SMTP id
 bx8-20020a0568081b0800b0035a89ff1c70mr3374168oib.97.1667840979114; 
 Mon, 07 Nov 2022 09:09:39 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4TMUcJOZo85uKjoO4bv28q5WyXsmQJE9AJvsP+xBSdR89lIGMAb9DHk1w9GA0PBigPnONZUw==
X-Received: by 2002:a05:6808:1b08:b0:35a:89ff:1c70 with SMTP id
 bx8-20020a0568081b0800b0035a89ff1c70mr3374149oib.97.1667840978804; 
 Mon, 07 Nov 2022 09:09:38 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 63-20020aca0542000000b00339befdfad0sm2570421oif.50.2022.11.07.09.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 09:09:38 -0800 (PST)
Date: Mon, 7 Nov 2022 12:09:09 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jon Maloy <jmaloy@redhat.com>, Siqi Chen <coc.cyqh@gmail.com>
Subject: Re: [PATCH v3 0/7] memory: prevent dma-reentracy issues
Message-ID: <20221107170909.oi6ger3ilt727t5q@mozz.bu.edu>
References: <20221028191648.964076-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028191648.964076-1-alxndr@bu.edu>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.196; envelope-from=alxndr@bu.edu;
 helo=esa8.hc2706-39.iphmx.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 221028 1516, Alexander Bulekov wrote:
> These patches aim to solve two types of DMA-reentrancy issues:
> 
> 1.) mmio -> dma -> mmio case
> To solve this, we track whether the device is engaged in io by
> checking/setting a flag within APIs used for MMIO access.
> 
> 2.) bh -> dma write -> mmio case
> This case is trickier, since we dont have a generic way to associate a
> bh with the underlying Device/DeviceState. Thus, this version introduces
> a change to QEMU's DMA APIs to associate each request with the
> origiantor DeviceState. In total, the affected APIs are used in
> approximately 250 locations:
> 
> dma_memory_valid (1 usage)
> dma_memory_rw (~5 uses)
> dma_memory_read (~92 uses)
> dma_memory_write (~71 uses)
> dma_memory_set (~4 uses)
> dma_memory_map (~18 uses)
> dma_memory_unmap (~21 uses)
> {ld,st}_{le,be}_{uw,l,q}_dma (~10 uses)
> ldub_dma (does not appear to be used anywhere)
> stb_dma (1 usage)
> dma_buf_read (~18 uses)
> dma_buf_write (~7 uses)
> 
> It is not trivial to mechanically replace all of the invocations:
> For many cases, this will be as simple as adding DEVICE(s) to the
> arguments, but there are locations where the code will need to be
> slightly changed. As such, for now I added "_guarded" versions of most
> of the APIs which can be used until all of the invocations are fixed.
> 
> The end goal is to go through all of hw/ and make the required changes
> (I will need help with this). Once that is done, the "_guarded" APIs can
> take the place of the standard DMA APIs and we can mecahnically remove
> the "_guarded" suffix from all invocations.
> 
> These changes do not address devices that bypass DMA apis and directly
> call into address_space.. APIs. This occurs somewhat commonly, and
> prevents me from fixing issues in Virtio devices, such as:
> https://gitlab.com/qemu-project/qemu/-/issues/827
> I'm not sure what approach we should take for these cases - maybe they
> should be switched to DMA APIs (or the DMA API expanded).
> 
> v2 -> v3: Bite the bullet and modify the DMA APIs, rather than
>     attempting to guess DeviceStates in BHs.
> 
> Alexander Bulekov (7):
>   memory: associate DMA accesses with the initiator Device
>   dma-helpers: switch to guarded DMA accesses
>   ahci: switch to guarded DMA acccesses
>   sdhci: switch to guarded DMA accesses
>   ehci: switch to guarded DMA accesses
>   xhci: switch to guarded DMA accesses
>   usb/libhw: switch to guarded DMA accesses
> 
>  hw/ide/ahci.c          | 16 +++++++++-------
>  hw/sd/sdhci.c          | 43 ++++++++++++++++++++++--------------------
>  hw/usb/hcd-ehci.c      |  8 ++++----
>  hw/usb/hcd-xhci.c      | 24 +++++++++++------------
>  hw/usb/libhw.c         |  4 ++--
>  include/hw/qdev-core.h |  2 ++
>  include/sysemu/dma.h   | 41 ++++++++++++++++++++++++++++++++++++++++
>  softmmu/dma-helpers.c  | 15 ++++++++-------
>  softmmu/memory.c       | 15 +++++++++++++++
>  softmmu/trace-events   |  1 +
>  10 files changed, 117 insertions(+), 52 deletions(-)
> 
> -- 
> 2.27.0
>

ping

