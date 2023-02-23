Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EE36A043D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 09:54:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV7M7-00067Q-In; Thu, 23 Feb 2023 03:53:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pV7M5-00067A-LQ
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 03:53:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pV7M4-0005bM-3e
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 03:53:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677142411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QKWA/FUvvE+8I1WhFJH3GESq6AQnWq5Gzt6Q9Hn3VPE=;
 b=F+WJnmOVDaplwbYOFc33L1FymJUJrEZkHOgr5NyI7h3Bp/xdS7Jyt784RJ/BGQbFWgD8d2
 LOoUVGkVAGEd/qXS/D/yWZEjqQGiF3VyzNtGdHvDHujPIM0pbJbCSTEgqGM05m/j5Nz+IS
 CiNVAPzsrj5izUKKaCFAX4jviRZYI3Q=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-314-eR3zb5CmNk6jKFoucF71Lw-1; Thu, 23 Feb 2023 03:53:30 -0500
X-MC-Unique: eR3zb5CmNk6jKFoucF71Lw-1
Received: by mail-vs1-f70.google.com with SMTP id
 v3-20020a67ff83000000b004124fe134e1so5590385vsq.23
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 00:53:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QKWA/FUvvE+8I1WhFJH3GESq6AQnWq5Gzt6Q9Hn3VPE=;
 b=I5xOTIuDCXUghr45RVSc9gO/+hvTtgKTgFzMnp7SwmESPhTNPU+UpS+m+5YD59J+QJ
 iaRFDhEbzXR38WiITafzU2I0A+vmgHD79l6Z7htJbDmldUwbh5gxjcEoDC/nQ4SdOAGK
 tL3TWtAie1+D+jNC1wN/l7jHlWfFH/QFdBxr/2XpaSJk/D1RlFz7cFoPO8g1YdCS91gv
 4uOVjfJbScusl+ey4FXxum42vjN+wMBqN91icsM/DLWgDwB14/xIsUNJcrwQwhVrZuZe
 eNnPnic7F44UodRL9u6SjhhSJHjKbkm7lB8+AoXyjdOyrkvn6oHFF86soqtH51eY76dC
 i44A==
X-Gm-Message-State: AO0yUKWmkgwSXHgn26xEV/tK23xrcAKTWzKnXvdt8g9CyCQcshb/L7cU
 XGwCE3wJ66kvSYo24hRDuOd7Y8r7EHhlxKm5Xm6IZ0jxFyBu5uPZB3caXBiR4SHnmAQr48wP1go
 2TscDqJ7H/tTEf5hBcl54RQsIlCVAbBg=
X-Received: by 2002:a1f:2cc8:0:b0:411:5a38:2006 with SMTP id
 s191-20020a1f2cc8000000b004115a382006mr682485vks.41.1677142408388; 
 Thu, 23 Feb 2023 00:53:28 -0800 (PST)
X-Google-Smtp-Source: AK7set/Wkrs7GIaUfdvRB8BNoSD4350bSb5Lszpd6QkS57oamMyeaht7cE4gIwfaLHe83W1aqMEqNDJEL9Ouz4kNRak=
X-Received: by 2002:a1f:2cc8:0:b0:411:5a38:2006 with SMTP id
 s191-20020a1f2cc8000000b004115a382006mr682479vks.41.1677142408084; Thu, 23
 Feb 2023 00:53:28 -0800 (PST)
MIME-Version: 1.0
References: <20230221012456.2607692-1-jsnow@redhat.com>
 <20230221012456.2607692-6-jsnow@redhat.com>
 <87o7pnzf4d.fsf@pond.sub.org>
 <CAFn=p-aYtKwFUpHH+4TYGKKNhVreUL+KSLKjzPvDbxiMr9eN3g@mail.gmail.com>
 <87bklmrx1y.fsf@pond.sub.org>
 <CAFn=p-aiM+8280+xUrJNqh7+uzK6JLmiwEjKBdob_fLR_Mss_Q@mail.gmail.com>
In-Reply-To: <CAFn=p-aiM+8280+xUrJNqh7+uzK6JLmiwEjKBdob_fLR_Mss_Q@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 23 Feb 2023 09:53:16 +0100
Message-ID: <CABgObfZ8SSvSAjTj2OskGDc6sqO3ap3GPFJ6-u_ZJcSZQQ3XcA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] meson: prefer 'sphinx-build' to 'sphinx-build-3'
To: John Snow <jsnow@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Michael Roth <michael.roth@amd.com>, Thomas Huth <thuth@redhat.com>, 
 Qemu-block <qemu-block@nongnu.org>, Cleber Rosa <crosa@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Daniel Berrange <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Feb 23, 2023 at 5:40 AM John Snow <jsnow@redhat.com> wrote:> >
For what it's worth, python3-sphinx-5.0.2-2.fc37.noarch provides
> >
> >     /usr/bin/sphinx-build
> >     /usr/bin/sphinx-build-3
> >     /usr/bin/sphinx-build-3.11
> >
> > where the latter two are symbolic links to the first.  No need to check
> > for sphinx-build-3 here.
>
> Oh, I see. I guess it should be fine, but only if we explicitly drop
> support for the 3.6 version that comes with CentOS. I'm not entirely
> sure if "sphinx-build-3" is used anywhere else, I *think* it's just an
> rpm-ism.

Are you sure CentOS has a problem there?  I checked
python3-sphinx-1.7.6-3.el8 and it has sphinx-build as a symlink too:

$ rpm2cpio ../python3-sphinx-1.7.6-3.el8.noarch.rpm |cpio -idv
$ ls -l usr/bin/
total 16
-rwxr-xr-x. 1 pbonzini users 403 Feb 23 09:50 sphinx-apidoc
lrwxrwxrwx. 1 pbonzini users  13 Feb 23 09:50 sphinx-apidoc-3 -> sphinx-apidoc
lrwxrwxrwx. 1 pbonzini users  13 Feb 23 09:50 sphinx-apidoc-3.6 -> sphinx-apidoc
-rwxr-xr-x. 1 pbonzini users 405 Feb 23 09:50 sphinx-autogen
lrwxrwxrwx. 1 pbonzini users  14 Feb 23 09:50 sphinx-autogen-3 -> sphinx-autogen
lrwxrwxrwx. 1 pbonzini users  14 Feb 23 09:50 sphinx-autogen-3.6 ->
sphinx-autogen
-rwxr-xr-x. 1 pbonzini users 401 Feb 23 09:50 sphinx-build
lrwxrwxrwx. 1 pbonzini users  12 Feb 23 09:50 sphinx-build-3 -> sphinx-build
lrwxrwxrwx. 1 pbonzini users  12 Feb 23 09:50 sphinx-build-3.6 -> sphinx-build
-rwxr-xr-x. 1 pbonzini users 411 Feb 23 09:50 sphinx-quickstart
lrwxrwxrwx. 1 pbonzini users  17 Feb 23 09:50 sphinx-quickstart-3 ->
sphinx-quickstart
lrwxrwxrwx. 1 pbonzini users  17 Feb 23 09:50 sphinx-quickstart-3.6 ->
sphinx-quickstart

And it's 3.6-based:

$ ls -l usr/lib
total 0
drwxr-xr-x. 3 pbonzini users 27 Feb 23 09:50 python3.6
$ head -4 usr/bin/sphinx-build
#!/usr/libexec/platform-python
# EASY-INSTALL-ENTRY-SCRIPT: 'Sphinx==1.7.6','console_scripts','sphinx-build'
__requires__ = 'Sphinx==1.7.6'
import re

This alternative, simpler patch should do it:

diff --git a/docs/meson.build b/docs/meson.build
index 9136fed3b730..1ab5a9882018 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -1,10 +1,5 @@
-if get_option('sphinx_build') == ''
-  sphinx_build = find_program(['sphinx-build-3', 'sphinx-build'],
-                              required: get_option('docs'))
-else
-  sphinx_build = find_program(get_option('sphinx_build'),
-                              required: get_option('docs'))
-endif
+sphinx_build = find_program(get_option('sphinx_build'),
+                            required: get_option('docs'))

 # Check if tools are available to build documentation.
 build_docs = false
diff --git a/meson_options.txt b/meson_options.txt
index 7e5801db90f9..92440429b1d0 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -12,7 +12,7 @@ option('pkgversion', type : 'string', value : '',
        description: 'use specified string as sub-version of the package')
 option('smbd', type : 'string', value : '',
        description: 'Path to smbd for slirp networking')
-option('sphinx_build', type : 'string', value : '',
+option('sphinx_build', type : 'string', value : 'sphinx-build',
        description: 'Use specified sphinx-build for building document')
 option('iasl', type : 'string', value : '',
        description: 'Path to ACPI disassembler')

Paolo


