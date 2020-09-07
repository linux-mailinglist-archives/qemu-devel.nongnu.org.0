Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F7825F99D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 13:37:12 +0200 (CEST)
Received: from localhost ([::1]:52588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFFSR-0007lc-Sy
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 07:37:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFFOm-0000u3-3G
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 07:33:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFFOi-0002X2-1v
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 07:33:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599478399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gynm4sTvzJq3aoAsUsICkH2tXREOWaPOemU9GZdAlkw=;
 b=ckV12XB5IPlVDVAhQYbBdCT0QfXmemCzJ/HFfAGVRAXCeYRybBg7Ef2NHnfuAPZSGkIL26
 PYg9RjNVHf++mWtPNDNzpUfMM3DQv7DxXC0IkWoeVu2AgzbWxkixuHPUeSB9XXLcbUsiwf
 wishi21EuIFxmGJc3DxUM51NPb9yI54=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-yBMNOylIOmihkjamya0yXw-1; Mon, 07 Sep 2020 07:33:16 -0400
X-MC-Unique: yBMNOylIOmihkjamya0yXw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B367C8015B0;
 Mon,  7 Sep 2020 11:33:14 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-154.ams2.redhat.com [10.36.114.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 16B4A5C1BB;
 Mon,  7 Sep 2020 11:33:10 +0000 (UTC)
Date: Mon, 7 Sep 2020 13:33:08 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: add Stefan Hajnoczi as block/nvme.c
 maintainer
Message-ID: <20200907113308.GC5615@linux.fritz.box>
References: <20200907111632.90499-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200907111632.90499-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 05:27:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.09.2020 um 13:16 hat Stefan Hajnoczi geschrieben:
> Development of the userspace NVMe block driver picked up again recently.
> After talking with Fam I am stepping up as block/nvme.c maintainer.
> Patches will be merged through my 'block' tree.
> 
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Klaus Jensen <k.jensen@samsung.com>
> Cc: Fam Zheng <fam@euphon.net>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Acked-by: Kevin Wolf <kwolf@redhat.com>


