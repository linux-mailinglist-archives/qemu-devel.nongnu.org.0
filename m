Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4703D5CE9
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 17:25:33 +0200 (CEST)
Received: from localhost ([::1]:34614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m82Tz-0001Id-Uw
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 11:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m82Su-0000UI-1X
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:24:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m82Sr-0008Qw-9X
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:24:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627313060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5IL5MBsZDQNj4CaS/eB4mdp4fhVyrzxUvnFfiwkOP5I=;
 b=bt/JbGEzCawmpmRtSiZnqOguHWaNRu2+Ga6G1wirgQrFiJl0TwS9/EHN54rpbMOWXllD3S
 9IYYBga6YCkrLWqRGB4SoBc0eLqIrX9i5sV445P+JA1idAx37rZqHNDvStjOBavU1Eji7S
 b3X0QjV/BmFdNFtCh6WPClq+ujhxWqo=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-ee6cpxFiPPSjO_cLmYqfCw-1; Mon, 26 Jul 2021 11:24:19 -0400
X-MC-Unique: ee6cpxFiPPSjO_cLmYqfCw-1
Received: by mail-qk1-f197.google.com with SMTP id
 s186-20020a3790c30000b02903b9ade0af31so9313634qkd.1
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 08:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=5IL5MBsZDQNj4CaS/eB4mdp4fhVyrzxUvnFfiwkOP5I=;
 b=XQSzVVMs+7M2dFl5wcEYstriqhfmKLET5ghPUUFckDorskoI4I9fGKp64loSE+ns97
 iMXEIXj0OirlmoGV2ZvE/mNlH10AXgv3Jh3GABjxT0pA1CKPuxXfmDEpPdDmzetiJrah
 8JcPBqoJqcdr825U/bPOCoAlQJ25ujmbpCDa+6+o5EnLlKi6O4TLY302o+gs9cvLUGKi
 qLAtas6UQwzp8/uLOnH4EfG/TEIebN5WZWNTibU63DJYrYRyIbx93khdEsKb4AC22lDa
 7TZ0OXObf2n23u4mVEzSziKrTSybOYy83gtmGtdBDl9xYT5ShPXE89K2aaq/FH2eka+l
 jM8g==
X-Gm-Message-State: AOAM532ggw2HT+mEkiiTup1WP/UH0BrHxAhUwUuiSlYcjwjf8pwyoE8B
 B4TbktA4c6KvmaJQ3W1e1aquvVWs/ueyYT+XzyX+uigTDrxKUnnGnMwjGY+Jlp2p6mOtYrkCAP2
 775V1ctFDVMMjqG4=
X-Received: by 2002:a05:622a:1392:: with SMTP id
 o18mr15524784qtk.117.1627313058641; 
 Mon, 26 Jul 2021 08:24:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx57yXz7cuvO00ewwgCtQEaTQJTFC+7OxL9RTPb+cq+Is9C1Z6d+MiyV898T/SUx73P4bjtIw==
X-Received: by 2002:a05:622a:1392:: with SMTP id
 o18mr15524756qtk.117.1627313058381; 
 Mon, 26 Jul 2021 08:24:18 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id i123sm158429qkf.60.2021.07.26.08.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 08:24:17 -0700 (PDT)
Date: Mon, 26 Jul 2021 11:24:15 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH resend v2 5/5] softmmu/memory_mapping: optimize for
 RamDiscardManager sections
Message-ID: <YP7Tn34cI156XiI+@t490s>
References: <20210720130304.26323-1-david@redhat.com>
 <20210720130304.26323-6-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210720130304.26323-6-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 20, 2021 at 03:03:04PM +0200, David Hildenbrand wrote:
> virtio-mem logically plugs/unplugs memory within a sparse memory region
> and notifies via the RamDiscardManager interface when parts become
> plugged (populated) or unplugged (discarded).
> 
> Currently, we end up (via the two users)
> 1) zeroing all logically unplugged/discarded memory during TPM resets.
> 2) reading all logically unplugged/discarded memory when dumping, to
>    figure out the content is zero.
> 
> 1) is always bad, because we assume unplugged memory stays discarded
>    (and is already implicitly zero).
> 2) isn't that bad with anonymous memory, we end up reading the zero
>    page (slow and unnecessary, though). However, once we use some
>    file-backed memory (future use case), even reading will populate memory.
> 
> Let's cut out all parts marked as not-populated (discarded) via the
> RamDiscardManager. As virtio-mem is the single user, this now means that
> logically unplugged memory ranges will no longer be included in the
> dump, which results in smaller dump files and faster dumping.
> 
> virtio-mem has a minimum granularity of 1 MiB (and the default is usually
> 2 MiB). Theoretically, we can see quite some fragmentation, in practice
> we won't have it completely fragmented in 1 MiB pieces. Still, we might
> end up with many physical ranges.
> 
> Both, the ELF format and kdump seem to be ready to support many
> individual ranges (e.g., for ELF it seems to be UINT32_MAX, kdump has a
> linear bitmap).
> 
> Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Claudio Fontana <cfontana@suse.de>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: "Alex Bennée" <alex.bennee@linaro.org>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Laurent Vivier <lvivier@redhat.com>
> Cc: Stefan Berger <stefanb@linux.ibm.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


