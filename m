Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 849094FD9B0
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 12:44:14 +0200 (CEST)
Received: from localhost ([::1]:54192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neE0L-000556-71
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 06:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1neDz3-0004P8-RW
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 06:42:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1neDz0-0000kQ-5m
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 06:42:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649760168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T4dCEWWy8dSW2jP3Tm6XY1VFLUqo4A9vXMjSM+p5It0=;
 b=SEzxoM7TlLPibnlWUYrUMnGe1kLKI58p/pD9duvCXwnn31MCDu4iZ4mBIxSt1ARvoql1hT
 2ZzbikoyX8gfwYuEIMf/g+dvmIAliEXWqnY7s4hAZXR4lf1cQTRnfZEqQ4g3WyS0s2Tf2g
 51FoLR0DUGZ/u4jac882oLc1UrXoerc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-YPxoL9KQMg2iwkwg_0KTHQ-1; Tue, 12 Apr 2022 06:42:48 -0400
X-MC-Unique: YPxoL9KQMg2iwkwg_0KTHQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 h65-20020a1c2144000000b0038e9ce3b29cso1114319wmh.2
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 03:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=T4dCEWWy8dSW2jP3Tm6XY1VFLUqo4A9vXMjSM+p5It0=;
 b=T5RFBLORBBsyI9OJzRWWB85X5pUFHQ/goDVgQtslHN3/dbxffdCnWPi9WeNj93VaIL
 N8MWcsR+b4IM0nwNVaRXvmT1Y5MJPMuMATnDyuwWHDThufGQCnqvmyGsSmRNFgbnWpSH
 3CFUXUcWC/bGzqCHhDLbGydhzHJEctTP3y+R/QFrqpdfSQbc1gw0teJYLO6udaGsbzZT
 bLRnu71a89kIuQV8+kQWRVs0inyl1RF1693L4wWFNZK7rD9GDd5Xtb7PSjHDrY/maoXA
 hAHeO72kEiAPf5zPEjA23xzMggt7Rvgmm7o3tHWjdMA8P460lEsVAgEHMIHEKo3Vflho
 xMOw==
X-Gm-Message-State: AOAM532LeRpE2X9PMGJLQsu2k4bHbmsKn9Vlmzo85G6g/P4aDLEERFiz
 mrK88Q7U2HKvNc2cutdYCj9EZar8qPltBPIj16MlrO2EM0D8iZ106niPOo096jVKU+P7jfmZjrn
 NtHpRbjgLYtDkKDc=
X-Received: by 2002:a05:600c:384e:b0:38c:9a8a:d205 with SMTP id
 s14-20020a05600c384e00b0038c9a8ad205mr3453180wmr.44.1649760166783; 
 Tue, 12 Apr 2022 03:42:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqN+ZYRdae/Yb+BFNr2uJq4Ns2BfP2GmGP9hII2bYGDhugAcz0Io5lMlCUTpWz1Bac3rtHRw==
X-Received: by 2002:a05:600c:384e:b0:38c:9a8a:d205 with SMTP id
 s14-20020a05600c384e00b0038c9a8ad205mr3453148wmr.44.1649760166386; 
 Tue, 12 Apr 2022 03:42:46 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 bu17-20020a056000079100b00207a3124b1dsm6451968wrb.65.2022.04.12.03.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 03:42:45 -0700 (PDT)
Date: Tue, 12 Apr 2022 11:42:43 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Denis V. Lunev" <den@openvz.org>
Subject: Re: [PATCH v2 for 7.1 1/1] block: add 'force' parameter to
 'blockdev-change-medium' command
Message-ID: <YlVXo9R5lpqx6hng@work-vm>
References: <20220412095048.231030-1-den@openvz.org>
MIME-Version: 1.0
In-Reply-To: <20220412095048.231030-1-den@openvz.org>
User-Agent: Mutt/2.2.1 (2022-02-19)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Denis V. Lunev (den@openvz.org) wrote:
> 'blockdev-change-medium' is a convinient wrapper for the following
> sequence of commands:
>  * blockdev-open-tray
>  * blockdev-remove-medium
>  * blockdev-insert-medium
>  * blockdev-close-tray
> and should be used f.e. to change ISO image inside the CD-ROM tray.
> Though the guest could lock the tray and some linux guests like
> CentOS 8.5 actually does that. In this case the execution if this
> command results in the error like the following:
>   Device 'scsi0-0-1-0' is locked and force was not specified,
>   wait for tray to open and try again.
> 
> This situation is could be resolved 'blockdev-open-tray' by passing
> flag 'force' inside. Thus is seems reasonable to add the same
> capability for 'blockdev-change-medium' too.

For HMP:

Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

(Although I'd be pretty careful with this; a guest OS might feel like
it could ignore anything else that was going on and keep it's data
cached if it had it's drive locked).

Dave

> Signed-off-by: Denis V. Lunev <den@openvz.org>
> CC: Kevin Wolf <kwolf@redhat.com>
> CC: Hanna Reitz <hreitz@redhat.com>
> CC: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> CC: Eric Blake <eblake@redhat.com>
> CC: Markus Armbruster <armbru@redhat.com>
> CC: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>  block/qapi-sysemu.c |  3 ++-
>  hmp-commands.hx     | 11 +++++++----
>  monitor/hmp-cmds.c  |  4 +++-
>  qapi/block.json     |  6 ++++++
>  ui/cocoa.m          |  1 +
>  5 files changed, 19 insertions(+), 6 deletions(-)
> 
> Changes from v1:
> - added kludge to Objective C code
> - simplified a bit call of do_open_tray() (thanks, Vova!)
> - added record to hmp-command.hx
> 
> diff --git a/block/qapi-sysemu.c b/block/qapi-sysemu.c
> index 8498402ad4..680c7ee342 100644
> --- a/block/qapi-sysemu.c
> +++ b/block/qapi-sysemu.c
> @@ -318,6 +318,7 @@ void qmp_blockdev_change_medium(bool has_device, const char *device,
>                                  bool has_id, const char *id,
>                                  const char *filename,
>                                  bool has_format, const char *format,
> +                                bool has_force, bool force,
>                                  bool has_read_only,
>                                  BlockdevChangeReadOnlyMode read_only,
>                                  Error **errp)
> @@ -380,7 +381,7 @@ void qmp_blockdev_change_medium(bool has_device, const char *device,
>  
>      rc = do_open_tray(has_device ? device : NULL,
>                        has_id ? id : NULL,
> -                      false, &err);
> +                      force, &err);
>      if (rc && rc != -ENOSYS) {
>          error_propagate(errp, err);
>          goto fail;
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 8476277aa9..6ec593ea08 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -202,9 +202,9 @@ ERST
>  
>      {
>          .name       = "change",
> -        .args_type  = "device:B,target:F,arg:s?,read-only-mode:s?",
> -        .params     = "device filename [format [read-only-mode]]",
> -        .help       = "change a removable medium, optional format",
> +        .args_type  = "device:B,force:-f,target:F,arg:s?,read-only-mode:s?",
> +        .params     = "device [-f] filename [format [read-only-mode]]",
> +        .help       = "change a removable medium, optional format, use -f to force the operation",
>          .cmd        = hmp_change,
>      },
>  
> @@ -212,11 +212,14 @@ SRST
>  ``change`` *device* *setting*
>    Change the configuration of a device.
>  
> -  ``change`` *diskdevice* *filename* [*format* [*read-only-mode*]]
> +  ``change`` *diskdevice* [-f] *filename* [*format* [*read-only-mode*]]
>      Change the medium for a removable disk device to point to *filename*. eg::
>  
>        (qemu) change ide1-cd0 /path/to/some.iso
>  
> +    ``-f``
> +      forces the operation even if the guest has locked the tray.
> +
>      *format* is optional.
>  
>      *read-only-mode* may be used to change the read-only status of the device.
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 634968498b..d8b98bed6c 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1472,6 +1472,7 @@ void hmp_change(Monitor *mon, const QDict *qdict)
>      const char *target = qdict_get_str(qdict, "target");
>      const char *arg = qdict_get_try_str(qdict, "arg");
>      const char *read_only = qdict_get_try_str(qdict, "read-only-mode");
> +    bool force = qdict_get_try_bool(qdict, "force", false);
>      BlockdevChangeReadOnlyMode read_only_mode = 0;
>      Error *err = NULL;
>  
> @@ -1508,7 +1509,8 @@ void hmp_change(Monitor *mon, const QDict *qdict)
>          }
>  
>          qmp_blockdev_change_medium(true, device, false, NULL, target,
> -                                   !!arg, arg, !!read_only, read_only_mode,
> +                                   !!arg, arg, true, force,
> +                                   !!read_only, read_only_mode,
>                                     &err);
>      }
>  
> diff --git a/qapi/block.json b/qapi/block.json
> index 82fcf2c914..3f100d4887 100644
> --- a/qapi/block.json
> +++ b/qapi/block.json
> @@ -326,6 +326,11 @@
>  # @read-only-mode: change the read-only mode of the device; defaults
>  #                  to 'retain'
>  #
> +# @force: if false (the default), an eject request through blockdev-open-tray
> +#         will be sent to the guest if it has locked the tray (and the tray
> +#         will not be opened immediately); if true, the tray will be opened
> +#         regardless of whether it is locked. (since 7.1)
> +#
>  # Features:
>  # @deprecated: Member @device is deprecated.  Use @id instead.
>  #
> @@ -367,6 +372,7 @@
>              '*id': 'str',
>              'filename': 'str',
>              '*format': 'str',
> +            '*force': 'bool',
>              '*read-only-mode': 'BlockdevChangeReadOnlyMode' } }
>  
>  
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index c4e5468f9e..a931174397 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -1529,6 +1529,7 @@ - (void)changeDeviceMedia:(id)sender
>                                         false, NULL,
>                                         [file cStringUsingEncoding:
>                                                   NSASCIIStringEncoding],
> +                                       true, false,
>                                         true, "raw",
>                                         false, 0,
>                                         &err);
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


