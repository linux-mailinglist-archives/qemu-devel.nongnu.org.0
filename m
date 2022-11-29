Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9B663BB4E
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 09:13:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozvjt-0000BD-Nw; Tue, 29 Nov 2022 03:13:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ozvjq-00007n-8r
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 03:13:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ozvjb-00075q-Vr
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 03:13:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669709575;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vq9/URMvsDo6ESXdQZGaIqIZELyyY+1xqtKxlotdSdQ=;
 b=U0kelB+9g7vjkHkS68Vphwh49lmOXbZ9VwF+pYbOguSIpJHOB+OMUxM58Qxn/U7jGeqaW+
 nUKMNAlU3fFjFa2lmLdkrDH7LqiAnfpWJ8OZ4GhWhR7yyt4G1TCxqmCi06XiUyKvpsovtX
 P3elB3hi/QxsF36siESqkrRo143FLnI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-vBpg7L8pNfOQzctf_QUlYw-1; Tue, 29 Nov 2022 03:12:51 -0500
X-MC-Unique: vBpg7L8pNfOQzctf_QUlYw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C44FE1019C89;
 Tue, 29 Nov 2022 08:12:50 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BD744EA47;
 Tue, 29 Nov 2022 08:12:49 +0000 (UTC)
Date: Tue, 29 Nov 2022 08:12:44 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-devel <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 for-8.0 0/5] scripts/make-release: Decrease size of
 the release tarballs
Message-ID: <Y4W+/OZWjVZz75pU@redhat.com>
References: <20221128092555.37102-1-thuth@redhat.com>
 <Y4TqEDYs+T4z6PX/@redhat.com>
 <CABgObfbTBN3t-OttM9gm75yPv8-5GDrp0v_Zeob0u-mp4hSQBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABgObfbTBN3t-OttM9gm75yPv8-5GDrp0v_Zeob0u-mp4hSQBA@mail.gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Nov 28, 2022 at 08:25:24PM +0100, Paolo Bonzini wrote:
> Il lun 28 nov 2022, 18:04 Daniel P. Berrangé <berrange@redhat.com> ha
> scritto:
> 
> > With my distro maintainer hat I would rather QEMU ship neither the
> > ROM source, nor the ROM binaries.
> >
> 
> Annd since QEMU can finally cross compile its embedded firmware modules,
> too, it is now easier for distros not to use any prebuilt binary.
> 
> However some firmware sources are only available from QEMU's submodules. So
> either we distribute those submodules as separate tarballs, or distros
> would need to use the bundled tarball as well.

If the firmware doesn't exist as a standalone project, IMHO, it is
fine to bundle their sources with QEMU. If they move off into a
separate project some time in arbitrary future, they can be unbundled
at that point.

> Separately, I am not even sure what compiler is needed for the old
> Macintosh ROMs...

That we're not sure how to build some ROMS is exactly why
distros have their build everything from source policy !

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


