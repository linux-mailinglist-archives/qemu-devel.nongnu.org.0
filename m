Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E184A5931
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 10:28:33 +0100 (CET)
Received: from localhost ([::1]:34058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEpSi-0002x1-Si
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 04:28:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEp7b-0001pP-Rb
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 04:06:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEp7Z-0001Ya-2O
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 04:06:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643706399;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ofVww+5k+nS3XHXqDMFykO9WPKdaV+IvSSWXJkdBCeg=;
 b=bl43jJU6LZoPLVhBUq8sI2JgJoeatgcN8Hm4zx1re9zckXWnIhcm31mhqU/o7BzzHwtUBG
 vzumY9HACCvwVt7fpbpbEndM7vfp6fVQRl5xyap7P+hkROUWG7+OvqMzP/Faeb0ImEv+s/
 9PcN2rAdcwUxsGW/vz+AKn/OEIhHGyQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-FD6ZruvvPjq3E1k-T0ES_A-1; Tue, 01 Feb 2022 04:06:32 -0500
X-MC-Unique: FD6ZruvvPjq3E1k-T0ES_A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BB691091DB2;
 Tue,  1 Feb 2022 09:06:31 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 992695E4B6;
 Tue,  1 Feb 2022 09:06:28 +0000 (UTC)
Date: Tue, 1 Feb 2022 09:06:25 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefano Brivio <sbrivio@redhat.com>
Subject: Re: "make check-acceptance" takes way too long
Message-ID: <Yfj4ERdAvmCF4ZzY@redhat.com>
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
 <CAFEAcA9_d5jw5-HOrZA6dsG1vMqxzqmrfHA7Jo0KsDcaEXmB_Q@mail.gmail.com>
 <6c90ca3d-eaec-d7e8-5941-4deb83b58fd0@redhat.com>
 <87zgnp4b32.fsf@dusky.pond.sub.org>
 <CAFEAcA_kxrCgyxWPFLw6VZ-rKx-res0C8L2BWRvfB81cR+keLg@mail.gmail.com>
 <875yqd6zib.fsf@linaro.org> <YerPk2ABMHQf/3QP@redhat.com>
 <20220125092011.dq2t4ryl632vrvsf@sirius.home.kraxel.org>
 <20220201073139.7896e10b@elisabeth>
MIME-Version: 1.0
In-Reply-To: <20220201073139.7896e10b@elisabeth>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 01, 2022 at 07:31:39AM +0100, Stefano Brivio wrote:
> Hi,
> 
> On Tue, 25 Jan 2022 10:20:11 +0100
> Gerd Hoffmann <kraxel@redhat.com> wrote:
> 
> >   Hi,
> > 
> > > IMHO the ideal scenario would be for us to have a kernel, initrd
> > > containing just busybox tools for the key arch targets we care
> > > about. Those could be used with direct kernel boot or stuffed
> > > into a disk iamge. Either way, they would boot in ~1 second,
> > > even with TCG, and would be able to execute simple shell scripts
> > > to test a decent amount of QEMU functionality.  
> > 
> > I have some test images based on buildroot which are essentially that.
> > https://gitlab.com/kraxel/br-kraxel/
> > 
> > Still a significant download, but much smaller than a full fedora or
> > ubuntu cloud image and it boots much faster too.  Not down to only one
> > second though.
> 
> I'm not sure you can recycle something from it, but my (ugly) approach
> to make this fast (for a different purpose -- I'm using qemu to run
> tests in guests, not testing qemu) is to build an initramfs by copying
> the host binaries I need (a shell, ip, jq) and recursively sourcing
> libraries using ldd (I guess I mentioned it's ugly).
> 
> No downloads, systemd, dracut, etc., guest boots in half a second
> (x86_64 on x86_64, KVM -- no idea with TCG). Host kernel with a few
> modules packed and loaded by a custom init script.

That is such a good idea, that it is exactly what I do too :-)

  https://gitlab.com/berrange/tiny-vm-tools/-/blob/master/make-tiny-image.py

it works incredibly well for the simple case of host-arch==guest-arch.

It could be made to work for foreign arch easily enough - just need
to have a foreign chroot lieing around somewhere you can point it
to.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


