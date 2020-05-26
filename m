Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC021B7A5A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Apr 2020 17:45:03 +0200 (CEST)
Received: from localhost ([::1]:42046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jS0Vi-0003xe-GX
	for lists+qemu-devel@lfdr.de; Fri, 24 Apr 2020 11:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58578)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alxndr@bu.edu>) id 1jS0To-00033N-6V
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 11:43:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alxndr@bu.edu>) id 1jS0Tm-0000UB-C0
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 11:43:03 -0400
Received: from relay68.bu.edu ([128.197.228.73]:54819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1jS0Tl-0000Kq-PN
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 11:43:02 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 03OFfkTZ014735
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 24 Apr 2020 11:41:48 -0400
Date: Fri, 24 Apr 2020 11:41:46 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 1/3] Makefile: Drop unused, broken target recurse-fuzz
Message-ID: <20200424154146.47exheu7wknq47ki@mozz.bu.edu>
References: <20200424071142.3525-1-armbru@redhat.com>
 <20200424071142.3525-2-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200424071142.3525-2-armbru@redhat.com>
User-Agent: NeoMutt/20180716
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/24 11:42:43
X-ACL-Warn: Detected OS   = Linux 2.6.x
X-Received-From: 128.197.228.73
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
Cc: lvivier@redhat.com, thuth@redhat.com, qemu-devel@nongnu.org, bsd@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 200424 0911, Markus Armbruster wrote:
> Target recurse-fuzz depends on pc-bios/optionrom/fuzz, which can't be
> made.  It's not used anywhere.  Added in commit c621dc3e01c, looks
> like cargo cult.  Delete.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

> ---
>  Makefile | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 8a9113e666..34275f57c9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -582,7 +582,6 @@ $(ROM_DIRS_RULES):
>  
>  .PHONY: recurse-all recurse-clean recurse-install
>  recurse-all: $(addsuffix /all, $(TARGET_DIRS) $(ROM_DIRS))
> -recurse-fuzz: $(addsuffix /fuzz, $(TARGET_DIRS) $(ROM_DIRS))
>  recurse-clean: $(addsuffix /clean, $(TARGET_DIRS) $(ROM_DIRS))
>  recurse-install: $(addsuffix /install, $(TARGET_DIRS))
>  $(addsuffix /install, $(TARGET_DIRS)): all
> -- 
> 2.21.1
> 

