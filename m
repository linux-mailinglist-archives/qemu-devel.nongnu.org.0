Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 411222CBD16
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 13:36:28 +0100 (CET)
Received: from localhost ([::1]:39808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkRMx-00068O-7R
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 07:36:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kkRLE-00059C-Td
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 07:34:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kkRLD-0001Pu-Et
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 07:34:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606912478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=j1RsvDTfvW7XhvKVAysckyTXeyjRBPkT9osexr46vTY=;
 b=GR3Kk6YT6pOuHVDKI3nw8hSdnMNHXwEb7bm0OUDp6cB90KIQVK2FkzRARrir+II+gpGPEF
 yJFNvu6cqZmBGQwCq4ePFYE+trNlq7LpNTs8fxuOggDBQvEBpSELaVwjmC1UeGEyC2cKM1
 fK9t6laaMPjdfpEW5a9/Zr01e0ekq5I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-m8goUnO_Og2pl5TuGTIxdA-1; Wed, 02 Dec 2020 07:34:36 -0500
X-MC-Unique: m8goUnO_Og2pl5TuGTIxdA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05FDC8797EB
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 12:34:36 +0000 (UTC)
Received: from work-vm (unknown [10.33.36.90])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4AFE5C3E9;
 Wed,  2 Dec 2020 12:34:12 +0000 (UTC)
Date: Wed, 2 Dec 2020 12:34:10 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: virtio-fs@redhat.com, slp@redhat.com
Subject: virtiofsd-rs: A rust virtiofs daemon
Message-ID: <20201202123410.GD3226@work-vm>
MIME-Version: 1.0
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,
  Sergio has been working on virtiofsd-rs, a virtiofs daemon
written in rust, and which can be found at:

  https://gitlab.com/virtio-fs/virtiofsd-rs

It started life originally as part of the crosvm project, got
ported to vhost-user as part of the Cloud Hypervisor project, and
has now been split out.

While the C version of virtiofsd isn't going away for now, the hope
is to stabilise virtiofsd-rs, add some missing features and start
preferentially adding new features and new work onto the Rust version
rather than the C version.

So please try it, and let the list (and Sergio!) know how you get on.

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


