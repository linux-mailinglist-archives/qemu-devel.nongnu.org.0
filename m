Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B61DA2B9AE0
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 19:48:23 +0100 (CET)
Received: from localhost ([::1]:38220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfoyk-00035V-QR
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 13:48:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kfox1-0002A1-LJ
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 13:46:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kfoww-0002MF-IK
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 13:46:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605811589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7joNm6js1phdaLyXl+hZiqaSIjT8iLGTfuqgg3mHY9Q=;
 b=PPu5hsz8/ZJ71cDBr4fzjTYsIcz4X8+hmBEyI8ldzGqi5MWnJGzVcfY/4MvxgWDMuDjQtG
 KV+EH2C4PlWrHa+gzvdHzxdnFGZJjHtXJbfQM8fuxk6ZYEb0f+7Vy0nBqW/toREBzP/UCX
 HmBHsNdR8u67JJITIcZ5n5mk2XEcapM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-CQkXVS01N92fXCqtTQcsOQ-1; Thu, 19 Nov 2020 13:46:27 -0500
X-MC-Unique: CQkXVS01N92fXCqtTQcsOQ-1
Received: by mail-qt1-f200.google.com with SMTP id r29so5389863qtu.21
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 10:46:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7joNm6js1phdaLyXl+hZiqaSIjT8iLGTfuqgg3mHY9Q=;
 b=HrIgLsZvywYoVIJft+mFSpVTe9BionrKON3hMiWYrtk5JbW8eO3D1vYtuhKVUeGRCA
 A+CEHbTpcGyUoEs6ITJiIFlQzYBBKmpThPDeD/lTM3hqsbiv+FCmZg66MW0rH+1raDos
 iogKCdfthNFQdzPKUCy8TblLegnMWG4VSo0pGO1cGM12MjImZ4im32jFYqyFqu+HUyhh
 a1qdPJqbNJjQnReWDBU9VT3eRz64wYGtEmNid9MV0SQkT8u6Iv0Arpc/4fPEpiVweWd6
 95mh1X85mpSinB6kIi7DPwq1sO3kjXBQXn1s+vCEUc2mY24R5RWyDxziB5XdnVgtWBB4
 LpUA==
X-Gm-Message-State: AOAM532mg9wq8ubculMN3ybd77+H5+sj3MNG4ubDVdWiwo7AzrkP5Z0m
 ymGwjh9MgzkmogKYN4S+s1RSkuADjRLMwroCmTB2wzL3Hxg8veZT0aL6zk4H/GhxOXhxEP6TsJO
 3C/PIlENHVEor5bI=
X-Received: by 2002:ae9:ef94:: with SMTP id d142mr12154995qkg.69.1605811586977; 
 Thu, 19 Nov 2020 10:46:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyh6l/Xn++CFoOrx39Pv3EEazXqcWv6zNH2+INo7PTaqYbI7RGqA6QCrq1aMmbR/mxx3zq7mw==
X-Received: by 2002:ae9:ef94:: with SMTP id d142mr12154966qkg.69.1605811586708; 
 Thu, 19 Nov 2020 10:46:26 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-196.dsl.bell.ca. [174.93.89.196])
 by smtp.gmail.com with ESMTPSA id y192sm509519qkb.12.2020.11.19.10.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 10:46:26 -0800 (PST)
Date: Thu, 19 Nov 2020 13:46:24 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v3 5/7] implementation of vm_start() BH
Message-ID: <20201119184624.GD6538@xz-x1>
References: <20201119125940.20017-1-andrey.gruzdev@virtuozzo.com>
 <20201119125940.20017-6-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201119125940.20017-6-andrey.gruzdev@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 19, 2020 at 03:59:38PM +0300, Andrey Gruzdev wrote:
> To avoid saving updated versions of memory pages we need
> to start tracking RAM writes before we resume operation of
> vCPUs. This sequence is especially critical for virtio device
> backends whos VQs are mapped to main memory and accessed
> directly not using MMIO callbacks.
> 
> One problem is that vm_start() routine makes calls state
> change notifier callbacks directly from itself. Virtio drivers
> do some stuff with syncing/flusing VQs in its notifier routines.
> Since we poll UFFD and process faults on the same thread, that
> leads to the situation when the thread locks in vm_start()
> if we try to call it from the migration thread.

There's a nice comment in previous patch about this before the bottom half
created, thanks, that's helpful.  Though IMHO this patch can directly be
squashed into previous one, since it's confusing with the comment there but
without doing anything about it.

-- 
Peter Xu


