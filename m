Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 263164A5AEE
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 12:11:55 +0100 (CET)
Received: from localhost ([::1]:55154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEr4j-0001XK-QY
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 06:11:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nEr0P-0007jI-LO
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:07:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nEr0J-0002gb-0w
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:07:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643713629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pEBG0vTl/lYk5UfSSj5btWWZRh70U6FT+tfTCiHAzdk=;
 b=YH2+5U8BeMZNGsqMDm0RjRCYDJWNjpVfyBRyISwzhAO7FOckhMuxbpvtzQyNTy74DQ1G3c
 gL/F4BD/i5wEsEb9smayD0w5KIwdnz2UF5mVyV038y7DPluSPIWK7RPKtEScW7+rVQKWIv
 cm3FSTJ/6OUUSmj8yIK39wje1QZVjks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-0CijBqNjNhCy_akmtrmUmw-1; Tue, 01 Feb 2022 06:07:06 -0500
X-MC-Unique: 0CijBqNjNhCy_akmtrmUmw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83D431853038;
 Tue,  1 Feb 2022 11:07:05 +0000 (UTC)
Received: from paraplu (unknown [10.39.195.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4D44607AA;
 Tue,  1 Feb 2022 11:06:36 +0000 (UTC)
Date: Tue, 1 Feb 2022 12:06:33 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: "make check-acceptance" takes way too long
Message-ID: <YfkUOVUQX3b2XgqN@paraplu>
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
 <CAFEAcA9_d5jw5-HOrZA6dsG1vMqxzqmrfHA7Jo0KsDcaEXmB_Q@mail.gmail.com>
 <6c90ca3d-eaec-d7e8-5941-4deb83b58fd0@redhat.com>
 <87zgnp4b32.fsf@dusky.pond.sub.org>
 <CAFEAcA_kxrCgyxWPFLw6VZ-rKx-res0C8L2BWRvfB81cR+keLg@mail.gmail.com>
 <875yqd6zib.fsf@linaro.org> <YerPk2ABMHQf/3QP@redhat.com>
 <20220125092011.dq2t4ryl632vrvsf@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20220125092011.dq2t4ryl632vrvsf@sirius.home.kraxel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 25, 2022 at 10:20:11AM +0100, Gerd Hoffmann wrote:
>   Hi,
> 
> > IMHO the ideal scenario would be for us to have a kernel, initrd
> > containing just busybox tools for the key arch targets we care
> > about. Those could be used with direct kernel boot or stuffed
> > into a disk iamge. Either way, they would boot in ~1 second,
> > even with TCG, and would be able to execute simple shell scripts
> > to test a decent amount of QEMU functionality.
> 
> I have some test images based on buildroot which are essentially that.
> https://gitlab.com/kraxel/br-kraxel/
> 
> Still a significant download, but much smaller than a full fedora or
> ubuntu cloud image and it boots much faster too.  Not down to only one
> second though.

Any objection to using CirrOS[1] images for boot-testing?   FWIW,
OpenStack upstream CI boots thousands of guests each day with these for
many years now.  It boots quick, and also satisfies one of Peter's
other requirements: AArch64 images.

A downside of CirrOS is it doesn't have a package manager, so installing
custom packages is a PITA.  The main use-case of CirrOS images
is any kind of boot-testing only.

To make the booting even quicker with CirrOS, do disable the "metadata
service lookup" (this is queried 20 times) at boot time.  It can be
trivially done by making this change in this file
/etc/cirros-init/config (in the disk image):

    - DATASOURCE_LIST="nocloud configdrive ec2"
    + DATASOURCE_LIST="nocloud"


[1] https://download.cirros-cloud.net/0.5.2/

        * * *

Another alternative that satisfies Peter's main requirements seem to be:
Alpine Linux:

(1) It has a small foot print -- under 50MB; 
(2) It supports x86 _and_ AArch64; and
(3) It has a proper package management system.


-- 
/kashyap


