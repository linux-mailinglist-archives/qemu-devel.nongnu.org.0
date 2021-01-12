Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CDE2F3C69
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 23:37:59 +0100 (CET)
Received: from localhost ([::1]:42854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzSIY-0008Mg-No
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 17:37:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kzSHn-0007wf-TN
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 17:37:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kzSHl-0007nS-8V
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 17:37:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610491028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=y6aUjUT5/iMZURFmulSG6IsrwiBlOOmvlsfYGryJr2o=;
 b=XTGNzgithjD89gRfn4zG2QxUmw/jsUFXyB//Co/44W8S+1U/XN3S/jfwdGX502O73nMLpN
 +Pc4tvy1g6tCxSpGOnQS3rE5TySnEyCbMDQXMoO38Hy6cMkeAOTnB+oezb48bSHMllA35Z
 5XMyaJJGjD45hvptjYLwhtilMuKKPWw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-QF30-rTfM4Wqi4aPjX2U6Q-1; Tue, 12 Jan 2021 17:37:03 -0500
X-MC-Unique: QF30-rTfM4Wqi4aPjX2U6Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39F821800D42;
 Tue, 12 Jan 2021 22:37:02 +0000 (UTC)
Received: from [10.10.120.151] (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C57D060CEB;
 Tue, 12 Jan 2021 22:37:01 +0000 (UTC)
To: QEMU Developers <qemu-devel@nongnu.org>
From: John Snow <jsnow@redhat.com>
Subject: minimal "zero conf" build dockerfiles for fedora:latest and
 alpine:latest
Message-ID: <a2f5077b-ae74-2b39-4fb8-70d29dd549eb@redhat.com>
Date: Tue, 12 Jan 2021 17:37:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I wanted to know what the minimal setup required was to replicate the 
compilation instructions featured on https://www.qemu.org/download/#source

 > wget https://download.qemu.org/qemu-5.2.0.tar.xz
 > tar xvJf qemu-5.2.0.tar.xz
 > cd qemu-5.2.0
 > ./configure
 > make

For fedora:latest, I found that to be:

----

FROM fedora:latest

ENV PACKAGES \
       wget \
       xz \
       ninja-build \
       gcc \
       glib2-devel \
       pixman-devel \
       bzip2 \
       diffutils \
       perl

ENV QEMU_CONFIGURE_OPTS ""

RUN dnf install -y $PACKAGES && \
     rpm -q $PACKAGES | sort > /packages.txt

RUN wget https://download.qemu.org/qemu-5.2.0.tar.xz && \
     tar xvJf qemu-5.2.0.tar.xz

WORKDIR /qemu-5.2.0
RUN ./configure $QEMU_CONFIGURE_OPTS && \
     make -j9

----

Notes:

- our configure file suggests bzip2 is an optional dependency (It's set 
to 'auto') but meson will error out if it is not present at 
configuration time:

     ../pc-bios/meson.build:5:2: ERROR: Program 'bzip2' not found

- diffutils is required for the qapi-schema test, which runs at build time.

- early on in the build process, an error "bash: find: command not 
found" can be seen, but it doesn't seem to cause a failure otherwise.

- perl is not declared as a hard pre-requisite during configure time, 
but the build will error out if it is not present:

[254/8314] Generating texture-blit-frag.h with a meson_exe.py custom command
FAILED: ui/shader/texture-blit-frag.h
/usr/bin/python3 /qemu-5.2.0/meson/meson.py --internal exe --capture 
ui/shader/texture-blit-frag.h -- /usr/bin/env perl 
/qemu-5.2.0/scripts/shaderinclude.pl ../ui/shader/texture-blit.frag
/usr/bin/env: ‘perl’: No such file or directory



I wanted to try with alpine for the sake of a dependency audit. It isn't 
quite "zero conf", but I did get it working by disabling linux-user:

----

FROM alpine:latest

ENV PACKAGES \
     wget \
     xz \
     python3 \
     ninja \
     gcc \
     musl-dev \
     pkgconfig \
     glib-dev \
     pixman-dev \
     make \
     bash \
     perl

ENV QEMU_CONFIGURE_OPTS --disable-linux-user

RUN apk add $PACKAGES

RUN wget https://download.qemu.org/qemu-5.2.0.tar.xz && \
     tar xvJf qemu-5.2.0.tar.xz

WORKDIR /qemu-5.2.0
RUN ./configure $QEMU_CONFIGURE_OPTS && \
     make -j9

----

Notes:

- "ninja" actually installs "samurai", but it appears to work.

- musl seems to work alright, but does throw a ton of warnings. I didn't 
actually run any tests, since they require more dependencies.

- bash has to be installed explicitly. configure/meson do not check for 
it, but the build will fail if they aren't present.

- linux-user binaries can't be compiled because alpine's usage of musl; 
I didn't look much more closely.



Takeaways:

- You really don't need a lot to build a minimal QEMU. Even the alpine 
package list is pretty small.

- meson seems to be handling "absolutely everything is missing" 
environments pretty well.

- There are a scant handful of dependencies that could be added to 
configure, but you are very likely not to be missing them, so it's low 
priority.


--js


