Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA243334657
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 19:12:47 +0100 (CET)
Received: from localhost ([::1]:33410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK3KA-00031Z-SX
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 13:12:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lK2uR-0002qC-4G
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:46:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lK2uO-0000il-23
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:46:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615398366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WaSL71Xe8HArUSD+y+W+L/FgsAy2hamt95B2tp6VXXM=;
 b=BBF7kHpdk25KQHmooiMiOD26qq7x0NPdUN/cf6h2c+C14gOpsxnk94xKzgyN4wqVnhAWOP
 Fuvv5+ax+vz5T27glNp7iPHSe1rDFyB7fLrT7+F22p1FgegN15pG10czsnTxDAuEYV/fev
 ZKxyI3wueBn+QNPSn8eIgamQSmovPOA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-3u8AAv1SNzSmfEPb8LsPOQ-1; Wed, 10 Mar 2021 12:46:05 -0500
X-MC-Unique: 3u8AAv1SNzSmfEPb8LsPOQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7FD4801817;
 Wed, 10 Mar 2021 17:46:03 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-29.ams2.redhat.com [10.36.114.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B46A60C66;
 Wed, 10 Mar 2021 17:45:58 +0000 (UTC)
Date: Wed, 10 Mar 2021 18:45:57 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 0/4] vhost-user-blk-test: add vhost-user-blk server tests
Message-ID: <20210310174557.GI6076@merkur.fritz.box>
References: <20210309094106.196911-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210309094106.196911-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Coiby Xu <Coiby.Xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.03.2021 um 10:41 hat Stefan Hajnoczi geschrieben:
> These patches were dropped from Kevin's last block pull request due to a GitLab
> CI failure. The old CentOS 7 and opensuse Leap build images lack
> memfd_create(2) (introduced in Linux around 2014). The vhost-user-blk server
> had a dependency on memfd_create(2) due to VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD
> and qemu-storage-daemon would fail to create a vhost-user-blk export.
> 
> Since we have not thought about or tested VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD
> anyway, disable it for now. It can be re-enabled again later when it's needed
> for reconnection support.

Thanks, applied to the block branch.

Kevin


