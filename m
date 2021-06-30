Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 222213B88FA
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 21:05:14 +0200 (CEST)
Received: from localhost ([::1]:60894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfWL-0001AD-7t
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 15:05:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyfL9-0005zZ-SC
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:53:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyfL5-0005JK-SB
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:53:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625079213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bHaCfBwIo6oWU7eh4Kmu4sh5Xnxxcz31ekRfg4KWnyQ=;
 b=PBNK217C9o6IdtJb8B+iUxmo0aCeAXdQvpjqWcl0voFbRfgqJXZUzHVDK5cnIH1rZjY5ZL
 hqvJJCxgQ1NvIUxX9+MSmKEaO5ooSkPt3wAk3XM13rCNlFlMd03sax/lr8JCFaUQRK0sd+
 kmQNnDPFcSAaOGZFEbRYUq/p727d0zA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-CFd3DhfjNvmXb4TIGYEyIw-1; Wed, 30 Jun 2021 14:53:32 -0400
X-MC-Unique: CFd3DhfjNvmXb4TIGYEyIw-1
Received: by mail-wr1-f69.google.com with SMTP id
 d9-20020adffbc90000b029011a3b249b10so1311607wrs.3
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bHaCfBwIo6oWU7eh4Kmu4sh5Xnxxcz31ekRfg4KWnyQ=;
 b=JsM6YSL6z8GCyMRc41kIpDQafZsWjZxtglQ+d9L8RPU1LiA4e6wJlEhFhoMtcMqzRh
 Dqt8y4u2h1FT8pdmKTNFQoGJxvnYABjYbqB2taZOHQMLoixEN8SaiPOTHnOZzaPBi7iO
 VsEjSzmKPD6yzPGKOKJ0lfKIFQePAlyR2KeBKughzJCHbNetKfZ1gqDks/9qRF/FQmZo
 JufXsYOkLH3kd/PYDxCp+snzz3E1swONODKkHce+yAYjBsyhJCLCzrCbt2QBz9Z7FIin
 wuOi15ZaXzxj4iZPuVAhCg4+i7nHLhcGFoBkTGjl+OgeoQpt+0pdKuKwd30PhTaWq9EP
 wcqA==
X-Gm-Message-State: AOAM532POqSr5RGz2Wu8lx2B/bjcHLuAPSHCgxEtV5uWE9p2/4c/bGHl
 QJbInG5cITntbDCyyFqZPK4EYqMPVyTj/qWfj86joEFGeHDNWQYc2MZ6bVp8ow21wSXpAMvbL6S
 zSsr2jwzbfzk3To4=
X-Received: by 2002:adf:ec4e:: with SMTP id w14mr7932094wrn.372.1625079211316; 
 Wed, 30 Jun 2021 11:53:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGhQ6RqAWk/WEbFpN8i/MzvEUPLYdW+cmd8UsF9xKWNH1AWvU+7rwBCOpSJ59y8/bS93vj+A==
X-Received: by 2002:adf:ec4e:: with SMTP id w14mr7932072wrn.372.1625079211116; 
 Wed, 30 Jun 2021 11:53:31 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id o33sm16505744wms.32.2021.06.30.11.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:53:30 -0700 (PDT)
Date: Wed, 30 Jun 2021 19:53:28 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v7 0/7] virtiofsd: Add support to enable/disable posix acls
Message-ID: <YNy9qKOnEzi3up+R@work-vm>
References: <20210622150852.1507204-1-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210622150852.1507204-1-vgoyal@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: virtio-fs@redhat.com, miklos@szeredi.hu, qemu-devel@nongnu.org,
 lhenriques@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> Hi,
> 
> This is V7 of the patches.
> 
> Changes since V6.
> 
> - Dropped kernel header update patch as somebody else did it.
> - Fixed coding style issues.
> 
> Currently posix ACL support does not work well with virtiofs and bunch
> of tests fail when I run xfstests "./check -g acl".
> 
> This patches series fixes the issues with virtiofs posix acl support
> and provides options to enable/disable posix acl (-o posix_acl/no_posix_acl).
> By default posix_acls are disabled.
> 
> With this patch series applied and virtiofsd running with "-o posix_acl",
> xfstests "./check -g acl" passes.
> 
> Thanks
> Vivek

Queued

> 
> 
> Vivek Goyal (7):
>   virtiofsd: Fix fuse setxattr() API change issue
>   virtiofsd: Fix xattr operations overwriting errno
>   virtiofsd: Add support for extended setxattr
>   virtiofsd: Add umask to seccom allow list
>   virtiofsd: Add capability to change/restore umask
>   virtiofsd: Switch creds, drop FSETID for system.posix_acl_access xattr
>   virtiofsd: Add an option to enable/disable posix acls
> 
>  docs/tools/virtiofsd.rst              |   3 +
>  tools/virtiofsd/fuse_common.h         |  10 ++
>  tools/virtiofsd/fuse_lowlevel.c       |  18 +-
>  tools/virtiofsd/fuse_lowlevel.h       |   3 +-
>  tools/virtiofsd/helper.c              |   1 +
>  tools/virtiofsd/passthrough_ll.c      | 229 ++++++++++++++++++++++++--
>  tools/virtiofsd/passthrough_seccomp.c |   1 +
>  7 files changed, 249 insertions(+), 16 deletions(-)
> 
> -- 
> 2.25.4
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


