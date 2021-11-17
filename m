Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17668454918
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 15:46:16 +0100 (CET)
Received: from localhost ([::1]:54036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnMCV-0001cI-0z
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 09:46:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mnMBU-0000IS-56
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:45:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mnMBS-0000Re-5Y
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:45:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637160309;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/0XLOW0QC4qT3ntY5uax6xSs9kKITAy61cnwyLEQCUw=;
 b=XRuzEg2XdoI2LPOypVE7LQBw2Dr/Mzdfea5moh/U1FlgFUyusVX9xE76u0BNi99cLwFXVV
 XiIxDW7Ru/Fh8GE9l53IlaGGywjuxUTV3E2N1vlZnw7hJTyBLyBsyfifdOCI487zxAbB6G
 ewUWADRT5jdjM93+c+xip4glwmjuO7w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-8miuuK9nN5qeopLiuQjPWw-1; Wed, 17 Nov 2021 09:44:56 -0500
X-MC-Unique: 8miuuK9nN5qeopLiuQjPWw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9ADB280D6BD;
 Wed, 17 Nov 2021 14:44:55 +0000 (UTC)
Received: from redhat.com (unknown [10.22.16.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 37B6A60BF1;
 Wed, 17 Nov 2021 14:44:54 +0000 (UTC)
Date: Wed, 17 Nov 2021 14:44:51 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] gitlab-ci: Test compilation on Windows with MSYS2
Message-ID: <YZUVY/kzy7uH0KDn@redhat.com>
References: <20211115140623.104116-1-thuth@redhat.com>
 <cba3524e-00d2-08b1-582f-1f31163fecf0@amsat.org>
 <CAJ+F1C+kTL_thUHtaQ1pxPN360E39aYA81m=8efaYrKhzXyaFw@mail.gmail.com>
 <623c1883-4ac9-e615-7a58-b0d781e19aeb@amsat.org>
 <874k8ax504.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <874k8ax504.fsf@linaro.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 17, 2021 at 01:52:57PM +0000, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
> > On 11/16/21 08:05, Marc-André Lureau wrote:
> >> Hi
> >> 
> >> On Mon, Nov 15, 2021 at 6:31 PM Philippe Mathieu-Daudé <f4bug@amsat.org
> >> <mailto:f4bug@amsat.org>> wrote:
> >> 
> >>     On 11/15/21 15:06, Thomas Huth wrote:
> >>     > Gitlab also provides runners with Windows, we can use them to
> >>     > test compilation with MSYS2, in both, 64-bit and 32-bit.
> >>     >
> >>     > However, it takes quite a long time to set up the VM, so to
> >>     > stay in the 1h time frame, we can only compile and check one
> >>     > target here.
> >> 
> >> 
> >> I wonder why gitlab does not offer the docker executor. On the
> >> freedesktop gitlab instance, they have windows docker executor, which
> >> speeds up the build time. Maybe we could also have our own Windows
> >> runner for qemu?
> >
> > We could, foss.org provides the QEMU project with x86 VMs resources
> > we are not using. What we miss is a sysadmin willing to setup &
> > maintain a such runner.
> 
> I think we might also have Azure credits from MS, but the same issues
> about admin and setup probably exist.

I've never explored this in any way, but IIUC, Azure should have
ability to run *windows* containers. If that's possible, then we
could avoid the admin burden of a VM and just use throwaway windows
containers as we do for Linux.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


