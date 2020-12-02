Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE632CCA91
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 00:33:41 +0100 (CET)
Received: from localhost ([::1]:43514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkbcy-0005rM-MD
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 18:33:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kkbbC-0004pF-B4; Wed, 02 Dec 2020 18:31:50 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:34250 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kkbb9-0005v6-VV; Wed, 02 Dec 2020 18:31:50 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 3DD6D41395;
 Wed,  2 Dec 2020 23:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1606951901;
 x=1608766302; bh=AmxaquwGD9FzSDKfsZ/KYeRRS4+wNGzeLqORBNEhud8=; b=
 YSqpMvCQTN7gdHevPJwXN1j8jUwVOQ7zpBGq+sHPx9ysHT+af32lkFBs4KDrZq3r
 eerjPrxbQxUAnp8c+T1TIy0izn4Z5n7OzdjqmN9tSgRvy7UJDt0DEsBkCXop9MNr
 2Dc744PtJXS2GynFNZG5Kcy3A8zuQjXKmBC5igBvfoE=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NU9tQu41fgOz; Thu,  3 Dec 2020 02:31:41 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id AE6974131C;
 Thu,  3 Dec 2020 02:31:41 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 3 Dec
 2020 02:31:41 +0300
Date: Thu, 3 Dec 2020 02:32:00 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v3 01/10] hvf: Add hypervisor entitlement to output
 binaries
Message-ID: <20201202233200.GA34964@SPB-NB-133.local>
References: <20201202190408.2041-1-agraf@csgraf.de>
 <20201202190408.2041-2-agraf@csgraf.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201202190408.2041-2-agraf@csgraf.de>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 02, 2020 at 08:03:59PM +0100, Alexander Graf wrote:
> In macOS 11, QEMU only gets access to Hypervisor.framework if it has the
> respective entitlement. Add an entitlement template and automatically self
> sign and apply the entitlement in the build.
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> 
> ---
> 
> v1 -> v2:
> 
>   - Make safe to ctrl-C
> ---
>  accel/hvf/entitlements.plist |  8 ++++++++
>  meson.build                  | 30 ++++++++++++++++++++++++++----
>  scripts/entitlement.sh       | 13 +++++++++++++
>  3 files changed, 47 insertions(+), 4 deletions(-)
>  create mode 100644 accel/hvf/entitlements.plist
>  create mode 100755 scripts/entitlement.sh
> 
> diff --git a/accel/hvf/entitlements.plist b/accel/hvf/entitlements.plist
> new file mode 100644
> index 0000000000..154f3308ef
> --- /dev/null
> +++ b/accel/hvf/entitlements.plist
> @@ -0,0 +1,8 @@
> +<?xml version="1.0" encoding="UTF-8"?>
> +<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
> +<plist version="1.0">
> +<dict>
> +    <key>com.apple.security.hypervisor</key>
> +    <true/>
> +</dict>
> +</plist>
> diff --git a/meson.build b/meson.build
> index 5062407c70..2a7ff5560c 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1844,9 +1844,14 @@ foreach target : target_dirs
>      }]
>    endif
>    foreach exe: execs
> -    emulators += {exe['name']:
> -         executable(exe['name'], exe['sources'],
> -               install: true,
> +    exe_name = exe['name']
> +    exe_sign = 'CONFIG_HVF' in config_target
> +    if exe_sign
> +      exe_name += '-unsigned'
> +    endif
> +
> +    emulator = executable(exe_name, exe['sources'],
> +               install: not exe_sign,
>                 c_args: c_args,
>                 dependencies: arch_deps + deps + exe['dependencies'],
>                 objects: lib.extract_all_objects(recursive: true),
> @@ -1854,7 +1859,24 @@ foreach target : target_dirs
>                 link_depends: [block_syms, qemu_syms] + exe.get('link_depends', []),
>                 link_args: link_args,
>                 gui_app: exe['gui'])
> -    }
> +
> +    if exe_sign
> +      exe_full = meson.current_build_dir() / exe['name']

It's defined but not used.

> +      emulators += {exe['name'] : custom_target(exe['name'],
> +                   install: true,
> +                   install_dir: get_option('bindir'),
> +                   depends: emulator,
> +                   output: exe['name'],
> +                   command: [
> +                     meson.current_source_dir() / 'scripts/entitlement.sh',
> +                     meson.current_build_dir() / exe['name'] + '-unsigned',

exe_name might be used instead of:
exe['name'] + '-unsigned'

Thanks,
Roman

> +                     meson.current_build_dir() / exe['name'],
> +                     meson.current_source_dir() / 'accel/hvf/entitlements.plist'
> +                   ])
> +      }
> +    else
> +      emulators += {exe['name']: emulator}
> +    endif
>  
>      if 'CONFIG_TRACE_SYSTEMTAP' in config_host
>        foreach stp: [
> diff --git a/scripts/entitlement.sh b/scripts/entitlement.sh
> new file mode 100755
> index 0000000000..c540fa6435
> --- /dev/null
> +++ b/scripts/entitlement.sh
> @@ -0,0 +1,13 @@
> +#!/bin/sh -e
> +#
> +# Helper script for the build process to apply entitlements
> +
> +SRC="$1"
> +DST="$2"
> +ENTITLEMENT="$3"
> +
> +trap 'rm "$DST.tmp"' exit
> +cp -af "$SRC" "$DST.tmp"
> +codesign --entitlements "$ENTITLEMENT" --force -s - "$DST.tmp"
> +mv "$DST.tmp" "$DST"
> +trap '' exit
> -- 
> 2.24.3 (Apple Git-128)
> 

