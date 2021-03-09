Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E396D332C55
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:41:51 +0100 (CET)
Received: from localhost ([::1]:41604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJfQc-00007Q-U7
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:41:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJf4L-00050r-RX
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:18:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJf4G-00026G-QQ
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:18:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615306722;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=UetN0+Mk8LpDWUxA7VROfGtyoeaYED9KNJwtFtMdRz4=;
 b=Dn4fJDYdEY7hSQFU2pVaia2q0waOEjU0Fw3Yi/f+VJvXjKSfvImssSdJgh+wGzgrbkBlFG
 UfkfJZfDRPPC17rPdcSyKDGc7au/PbkWbxExxJVS8c+JKYM2UuhEbHH8P0oxZrPLENbu4+
 2RD1mnUZy4diW3y+BvHhaMGax4tuGcw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-Sm4K4owbOemEbOi1FjJyOQ-1; Tue, 09 Mar 2021 11:18:40 -0500
X-MC-Unique: Sm4K4owbOemEbOi1FjJyOQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FDE71B18BC3;
 Tue,  9 Mar 2021 16:18:39 +0000 (UTC)
Received: from redhat.com (ovpn-114-154.ams2.redhat.com [10.36.114.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4105A614FD;
 Tue,  9 Mar 2021 16:18:31 +0000 (UTC)
Date: Tue, 9 Mar 2021 16:18:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 4/4] blockdev: Drop deprecated bogus -drive interface
 type
Message-ID: <YEef1F9vZzLGAO6+@redhat.com>
References: <20210309161214.1402527-1-armbru@redhat.com>
 <20210309161214.1402527-5-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210309161214.1402527-5-armbru@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 09, 2021 at 05:12:13PM +0100, Markus Armbruster wrote:
> Drop the crap deprecated in commit a1b40bda08 "blockdev: Deprecate
> -drive with bogus interface type" (v5.1.0).
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  docs/system/deprecated.rst       |  7 ------
>  docs/system/removed-features.rst |  7 ++++++
>  include/sysemu/blockdev.h        |  1 -
>  blockdev.c                       | 37 +++++++++++++-------------------
>  softmmu/vl.c                     |  8 +------
>  5 files changed, 23 insertions(+), 37 deletions(-)
> 
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 601e9647a5..664ed60e9f 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -94,13 +94,6 @@ QEMU 5.1 has three options:
>        to the user to load all the images they need.
>   3. ``-bios <file>`` - Tells QEMU to load the specified file as the firmwrae.
>  
> -``-drive`` with bogus interface type (since 5.1)
> -''''''''''''''''''''''''''''''''''''''''''''''''
> -
> -Drives with interface types other than ``if=none`` are for onboard
> -devices.  It is possible to use drives the board doesn't pick up with
> --device.  This usage is now deprecated.  Use ``if=none`` instead.
> -
>  Short-form boolean options (since 6.0)
>  ''''''''''''''''''''''''''''''''''''''
>  
> diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
> index 77e7ba1339..e6d2fbe798 100644
> --- a/docs/system/removed-features.rst
> +++ b/docs/system/removed-features.rst
> @@ -87,6 +87,13 @@ becomes
>      -device isa-fdc,...
>      -device floppy,unit=1,drive=...
>  
> +``-drive`` with bogus interface type (removed in 6.0)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +Drives with interface types other than ``if=none`` are for onboard
> +devices.  Drives the board doesn't pick up can no longer be used with
> +-device.  Use ``if=none`` instead.
> +
>  QEMU Machine Protocol (QMP) commands
>  ------------------------------------
>  
> diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
> index 3b5fcda08d..32c2d6023c 100644
> --- a/include/sysemu/blockdev.h
> +++ b/include/sysemu/blockdev.h
> @@ -35,7 +35,6 @@ struct DriveInfo {
>      bool is_default;            /* Added by default_drive() ?  */
>      int media_cd;
>      QemuOpts *opts;
> -    bool claimed_by_board;
>      QTAILQ_ENTRY(DriveInfo) next;
>  };
>  
> diff --git a/blockdev.c b/blockdev.c
> index cd438e60e3..2e01889cff 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -240,19 +240,10 @@ DriveInfo *drive_get(BlockInterfaceType type, int bus, int unit)
>      return NULL;
>  }
>  
> -void drive_mark_claimed_by_board(void)
> -{
> -    BlockBackend *blk;
> -    DriveInfo *dinfo;
> -
> -    for (blk = blk_next(NULL); blk; blk = blk_next(blk)) {
> -        dinfo = blk_legacy_dinfo(blk);
> -        if (dinfo && blk_get_attached_dev(blk)) {
> -            dinfo->claimed_by_board = true;
> -        }
> -    }
> -}
> -
> +/*
> + * Check board claimed all -drive that are meant to be claimed.
> + * Fatal error if any remain unclaimed.
> + */
>  void drive_check_orphaned(void)
>  {
>      BlockBackend *blk;
> @@ -262,7 +253,17 @@ void drive_check_orphaned(void)
>  
>      for (blk = blk_next(NULL); blk; blk = blk_next(blk)) {
>          dinfo = blk_legacy_dinfo(blk);
> -        if (dinfo->is_default || dinfo->type == IF_NONE) {
> +        /*
> +         * Ignore default drives, because we create certain default
> +         * drives unconditionally, then leave them unclaimed.  Not the
> +         * users fault.
> +         * Ignore IF_VIRTIO, because it gets desugared into -device,
> +         * so we can leave failing to -device.
> +         * Ignore IF_NONE, because leaving unclaimed IF_NONE remains
> +         * available for device_add is a feature.
> +         */
> +        if (dinfo->is_default || dinfo->type == IF_VIRTIO
> +            || dinfo->type == IF_NONE) {
>              continue;
>          }
>          if (!blk_get_attached_dev(blk)) {
> @@ -273,14 +274,6 @@ void drive_check_orphaned(void)
>                           if_name[dinfo->type], dinfo->bus, dinfo->unit);
>              loc_pop(&loc);
>              orphans = true;
> -            continue;
> -        }
> -        if (!dinfo->claimed_by_board && dinfo->type != IF_VIRTIO) {
> -            loc_push_none(&loc);
> -            qemu_opts_loc_restore(dinfo->opts);
> -            warn_report("bogus if=%s is deprecated, use if=none",
> -                        if_name[dinfo->type]);
> -            loc_pop(&loc);
>          }
>      }
>  
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index ff488ea3e7..7453611152 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2460,13 +2460,7 @@ static void qemu_init_board(void)
>      /* From here on we enter MACHINE_PHASE_INITIALIZED.  */
>      machine_run_board_init(current_machine);
>  
> -    /*
> -     * TODO To drop support for deprecated bogus if=..., move
> -     * drive_check_orphaned() here, replacing this call.  Also drop
> -     * its deprecation warning, along with DriveInfo member
> -     * @claimed_by_board.
> -     */
> -    drive_mark_claimed_by_board();
> +    drive_check_orphaned();

This method is already called by qemu_machine_creation_done(), which is
invoked shortly after this qemu_init_board() is run.

So either this added instance, or the later call to drive_check_orphaned
feels redundant

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


