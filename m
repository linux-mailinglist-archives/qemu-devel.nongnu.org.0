Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A314F61979C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 14:20:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqwc8-0005KF-4n; Fri, 04 Nov 2022 09:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oqwc5-0005Jm-VB
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 09:20:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oqwbv-0007mn-Gh
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 09:19:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667567990;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HFe38U1n76Sr/czLMQBg40yfktjJyuX9HsmXhAcT7ss=;
 b=ZQBrQXVI2krDAn3dWi+Rn80Kz24vjrM8BSeAYOad2N4/AszmCOdoZDdP7vIspDZcwSvEDy
 lAhJes+ZXn8vEOq/30rxFHOzji7mabxtXuuB6DpRu3Ysxw7fQHhEB5c/o7VoucitN/Ekmb
 a1VkHMQ5yLcnyG9iLfiFgZ8nKoAcSpk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-GfiExQTtOsmdFcRKWuPERA-1; Fri, 04 Nov 2022 09:19:47 -0400
X-MC-Unique: GfiExQTtOsmdFcRKWuPERA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 488BD3826A44;
 Fri,  4 Nov 2022 13:19:47 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1EE4C15BA4;
 Fri,  4 Nov 2022 13:19:45 +0000 (UTC)
Date: Fri, 4 Nov 2022 13:19:43 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 2/2] gitlab: show configure/make args before running
Message-ID: <Y2URb1qkDbSdDmmd@redhat.com>
References: <20221103173044.3969425-1-berrange@redhat.com>
 <20221103173044.3969425-3-berrange@redhat.com>
 <CAJSP0QW_soqfj9d=6nkvzMPUzZGwzhfRDXg7QK4Q8OkNCO1+xw@mail.gmail.com>
 <395832eb-2eb6-bdf6-21c1-0f643b0bbf58@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <395832eb-2eb6-bdf6-21c1-0f643b0bbf58@linaro.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Nov 04, 2022 at 08:31:31AM +1100, Richard Henderson wrote:
> On 11/4/22 06:06, Stefan Hajnoczi wrote:
> > On Thu, 3 Nov 2022 at 13:30, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > 
> > > When debugging failed jobs it is helpful to see the
> > > full configure/make args used, without having to search
> > > the gitlab config file to figure it out.
> > > 
> > > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > > ---
> > >   .gitlab-ci.d/buildtest-template.yml  |  4 ++++
> > >   .gitlab-ci.d/crossbuild-template.yml | 15 +++++++++++++++
> > >   2 files changed, 19 insertions(+)
> > 
> > On IRC Mark suggested sh -xc "$CMD" to avoid duplication. I'm not sure
> > how to get escaping right though.
> 
> set -x && ../configure ... ?

I tried adding 'set -x' to the script: blocks too. It turns out that
gitlab has an  echo '$CMD' for each line in the yaml script: section

IOW, with my patch here we get a log that looks like

$ mkdir build
$ cd build
$ if test -n "$TARGETS"; then echo "../configure --enable-werror --disable-docs ${LD_JOBS:+--meson=git} $CONFIGURE_ARGS --target-list=\"$TARGETS\"" ; ../configure --enable-werror --disable-docs ${LD_JOBS:+--meson=git} $CONFIGURE_ARGS --target-list="$TARGETS" ; else echo "../configure --enable-werror --disable-docs ${LD_JOBS:+--meson=git} $CONFIGURE_ARGS" ; ../configure --enable-werror --disable-docs ${LD_JOBS:+--meson=git} $CONFIGURE_ARGS ; fi || { cat config.log meson-logs/meson-log.txt && exit 1; }
../configure --enable-werror --disable-docs  --disable-gcrypt --enable-nettle --enable-docs --enable-fdt=system --enable-slirp --enable-capstone --target-list="tricore-softmmu microblaze-softmmu mips-softmmu xtensa-softmmu m68k-softmmu riscv32-softmmu ppc-softmmu sparc64-softmmu"


and with adding 'set -x' we get


++ echo '$ mkdir build'
$ mkdir build
++ mkdir build
++ echo '$ cd build'
$ cd build
++ cd build
++ echo '$ if test -n "$TARGETS"; then ../configure --enable-werror --disable-docs ${LD_JOBS:+--meson=git} $CONFIGURE_ARGS --target-list="$TARGETS" ; else ../configure --enable-werror --disable-docs ${LD_JOBS:+--meson=git} $CONFIGURE_ARGS ; fi || { cat config.log meson-logs/meson-log.txt && exit 1; }'
$ if test -n "$TARGETS"; then ../configure --enable-werror --disable-docs ${LD_JOBS:+--meson=git} $CONFIGURE_ARGS --target-list="$TARGETS" ; else ../configure --enable-werror --disable-docs ${LD_JOBS:+--meson=git} $CONFIGURE_ARGS ; fi || { cat config.log meson-logs/meson-log.txt && exit 1; }
++ test -n 'tricore-softmmu microblaze-softmmu mips-softmmu xtensa-softmmu m68k-softmmu riscv32-softmmu ppc-softmmu sparc64-softmmu'
++ ../configure --enable-werror --disable-docs --disable-gcrypt --enable-nettle --enable-docs --enable-fdt=system --enable-slirp --enable-capstone '--target-list=tricore-softmmu microblaze-softmmu mips-softmmu xtensa-sof


Doing 'set -x && configure' only marginally helps, as the 'set -x' still
takes effect for all commands that come after configure too.


The other option is to not do either 'echo' not 'set -x', and instead
do this:

  printenv | grep -v -E "(CI_|GITLAB)"

so that the build logs has a dump of any env vars set. So when seeing

./configure $CONFIGURE_ARGS

we have a record of what $CONFIGURE_ARGS was set to.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


