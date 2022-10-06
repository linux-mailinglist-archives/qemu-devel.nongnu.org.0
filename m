Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 418175F6419
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 12:04:13 +0200 (CEST)
Received: from localhost ([::1]:35414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogNjc-0003Oc-E9
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 06:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ogNLh-0002yG-Ao
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 05:39:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ogNLc-000760-PC
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 05:39:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665049158;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZuWdDviIFBRRPZvPy/lVWGC9QEwzAN00z++PPZu/0ZU=;
 b=Q5uD0DG3e97cMPNYQSjJWdvl4ECimOc4jv5O1B6k+awkL4ni2lUhpJIoh0xPxtOeMiLr8/
 4cOloy/zUU0VURJgkmbSpYXQyPdRnCGCYp/VgMVklLuU72Uoy+q/ETTXHz2sSnTr7+BQJn
 sqICrZhnUvyvg2KkG76vm3Y/47lcydU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-4tEw1h6dNoeHpRfkp9_K4g-1; Thu, 06 Oct 2022 05:39:17 -0400
X-MC-Unique: 4tEw1h6dNoeHpRfkp9_K4g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D97A2185A7A9;
 Thu,  6 Oct 2022 09:39:16 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFDF8145B961;
 Thu,  6 Oct 2022 09:39:04 +0000 (UTC)
Date: Thu, 6 Oct 2022 10:39:02 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, jb-gnumlists@wisemo.com, thuth@redhat.com,
 jasowang@redhat.com, qemu_oss@crudebyte.com
Subject: Re: [PATCH v2] build-sys: error when slirp is not found and not
 disabled
Message-ID: <Yz6iNj5vTrMlunD2@redhat.com>
References: <20221006083322.2612639-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221006083322.2612639-1-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 06, 2022 at 12:33:22PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> This is an alternative configure-time solution to "[PATCH] net:
> print a more actionable error when slirp is not found".
> 
> See also "If your networking is failing after updating to the latest git
> version of QEMU..." ML thread.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  meson.build | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/meson.build b/meson.build
> index 4321b8f8da..b05080b051 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -690,6 +690,13 @@ if not get_option('slirp').auto() or have_system
>    endif
>  endif
>  
> +# Remove this error after QEMU 8.1 has been released.
> +if not get_option('slirp').disabled() and not slirp.found()
> +  error('libslirp is not explicitely disabled and was not found. ' +
> +        'Since qemu 7.2, libslirp is no longer included as a submodule ' +
> +        'fallback, you must install it on your system or --disable-slirp.')
> +endif
> +

I'm still not convinced we should be making this a fatal error, as
opposed to treating it as a warning we display at the end of meson
execution, which is what we do in other cases where we want to
alert users to something important about their build environment.


We have this for example:

  message()
  warning('SUPPORT FOR THIS HOST CPU WILL GO AWAY IN FUTURE RELEASES!')
  message()
  message('CPU host architecture ' + cpu + ' support is not currently maintained.')
  message('The QEMU project intends to remove support for this host CPU in')
  message('a future release if nobody volunteers to maintain it and to')
  message('provide a build host for our continuous integration setup.')
  message('configure has succeeded and you can continue to build, but')
  message('if you care about QEMU on this platform you should contact')
  message('us upstream at qemu-devel@nongnu.org.')


This is just as important to show users as the slirp case IMHO, so
it isn't clear why this approach is insufficient for slirp too.


One irritation though, is that there's no way to get this text to
display *after* meson prints the summary() data, so it is likely
scrolled off the screen.

I think 'summary()'  ought to have a way to register warning messages
that are guaranteed to be the last thing printed, with boldness.

In absence of that, we can partially mitigate this by using a custom
summary section though.

Consider this:

@@ -3936,3 +3937,20 @@ if not supported_oses.contains(targetos)
   message('if you care about QEMU on this platform you should contact')
   message('us upstream at qemu-devel@nongnu.org.')
 endif
+
+warning_info = {}
+
+# Remove this warning after QEMU 8.1 has been released.
+if not get_option('slirp').disabled() and not slirp.found()
+    warning_info += {'SLIRP': 'libslirp not present, "user" network backend will not be available'}
+    message()
+    warning('libslirp not present, "user" network backend will not be available')
+    message()
+    message('Since qemu 7.2, libslirp is no longer included as a submodule')
+    message('fallback, you must install it on your system if you require')
+    message('-netdev user / -net user to be a supported network backend')
+    message()
+endif
+
+summary(warning_info, bool_yn: true,
+        section: 'WARNINGS 💥 WARNINGS 💥 WARNINGS 💥 WARNINGS 💥 WARNINGS')

Would mean that meson/configures ends  with:




Message:
../meson.build:3946: WARNING: libslirp not present, "user" network backend will not be available
Message:
Message: Since qemu 7.2, libslirp is no longer included as a submodule
Message: fallback, you must install it on your system if you require
Message: -netdev user / -net user to be a supported network backend
Message:
Build targets in project: 576

qemu 7.1.50

  Directories
    Install prefix               : /usr/local
    BIOS directory               : share/qemu
    firmware path                : share/qemu-firmware

...snip a page or two more summary...

    zstd support                 : YES 1.5.2
    NUMA host support            : YES
    capstone                     : YES 4.0.2
    libpmem support              : YES 1.11.1
    libdaxctl support            : YES 74
    libudev                      : YES 250
    FUSE lseek                   : YES
    selinux                      : YES 3.3

  WARNINGS 💥 WARNINGS 💥 WARNINGS 💥 WARNINGS 💥 WARNINGS
    SLIRP                        : libslirp not present, "user" network backend will not be available

  Subprojects
    libvduse                     : YES
    libvhost-user                : YES

  User defined options
    Native files                 : config-meson.cross
    prefix                       : /usr/local
    werror                       : true
    vfio_user_server             : disabled

Found ninja-1.10.2 at /usr/bin/ninja
Running postconf script '/usr/bin/python3 /home/berrange/src/virt/qemu/scripts/symlink-install-tree.py'



Is that really not sufficiently alerting to users that they might be
loosing the 'user' network feature ?

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


