Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1B131557F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 18:59:50 +0100 (CET)
Received: from localhost ([::1]:52366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9XIj-0002B5-SC
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 12:59:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l9XHl-0001ji-Gc
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 12:58:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l9XHg-0007Fg-OS
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 12:58:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612893523;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=QsuKbq3s/6Vb7Vi5ihlfCQrIBTI+B6z6MXFPAfim048=;
 b=A8T6KkS9esKWuWlcjD5z+EBzQiTNppwIB7yPdcNpRshr5xty8NQYvTn0oakQHKBkMmpwZm
 tyMemjJzI5jXSiAI8Mwk8rsvvut0hg7GeomrKYLNBedGwucurM1W8hPwsAKw79PgXXAMZ0
 sjaAAuskHyK6DDDoOtpFif/xxX6ISaY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-LGImB1h9NCyQR6bFn0ig6Q-1; Tue, 09 Feb 2021 12:58:38 -0500
X-MC-Unique: LGImB1h9NCyQR6bFn0ig6Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91411107ACF9
 for <qemu-devel@nongnu.org>; Tue,  9 Feb 2021 17:58:37 +0000 (UTC)
Received: from redhat.com (ovpn-115-66.ams2.redhat.com [10.36.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A6CE519C59;
 Tue,  9 Feb 2021 17:58:36 +0000 (UTC)
Date: Tue, 9 Feb 2021 17:58:34 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] meson: adjust timeouts for some slower tests
Message-ID: <20210209175834.GW1166421@redhat.com>
References: <20210209174541.150011-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209174541.150011-1-pbonzini@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 09, 2021 at 06:45:41PM +0100, Paolo Bonzini wrote:
> Adjust the timeouts for the longest running tests.  These are the
> times that I measured and the corresponding timeouts.  For generic
> qtests, the target that reported the longest runtime is included.
> 
> unit tests:
>     test-crypto-tlscredsx509        13.15s   60s
>     test-crypto-tlssession          14.12s   60s

The default meson timeout is 30 seconds which is enough for these
tests. Of course larger timeouts give more headroom.

If running on particularly slow environemnt (eg under TCG)
then it would be expecte dto instead use "meson --timeout-multiplier=10"
to make everything have more headroom.

So I wonder what threshold we need the extra headroom above
30 seconds in the default config ?


> qtests:
>     ide-test                        13.65s   60s
>     npcm7xx_watchdog_timer-test     15.02s   60s
>     qos-test                        21.26s   60s   (i386)
>     ahci-test                       22.18s   60s
>     pxe-test                        26.51s   90s
>     boot-serial-test                28.02s   90s   (sparc)
>     prom-env-test                   28.86s   90s
>     bios-tables-test                50.17s   90s   (aarch64)
>     test-hmp                        57.15s   90s   (aarch64)
>     npcm7xx_pwm-test                71.27s   120s
>     migration-test                  97.09s   150s  (aarch64)
>     qom-test                        139.20s  180s  (aarch64)
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tests/meson.build       |  6 ++++++
>  tests/qtest/meson.build | 15 +++++++++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/tests/meson.build b/tests/meson.build
> index 0c939f89f7..fde21b6c8f 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -237,6 +237,11 @@ test_env = environment()
>  test_env.set('G_TEST_SRCDIR', meson.current_source_dir())
>  test_env.set('G_TEST_BUILDDIR', meson.current_build_dir())
>  
> +slow_tests = {
> +  'test-crypto-tlscredsx509': 2,
> +  'test-crypto-tlssession': 2
> +}
> +
>  foreach test_name, extra: tests
>    src = [test_name + '.c']
>    deps = [qemuutil]
> @@ -254,6 +259,7 @@ foreach test_name, extra: tests
>         env: test_env,
>         args: ['--tap', '-k'],
>         protocol: 'tap',
> +       timeout: 30 * slow_tests.get(test_name, 1),
>         suite: ['unit'])
>  endforeach
>  
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 7e082be6fb..b1f8790b75 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -4,6 +4,20 @@ if not config_host.has_key('CONFIG_POSIX')
>    subdir_done()
>  endif
>  
> +slow_qtests = {
> +  'ahci-test' : 2,
> +  'bios-tables-test' : 3,
> +  'boot-serial-test' : 3,
> +  'ide-test' : 2,
> +  'migration-test' : 5,
> +  'npcm7xx_pwm-test': 4,
> +  'npcm7xx_watchdog_timer-test': 2,
> +  'prom-env-test' : 3,
> +  'pxe-test' : 3,
> +  'qos-test : 2,
> +  'qom-test' : 6,
> +  'test-hmp' : 3,
> +]
>  qtests_generic = [
>    'cdrom-test',
>    'device-introspect-test',
> @@ -272,6 +286,7 @@ foreach dir : target_dirs
>           env: qtest_env,
>           args: ['--tap', '-k'],
>           protocol: 'tap',
> +         timeout: 30 * slow_qtests.get(test_name, 1),
>           suite: ['qtest', 'qtest-' + target_base])
>    endforeach
>  endforeach
> -- 
> 2.29.2
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


