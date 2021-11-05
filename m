Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70366446017
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 08:25:44 +0100 (CET)
Received: from localhost ([::1]:52804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mitbb-0005V3-05
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 03:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mitaK-0004ny-OV
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 03:24:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mitaG-0006HE-QD
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 03:24:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636097059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CzCZfsjyqL7KqY+U4VcCmINYHYr2UKSv3Akt8OxvKOs=;
 b=UlfTuvmdVE5AnIyoK5+tZnsT8hYVhiX1IBTTmvb6DWNbtEKdM1d1xbosmp8QcjTalYKroJ
 AuoZ+EzGrE740IurjvOF+RHCHMfztEO/19X/T2UtfTrIpNVxsY8KvcJUgfyOtlcYo5gici
 xaBG4YRUG2/DnT4G+zNaGDtKIVAwrtk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-g7WpSq3WMcOftdRFohvc8A-1; Fri, 05 Nov 2021 03:24:13 -0400
X-MC-Unique: g7WpSq3WMcOftdRFohvc8A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7675A104ECFD;
 Fri,  5 Nov 2021 07:24:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 766395FC25;
 Fri,  5 Nov 2021 07:23:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 04E1C11380A7; Fri,  5 Nov 2021 08:23:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Subject: Re: [PATCH v8 8/8] hmp: add virtio commands
References: <1635334909-31614-1-git-send-email-jonah.palmer@oracle.com>
 <1635334909-31614-9-git-send-email-jonah.palmer@oracle.com>
Date: Fri, 05 Nov 2021 08:23:22 +0100
In-Reply-To: <1635334909-31614-9-git-send-email-jonah.palmer@oracle.com>
 (Jonah Palmer's message of "Wed, 27 Oct 2021 07:41:49 -0400")
Message-ID: <87fssb5amt.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, si-wei.liu@oracle.com, joao.m.martins@oracle.com,
 eblake@redhat.com, qemu-block@nongnu.org, david@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jonah Palmer <jonah.palmer@oracle.com> writes:

> From: Laurent Vivier <lvivier@redhat.com>
>
> This patch implements the HMP versions of the virtio QMP commands.
>
> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
> ---
>  docs/system/monitor.rst |   2 +
>  hmp-commands-virtio.hx  | 250 ++++++++++++++++++++++++++++++++++
>  hmp-commands.hx         |  10 ++
>  hw/virtio/virtio.c      | 355 ++++++++++++++++++++++++++++++++++++++++++++++++
>  include/monitor/hmp.h   |   5 +
>  meson.build             |   1 +
>  monitor/misc.c          |  17 +++
>  7 files changed, 640 insertions(+)
>  create mode 100644 hmp-commands-virtio.hx
>
> diff --git a/docs/system/monitor.rst b/docs/system/monitor.rst
> index ff5c434..10418fc 100644
> --- a/docs/system/monitor.rst
> +++ b/docs/system/monitor.rst
> @@ -21,6 +21,8 @@ The following commands are available:
>  
>  .. hxtool-doc:: hmp-commands.hx
>  
> +.. hxtool-doc:: hmp-commands-virtio.hx
> +
>  .. hxtool-doc:: hmp-commands-info.hx
>  
>  Integer expressions
> diff --git a/hmp-commands-virtio.hx b/hmp-commands-virtio.hx
> new file mode 100644
> index 0000000..36aab94
> --- /dev/null
> +++ b/hmp-commands-virtio.hx
> @@ -0,0 +1,250 @@
> +HXCOMM Use DEFHEADING() to define headings in both help text and rST.
> +HXCOMM Text between SRST and ERST is copied to the rST version and
> +HXCOMM discarded from C version.
> +HXCOMM
> +HXCOMM DEF(command, args, callback, arg_string, help) is used to construct
> +HXCOMM monitor info commands.
> +HXCOMM
> +HXCOMM HXCOMM can be used for comments, discarded from both rST and C.
> +HXCOMM
> +HXCOMM In this file, generally SRST fragments should have two extra
> +HXCOMM spaces of indent, so that the documentation list item for "virtio cmd"
> +HXCOMM appears inside the documentation list item for the top level
> +HXCOMM "virtio" documentation entry. The exception is the first SRST
> +HXCOMM fragment that defines that top level entry.
> +
> +SRST
> +  ``virtio`` *subcommand*
> +  Show various information about virtio
> +
> +  Example:
> +
> +  List all sub-commands::
> +
> +  (qemu) virtio
> +  virtio query  -- List all available virtio devices

I get:

    qemu/docs/../hmp-commands-virtio.hx:25:Inconsistent literal block quoting.

> +  virtio status path -- Display status of a given virtio device
> +  virtio queue-status path queue -- Display status of a given virtio queue
> +  virtio vhost-queue-status path queue -- Display status of a given vhost queue
> +  virtio queue-element path queue [index] -- Display element of a given virtio queue
> +
> +ERST

[...]

> diff --git a/monitor/misc.c b/monitor/misc.c
> index ffe7966..5e4cd88 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -23,6 +23,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include CONFIG_DEVICES
>  #include "monitor-internal.h"
>  #include "monitor/qdev.h"
>  #include "hw/usb.h"
> @@ -219,6 +220,15 @@ static void hmp_info_help(Monitor *mon, const QDict *qdict)
>      help_cmd(mon, "info");
>  }
>  
> +static void hmp_virtio_help(Monitor *mon, const QDict *qdict)
> +{
> +#if defined(CONFIG_VIRTIO)
> +    help_cmd(mon, "virtio");

Probably not your patch's fault: extra space before '--' in the line

    virtio query  -- List all available virtio devices

> +#else
> +    monitor_printf(mon, "Virtio is disabled\n");
> +#endif
> +}
> +
>  static void monitor_init_qmp_commands(void)
>  {
>      /*
> @@ -1433,6 +1443,13 @@ static HMPCommand hmp_info_cmds[] = {
>      { NULL, NULL, },
>  };
>  
> +static HMPCommand hmp_virtio_cmds[] = {
> +#if defined(CONFIG_VIRTIO)
> +#include "hmp-commands-virtio.h"
> +#endif
> +    { NULL, NULL, },
> +};
> +
>  /* hmp_cmds and hmp_info_cmds would be sorted at runtime */
>  HMPCommand hmp_cmds[] = {
>  #include "hmp-commands.h"


