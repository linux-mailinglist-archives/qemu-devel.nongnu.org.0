Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3992156BA80
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 15:17:26 +0200 (CEST)
Received: from localhost ([::1]:41302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9nrI-0002gT-Ox
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 09:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9nnX-0001Dg-EX
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 09:13:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9nnN-0004d6-Ng
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 09:13:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657285997;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xSUp2E0tYMGibNvQjaOgkkqhvoUsGKcb2J8EoTjosqU=;
 b=Z/+TE+CXBr1wd6dF9ljXddBo0NksMgfTnPnYfE7DVn/1VlDF4drZw9STDK8w26qrevZ+rg
 nycuNO/MCGgKoCNwQR4hnQyQUn45Ep3gImUhKiR8h74PDwJhhZai5/7QRMPMOa3WYGIDwb
 uHEL/tO+xzrK/IK/zfv042Nyelfd7WE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-TUk80wlDOhKld76DisUBWg-1; Fri, 08 Jul 2022 09:13:15 -0400
X-MC-Unique: TUk80wlDOhKld76DisUBWg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4DD9811E87;
 Fri,  8 Jul 2022 13:13:14 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B984E18EAA;
 Fri,  8 Jul 2022 13:13:13 +0000 (UTC)
Date: Fri, 8 Jul 2022 14:13:10 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: Intermittent meson failures on msys2
Message-ID: <YsgtZo/dQPT58Sfm@redhat.com>
References: <c27c93e9-c6e9-1d12-8b45-41c34065a977@linaro.org>
 <CAJ+F1CLQ6Y-tzcjwQeL=EO21+v+_49F85E2fnEcN170Gb89kjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1CLQ6Y-tzcjwQeL=EO21+v+_49F85E2fnEcN170Gb89kjw@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Fri, Jul 08, 2022 at 04:41:48PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Mon, Jun 27, 2022 at 6:41 AM Richard Henderson <
> richard.henderson@linaro.org> wrote:
> 
> > Hi guys,
> >
> > There's an occasional failure on msys2, where meson fails to capture the
> > output of a build
> > script.  E.g.
> >
> > https://gitlab.com/qemu-project/qemu/-/jobs/2642051161
> >
> > FAILED: ui/input-keymap-qcode-to-linux.c.inc
> > "C:/GitLab-Runner/builds/qemu-project/qemu/msys64/mingw64/bin/python3.exe"
> > "C:/GitLab-Runner/builds/qemu-project/qemu/meson/meson.py" "--internal"
> > "exe" "--capture"
> > "ui/input-keymap-qcode-to-linux.c.inc" "--"
> > "C:/GitLab-Runner/builds/qemu-project/qemu/msys64/mingw64/bin/python3.exe"
> > "../ui/keycodemapdb/tools/keymap-gen" "code-map" "--lang" "glib2"
> > "--varname"
> > "qemu_input_map_qcode_to_linux" "../ui/keycodemapdb/data/keymaps.csv"
> > "qcode" "linux"
> > [301/1665] Generating input-keymap-qcode-to-qnum.c.inc with a custom
> > command (wrapped by
> > meson to capture output)
> > ninja: build stopped: subcommand failed.
> >
> >
> > https://gitlab.com/qemu-project/qemu/-/jobs/2625836697
> >
> > FAILED: ui/shader/texture-blit-frag.h
> > "C:/GitLab-Runner/builds/qemu-project/qemu/msys64/mingw64/bin/python3.exe"
> > "C:/GitLab-Runner/builds/qemu-project/qemu/meson/meson.py" "--internal"
> > "exe" "--capture"
> > "ui/shader/texture-blit-frag.h" "--" "perl"
> > "C:/GitLab-Runner/builds/qemu-project/qemu/scripts/shaderinclude.pl"
> > "../ui/shader/texture-blit.frag"
> > [313/1663] Generating texture-blit-vert.h with a custom command (wrapped
> > by meson to
> > capture output)
> > ninja: build stopped: subcommand failed.
> >
> >
> > Could you have a look please?
> >
> >
> >
> Ah, we don't have artifacts for msys2 builds it seems, that would perhaps
> help. It would make sense to at least take meson-logs/*.txt. I'll work on a
> patch.
> 
> My guess is that CI randomly fails with "too many opened files", as I have
> seen that regularly on various projects with Windows runners. And here,
> it's probably reaching limits when running python/perl scripts
> simultaneously... I don't see an easy way to solve that if that's the issue.

There shouldn't be very much parallelism even taking place, because

https://docs.gitlab.com/ee/ci/runners/saas/windows_saas_runner.html

says  "Windows runners execute your CI/CD jobs on n1-standard-2 
       instances with 2 vCPUs and 7.5 GB RAM. "

unless ninja is setting a parellism much higher than nCPUs ?


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


