Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 692F5418E8E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 07:03:46 +0200 (CEST)
Received: from localhost ([::1]:46112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUinp-0006zk-Eq
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 01:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1mUil1-00052Y-It
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 01:00:52 -0400
Received: from relay.yourmailgateway.de ([188.68.63.101]:39787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1mUiky-00029r-NY
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 01:00:50 -0400
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
 by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4HHr7H47cVz4yH0;
 Mon, 27 Sep 2021 07:00:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zapateado.de; s=key2;
 t=1632718843; bh=wg3xXY2ajFyQVlpBXmyPWPz8huf4gW6mh3HZRFRHvHQ=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=AEfKdSrGsVA1+1SbQd9iwtw2b9yB0t3o1+SmJfnKUngz8oONOPLPpIVVzkasAmyJM
 59CCyHpglPoVk/gHrujvw45r1tsBOuWRAfyUAgkMEN6V6b7F2gzjM/+FBDtsQ8rr+W
 4Js1BhkSwbFAZhE7FZF5Ohvz7Y9ra4T9u2jSPyDIp7HwbB/UBYESDhrjSCZQpLbzKa
 oHWse44LAw/QJTR/EzhNRUBhFDZEdv1Br3Yvc66LBRZ7kDoTm9CZ65hS2p6zbDa8wY
 1SPehEGJZaK0Ri2DU7Tmhq6Nm+qZB/tpho4TYhsQUKDoFJofzoF5DRrQ61r9hGQC0K
 xXppAzjkRSWeQ==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4HHr7H3hvpz4yFG;
 Mon, 27 Sep 2021 07:00:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Score: -1.5
Received: from mx2f6e.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy01-mors.netcup.net (Postfix) with ESMTPS id 4HHr7F2Vlhz8sg9;
 Mon, 27 Sep 2021 07:00:41 +0200 (CEST)
Received: from [192.168.54.9] (ip-95-223-69-36.hsi16.unitymediagroup.de
 [95.223.69.36])
 by mx2f6e.netcup.net (Postfix) with ESMTPSA id 630E0651B5;
 Mon, 27 Sep 2021 07:00:40 +0200 (CEST)
Authentication-Results: mx2f6e;
 spf=pass (sender IP is 95.223.69.36) smtp.mailfrom=hk@zapateado.de
 smtp.helo=[192.168.54.9]
Received-SPF: pass (mx2f6e: connection is authenticated)
Subject: Re: ping [PATCH] configure/optionrom: Fix MSYS2 multiboot.bin issue
From: Helge Konetzka <hk@zapateado.de>
To: qemu-devel@nongnu.org
References: <2b5ab039-8495-b55f-03f1-ecfd996907a9@zapateado.de>
Message-ID: <7223fdda-c68e-0617-76fc-e564c85e9de7@zapateado.de>
Date: Mon, 27 Sep 2021 07:00:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <2b5ab039-8495-b55f-03f1-ecfd996907a9@zapateado.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <163271884074.8896.16395173899831070042@mx2f6e.netcup.net>
X-PPP-Vhost: konetzka.de
X-NC-CID: CUslU9dq60oeyfbRE0lmhW3OSsoP1fkSnQZfU3LKw2Oe
Received-SPF: pass client-ip=188.68.63.101; envelope-from=hk@zapateado.de;
 helo=relay.yourmailgateway.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.478,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

https://lore.kernel.org/qemu-devel/2b5ab039-8495-b55f-03f1-ecfd996907a9@zapateado.de/T/#u

https://patchew.org/QEMU/2b5ab039-8495-b55f-03f1-ecfd996907a9@zapateado.de/

Am 15.09.21 um 12:56 schrieb Helge Konetzka:
> This patch enables native builds on MSYS2 with symlinks disabled.
> 
> 
> Signed-off-by: Helge Konetzka <hk@zapateado.de>
> ---
> 
> Without this patch these builds fail with:
> 
> make[1]: *** No rule to make target 'multiboot.bin', needed by 'all'. Stop.
> make: *** [Makefile:189: pc-bios/optionrom/all] Error 2
> make: *** Waiting for unfinished jobs....
> ...
> ==> ERROR: A failure occurred in build().
>       Aborting...
> 
> Builds fail because make cannot determine correct TOPSRC_DIR/SRC_DIR 
> based on copied instead of linked Makefile
> 
> After applying this patch to current master I succeeded in building 
> natively on Linux and Windows/MSYS2 with symlinks disabled and enabled 
> (winsymlinks:nativestrict, bash executed as Administrator).
> 
>   configure                  | 4 ++++
>   pc-bios/optionrom/Makefile | 5 ++---
>   2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/configure b/configure
> index da2501489f..a12bc8edbf 100755
> --- a/configure
> +++ b/configure
> @@ -5090,6 +5090,10 @@ for rom in seabios; do
>       echo "RANLIB=$ranlib" >> $config_mak
>   done
> 
> +config_mak=pc-bios/optionrom/config.mak
> +echo "# Automatically generated by configure - do not modify" > 
> $config_mak
> +echo "TOPSRC_DIR=$source_path" >> $config_mak
> +
>   if test "$skip_meson" = no; then
>     cross="config-meson.cross.new"
>     meson_quote() {
> diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
> index 30771f8d17..3482508a86 100644
> --- a/pc-bios/optionrom/Makefile
> +++ b/pc-bios/optionrom/Makefile
> @@ -1,6 +1,5 @@
> -CURRENT_MAKEFILE := $(realpath $(word $(words 
> $(MAKEFILE_LIST)),$(MAKEFILE_LIST)))
> -SRC_DIR := $(dir $(CURRENT_MAKEFILE))
> -TOPSRC_DIR := $(SRC_DIR)/../..
> +include config.mak
> +SRC_DIR := $(TOPSRC_DIR)/pc-bios/optionrom
>   VPATH = $(SRC_DIR)
> 
>   all: multiboot.bin linuxboot.bin linuxboot_dma.bin kvmvapic.bin pvh.bin

