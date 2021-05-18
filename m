Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B89FF3876A7
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:37:42 +0200 (CEST)
Received: from localhost ([::1]:57548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lix6b-0003J7-PU
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:37:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1liwmS-0008I0-UJ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:16:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1liwmP-0003oO-T2
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:16:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621333009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pi4VaWKTP/GzB88dopTIJ+xcWu2HHspv73TmdL7dTgs=;
 b=FKshGOK8CQZIHtn2kVlnDo0QhNTRaW6bAzGWzR9m8ABKS0uqLFJvqeMOwpASHw0PZGJuoG
 kydHjiVQg23jnszEPYM6wAm/g3SNgW9mkHiFVf3XXAOZGzKaSUX8t8szn1rgMR0uUVimEg
 ljvmUJQfKCYUMt7RGK4MnRgP8Py+WAI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-weI6sqCNOtyx2Ab2tH9S5A-1; Tue, 18 May 2021 06:16:45 -0400
X-MC-Unique: weI6sqCNOtyx2Ab2tH9S5A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC346501F6;
 Tue, 18 May 2021 10:16:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-0.ams2.redhat.com
 [10.36.114.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EB885E273;
 Tue, 18 May 2021 10:16:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 90CDF180079B; Tue, 18 May 2021 12:16:38 +0200 (CEST)
Date: Tue, 18 May 2021 12:16:38 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v4 00/13] virtio-gpu: Add support for Blob resources
 feature (v4)
Message-ID: <20210518101638.mvtys424rl2d72iu@sirius.home.kraxel.org>
References: <20210511224719.387443-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210511224719.387443-1-vivek.kasireddy@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Tina Zhang <tina.zhang@intel.com>, qemu-devel@nongnu.org,
 Dongwon Kim <dongwon.kim@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 11, 2021 at 03:47:06PM -0700, Vivek Kasireddy wrote:
> Enabling this feature would eliminate data copies from the resource
> object in the Guest to the shadow resource in Qemu. This patch series
> however adds support only for Blobs of type
> VIRTIO_GPU_BLOB_MEM_GUEST with property VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE.
> 
> Most of the patches in this series are a rebased, refactored and bugfixed 
> versions of Gerd Hoffmann's patches located here:
> https://gitlab.freedesktop.org/virgl/qemu/-/commits/virtio-gpu-next

Doesn't apply cleanly to master, can you rebase and resend?

thanks,
  Gerd


