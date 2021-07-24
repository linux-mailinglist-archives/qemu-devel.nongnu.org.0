Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CE73D43FB
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Jul 2021 02:31:52 +0200 (CEST)
Received: from localhost ([::1]:46084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m75a3-0006Y0-Al
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 20:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m75Z8-0005rk-42
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 20:30:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m75Z4-0006de-6n
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 20:30:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627086648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vmZsvGmb699rKTx3oeMkbRqiRZipB6epa+q8jrZOjbI=;
 b=SaHnytCdPtnmj6GFxC5s+vPvZdRYloUyX17dQCrSQTgneyzzasSFDBKc8TNKv9MtzosYhg
 3OWesvHxjlShTuPDc0UQWxyyDRhR7TFwmojy5vIxnT0DPwD4lS1u1SSKycbkNSkNkoPWYi
 rGntndWzruQ9TS9HnFxabYhEBBE5wfM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-4EJpUwPpNyiAhKcoRufJYw-1; Fri, 23 Jul 2021 20:30:46 -0400
X-MC-Unique: 4EJpUwPpNyiAhKcoRufJYw-1
Received: by mail-wr1-f72.google.com with SMTP id
 u26-20020adfb21a0000b029013e2b4a9d1eso1547542wra.4
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 17:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vmZsvGmb699rKTx3oeMkbRqiRZipB6epa+q8jrZOjbI=;
 b=e4uVrYuXJjK/0uWKaMD4ByhSRrKeC1+IsRaQbdbwWhu8t8VMsNmYKHLSdGULYv3uX8
 eRdLxUwvVDC2gcAlCpWMZEhz0jy0zoVGp6l++Q1uz53qlJ/iGvzeoDrUbk9eGnZaKIab
 5Y8HLnm+ify0Vzy19JcdyuvSOKqLBxAWgFlS/eRS/uPHcUoiWi62Q4Jl5F2UR5gYLHj+
 1ILV6+9S4hFMJmRwubYCeBwHmh+MZaOPfORfRZQmWqbAUgVkyOC5xwZA9o7dYiLIiMYe
 BKj+iNZ+M+dzRv+yV54q5pX1PA0aV5eqNkcNZj2OlbG2LuW9NugvwMoKAgec7kS9/z9j
 EoaA==
X-Gm-Message-State: AOAM530ZQsITXnkrYOHIm2lmWtocyQ8ukjDIt647WEiBMqYE/0O0oc9m
 riddLGKW9w4e6B5HSxrmh/W3NwF2tVK0aho8+cyBjcN84027FdfMI9Waqq0peBrPm8MkV5nK8GB
 J6X6RP0BwiImZ9is=
X-Received: by 2002:a1c:7314:: with SMTP id d20mr6535808wmb.167.1627086645756; 
 Fri, 23 Jul 2021 17:30:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8fyE+HZN5BBYs9QpbZ2knIjNTWI+LAu37PCxpP6N95cuVZ1MwUizdEA0iazCLZIkAuRAdNw==
X-Received: by 2002:a1c:7314:: with SMTP id d20mr6535786wmb.167.1627086645532; 
 Fri, 23 Jul 2021 17:30:45 -0700 (PDT)
Received: from redhat.com ([2.55.16.196])
 by smtp.gmail.com with ESMTPSA id f15sm6329897wmj.15.2021.07.23.17.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 17:30:44 -0700 (PDT)
Date: Fri, 23 Jul 2021 20:30:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 00/16] Various error handling fixes and cleanups
Message-ID: <20210723203023-mutt-send-email-mst@kernel.org>
References: <20210720125408.387910-1-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210720125408.387910-1-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Jagannathan Raman <jag.raman@oracle.com>, Juan Quintela <quintela@redhat.com>,
 Kamil Rytarowski <kamil@netbsd.org>, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Aravinda Prasad <arawinda.p@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Cornelia Huck <cornelia.huck@de.ibm.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 20, 2021 at 02:53:52PM +0200, Markus Armbruster wrote:
> I doubt the fixes are 6.1 material at this late stage.  If you
> disagree, let me know.
> 
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Aravinda Prasad <arawinda.p@gmail.com>
> Cc: Cornelia Huck <cornelia.huck@de.ibm.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Jagannathan Raman <jag.raman@oracle.com>
> Cc: John G Johnson <john.g.johnson@oracle.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: Kamil Rytarowski <kamil@netbsd.org>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Kirti Wankhede <kwankhede@nvidia.com>
> Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
> Cc: Marcelo Tosatti <mtosatti@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Reinoud Zandijk <reinoud@netbsd.org>
> Cc: Sergio Lopez <slp@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Sunil Muthuswamy <sunilmut@microsoft.com>
> Cc: Thomas Huth <thuth@redhat.com>


Acked-by: Michael S. Tsirkin <mst@redhat.com>

agree it's not 6.1 material

> Markus Armbruster (16):
>   error: Use error_fatal to simplify obvious fatal errors (again)
>   spapr: Plug memory leak when we can't add a migration blocker
>   spapr: Explain purpose of ->fwnmi_migration_blocker more clearly
>   multi-process: Fix pci_proxy_dev_realize() error handling
>   vhost-scsi: Plug memory leak on migrate_add_blocker() failure
>   i386: Never free migration blocker objects instead of sometimes
>   vfio: Avoid error_propagate() after migrate_add_blocker()
>   whpx nvmm: Drop useless migrate_del_blocker()
>   migration: Unify failure check for migrate_add_blocker()
>   migration: Handle migration_incoming_setup() errors consistently
>   microvm: Drop dead error handling in microvm_machine_state_init()
>   vhost: Clean up how VhostOpts method vhost_get_config() fails
>   vhost: Clean up how VhostOpts method vhost_backend_init() fails
>   Remove superfluous ERRP_GUARD()
>   vl: Clean up -smp error handling
>   vl: Don't continue after -smp help.
> 
>  backends/tpm/tpm_emulator.c |  3 +--
>  hw/display/qxl.c            |  8 ++++----
>  hw/i386/microvm.c           |  5 -----
>  hw/ppc/spapr_events.c       | 20 ++++++++++----------
>  hw/remote/mpqemu-link.c     |  3 ---
>  hw/remote/proxy.c           | 10 +++++++++-
>  hw/s390x/ipl.c              |  6 +-----
>  hw/scsi/vhost-scsi.c        |  4 ++--
>  hw/vfio/migration.c         |  6 ++----
>  hw/virtio/vhost-user.c      |  8 ++++++++
>  hw/virtio/vhost.c           | 16 +++-------------
>  migration/migration.c       | 34 ++++++++++------------------------
>  qemu-img.c                  |  6 +-----
>  qemu-io.c                   |  6 +-----
>  qemu-nbd.c                  |  5 +----
>  qga/commands-posix-ssh.c    | 17 -----------------
>  qga/commands-win32.c        |  1 -
>  scsi/qemu-pr-helper.c       | 11 +++--------
>  softmmu/vl.c                | 19 +++++++------------
>  target/i386/kvm/kvm.c       |  9 +++------
>  target/i386/nvmm/nvmm-all.c |  4 +---
>  target/i386/sev.c           |  8 +-------
>  target/i386/whpx/whpx-all.c |  4 +---
>  ui/console.c                |  7 ++-----
>  ui/spice-core.c             |  7 +------
>  25 files changed, 72 insertions(+), 155 deletions(-)
> 
> -- 
> 2.31.1


