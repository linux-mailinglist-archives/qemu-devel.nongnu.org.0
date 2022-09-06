Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A455AED75
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 16:38:34 +0200 (CEST)
Received: from localhost ([::1]:58188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVZij-0008S9-Nu
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 10:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oVZQ8-0005Yd-E4
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 10:19:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oVZQ2-0001Gf-Ty
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 10:19:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662473953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=StAwNT6NcevFBiAZw0Atnanjxt02RxSeV9msXKhEUdU=;
 b=dKPX4waMMw18A3XtLhVhYnnVdk5r06KJlhWGuvZNSCkI4vBdX36CnUT3w1JjS68eXXRfGA
 kfX8KeNyp045UZpOCb/ta1ubX69VCnpGVIz4lVC9l1uBPNLqHR5X/4N5YWswOT6+GckIUu
 oRdiTRK4IzI8bFJ+FHyzc0HlWGIXQrk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-118-je2yAlLSOL2ie0NeDHcGlw-1; Tue, 06 Sep 2022 10:19:12 -0400
X-MC-Unique: je2yAlLSOL2ie0NeDHcGlw-1
Received: by mail-ej1-f70.google.com with SMTP id
 hr32-20020a1709073fa000b00730a39f36ddso3669816ejc.5
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 07:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=StAwNT6NcevFBiAZw0Atnanjxt02RxSeV9msXKhEUdU=;
 b=wlKKovHU+9HomLmKul8UOnPADkqYWTZcpZgGDYxMTT8vI6nxVEdDtx8lrr6AgAupsI
 gy5za0nL72yd1wt76HIMkN3W/fFAfpbdITibJ9B7cqBhZR9pNvLOOhafXajDunkGlFDN
 MFLDicGvnP1DFdJnq37GYgGEYSEZW+ZILDq3n0m0SjVtU1EE0P8nOP1cQXN4enX6EVBF
 V77r791beu6oBBZLsZxIP7y6SoFJJJdY7qV55MsBBxAS5A8Zu4P0cL0VPMRm2yJ1Tx6p
 P1GXSaxdJhE7UtdmcuGzwLuaKU16s6qRgKxlEnCgiYI6nZAnOJy1sAVa59EFuhjE3tf2
 GPeA==
X-Gm-Message-State: ACgBeo1zos6IE25uJPeY4is1vQ3fOjoUEF5TSJt1IrJhbtgXVRebDJf/
 Ggmu1zK6zLhfhRbNQl5oAxi+gOKpRZ+/p+MghJliBw6jTbKNxA6+wEDRmdlVneD9povJeBwLAo4
 vCnxcnda5XUGZyRU=
X-Received: by 2002:a17:906:4bd3:b0:731:3bdf:b95c with SMTP id
 x19-20020a1709064bd300b007313bdfb95cmr39875044ejv.677.1662473951553; 
 Tue, 06 Sep 2022 07:19:11 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7SVsEEKrm5aHm+xvX3qZqRzlaYBfGPzxjXJ3/boUHtG9GcH+GDSxRc5+Y1C5Jh7iNLZzE3Qw==
X-Received: by 2002:a17:906:4bd3:b0:731:3bdf:b95c with SMTP id
 x19-20020a1709064bd300b007313bdfb95cmr39875024ejv.677.1662473951275; 
 Tue, 06 Sep 2022 07:19:11 -0700 (PDT)
Received: from redhat.com ([2.52.135.118]) by smtp.gmail.com with ESMTPSA id
 n10-20020aa7c78a000000b00445e930e20esm8337358eds.64.2022.09.06.07.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 07:19:10 -0700 (PDT)
Date: Tue, 6 Sep 2022 10:19:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>,
 qemu-devel@nongnu.org, thuth@redhat.com, jsnow@redhat.com,
 pbonzini@redhat.com, imammedo@redhat.com
Subject: Re: [PATCH v2 00/11] Introduce new acpi/smbios python tests using
 biosbits
Message-ID: <20220906101608-mutt-send-email-mst@kernel.org>
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220711044032-mutt-send-email-mst@kernel.org>
 <CAFEAcA_KUh_Hmozw2KthwNoM2L9rnA18ttrk9GHHnJZ-X_M4yQ@mail.gmail.com>
 <YxdH/c9jx+3oVs9m@redhat.com>
 <20220906095824-mutt-send-email-mst@kernel.org>
 <YxdUvTmfrU0DSdkU@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YxdUvTmfrU0DSdkU@redhat.com>
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

On Tue, Sep 06, 2022 at 03:10:05PM +0100, Daniel P. Berrangé wrote:
> On Tue, Sep 06, 2022 at 10:03:55AM -0400, Michael S. Tsirkin wrote:
> > On Tue, Sep 06, 2022 at 02:15:41PM +0100, Daniel P. Berrangé wrote:
> > > On Thu, Jul 14, 2022 at 02:24:18PM +0100, Peter Maydell wrote:
> > > > On Mon, 11 Jul 2022 at 10:34, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > >
> > > > > On Sun, Jul 10, 2022 at 10:30:03PM +0530, Ani Sinha wrote:
> > > > > > Changelog:
> > > > > > v2:
> > > > > >  - a new class of python based tests introduced that is separate from avocado
> > > > > >    tests or qtests. Can be run by using "make check-pytest".
> > > > > >  - acpi biosbits tests are the first tests to use pytest environment.
> > > > > >  - bios bits tests now download the bits binary archives from a remote
> > > > > >    repository if they are not found locally. The test skips if download
> > > > > >    fails.
> > > > > >  - A new environment variable is introduced that can be passed by the tester
> > > > > >    to specify the location of the bits archives locally. test skips if the
> > > > > >    bits binaries are not found in that location.
> > > > > >  - if pip install of python module fails for whatever reaoson, the test skips.
> > > > > >  - misc code fixes including spell check of the README doc. README has been
> > > > > >    updated as well.
> > > > > >  - addition of SPDX license headers to bits test files.
> > > > > >  - update MAINTAINERS to reflect the new pytest test class.
> > > > > >
> > > > > > For biosbits repo:
> > > > > >  - added Dockerfile and build script. Made bios bits build on gcc 11.
> > > > > >    https://github.com/ani-sinha/bits/blob/bits-qemu-logging/Dockerfile
> > > > > >    https://github.com/ani-sinha/bits/blob/bits-qemu-logging/build-artifacts.sh
> > > > > >    The build script generates the zip archive and tarball used by the test.
> > > > >
> > > > > So far so good, I think it's ok for a start. It's probably a good idea
> > > > > to host the source on qemu.org. Peter - any objection to this?
> > > > 
> > > > Dan was looking at v1 from the point of view of how we handle the
> > > > guest binary blobs for these tests -- I'd rather defer to him rather
> > > > than taking the time to get up to speed on the issue myself.
> > > 
> > > Storing the *source* git repo for biosbits on gitlab.com/qemu-project
> > > is sensible, as that's what we've done for other 3rd party bits that
> > > we bundle/depend on git repo access for.
> > > 
> > > The above git repo, however, has extra branches that also store the
> > > binary builds, and I'm not convinced that is a good idea.
> > > 
> > > I feel like the source git repo should have a .gitlab-ci.yml file
> > > that builds the binary and publishes it as an CI artifact. This
> > > lets us keep the binary outside of GIT, have a CI job that periodically
> > > refreshes the binary (eg so when the Ubuntu version that Dockerfile
> > > uses goes EOL we can use something else). The test can access the CI
> > > artifact directly.
> > > 
> > > 
> > > With regards,
> > > Daniel
> > 
> > CI is for biosbits developers, bits that everyone uses
> > is production. I don't think our CI is yet robust enough -
> > I think when it comes to pushing bits that all
> > other developers are going to use, it is wise to have them
> > pushed manually. Random CI failures are not unheard of,
> > and if these cause a corrupted binary to be downloaded
> > to all developers, it's going to be bad.
> 
> The artifacts would only be published if the CI job succeeds. If it fails
> the artifacts from the previous successful job remain available.
> 
> Second, we don't need to run the CI continuously. It could be done once
> a month, or could be triggered manually on demand. Or it could run
> frequently, but we only publish artifacts from a manual invokation.
> 
> 
> With regards,
> Daniel

I think publishing should happen manually after maintainer decides
it's worth it. In particular, I think we want to keep old
qemu source working wrt tests and that means we don't ever
erase old binaries, instead adding new ones on demand.

IIUC at the moment no other subproject within qemu uses
CI for production, we just use it for testing, and it seems
somewhat weird to start with a new subproject as opposed
to an established one. The new kid and a new maintainer
will have problems enough as it is.

> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


