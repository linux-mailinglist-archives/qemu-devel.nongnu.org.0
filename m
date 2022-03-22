Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4254E3BDD
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 10:44:44 +0100 (CET)
Received: from localhost ([::1]:43980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWb4F-0001cI-6B
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 05:44:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nWb2C-0000HB-2f
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:42:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nWb2A-0007ZD-Hf
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:42:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647942153;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=icacmMKjb402+3XIrR7lA4yaDpAbkpY/4XU2pL7YvF4=;
 b=FmdBGMSNS7xijFK9dTYisGeCcgRf64DsDjVKdRx1H5UOaOfHG66ugNozx+bBlooFqQNXy7
 IJ+FqgET9C75arSD2pQ4BSV+wy19XnKvbwaI2pey9J/2h90BYc1ssyWJdz0qElBwCsm+SU
 AodXKKkfsDy/K6kBIYLC4k9v8UI3RJc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-V9LyTUItPlyIXMCja6mMyw-1; Tue, 22 Mar 2022 05:42:22 -0400
X-MC-Unique: V9LyTUItPlyIXMCja6mMyw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4741480418F;
 Tue, 22 Mar 2022 09:42:22 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F447401E3A;
 Tue, 22 Mar 2022 09:42:19 +0000 (UTC)
Date: Tue, 22 Mar 2022 09:42:17 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kshitij Suri <kshitij.suri@nutanix.com>
Subject: Re: [PATCH v2 1/2] Replacing CONFIG_VNC_PNG with CONFIG_PNG
Message-ID: <YjmZ+TdhAOAg+H73@redhat.com>
References: <20220322081845.19680-1-kshitij.suri@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <20220322081845.19680-1-kshitij.suri@nutanix.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: soham.ghosh@nutanix.com, thuth@redhat.com, prerna.saxena@nutanix.com,
 armbru@redhat.com, qemu-devel@nongnu.org, philippe.mathieu.daude@gmail.com,
 kraxel@redhat.com, prachatos.mitra@nutanix.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 22, 2022 at 08:18:44AM +0000, Kshitij Suri wrote:
> Libpng is only detected if VNC is enabled currently. This patch adds a
> generalised png option in the meson build which is aimed to replace use of
> CONFIG_VNC_PNG with CONFIG_PNG.
> 
> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
> ---
>  meson.build        |  9 ++++-----
>  meson_options.txt  |  4 ++--
>  ui/vnc-enc-tight.c | 18 +++++++++---------
>  ui/vnc.c           |  4 ++--
>  ui/vnc.h           |  2 +-
>  5 files changed, 18 insertions(+), 19 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


