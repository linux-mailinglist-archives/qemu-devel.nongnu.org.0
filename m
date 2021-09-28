Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8566041AF1F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 14:36:42 +0200 (CEST)
Received: from localhost ([::1]:50504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVCLh-0005n2-Gz
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 08:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVCE9-0007JK-PP
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:28:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVCE8-0001mC-2f
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:28:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632832131;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PjP/8ax+S0hsMlDkpxNf/TpPcNE05SXYOEYbHGKWEis=;
 b=RI8MZrlix3wnWOxNl8XgKDLWV5walieCXvQp0B++HhsxbjTsZM6B8ZQg+MCpUx8YEPuOLv
 uguyZmF11afdHoP0tCipjn0LgA7iMSeqSohl5qKaWJdfP+LuSd/EkDfm9siQfyLdsVvXtw
 kAkqJaS/XXwc8AW+mMO3MurANz0WULc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-1ySdMceIOqWWxZFI6gfNsQ-1; Tue, 28 Sep 2021 08:28:50 -0400
X-MC-Unique: 1ySdMceIOqWWxZFI6gfNsQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 187691084685;
 Tue, 28 Sep 2021 12:28:49 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF9C960657;
 Tue, 28 Sep 2021 12:28:47 +0000 (UTC)
Date: Tue, 28 Sep 2021 13:28:45 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v2 1/2] qemu-options: Tweak [,maxcpus=cpus] to
 [,maxcpus=maxcpus]
Message-ID: <YVMKffLI2bbJkQ7w@redhat.com>
References: <20210928121134.21064-1-wangyanan55@huawei.com>
 <20210928121134.21064-2-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210928121134.21064-2-wangyanan55@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-trivial@nongnu.org, wanghaibin.wang@huawei.com,
 Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 28, 2021 at 08:11:33PM +0800, Yanan Wang wrote:
> In qemu-option.hx, there is "-smp [[cpus=]n][,maxcpus=cpus]..." in the
> DEF part, and "-smp [[cpus=]n][,maxcpus=maxcpus]..." in the RST part.
> Obviously the later is right, let's fix the previous one.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  qemu-options.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


