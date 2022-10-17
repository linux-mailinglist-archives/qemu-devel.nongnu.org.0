Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C82601C15
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 00:09:32 +0200 (CEST)
Received: from localhost ([::1]:60452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okYId-00006m-Gl
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 18:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1okYFl-0003gw-JU
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 18:06:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1okYFj-0002vK-Ij
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 18:06:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666044390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WtWXsm6fXNg5LwuW9K1FB30lJgf2PnaO99M3ucglYrI=;
 b=PIeKrRmzLZmhRB/9jW10dNDgssGaVC7Lu4oGKs/JVVGg5I8adA9GvtSasp0tp5YDz34NRW
 uCbmhAG7lhCNWU3Km+Lvg6Wn2dxqxXI1CvmThwvu4snVCUX/4lLwUHRFfT3jjNdhn+EwP6
 eG9ifkraHIPqFDGGGmTdYvvHqjWNJ0c=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-142-ufrT-xk_M-GPCQrrwwko2A-1; Mon, 17 Oct 2022 18:06:28 -0400
X-MC-Unique: ufrT-xk_M-GPCQrrwwko2A-1
Received: by mail-ed1-f72.google.com with SMTP id
 v13-20020a056402348d00b0045d36615696so6996466edc.14
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 15:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WtWXsm6fXNg5LwuW9K1FB30lJgf2PnaO99M3ucglYrI=;
 b=EPuG9N6+/ZUvi3Ax8/Sgscq9h3vKp0XYuVME4hcIgE+95+qIvexGCvK0wap5HT8e7E
 820Mm6LZlpDA7q0yWuEEogXqiWL+6XmIS9yhpkBLHkOmoV0lqhW2qkEouzM66UKaEQUW
 VZOkMW8iSIhvBPaAU7PjhXtzOnAh4PrSQQdR9Vjf21g5Jbg67rDpfa20H1CT8dcggxEt
 OTMnchLX3gYVs1sAd81AJe11PIduKISGeY0CRN/BGno4bA3O1oANhNg9GKJjFpUm78ga
 NH+Kzb/OCl/xcN+FeMEvJ9JI+Q+qLuFMhUy+/EA3vHNFOAa1jHpnRbtUHqMKFSSc9ZRR
 oOUg==
X-Gm-Message-State: ACrzQf0b9fjtZFl1hNwdRdoPq70cZWVT7yiF0fhCwVP8k0HPRHhHG+8F
 Tj7vaiwAeK/oTlzWkGKQ7LSPdw8vudGfc3K5YMwTqh9mgOtL7z8ONufn6iv6ENBah034RjtI8R8
 MJ6ocFTq+iBvRTYo=
X-Received: by 2002:a17:907:d02:b0:78d:b3cd:a277 with SMTP id
 gn2-20020a1709070d0200b0078db3cda277mr10456507ejc.622.1666044387850; 
 Mon, 17 Oct 2022 15:06:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM61RR1jk+nGXWK6rG2PBDwF1RjxmwL3xmjrhWRsmbUE7IqvIjHj70JrTZDyB2E35ByY+CIPKg==
X-Received: by 2002:a17:907:d02:b0:78d:b3cd:a277 with SMTP id
 gn2-20020a1709070d0200b0078db3cda277mr10456476ejc.622.1666044387582; 
 Mon, 17 Oct 2022 15:06:27 -0700 (PDT)
Received: from redhat.com ([2.54.172.104]) by smtp.gmail.com with ESMTPSA id
 a16-20020aa7d910000000b00459ad800bbcsm7923108edr.33.2022.10.17.15.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 15:06:26 -0700 (PDT)
Date: Mon, 17 Oct 2022 18:06:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Ani Sinha <ani@anisinha.ca>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 01/10] acpi/tests/avocado/bits: initial commit of test
 scripts that are run by biosbits
Message-ID: <20221017180405-mutt-send-email-mst@kernel.org>
References: <20221014173508.222823-1-ani@anisinha.ca>
 <20221014173508.222823-2-ani@anisinha.ca>
 <5df81a97-8fd7-8ee6-f631-7c979a2e58a0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5df81a97-8fd7-8ee6-f631-7c979a2e58a0@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 17, 2022 at 11:13:55PM +0200, Philippe Mathieu-Daudé wrote:
> On 14/10/22 19:34, Ani Sinha wrote:
> > This is initial commit of cpuid, acpi and smbios python test scripts for
> > biosbits to execute. No change has been made to them from the original code
> > written by the biosbits author Josh Triplett. They are required to be installed
> > into the bits iso file and then run from within the virtual machine booted off
> > with biosbits iso.
> > 
> > The test scripts have a ".py2" extension in order to prevent avocado from
> > loading them. They are written in python 2.7 and are run from within bios bits.
> > There is no need for avocado to try to load them and call out errors on python3
> > specific syntaxes.
> > 
> > The original location of these tests are here:
> > https://github.com/biosbits/bits/blob/master/python/testacpi.py
> > https://github.com/biosbits/bits/blob/master/python/smbios.py
> > https://github.com/biosbits/bits/blob/master/python/testcpuid.py
> > 
> > For QEMU, we maintain a fork of the above repo here with numerious fixes:
> > https://gitlab.com/qemu-project/biosbits-bits
> > 
> > The acpi test for example is maintained here in the fork:
> > https://gitlab.com/qemu-project/biosbits-bits/-/raw/master/python/testacpi.py
> 
> I missed the previous iterations of this series, and wonder why copy
> these files in QEMU repository if they already are in a forked
> repository. Why not add the fork as a submodule?

People don't want to use submodules because their default
configuration in git is broken and git devs don't seem to
be willing to change this. Look for "submodules" in qemu archives.

> > Cc: Daniel P. Berrangé <berrange@redhat.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Maydell Peter <peter.maydell@linaro.org>
> > Cc: John Snow <jsnow@redhat.com>
> > Cc: Thomas Huth <thuth@redhat.com>
> > Cc: Alex Bennée <alex.bennee@linaro.org>
> > Cc: Igor Mammedov <imammedo@redhat.com>
> > Cc: Michael Tsirkin <mst@redhat.com>
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > ---
> >   tests/avocado/acpi-bits/bits-tests/smbios.py2 | 2430 +++++++++++++++++
> >   .../avocado/acpi-bits/bits-tests/testacpi.py2 |  283 ++
> >   .../acpi-bits/bits-tests/testcpuid.py2        |   83 +
> >   3 files changed, 2796 insertions(+)
> >   create mode 100644 tests/avocado/acpi-bits/bits-tests/smbios.py2
> >   create mode 100644 tests/avocado/acpi-bits/bits-tests/testacpi.py2
> >   create mode 100644 tests/avocado/acpi-bits/bits-tests/testcpuid.py2


