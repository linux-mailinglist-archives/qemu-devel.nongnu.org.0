Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EA74B7494
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 20:13:36 +0100 (CET)
Received: from localhost ([::1]:45980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK3Ga-0000J3-1C
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 14:13:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nK2qT-0002bc-A4
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 13:46:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nK2qO-0008Jj-H6
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 13:46:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644950791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FHV/sLtgUA1mNI2u73+9pCVCCUhsO8rTfrYIqkKO90k=;
 b=MjaTqbGK3tGGYcOfMW0v98jG2dZo4kgstemJ7itkJOPJS5OgCzCdwOqNms3y/vgMSERR/G
 dlkFWHJ2pYD9NwTRRAymwSJRO3QjtV5EbtrHSgUaD9vUtcE/OXCjfBIpQdOHCEv+yNOqPt
 o4jhU1QXs0t8fwGaORvK4Bqn0DGjmoc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-ZVaEdzOON4GzgBO3X0FB9w-1; Tue, 15 Feb 2022 13:46:29 -0500
X-MC-Unique: ZVaEdzOON4GzgBO3X0FB9w-1
Received: by mail-wr1-f70.google.com with SMTP id
 m8-20020adfa3c8000000b001e3381fdf45so8687743wrb.4
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 10:46:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FHV/sLtgUA1mNI2u73+9pCVCCUhsO8rTfrYIqkKO90k=;
 b=sXZ0824BYUDjYR9GiFpJesEu5B/pJWHv0kTsHTlkpdCLuZo6xSnT31+S696+Vtm2e4
 RMzAR0Fjs+CAGwapbj4FhgqL8dACP7iWMwMYwatDIZsEk47T2tN0yVbElt4mjA0MPLV/
 QUZx9hULcpK7pvFpDqzSjYcvpcRiy9hv1iDcsN/S1/E0SFwHzqP3qLdOahYtlnFl11CP
 4U7g4CVslpGqpgEJmX+K6AK/DSiL8u2ZwVQX9Uiau1ZM+M+q1azXM5+GmNyx+yw/bCi+
 /b/NK1sxYIO8TTBf8okuK0gSC+aUJ+2HQPaLnlPMVuP+bC1PsLTfHgAkeztpKutj8CGi
 4EyA==
X-Gm-Message-State: AOAM533qvOgTuXYTY9sK10te4ZlFIns9N5lEtqCz5IEhFF1jdvac5eXz
 9Up50dI7gFZTujxXt4j1nADL8EtQSP2ms42J1KXy3yXbcPO+sjVPfrZX1E6ScPL8UCzJs7Yzv3a
 QMMFK/YgoWJb20tM=
X-Received: by 2002:a05:6000:1885:: with SMTP id
 a5mr251572wri.193.1644950788464; 
 Tue, 15 Feb 2022 10:46:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0a3MPm4rS/zPdrOIXQUojCNJnj2DPMVxWKAJC4ldQR3oGktBCh1JXdbdg+1/yEa2uUTjGXg==
X-Received: by 2002:a05:6000:1885:: with SMTP id
 a5mr251546wri.193.1644950788197; 
 Tue, 15 Feb 2022 10:46:28 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id r11sm24465488wrt.28.2022.02.15.10.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 10:46:27 -0800 (PST)
Date: Tue, 15 Feb 2022 18:46:25 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] migration: Remove load_state_old and
 minimum_version_id_old
Message-ID: <Ygv1AchI+zEem8pB@work-vm>
References: <20220215175705.3846411-1-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20220215175705.3846411-1-peter.maydell@linaro.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Francisco Iglesias <francisco.iglesias@xilinx.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> There are no longer any VMStateDescription structs in the tree which
> use the load_state_old support for custom handling of incoming
> migration from very old QEMU.  Remove the mechanism entirely.
> 
> This includes removing one stray useless setting of
> minimum_version_id_old in a VMStateDescription with no load_state_old
> function, which crept in after the global weeding-out of them in
> commit 17e313406126.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Thanks!

> ---
>  docs/devel/migration.rst    | 10 ++--------
>  include/migration/vmstate.h |  2 --
>  hw/ssi/xlnx-versal-ospi.c   |  1 -
>  migration/vmstate.c         |  6 ------
>  4 files changed, 2 insertions(+), 17 deletions(-)
> 
> diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
> index 24012534827..3e9656d8e0b 100644
> --- a/docs/devel/migration.rst
> +++ b/docs/devel/migration.rst
> @@ -389,19 +389,13 @@ Each version is associated with a series of fields saved.  The ``save_state`` al
>  the state as the newer version.  But ``load_state`` sometimes is able to
>  load state from an older version.
>  
> -You can see that there are several version fields:
> +You can see that there are two version fields:
>  
>  - ``version_id``: the maximum version_id supported by VMState for that device.
>  - ``minimum_version_id``: the minimum version_id that VMState is able to understand
>    for that device.
> -- ``minimum_version_id_old``: For devices that were not able to port to vmstate, we can
> -  assign a function that knows how to read this old state. This field is
> -  ignored if there is no ``load_state_old`` handler.
>  
> -VMState is able to read versions from minimum_version_id to
> -version_id.  And the function ``load_state_old()`` (if present) is able to
> -load state from minimum_version_id_old to minimum_version_id.  This
> -function is deprecated and will be removed when no more users are left.
> +VMState is able to read versions from minimum_version_id to version_id.
>  
>  There are *_V* forms of many ``VMSTATE_`` macros to load fields for version dependent fields,
>  e.g.
> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> index 017c03675ca..ad24aa19345 100644
> --- a/include/migration/vmstate.h
> +++ b/include/migration/vmstate.h
> @@ -181,9 +181,7 @@ struct VMStateDescription {
>      int unmigratable;
>      int version_id;
>      int minimum_version_id;
> -    int minimum_version_id_old;
>      MigrationPriority priority;
> -    LoadStateHandler *load_state_old;
>      int (*pre_load)(void *opaque);
>      int (*post_load)(void *opaque, int version_id);
>      int (*pre_save)(void *opaque);
> diff --git a/hw/ssi/xlnx-versal-ospi.c b/hw/ssi/xlnx-versal-ospi.c
> index 7ecd148fdf3..c762e0b3679 100644
> --- a/hw/ssi/xlnx-versal-ospi.c
> +++ b/hw/ssi/xlnx-versal-ospi.c
> @@ -1800,7 +1800,6 @@ static const VMStateDescription vmstate_xlnx_versal_ospi = {
>      .name = TYPE_XILINX_VERSAL_OSPI,
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .fields = (VMStateField[]) {
>          VMSTATE_FIFO8(rx_fifo, XlnxVersalOspi),
>          VMSTATE_FIFO8(tx_fifo, XlnxVersalOspi),
> diff --git a/migration/vmstate.c b/migration/vmstate.c
> index 05f87cdddc5..36ae8b9e191 100644
> --- a/migration/vmstate.c
> +++ b/migration/vmstate.c
> @@ -90,12 +90,6 @@ int vmstate_load_state(QEMUFile *f, const VMStateDescription *vmsd,
>          return -EINVAL;
>      }
>      if  (version_id < vmsd->minimum_version_id) {
> -        if (vmsd->load_state_old &&
> -            version_id >= vmsd->minimum_version_id_old) {
> -            ret = vmsd->load_state_old(f, opaque, version_id);
> -            trace_vmstate_load_state_end(vmsd->name, "old path", ret);
> -            return ret;
> -        }
>          error_report("%s: incoming version_id %d is too old "
>                       "for local minimum version_id  %d",
>                       vmsd->name, version_id, vmsd->minimum_version_id);
> -- 
> 2.25.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


