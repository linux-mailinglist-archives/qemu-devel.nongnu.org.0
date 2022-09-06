Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A02A85AEB5B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 16:13:27 +0200 (CEST)
Received: from localhost ([::1]:39386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVZKQ-0005pD-Hw
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 10:13:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oVZBZ-0001bJ-L4
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 10:04:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oVZBW-0006ZA-76
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 10:04:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662473052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ITHKTpZ8NKW7dNTrhK2EplU22y1ZHAMtb/nxm7uALGM=;
 b=G/Ck+0/MO3V91XcK3j47auPx5xZ76GRFQ9n/jwmyxZ9YAAEJf4C1qGPyzkPIJEp/b+4v2H
 7xMqu75QXepeDcLutvhm66D0R1w0QbrhpMsA5oZXIVjhHwNLkZKu0A1u3eX0TxFlnNYr4e
 dexPL22Cxc09KegA+L8KjG2ykvahA7A=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-614-uRi2CUTlNSqOLgCw1tSfbQ-1; Tue, 06 Sep 2022 10:04:01 -0400
X-MC-Unique: uRi2CUTlNSqOLgCw1tSfbQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 m18-20020a056402511200b0044862412596so7664620edd.3
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 07:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ITHKTpZ8NKW7dNTrhK2EplU22y1ZHAMtb/nxm7uALGM=;
 b=LZnGesaWUBROELSY/d2ry+FKxzK94sQSCrzTELXax9TYc6WRoVyufmJD23UmGU6FrX
 ExsffFp8Jr/Mi2HmFeaHRKE33DNJB5K9VoFMnJUH2jEszelBAU3lLN87pvKhJ8b4QNPv
 Q3n05OpeB8ZXsb3fb9TGcc6CEvAUBTJnWEqSxIh+1xGs/KaApKOtV+WFaQffZSKDMYz0
 tD/seldv2Ca/KNtI9OxUPpkrYPsofCpXXklkc7ogLT0hEuFgY7Emh/+NN3WitdpthzJR
 Gb3Q9QnWXpRnAlAeKRfi96AbimiS+qIiy8BQT8O0h2+uTmlMpsSpd/NRSeKJ+LC0TrSq
 LFpw==
X-Gm-Message-State: ACgBeo3AIOEZs6BXLH2tbHiI8/r+cS+3Gbm20OqXbLojU/NsoVGX2YRU
 MhJmn6mcV1+0VyelkoG5AG77isDl7xQ4u+hJ2Uc6Tia/hau9+IZBN82AzR0d8pb8WRpyodd+vF6
 eIDx/vq4QqJFO4iQ=
X-Received: by 2002:a17:906:9c82:b0:6e1:2c94:1616 with SMTP id
 fj2-20020a1709069c8200b006e12c941616mr2036705ejc.64.1662473040085; 
 Tue, 06 Sep 2022 07:04:00 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6LB9Oa3xPASiV4C6XaYo6jRdKO23j6rhbPFTQ6FzYkhJ0gfqzMDG3YcONfUQkXhf9ckRdvVA==
X-Received: by 2002:a17:906:9c82:b0:6e1:2c94:1616 with SMTP id
 fj2-20020a1709069c8200b006e12c941616mr2036684ejc.64.1662473039877; 
 Tue, 06 Sep 2022 07:03:59 -0700 (PDT)
Received: from redhat.com ([2.52.135.118]) by smtp.gmail.com with ESMTPSA id
 7-20020a170906328700b00734bfab4d59sm6768058ejw.170.2022.09.06.07.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 07:03:58 -0700 (PDT)
Date: Tue, 6 Sep 2022 10:03:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>,
 qemu-devel@nongnu.org, thuth@redhat.com, jsnow@redhat.com,
 pbonzini@redhat.com, imammedo@redhat.com
Subject: Re: [PATCH v2 00/11] Introduce new acpi/smbios python tests using
 biosbits
Message-ID: <20220906095824-mutt-send-email-mst@kernel.org>
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220711044032-mutt-send-email-mst@kernel.org>
 <CAFEAcA_KUh_Hmozw2KthwNoM2L9rnA18ttrk9GHHnJZ-X_M4yQ@mail.gmail.com>
 <YxdH/c9jx+3oVs9m@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YxdH/c9jx+3oVs9m@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 06, 2022 at 02:15:41PM +0100, Daniel P. Berrangé wrote:
> On Thu, Jul 14, 2022 at 02:24:18PM +0100, Peter Maydell wrote:
> > On Mon, 11 Jul 2022 at 10:34, Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Sun, Jul 10, 2022 at 10:30:03PM +0530, Ani Sinha wrote:
> > > > Changelog:
> > > > v2:
> > > >  - a new class of python based tests introduced that is separate from avocado
> > > >    tests or qtests. Can be run by using "make check-pytest".
> > > >  - acpi biosbits tests are the first tests to use pytest environment.
> > > >  - bios bits tests now download the bits binary archives from a remote
> > > >    repository if they are not found locally. The test skips if download
> > > >    fails.
> > > >  - A new environment variable is introduced that can be passed by the tester
> > > >    to specify the location of the bits archives locally. test skips if the
> > > >    bits binaries are not found in that location.
> > > >  - if pip install of python module fails for whatever reaoson, the test skips.
> > > >  - misc code fixes including spell check of the README doc. README has been
> > > >    updated as well.
> > > >  - addition of SPDX license headers to bits test files.
> > > >  - update MAINTAINERS to reflect the new pytest test class.
> > > >
> > > > For biosbits repo:
> > > >  - added Dockerfile and build script. Made bios bits build on gcc 11.
> > > >    https://github.com/ani-sinha/bits/blob/bits-qemu-logging/Dockerfile
> > > >    https://github.com/ani-sinha/bits/blob/bits-qemu-logging/build-artifacts.sh
> > > >    The build script generates the zip archive and tarball used by the test.
> > >
> > > So far so good, I think it's ok for a start. It's probably a good idea
> > > to host the source on qemu.org. Peter - any objection to this?
> > 
> > Dan was looking at v1 from the point of view of how we handle the
> > guest binary blobs for these tests -- I'd rather defer to him rather
> > than taking the time to get up to speed on the issue myself.
> 
> Storing the *source* git repo for biosbits on gitlab.com/qemu-project
> is sensible, as that's what we've done for other 3rd party bits that
> we bundle/depend on git repo access for.
> 
> The above git repo, however, has extra branches that also store the
> binary builds, and I'm not convinced that is a good idea.
> 
> I feel like the source git repo should have a .gitlab-ci.yml file
> that builds the binary and publishes it as an CI artifact. This
> lets us keep the binary outside of GIT, have a CI job that periodically
> refreshes the binary (eg so when the Ubuntu version that Dockerfile
> uses goes EOL we can use something else). The test can access the CI
> artifact directly.
> 
> 
> With regards,
> Daniel

CI is for biosbits developers, bits that everyone uses
is production. I don't think our CI is yet robust enough -
I think when it comes to pushing bits that all
other developers are going to use, it is wise to have them
pushed manually. Random CI failures are not unheard of,
and if these cause a corrupted binary to be downloaded
to all developers, it's going to be bad.



> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


