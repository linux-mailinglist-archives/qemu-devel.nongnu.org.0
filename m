Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7738C33B1C7
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 12:54:09 +0100 (CET)
Received: from localhost ([::1]:34438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLlnU-0003hY-Ho
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 07:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lLllO-0002TA-Hs
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:51:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lLllM-000117-GH
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:51:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615809115;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XRJNev3TgWNFT4jUkoQrlmlZ2+puFrgs8CdfNkPm+/M=;
 b=F3CyfAhB78vWp8k3/PA2Xo0UT8u0LSdsaEgDEdhvnWTRQHWibIunF7uth7qfsKrtZ5ditC
 wvWY6eBWiJ/ap/sdiiKiEONw3gz6Yoqtb1Gj0dbAoVQm9KAKTRzEHjDjpyGmHvAj5Q6Kaw
 frOls0zqZjvK+Rjj2bSWtwUCo6d/MB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-ZTHD2xlPMmqlMrqx1g0rGA-1; Mon, 15 Mar 2021 07:51:54 -0400
X-MC-Unique: ZTHD2xlPMmqlMrqx1g0rGA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E0DF801817;
 Mon, 15 Mar 2021 11:51:52 +0000 (UTC)
Received: from redhat.com (ovpn-115-81.ams2.redhat.com [10.36.115.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 45C3F5D9D3;
 Mon, 15 Mar 2021 11:51:29 +0000 (UTC)
Date: Mon, 15 Mar 2021 11:51:26 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 07/14] machine: remove 'arch' field from
 'query-cpus-fast' QMP command
Message-ID: <YE9KPpnLpEcDYX5P@redhat.com>
References: <20210224131142.1952027-1-berrange@redhat.com>
 <20210224131142.1952027-8-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210224131142.1952027-8-berrange@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping for anyone willing to review this so I can get this in before freeze.

On Wed, Feb 24, 2021 at 01:11:35PM +0000, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  docs/system/deprecated.rst       |  6 -----
>  docs/system/removed-features.rst |  6 +++++
>  hw/core/machine-qmp-cmds.c       | 41 --------------------------------
>  qapi/machine.json                | 22 -----------------
>  4 files changed, 6 insertions(+), 69 deletions(-)
> 
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 484f017119..78474f0845 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -192,12 +192,6 @@ Since the ``dirty-bitmaps`` field is optionally present in both the old and
>  new locations, clients must use introspection to learn where to anticipate
>  the field if/when it does appear in command output.
>  
> -``query-cpus-fast`` ``arch`` output member (since 3.0.0)
> -''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> -
> -The ``arch`` output member of the ``query-cpus-fast`` command is
> -replaced by the ``target`` output member.
> -
>  chardev client socket with ``wait`` option (since 4.0)
>  ''''''''''''''''''''''''''''''''''''''''''''''''''''''
>  
> diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
> index ad146daf9b..7942c2e513 100644
> --- a/docs/system/removed-features.rst
> +++ b/docs/system/removed-features.rst
> @@ -100,6 +100,12 @@ Use ``migrate_set_parameter`` instead.
>  
>  The ``query-cpus`` command is replaced by the ``query-cpus-fast`` command.
>  
> +``query-cpus-fast`` ``arch`` output member (removed in 6.0)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +The ``arch`` output member of the ``query-cpus-fast`` command is
> +replaced by the ``target`` output member.
> +
>  Human Monitor Protocol (HMP) commands
>  -------------------------------------
>  
> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
> index af60cd969d..68a942595a 100644
> --- a/hw/core/machine-qmp-cmds.c
> +++ b/hw/core/machine-qmp-cmds.c
> @@ -24,46 +24,6 @@
>  #include "sysemu/runstate.h"
>  #include "sysemu/sysemu.h"
>  
> -static CpuInfoArch sysemu_target_to_cpuinfo_arch(SysEmuTarget target)
> -{
> -    /*
> -     * The @SysEmuTarget -> @CpuInfoArch mapping below is based on the
> -     * TARGET_ARCH -> TARGET_BASE_ARCH mapping in the "configure" script.
> -     */
> -    switch (target) {
> -    case SYS_EMU_TARGET_I386:
> -    case SYS_EMU_TARGET_X86_64:
> -        return CPU_INFO_ARCH_X86;
> -
> -    case SYS_EMU_TARGET_PPC:
> -    case SYS_EMU_TARGET_PPC64:
> -        return CPU_INFO_ARCH_PPC;
> -
> -    case SYS_EMU_TARGET_SPARC:
> -    case SYS_EMU_TARGET_SPARC64:
> -        return CPU_INFO_ARCH_SPARC;
> -
> -    case SYS_EMU_TARGET_MIPS:
> -    case SYS_EMU_TARGET_MIPSEL:
> -    case SYS_EMU_TARGET_MIPS64:
> -    case SYS_EMU_TARGET_MIPS64EL:
> -        return CPU_INFO_ARCH_MIPS;
> -
> -    case SYS_EMU_TARGET_TRICORE:
> -        return CPU_INFO_ARCH_TRICORE;
> -
> -    case SYS_EMU_TARGET_S390X:
> -        return CPU_INFO_ARCH_S390;
> -
> -    case SYS_EMU_TARGET_RISCV32:
> -    case SYS_EMU_TARGET_RISCV64:
> -        return CPU_INFO_ARCH_RISCV;
> -
> -    default:
> -        return CPU_INFO_ARCH_OTHER;
> -    }
> -}
> -
>  static void cpustate_to_cpuinfo_s390(CpuInfoS390 *info, const CPUState *cpu)
>  {
>  #ifdef TARGET_S390X
> @@ -104,7 +64,6 @@ CpuInfoFastList *qmp_query_cpus_fast(Error **errp)
>              value->props = props;
>          }
>  
> -        value->arch = sysemu_target_to_cpuinfo_arch(target);
>          value->target = target;
>          if (target == SYS_EMU_TARGET_S390X) {
>              cpustate_to_cpuinfo_s390(&value->u.s390x, cpu);
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 9811927504..c0c52aef10 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -34,21 +34,6 @@
>               'sh4eb', 'sparc', 'sparc64', 'tricore', 'unicore32',
>               'x86_64', 'xtensa', 'xtensaeb' ] }
>  
> -##
> -# @CpuInfoArch:
> -#
> -# An enumeration of cpu types that enable additional information during
> -# @query-cpus-fast.
> -#
> -# @s390: since 2.12
> -#
> -# @riscv: since 2.12
> -#
> -# Since: 2.6
> -##
> -{ 'enum': 'CpuInfoArch',
> -  'data': ['x86', 'sparc', 'ppc', 'mips', 'tricore', 's390', 'riscv', 'other' ] }
> -
>  ##
>  # @CpuS390State:
>  #
> @@ -86,14 +71,9 @@
>  # @props: properties describing to which node/socket/core/thread
>  #         virtual CPU belongs to, provided if supported by board
>  #
> -# @arch: base architecture of the cpu
> -#
>  # @target: the QEMU system emulation target, which determines which
>  #          additional fields will be listed (since 3.0)
>  #
> -# Features:
> -# @deprecated: Member @arch is deprecated.  Use @target instead.
> -#
>  # Since: 2.12
>  #
>  ##
> @@ -102,8 +82,6 @@
>                        'qom-path'     : 'str',
>                        'thread-id'    : 'int',
>                        '*props'       : 'CpuInstanceProperties',
> -                      'arch'         : { 'type': 'CpuInfoArch',
> -                                         'features': [ 'deprecated' ] },
>                        'target'       : 'SysEmuTarget' },
>    'discriminator' : 'target',
>    'data'          : { 's390x'        : 'CpuInfoS390' } }
> -- 
> 2.29.2
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


