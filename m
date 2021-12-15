Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8984A475690
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 11:38:03 +0100 (CET)
Received: from localhost ([::1]:54074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxRfe-0001Vw-FG
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 05:38:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxRY6-0000hQ-O8
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:30:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxRY2-0006oB-L4
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:30:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639564209;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Rb4dJjQBFXybt9IhAECeYV2/4iwAwioU6KV7qZY15Yc=;
 b=GWDaK0yq7Ql/6r6OZ9VnP0wzVNDe6l0PoitAdJaGoMHfJS3OiYJaa5SLkee4QaTYOWp6hi
 ddFnDLCiuwi7eSISH95YMUm8OCz34puVZC4oCQoFs57QDh5IQ+OUpnMLw/e/3CrIZ3VLAB
 KzVyR69jq7FDk0p/u0xcsF9UmOMOBSw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-182-azZZtvWiM9q5i1om-JIBHQ-1; Wed, 15 Dec 2021 05:30:04 -0500
X-MC-Unique: azZZtvWiM9q5i1om-JIBHQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FE581808324;
 Wed, 15 Dec 2021 10:30:03 +0000 (UTC)
Received: from redhat.com (unknown [10.22.8.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E97E62731;
 Wed, 15 Dec 2021 10:29:37 +0000 (UTC)
Date: Wed, 15 Dec 2021 10:29:34 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: Building QEMU as a shared library
Message-ID: <YbnDjtTCFXA6WVAx@redhat.com>
References: <PA4PR09MB4880FF47C3A6E249E55B80E2EB769@PA4PR09MB4880.eurprd09.prod.outlook.com>
 <Ybm5VNnZDtPzku3m@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <Ybm5VNnZDtPzku3m@stefanha-x1.localdomain>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Amir Gonnen <amir.gonnen@neuroblade.ai>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 15, 2021 at 09:45:56AM +0000, Stefan Hajnoczi wrote:
> On Wed, Dec 15, 2021 at 08:18:53AM +0000, Amir Gonnen wrote:
> > Before sending a patch, I would like to check if it's of interest to the community.
> > 
> > My goal is to simulate a mixed architecture system.
> > Today QEMU strongly assumes that the simulated system is a *single architecture*.
> > Changing this assumption and supporting mixed architecture in QEMU proved to be
> > non-trivial and may require significant development effort. Common code such as
> > TCG and others explicitly include architecture specific header files, for example.
> 
> Hi Amir,
> Simulating heterogenous machines comes up from periodically. So far no
> one has upstreamed a solution but there is definitely interest.
> 
> I suggest going ahead and posting the code even if it's not cleaned up.
> 
> > A possible solution, discussed on https://stackoverflow.com/q/63229262/619493 is to
> > separate the simulation to multiple processes (as done by Xilinx) and to use some form
> > of Interprocess Communication channel between them.
> > Such solution has several disadvantages:
> > 
> > - Harder to synchronize simulation between processes
> > - Performance impact of Interprocess Communication
> > - Harder to debug, profile and maintain
> > 
> > Instead, I would like to suggest a new approach we use at Neuroblade to achieve this:
> > Build QEMU as a shared library that can be loaded and used directly in a larger simulation.
> > Today we build qemu-system-nios2 shared library and load it from qemu-system-x86_64 in order
> > to simulate an x86_64 system that also consists of multiple nios2 cores.
> > In our simulation, two independent "main" functions are running on different threads, and
> > simulation synchronization is reduced to synchronizing threads.
> > 
> > To achieve this, I needed to do the following changes in QEMU:
> > 
> > 1. Avoid Glib global context. Use a different context (g_main_context_new) for each QEMU instance.
> > 2. Change meson.build to build QEMU as a shared library (with PIC enabled for static libraries)
> > 3. Define a C API for the library and export it (with a -Wl,--version-script)

I'm curious what kind of scope the C API has and whether it is likely to
conflict with any general plans we have for future evolution to QEMU's
design, especially around configuration / CLI.

In your example where the client loading the QEMU shared library is
QEMU itself, the licensing doesn't become an issue, as everything
is within the same project codebase.

If the shared library were exposed to consumers outside of the
QEMU project, then licensing is a significant stumbling block,
as any consumer has to be GPL-v2-only compatible. It is pretty
easy to get into a license incompatibility situation with this
requirement. I fear alot of people would just ignore this as an
"inconvenience" and knowingly use incompatible code.

Both of these issues could be avoided if we make any shuared
library a QEMU-internal thing, by not installing any headers
and doing something to ensure its ABI changes on every build.

> > These changes seem enough for simulating mixed architecture system on a single process.
> > 
> > If this approach sounds useful, I'll be happy to send patches.
> > I'd appreciate if you could provide your feedback!
> 
> I'm curious how much synchronization and IPC there is between the QEMU
> shared libraries? I would have guessed that the pain of making
> communication work efficiently between processes would be less than the
> pain of solving global state bugs related to shared libraries within a
> single process.

We've already got ability to have device backends run in separate
processes with vhost-user, and have various other efforts underway
to support more generalized out of tree device implementations.
With this direction in mind, it feels conceptually desirable  if
we are able to support heterogenous CPU emulation using co-operating
processes too, as opposed to a monolithic process architecture.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


