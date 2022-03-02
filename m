Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2BF4CA51F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 13:46:25 +0100 (CET)
Received: from localhost ([::1]:46194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPON6-0007d4-Oc
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 07:46:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPOBE-00055a-EU
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:34:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPOB9-0002Lv-Ao
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:34:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646224439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hNSxou9DmwjiYw5NGZ2RW3QBAOKnFimBtn6kHf8tuZo=;
 b=hP03G7xNCFxcczWFFnySmUClJ2A7/Dhy4+bB/1CxPx3sSgfMcw9+Z7bqzK1WMpGAdrQCzN
 8FBRwFg72SRYgEWJYhfGakupdt5SOpwqH4A8+jbg27iix/HGM6RwVGhaFWIraojyHuOxIg
 u47D0Tkw5Brttw9BVyzK2hfmR2CjRmA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-uLusKoIUMlyX4roypDKGRw-1; Wed, 02 Mar 2022 07:33:56 -0500
X-MC-Unique: uLusKoIUMlyX4roypDKGRw-1
Received: by mail-wr1-f72.google.com with SMTP id
 t8-20020adfa2c8000000b001e8f6889404so612145wra.0
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 04:33:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hNSxou9DmwjiYw5NGZ2RW3QBAOKnFimBtn6kHf8tuZo=;
 b=aGmSSKmSkqiDP7zMu5iqkiAcH8AxgEJE/M/ZfTkV0Ni3MVK4SL9BKKL5vk9X12PI4u
 DUPtME8gCDZ07YARuHKDzcEKVe6AF6MvI2wZmE21GOGYovBE2DQzyBX2W3V3LEiobqsa
 hEQ8iCeQI4A6pt57QZXsnMBdzp8t+arL6IX+MpDBloZ7a1nehhM6DVd6qJY9sXcWE8nW
 N9PsU9ZTP1I4j69bseXTn3ByZ1AO1MrwjaEgkshU5KYC4JUlWGDR1BN9+XEYw2pWnmfq
 22A43W6cH5DAPPs1t2QEwMYrjEynx+5pl0TKMOIhvEJ6PD+nI0SBx7pg7QTkjkIn739z
 MCrw==
X-Gm-Message-State: AOAM532blpb2sjnJ9JlWlQhhoJoVvn/odip8bilWjf+i/lTad0fbUx5v
 /NzG+Id7+hCmquMFRipkJw8kZXENCZxkpoYot02cBR7sFpMJ9WmheN0upbFBBzGXhpbMdvJpc7/
 NqbMjZKC9j7eoXRg=
X-Received: by 2002:adf:e98c:0:b0:1f0:2f5c:2e9 with SMTP id
 h12-20020adfe98c000000b001f02f5c02e9mr2074023wrm.356.1646224435508; 
 Wed, 02 Mar 2022 04:33:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhJ3LCu9FJrCU0QYGeAImzTbmuNMEZqDazJox3ulBqfRtCt5IL4msaXE1lD65I2lZKdJhJ1g==
X-Received: by 2002:adf:e98c:0:b0:1f0:2f5c:2e9 with SMTP id
 h12-20020adfe98c000000b001f02f5c02e9mr2073997wrm.356.1646224435229; 
 Wed, 02 Mar 2022 04:33:55 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 s16-20020adfecd0000000b001e7be443a17sm23845292wro.27.2022.03.02.04.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 04:33:54 -0800 (PST)
Date: Wed, 2 Mar 2022 12:33:52 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] migration: Remove load_state_old and
 minimum_version_id_old
Message-ID: <Yh9kMF9TaW1Dae01@work-vm>
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

Queued

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
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


