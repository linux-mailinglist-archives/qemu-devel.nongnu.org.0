Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BFA2C5B0C
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 18:49:12 +0100 (CET)
Received: from localhost ([::1]:58004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiLOJ-0006Zm-MD
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 12:49:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1kiLED-0005UZ-0L
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 12:38:45 -0500
Received: from esa4.hc3370-68.iphmx.com ([216.71.155.144]:8072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1kiLE5-0006wh-Cw
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 12:38:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1606412317;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bXQzNtHqJ2Yw8039qwF6PExFC7hXWX7QRQoV51ZIeHI=;
 b=ZOuAOYMEpgRhmz6PKBEzsD/O1xtj3V7MN/LMzgmT4F8WWPW0aPYLUd93
 l0BUnV6rI2LOxIPe+Tq8W7yfRs4hfBSOaSmICvjkYYEWZXt8WLApELr+y
 r+GbZ5NFYzc8WakCHUR5oKTAL7XwgMuzoDjk/JOQLzf4CBTN5O+YXoj+d w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: KFVGLLdvf8DEeihaDbUXddHR0GUT3gEY/wdoGM652HXR/2rCOBM0eF25OhgsWDNyfp9MYeek/X
 0WqeC80WMCfN5zCQyhxAe/ClDmUBJc/JGrvvkpaaf8+FQl/NGDNBjFJ7foXBTOmAsMLwcty1Gm
 HyVsqyBsVA4G3HPVyHI1XZR324jHdTkA8nGTMYXZrCt7x0UIlPuH696eY5fnGbQaPvhMOZ9Aoo
 M8iqvI23iZcXGqxutTGvgaJUYGdwZdT71+kxty6g9x2cBmotdnH2k6/JUn+s7MnnpHKhmbihk2
 YHU=
X-SBRS: None
X-MesageID: 33168172
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,372,1599537600"; d="scan'208";a="33168172"
Date: Thu, 26 Nov 2020 17:38:24 +0000
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
CC: <qemu-devel@nongnu.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, "Igor
 Mammedov" <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Paolo Bonzini" <pbonzini@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>, Thomas Huth
 <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, Alex
 =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Richard Henderson <rth@twiddle.net>, Fam
 Zheng <fam@euphon.net>, "Daniel P . Berrange" <berrange@redhat.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH-for-6.0 v4 15/17] gitlab-ci: Add test for Xen (on CentOS 7)
Message-ID: <20201126173824.GB2098@perard.uk.xensource.com>
References: <20201108204535.2319870-1-philmd@redhat.com>
 <20201108204535.2319870-16-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201108204535.2319870-16-philmd@redhat.com>
Received-SPF: pass client-ip=216.71.155.144;
 envelope-from=anthony.perard@citrix.com; helo=esa4.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Anthony PERARD <anthony.perard@citrix.com>
From: Anthony PERARD via <qemu-devel@nongnu.org>

On Sun, Nov 08, 2020 at 09:45:33PM +0100, Philippe Mathieu-Daudé wrote:
> Xen packages are available in CentOS 7, but have been
> removed from CentOS 8. Use the CentOS 7 container.

Technically Xen has never been in CentOS 8, I'm working on it, slowly.

> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org
> ---
>  .gitlab-ci.yml | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 2f0da7b3dc1..8e15266c277 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -557,6 +557,27 @@ check-crypto-only-gnutls:
>      IMAGE: centos7
>      MAKE_CHECK_ARGS: check
>  
> +build-xen-centos:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: centos7
> +    TARGETS: i386-softmmu x86_64-softmmu
> +    CONFIGURE_ARGS: --enable-xen
> +    MAKE_CHECK_ARGS: check-build
> +  artifacts:
> +    paths:
> +      - build
> +
> +check-xen-centos:
> +  <<: *native_test_job_definition
> +  needs:
> +    - job: build-xen-centos
> +      artifacts: true
> +  variables:
> +    IMAGE: centos7
> +    MAKE_CHECK_ARGS: check

Is `make check` going to do something useful with the Xen support? Or is
it going to need more work in order to test the Xen support of QEMU?
(Like starting an actual Xen guest.)

Cheers,

-- 
Anthony PERARD

