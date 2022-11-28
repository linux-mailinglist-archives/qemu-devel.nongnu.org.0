Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6054763AE69
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 18:05:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozhYc-00046Q-He; Mon, 28 Nov 2022 12:04:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ozhYY-00043P-6M
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 12:04:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ozhYW-0000wh-8c
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 12:04:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669655068;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=n3dis0waZ5Wy81s8KPZUUPgEar4iB/v2OVjL/42NjH4=;
 b=C6r1wLpyCeYB3cW2uiZrOwuG6Gl1HQFZPBwI82hSpJzMZzt8I/cNWGevZytHvPETfbwAJa
 YX6uWNAwzP7xCOEYuOClv1QoATNB5cC7jqBslnv9ncCxOoZC4Huf1ibcQYf8naJAMxq6Ty
 uVxAN8GhljnUZtP02uVLKIdLXnxGq+s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-0yq7dvBdMPGWZ3iRD0K7Nw-1; Mon, 28 Nov 2022 12:04:24 -0500
X-MC-Unique: 0yq7dvBdMPGWZ3iRD0K7Nw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E21129ABA1B;
 Mon, 28 Nov 2022 17:04:24 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8057240C6EC2;
 Mon, 28 Nov 2022 17:04:21 +0000 (UTC)
Date: Mon, 28 Nov 2022 17:04:16 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 for-8.0 0/5] scripts/make-release: Decrease size of
 the release tarballs
Message-ID: <Y4TqEDYs+T4z6PX/@redhat.com>
References: <20221128092555.37102-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221128092555.37102-1-thuth@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Nov 28, 2022 at 10:25:50AM +0100, Thomas Huth wrote:
> Our release tarballs are huge - qemu-7.2.0-rc2.tar.xz has a size of 116
> MiB. If you look at the contents, approx. 80% of the size is used for the
> firmware sources that we ship along to provide the sources for the ROM
> binaries. This feels very wrong, why do we urge users to download such
> huge tarballs while 99.9% of them never will rebuilt the firmware sources?
> We were also struggeling a bit in the past already with server load and
> costs, so we should really try to decrease the size of our release tarballs
> to a saner level.

The main reason for shipping the source in the tarball was to
guarantee license compliance for anyone who is distributing
qemu release tarballs, including ourselves.

Splitting off the firmware source, but not the firmware binaries,
means people are now at risk of not complying with the license
but failing to provide complete and corresponding source.

Technically the license requirement is only critical for GPL
licenses ROMs, but as good practice we do it for all our ROMs.

> So let's split the firmware sources into a separate tarball to decrease
> the size of the main QEMU sources tarball a lot (which should help us
> to safe a lot of traffic on the server).

With my distro maintainer hat I would rather QEMU ship neither the
ROM source, nor the ROM binaries.

Still the binaries are convenient for people doing their own QEMU
builds from source.

How about shipping two distinct options:

  qemu-x.y.z.tar.xz          (QEMU source only)
  qemu-bundled-x.y.z.tar.xz  (QEMU source + bundled ROM binaries + ROM sources)

though I'm not sure how much of an impact that will have on the download
traffic - depends what is causing the traffic.

Another option is

  qemu-x.y.z.tar.xz        (QEMU source only)
  qemu-roms-x.y.z.tar.xz   (bundled ROM binaries + ROM sources)

though this is slightly more inconvenient for users, and there's the
risk they'll use new QEMU with old ROMs.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


