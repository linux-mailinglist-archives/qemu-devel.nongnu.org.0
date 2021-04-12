Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6198E35C363
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 12:11:57 +0200 (CEST)
Received: from localhost ([::1]:35104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVtXv-0000mn-TY
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 06:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lVtWk-0000Ku-Jj
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 06:10:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lVtWg-0004eg-6O
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 06:10:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618222235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GWO8vlWyT31vGKOspiGjCwX9E4b5Tgoca9yRawvAb+A=;
 b=alyzJ3aUL8DNi2z8vqAL6xHZDHCPFIL1B7OpAbYkTjVCsh7Fw9DAM60CuPk6BtLf4wq/1n
 vD4TzWTIQGzcioBEWb+YKiRfpQZQbwv3b33cVh0B+acXcfyDGdCHBtGMko34Zp0C9CJcnf
 BccjziTmCqV2SJXWoJmWlYGhEhtKHj8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-8U2rcaCLPvOviBHL1NzHog-1; Mon, 12 Apr 2021 06:10:33 -0400
X-MC-Unique: 8U2rcaCLPvOviBHL1NzHog-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D05D8030B5;
 Mon, 12 Apr 2021 10:10:32 +0000 (UTC)
Received: from gondolin (ovpn-113-114.ams2.redhat.com [10.36.113.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0826610A8;
 Mon, 12 Apr 2021 10:10:25 +0000 (UTC)
Date: Mon, 12 Apr 2021 12:10:22 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH v4 1/1] docs/devel: Add VFIO device migration documentation
Message-ID: <20210412121022.48a66e07.cohuck@redhat.com>
In-Reply-To: <20210409134346.16490-1-targupta@nvidia.com>
References: <20210409134346.16490-1-targupta@nvidia.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: kevin.tian@intel.com, cjia@nvidia.com, quintela@redhat.com,
 alex.williamson@redhat.com, qemu-devel@nongnu.org, yan.y.zhao@intel.com,
 lushenming@huawei.com, kwankhede@nvidia.com, dnigam@nvidia.com,
 berrange@redhat.com, philmd@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 9 Apr 2021 19:13:46 +0530
Tarun Gupta <targupta@nvidia.com> wrote:

> Document interfaces used for VFIO device migration. Added flow of state changes
> during live migration with VFIO device.
> 
> Co-developed-by: Kirti Wankhede <kwankhede@nvidia.com>

This still needs Kirti's S-o-b as well (i.e. both tags need to be
paired.)

> Signed-off-by: Tarun Gupta <targupta@nvidia.com>
> ---
> Tested by building docs with new vfio-migration.rst file
> 
> v4:
> - Added info about vfio_listener_log_global_[start|stop]
> - Added info about `save_state` callback.
> - Incorporated comments from v3.
> 
> v3:
> - Add introductory line about VM migration in general.
> - Remove occurcences of vfio_pin_pages() to describe pinning.
> - Incorporated comments from v2
> 
> v2:
> - Included the new vfio-migration.rst file in index.rst
> - Updated dirty page tracking section, also added details about
>   'pre-copy-dirty-page-tracking' opt-out option.
> - Incorporated comments around wording of doc.
> 

The change log and the other extra information also need to be followed
by another '---'.

>  MAINTAINERS                   |   1 +
>  docs/devel/index.rst          |   1 +
>  docs/devel/vfio-migration.rst | 150 ++++++++++++++++++++++++++++++++++
>  3 files changed, 152 insertions(+)
>  create mode 100644 docs/devel/vfio-migration.rst

Aside from the meta issues above, the patch looks good to me.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


