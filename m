Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6C12DBFA4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 12:45:35 +0100 (CET)
Received: from localhost ([::1]:39106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpVFO-0005Dz-3J
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 06:45:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kpVC1-0002PW-DD
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 06:42:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kpVBk-0006F2-RS
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 06:41:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608118907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KE8Jl8D5FojyVCZV39MgGBvIrMUAmJ4yOL7QlaSFrBI=;
 b=gc2D4OIpAx9AoW9gveiF7yVALCn4sho1FYulI9o2eKL314KIkEZxbH0MLXrd5XeWlHxE3J
 W6XB+abYkV4IZgwwMnsYqApCtH/rH5RtgMJV1Q6X7LECKjIM3kaTczr/RfcNuJ7hqP90Cn
 GIAaDGYdbBVohYbiv+mVLGOZu5VTzLc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-pmf5vxZ7MjuRPSOlyGYUTQ-1; Wed, 16 Dec 2020 06:41:46 -0500
X-MC-Unique: pmf5vxZ7MjuRPSOlyGYUTQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22194CC621;
 Wed, 16 Dec 2020 11:41:45 +0000 (UTC)
Received: from gondolin (ovpn-113-163.ams2.redhat.com [10.36.113.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C817C5D9E3;
 Wed, 16 Dec 2020 11:41:37 +0000 (UTC)
Date: Wed, 16 Dec 2020 12:41:35 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/acceptance: Add a test with the Fedora 31 kernel
 and initrd
Message-ID: <20201216124135.7a7d5ec9.cohuck@redhat.com>
In-Reply-To: <6948dfc6-5ec4-6d7f-2c76-fe8449b8aa14@redhat.com>
References: <20201216105711.14796-1-thuth@redhat.com>
 <6948dfc6-5ec4-6d7f-2c76-fe8449b8aa14@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Dec 2020 12:32:22 +0100
Thomas Huth <thuth@redhat.com> wrote:

> On 16/12/2020 11.57, Thomas Huth wrote:

> > +        # Disable blinking cursor, then write some stuff into the framebuffer
> > +        # ("32-bit encoded", the screendump PPM will then only contain 24-bit)  
> 
> As just discussed offline with Cornelia, this maybe needs some more
> explanation, so I'd suggest to add something like:
> 
>  # Disable blinking cursor, then write some stuff into the
>  # framebuffer. QEMU's PPM screendumps contain uncompressed
>  # 24-bit values, while the framebuffer uses 32-bit, so we
>  # pad our text with some spaces when writing to the frame-
>  # buffer. Since the PPM is uncompressed, we then can simple
>  # read the written "magic bytes" back from the PPM file to
>  # check whether the framebuffer is working as expected.
> 
> Does that sound ok?

Sound good to me.

> 
>  Thomas
> 
> 
> > +        exec_command_and_wait_for_pattern(self,
> > +            'echo -e "\e[?25l" > /dev/tty0', ':/#')
> > +        exec_command_and_wait_for_pattern(self, 'for ((i=0;i<500;i++)); do '
> > +            'echo " The  qu ick  fo x j ump s o ver  a  laz y d og" >> fox.txt;'
> > +            'done',
> > +            ':/#')
> > +        exec_command_and_wait_for_pattern(self,
> > +            'dd if=fox.txt of=/dev/fb0 bs=1000 oflag=sync,nocache ; rm fox.txt',
> > +            '24+0 records out')
> > +        tmpfile = tempfile.NamedTemporaryFile(suffix='.ppm',
> > +                                              prefix='qemu-scrdump-')
> > +        self.vm.command('screendump', filename=tmpfile.name)
> > +        ppmfile = open(tmpfile.name, "r")
> > +        tmpfile.close
> > +        line = ppmfile.readline()
> > +        self.assertEqual(line, "P6\n")
> > +        line = ppmfile.readline()
> > +        self.assertEqual(line, "1024 768\n")
> > +        line = ppmfile.readline()
> > +        self.assertEqual(line, "255\n")
> > +        line = ppmfile.readline()
> > +        self.assertEqual(line, "The quick fox jumps over a lazy dog\n")
> > +        ppmfile.close
> >   
> 


