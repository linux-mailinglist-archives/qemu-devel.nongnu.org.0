Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7434B524A24
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 12:19:46 +0200 (CEST)
Received: from localhost ([::1]:51066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np5v7-00017G-IY
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 06:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1np5Xp-0003sw-Gh
 for qemu-devel@nongnu.org; Thu, 12 May 2022 05:55:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1np5Xm-0002ww-Ak
 for qemu-devel@nongnu.org; Thu, 12 May 2022 05:55:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652349336;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Suly+AhOLSwL62JZZv4D1I4Li10rb2Uta4ldrrSF51M=;
 b=LiR+8UEC+CSDRdAGz1vOI9bks51xDah7Ndl7C+meDIIskexE8b1V7X6+WSdvjffpgwiQbU
 iQ/y3tnvcQ0/O9f58S65MVvVFtSjQuyj4cJvb+crsAkYtVCNBPxdbHoHjlB8NNIMU83MgO
 ZiBslKJNG8W1j9T9SFFr3FL9FEaHnUU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-GK2AF1lRPLa7_7y1_15qng-1; Thu, 12 May 2022 05:55:33 -0400
X-MC-Unique: GK2AF1lRPLa7_7y1_15qng-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2475710726B5;
 Thu, 12 May 2022 09:55:24 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A694E1542A82;
 Thu, 12 May 2022 09:55:21 +0000 (UTC)
Date: Thu, 12 May 2022 10:55:18 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: mst@redhat.com, arei.gonglei@huawei.com, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org,
 linux-crypto@vger.kernel.org, helei.sig11@bytedance.com,
 jasowang@redhat.com, cohuck@redhat.com
Subject: Re: [PATCH v5 1/9] virtio-crypto: header update
Message-ID: <YnzZhjwbD6PaKx+2@redhat.com>
References: <20220428135943.178254-1-pizhenwei@bytedance.com>
 <20220428135943.178254-2-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220428135943.178254-2-pizhenwei@bytedance.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 28, 2022 at 09:59:35PM +0800, zhenwei pi wrote:
> Update header from linux, support akcipher service.
> 
> Reviewed-by: Gonglei <arei.gonglei@huawei.com>
> Signed-off-by: lei he <helei.sig11@bytedance.com>
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  .../standard-headers/linux/virtio_crypto.h    | 82 ++++++++++++++++++-
>  1 file changed, 81 insertions(+), 1 deletion(-)

I see these changes were now merged in linux.git with

  commit 24e19590628b58578748eeaec8140bf9c9dc00d9
  Author:     zhenwei pi <pizhenwei@bytedance.com>
  AuthorDate: Wed Mar 2 11:39:15 2022 +0800
  Commit:     Michael S. Tsirkin <mst@redhat.com>
  CommitDate: Mon Mar 28 16:52:58 2022 -0400

    virtio-crypto: introduce akcipher service
    
    Introduce asymmetric service definition, asymmetric operations and
    several well known algorithms.
    
    Co-developed-by: lei he <helei.sig11@bytedance.com>
    Signed-off-by: lei he <helei.sig11@bytedance.com>
    Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
    Link: https://lore.kernel.org/r/20220302033917.1295334-3-pizhenwei@bytedance.com
    Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
    Reviewed-by: Gonglei <arei.gonglei@huawei.com>


And the changes proposed here match that, so

  Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


