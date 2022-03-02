Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEA44CA5CF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:20:09 +0100 (CET)
Received: from localhost ([::1]:47254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPOtk-00089x-J3
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:20:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPNKb-00046o-3a
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 06:39:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPNKZ-0004ch-3f
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 06:39:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646221182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=19ViMvdRgyTTsoAOTKvBgGMstF1T/snbg2xNx4W52GU=;
 b=dtU7WcLHTkXLJMLLy+3wO8QO7VzeqVUPKa74YZNO3ZfdzgrUJYaEnlBYCpkJ3wOU4i+xnW
 95rZ+lHALBZbLOBVVm48l/QOShfpYoxgioPAnnR9jX3OeXLTUF3lkSbjpFdo4dUiO4CbIC
 m91Yoysv8OT6ETDc393p/0JEgIjVRRo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-WfAYugtTPj6i17IuLQmh0g-1; Wed, 02 Mar 2022 06:39:35 -0500
X-MC-Unique: WfAYugtTPj6i17IuLQmh0g-1
Received: by mail-wr1-f72.google.com with SMTP id
 p9-20020adf9589000000b001e333885ac1so535312wrp.10
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 03:39:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=19ViMvdRgyTTsoAOTKvBgGMstF1T/snbg2xNx4W52GU=;
 b=MyxNYln+GJo/YnzrHuv/XSEPx7REur0quygE3tZGszZ4f5Q3XFCVAZuHjUxvJUMYIR
 ZtlYm+mfjyjDbukPKFJ+dCjmXe6TtZj0TukqE4lBKbwm5RdAzvxeIFh+vLMFFuLTtF8P
 nsfd/AkVxyj6unrYSCVQXRquY0hfhDLyNL+yw4xFxpHtVbFfXtiock0X+koGuVaKZGBu
 qjx2krwXTvDTK9SGRiWwJPbdFUVlX7FUC+4vBoL9t7qQoMcbiYsNVcQ4EynlhnwI1PfS
 6UcMH4SdIWvQv9ruqJueP93yzflJ3YyaT5Lr4lfCG55k9IlJ++LuXKYthu6zHXgBSoGT
 gEnw==
X-Gm-Message-State: AOAM533EauS2b+UdpY5VJs3a/EQe7Akm4d+0bPrjwzHt7eCw2d1gs7t6
 oGUu8KeNDDLJqb9OH2wKIkM5UWUtwsDcNFqknhz0LDhpR0Dq4ja8OeprjHiUzAYGq/xIbl+L0nE
 XaeQB5UpAa35O+Fw=
X-Received: by 2002:a05:6000:114d:b0:1ee:f251:52c6 with SMTP id
 d13-20020a056000114d00b001eef25152c6mr21668425wrx.618.1646221174557; 
 Wed, 02 Mar 2022 03:39:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1Xf7siCi43xGxdwQnVkacfT0/sOXY2ykUin3Tb4ekfe/fTt/zULIpSy0EEq5FEZixKtULbA==
X-Received: by 2002:a05:6000:114d:b0:1ee:f251:52c6 with SMTP id
 d13-20020a056000114d00b001eef25152c6mr21668412wrx.618.1646221174321; 
 Wed, 02 Mar 2022 03:39:34 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 b15-20020adfc74f000000b001e888b871a0sm17136930wrh.87.2022.03.02.03.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 03:39:33 -0800 (PST)
Date: Wed, 2 Mar 2022 11:39:31 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Fabian Ebner <f.ebner@proxmox.com>
Subject: Re: [PATCH v8 0/3] VNC-related HMP/QMP fixes
Message-ID: <Yh9Xc766JwFT5ySD@work-vm>
References: <20220204101220.343526-1-f.ebner@proxmox.com>
MIME-Version: 1.0
In-Reply-To: <20220204101220.343526-1-f.ebner@proxmox.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: w.bumiller@proxmox.com, berrange@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, marcandre.lureau@gmail.com, kraxel@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, eblake@redhat.com,
 t.lamprecht@proxmox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Fabian Ebner (f.ebner@proxmox.com) wrote:
> Original cover letter by Stefan R.:
> 
> Since the removal of the generic 'qmp_change' command, one can no
> longer replace the 'default' VNC display listen address at runtime
> (AFAIK). For our users who need to set up a secondary VNC access port,
> this means configuring a second VNC display (in addition to our
> standard one for web-access), but it turns out one cannot set a
> password on this second display at the moment, as the 'set_password'
> call only operates on the 'default' display.
> 
> Additionally, using secret objects, the password is only read once at
> startup. This could be considered a bug too, but is not touched in
> this series and left for a later date.

Queued

> v7 -> v8:
> * drop last patch deprecating SetPasswordAction values besides 'keep'
>   for VNC (unfortunately, I don't have enough time to try implementing
>   'disconnect' and 'fail' for VNC in the near future)
> * drop if conditionals for DisplayProtocol enum to make compilation
>   with --disable-spice and/or --disable-vnc work
> * order 'keep' first in enum, to fix how patch #3 uses it as an
>   implicit default
> * also set connected and has_connected for the VNC options in
>   hmp_set_password
> * fix typo in patch #1
> * add missing '#' for description in patch #3
> 
> v6 -> v7:
> * remove g_strdup and g_free, use strings directly
> * squash in last patch
> 
> v5 -> v6:
> * consider feedback from Markus' review, mainly:
>   * fix crash bug in patch 1 (sorry, artifact of patch-splitting)
>   * rely on '!has_param => param == NULL' to shorten code
>   * add note to 'docs/about/deprecated.rst' and touch up comments a bit
> * go back to g_free instead of qapi_free_* since the latter apparently tries to
>   free the passed in pointer which lives on the stack...
> * fix bug in HMP parsing (see patch 1)
> 
> v4 -> v5:
> * add comment to patch 1 in "monitor-internal.h"
> * use qapi_free_SetPasswordOptions and friends, don't leak strdups
> * split QAPI change into 3 seperate patches
> 
> v3 -> v4:
> * drop previously patch 1, this was fixed here instead:
>   https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg02529.html
> * patch 1: add Eric's R-b
> * patch 2: remove if-assignment, use 'deprecated' feature in schema
> 
> v2 -> v3:
> * refactor QMP schema for set/expire_password as suggested by Eric Blake and
>   Markus Armbruster
> 
> v1 -> v2:
> * add Marc-André's R-b on patch 1
> * use '-d' flag as suggested by Eric Blake and Gerd Hoffmann
>   * I didn't see a way to do this yet, so I added a "flags with values" arg type
> 
> Stefan Reiter (3):
>   monitor/hmp: add support for flag argument with value
>   qapi/monitor: refactor set/expire_password with enums
>   qapi/monitor: allow VNC display id in set/expire_password
> 
>  hmp-commands.hx            |  24 ++++---
>  monitor/hmp-cmds.c         |  52 +++++++++++++-
>  monitor/hmp.c              |  19 +++++-
>  monitor/monitor-internal.h |   3 +-
>  monitor/qmp-cmds.c         |  49 ++++----------
>  qapi/ui.json               | 134 ++++++++++++++++++++++++++++++++-----
>  6 files changed, 213 insertions(+), 68 deletions(-)
> 
> -- 
> 2.30.2
> 
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


