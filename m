Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED432321C61
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 17:08:45 +0100 (CET)
Received: from localhost ([::1]:51598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEDlM-0007zI-Va
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 11:08:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEDin-0006X7-B0
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 11:06:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEDii-0008Oa-Tb
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 11:06:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614009959;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nl131LCGC2fBqBE7BeJqiXZ0ht17cjG8+90AsoNLScw=;
 b=a9emPOC5ShffsQ4FKeMZpAX0rFRVoRm1qdTyBtDmUyiIzlHZpvBALKdf8D5Rk57dwRB+2W
 IjS77JfKw6kOz6I4mnNG93W/QyaiftUCUVgfvu6M4z4dKobUf24BnhI4tGt23nqe5VWvk6
 /6HDeXMlpwX33XJ72hOqzTq3l95fg7k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-8gWUyg8BPq6RiROFP9EkLg-1; Mon, 22 Feb 2021 11:05:55 -0500
X-MC-Unique: 8gWUyg8BPq6RiROFP9EkLg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A9C619611DC;
 Mon, 22 Feb 2021 16:05:41 +0000 (UTC)
Received: from redhat.com (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 933C2101E581;
 Mon, 22 Feb 2021 16:05:03 +0000 (UTC)
Date: Mon, 22 Feb 2021 16:05:01 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: Probing Meson for build configurations (was: [PATCH v2 3/6]
 tests/acceptance: allow a "graceful" failing for virtio-gpu test)
Message-ID: <YDPWLXWjjVA8VS2h@redhat.com>
References: <20210222101455.12640-1-alex.bennee@linaro.org>
 <20210222101455.12640-4-alex.bennee@linaro.org>
 <71dc4eca-d52e-3650-3b23-a96950ecc05e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <71dc4eca-d52e-3650-3b23-a96950ecc05e@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, f4bug@amsat.org, Willian Rampazzo <willianr@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 stefanha@redhat.com, crosa@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 22, 2021 at 12:44:37PM -0300, Wainer dos Santos Moschetta wrote:
> Hi Paolo,
> 
> Last week I was chatting with Cleber about probing configured features so
> that tests could be skipped (just like on this case). He has a
> implementation which never landed in, and is based on the old build system.
> Now with Meson, I am wondering if it has some sort of API for probing, or
> parsing the JSON files in build/meson-info/ is the proper way to inspect the
> build configuration.

Probing build configuration is the wrong approach.

We need to be querying the QEMU binary to ask if it has the logical
feature we need.  In this case

{
  "execute": "device-list-properties",
  "arguments": {
    "typename": "virtio-gpu-pci"
  },
}


the response will include "virgl" property, if QEMU was compiled
with VirGL. This is how libvirt detects VirGL support in QEMU
today.

> On 2/22/21 7:14 AM, Alex Bennée wrote:
> > This is a band-aid with a TODO for cases when QEMU doesn't start due
> > to missing VirGL. Longer term we could do with some proper feature
> > probing.
> > 
> > Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> > Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> > Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
> > Message-Id: <20210217121932.19986-7-alex.bennee@linaro.org>
> > ---
> >   tests/acceptance/virtio-gpu.py | 7 ++++++-
> >   1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/acceptance/virtio-gpu.py b/tests/acceptance/virtio-gpu.py
> > index ab1a4c1a71..ab18cddbb7 100644
> > --- a/tests/acceptance/virtio-gpu.py
> > +++ b/tests/acceptance/virtio-gpu.py
> > @@ -85,7 +85,12 @@ def test_virtio_vga_virgl(self):
> >               "-append",
> >               kernel_command_line,
> >           )
> > -        self.vm.launch()
> > +        try:
> > +            self.vm.launch()
> > +        except:
> > +            # TODO: probably fails because we are missing the VirGL features
> > +            self.cancel("VirGL not enabled?")
> > +
> >           self.wait_for_console_pattern("as init process")
> >           exec_command_and_wait_for_pattern(
> >               self, "/usr/sbin/modprobe virtio_gpu", ""

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


