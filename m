Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9499320176
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 23:48:39 +0100 (CET)
Received: from localhost ([::1]:44806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDEZi-0001Og-Rt
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 17:48:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lDEYb-0000xO-JI
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:47:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lDEYY-0000oT-1e
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:47:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613774843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CiPR5lHFh6P9NfLQ2/1gesua0t/cbRcNILO1ltZgUc0=;
 b=N8WY9pqTwIhWXfq/UGqOaQWp2oJ7ltuvw1rDh5Lp7dfZ0nRbKNxbgbYf/c6fB4sYLUZ0a/
 sKNeFYRhov9y+NDYKjYRH6skBF86HDfkKidgB731tpzks2a+WUa7DLV32nfg/GB6PfqCcR
 SZ67NLEmohcSf0ysa4KOPOOQxA42518=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-5NKe9oTUPcSoEwm1VD1LuA-1; Fri, 19 Feb 2021 17:47:22 -0500
X-MC-Unique: 5NKe9oTUPcSoEwm1VD1LuA-1
Received: by mail-qv1-f70.google.com with SMTP id e9so4114157qvf.21
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 14:47:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=CiPR5lHFh6P9NfLQ2/1gesua0t/cbRcNILO1ltZgUc0=;
 b=OsWzCVqMOzh9XJE17BJaFjotp6M3IYCjd1pABFnFoAcXTbe9HsGfDQ6M5BzOkwzuxu
 2pAbGTzRyS18bKyZAcfg2fpEfO5hoIQQ9/9fyEzO9rVNrdnGhnvTcy3OoSW7rG1XHoDg
 nx5Xxfw1nUhvfSYkZJJN4G0Buvyz0ZK5Oe/5WO49+TeZgHEfX/vphR7ylZZTbYQ4QFWC
 Z5kDlEh/rV18CZnYZYJGU8XPbRWHej9zdFlACtOxKqHbQd2I+kflfOaqTBlN/I3puSdW
 xgh8n1Pu5ErpEpg1ZVEnxWQjZ+Q/IdSPbhxmR199A6rI4fFPIoemug+BCztzmxpunQVi
 yK0Q==
X-Gm-Message-State: AOAM532muetBnh28dvYg+h3YImsVCj6XrceVwDN8obzDEyOT8lnUZz2R
 wtFRxDtrCW1x7UC0Cy+wQeqIVQCNlg0xR75vbgAzAruyicOOi6UEo9F2Pp4fEGX/xQeD4ervFxg
 GlcUBUOwm0TBv6j0=
X-Received: by 2002:a05:620a:9c6:: with SMTP id
 y6mr11937769qky.389.1613774841814; 
 Fri, 19 Feb 2021 14:47:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydM98ZH0bcf/AlJiG6X8IVHVOZqBuQ+auP8PkZR/eyd1VCVp3ddlbG6bxfPfJ0+027x1+UyQ==
X-Received: by 2002:a05:620a:9c6:: with SMTP id
 y6mr11937750qky.389.1613774841587; 
 Fri, 19 Feb 2021 14:47:21 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id x14sm5035883qtq.47.2021.02.19.14.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 14:47:21 -0800 (PST)
Date: Fri, 19 Feb 2021 17:47:19 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
Message-ID: <20210219224719.GN6669@xz-x1>
References: <B2724848-DDA8-442B-A252-E84C56752D7E@redhat.com>
 <3D93AD71-A570-481C-BFE9-0DFA8C30F148@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3D93AD71-A570-481C-BFE9-0DFA8C30F148@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alexander Duyck <alexander.duyck@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Den Lunev <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 19, 2021 at 10:20:42PM +0100, David Hildenbrand wrote:
> > A shiver just went down my spine. Please don‘t just for the sake of creating a snapshot.
> > 
> > (Just imagine you don‘t have a shared zeropage...)
> 
> ... and I just remembered we read all memory either way. Gah.
> 
> I have some patches to make snapshots fly with virtio-mem so exactly that won‘t happen. But they depend on vfio support, so it might take a while.

Sorry I can't really follow.

It'll be great if virtio-mem won't have similar problem with live snapshot
finally.  Is that idea applicable to balloon too, then?

-- 
Peter Xu


