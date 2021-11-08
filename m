Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 414D2447CF5
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 10:39:24 +0100 (CET)
Received: from localhost ([::1]:45908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk17a-0007db-Sh
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 04:39:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mk15W-0006H4-RT
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:37:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mk15R-0008U4-Oe
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:37:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636364228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OFdTT+iTTnEyQs1gsQ25FO9MzlPl6y8AEe1fgo3DQKo=;
 b=eo+mmUx17T5IjBXxeDl3GJydJnWn7k7nKyDtgPuLtfNds+amIBQ8I/+8FhctjOUBnj2wyg
 vwlB4LlmLh1lZvrnCW7L1VcOWWVIA3o+HX04CPcN7oMseXo1mXgBods9/UUnWtWDf7Xx/D
 ckg4lI/bqhKra6cEy/F+nLAHXDqIe7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-nxy_gPG1MvmZ1G_UCObCzA-1; Mon, 08 Nov 2021 04:37:05 -0500
X-MC-Unique: nxy_gPG1MvmZ1G_UCObCzA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA42E18125C0;
 Mon,  8 Nov 2021 09:37:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DE5019C79;
 Mon,  8 Nov 2021 09:37:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8CB611803560; Mon,  8 Nov 2021 10:36:58 +0100 (CET)
Date: Mon, 8 Nov 2021 10:36:58 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PULL 0/6] Egl 20211105 patches
Message-ID: <20211108093658.xofljgqxe3p4as7e@sirius.home.kraxel.org>
References: <20211105113043.4059361-1-kraxel@redhat.com>
 <9221f39f-32ca-094b-c526-82fdbf99a588@linaro.org>
 <c97aefa2-4686-b339-4d07-f801ac6e5de1@amsat.org>
 <1b641554-f983-a86f-3512-c109779f6d73@amsat.org>
 <cc48fcc7-4408-be45-7081-335b98c1ce6f@ilande.co.uk>
 <4733e0d7-a108-e444-e640-0d5dd7644943@amsat.org>
 <YYjsatU4ENpazt29@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YYjsatU4ENpazt29@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > >> +#ifdef CONFIG_GBM
> > >>           if (vc->gfx.guest_fb.dmabuf) {
> > >>               egl_dmabuf_release_texture(vc->gfx.guest_fb.dmabuf);
> > >>               gd_egl_scanout_dmabuf(dcl, vc->gfx.guest_fb.dmabuf);
> > >>           }
> > >> +#endif

> I don't know what Mark sees a problem on Debian Buster though, as we
> successfully built there AFAICT
> 
>    https://gitlab.com/qemu-project/qemu/-/jobs/1756202449

Probably depends on whenever libgbm-dev (or whatever the package
is named on debian) is installed or not.

take care,
  Gerd


