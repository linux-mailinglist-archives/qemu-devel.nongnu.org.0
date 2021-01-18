Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F50C2F9C59
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 11:31:36 +0100 (CET)
Received: from localhost ([::1]:34806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Rot-0007q5-He
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 05:31:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l1RnH-0006aG-JO
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 05:29:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l1RnG-0004Ac-48
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 05:29:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610965792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t8mWNt8hJw0hQ9PEvDoNhosqvlo4sZCpXsYV2OEGWUw=;
 b=UNMx7EY3VsnQ6Vo+ZvVMTtcW1vl1HW2+aqiy4qHXYdgNPzaOF5GMtEavvb3CH/74mIG1jl
 COmTE8/v421zTNig+NXQEG4hBs/oM9f8pDL3HeA+aJZ6cJ24Hh1ODRTb8IeNCoJRyTjHUF
 F1jmGVog06n9Dfvvcf4ekQPy2VCaJz0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-8L2zcLudMRaAyXLFejrB4w-1; Mon, 18 Jan 2021 05:29:48 -0500
X-MC-Unique: 8L2zcLudMRaAyXLFejrB4w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EA2918C8C11;
 Mon, 18 Jan 2021 10:29:47 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-75.ams2.redhat.com [10.36.115.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 415CF6F98B;
 Mon, 18 Jan 2021 10:29:46 +0000 (UTC)
Date: Mon, 18 Jan 2021 11:29:44 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/28] qemu-option, keyval, vl: switch -object/-M/-accel
 to keyval parsing
Message-ID: <20210118102944.GB11555@merkur.fritz.box>
References: <20201202090305.4129317-1-pbonzini@redhat.com>
 <de8c073c-471b-8149-1200-8c7f061aae37@redhat.com>
MIME-Version: 1.0
In-Reply-To: <de8c073c-471b-8149-1200-8c7f061aae37@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: imammedo@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.01.2021 um 17:48 hat Paolo Bonzini geschrieben:
> On 02/12/20 10:02, Paolo Bonzini wrote:
> > This series switches -object, -M and -accel from QemuOpts to keyval.
> > Monitor commands device_add and netdev_add are also switched to keyval,
> > though -device and -netdev for now are not.
> > 
> > Along the way, the syntax of keyval and QemuOpts becomes more consistent
> > and support for keyval-based options is added to -readconfig.  -writeconfig
> > instead is removed (see patch 13 for rationale).

> Ping?  It's been over a month (even if with the Christmas vacation).
> 
> Patches 1-2 were already reviewed so I have included them already.  I would
> like at least the next 14 patches to go in as soon as possible. (The rest
> can be routed through maintainer trees or I can post them together with the
> softmmu/vl.c cleanups).

On which commit is this based? It doesn't seem to apply to master (maybe
no surprise), but also not to 5.2.0-rc4, which was the state of master
when this was posted.

Kevin


