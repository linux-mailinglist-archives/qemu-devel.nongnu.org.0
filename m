Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E28E949517F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 16:32:37 +0100 (CET)
Received: from localhost ([::1]:39338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAZQS-0002ow-UF
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 10:32:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nAVl8-0007rD-7l
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 06:37:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nAVl2-0005aF-QP
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 06:37:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642678649;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1RWlkUbiIAlpnX2lx0kRfyAaj0WNcocOPj3qPQtcGSA=;
 b=HZ25AVIVazg1PI4OOLxMEcMI7GfCz7ooQfzgzsLL5eWjHnw78IYiNA0NkVuDYHF0uMdanF
 DHHQOgprPCZhQj54s8i7Q7nT7gNY4b/mTKhaEdhhb1YS3lFPbBSF0mm8Zy3OaoOBApm2aM
 P2lpMwLpy8UEPSnctBACiChaZ6DeKZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-7lycijJPOker-RFBe_EFOg-1; Thu, 20 Jan 2022 06:37:26 -0500
X-MC-Unique: 7lycijJPOker-RFBe_EFOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 140471091DA4;
 Thu, 20 Jan 2022 11:37:25 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E64B17CD68;
 Thu, 20 Jan 2022 11:37:22 +0000 (UTC)
Date: Thu, 20 Jan 2022 11:37:19 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 6/7] tests/lcitool: Remove libxml2
Message-ID: <YelJb1Vvb1JCLdzp@redhat.com>
References: <20220120113016.268265-1-f4bug@amsat.org>
 <20220120113016.268265-7-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20220120113016.268265-7-f4bug@amsat.org>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Ed Maste <emaste@freebsd.org>, qemu-block@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Yonggang Luo <luoyonggang@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 20, 2022 at 12:30:15PM +0100, Philippe Mathieu-Daudé wrote:
> The previous commit removed all uses of libxml2.
> 
> Update lcitool's qemu.yml and refresh the generated files by running:
> 
>   $ make lcitool-refresh
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  .gitlab-ci.d/cirrus/freebsd-12.vars           | 2 +-
>  .gitlab-ci.d/cirrus/freebsd-13.vars           | 2 +-
>  .gitlab-ci.d/cirrus/macos-11.vars             | 2 +-
>  tests/docker/dockerfiles/alpine.docker        | 1 -
>  tests/docker/dockerfiles/centos8.docker       | 1 -
>  tests/docker/dockerfiles/fedora.docker        | 1 -
>  tests/docker/dockerfiles/opensuse-leap.docker | 1 -
>  tests/docker/dockerfiles/ubuntu1804.docker    | 1 -
>  tests/docker/dockerfiles/ubuntu2004.docker    | 1 -
>  tests/lcitool/projects/qemu.yml               | 1 -
>  10 files changed, 3 insertions(+), 10 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


