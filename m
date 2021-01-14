Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F9C2F69D7
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 19:46:55 +0100 (CET)
Received: from localhost ([::1]:39078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l07e2-00016y-Ig
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 13:46:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l06qo-0000PM-Pr
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:56:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l06qk-0000x9-Oz
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 12:56:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610646957;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4LTLoFGiH3fcCa/wTnMGDZQ1UpgVuWHKwRL/yvGND2Q=;
 b=AH/XOzdjzhimiD5lrYQnGJKSNtnBI11mg6OErSZ0q4CKmJScL2hNnX4NC+DMswr7rDPexI
 HLJ32UOAtoro14cvd5+CaMVeBvE+3AuPuiRuq5OcRHo1ZneZVkfdgVQXs3fwiKiMGNFrQq
 MnRVerGIf31ESpW9KG4zSQ4i68ABrxo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-nqh9G4PJPwaMorV407M48g-1; Thu, 14 Jan 2021 12:55:53 -0500
X-MC-Unique: nqh9G4PJPwaMorV407M48g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 192CF107ACF7;
 Thu, 14 Jan 2021 17:55:52 +0000 (UTC)
Received: from redhat.com (ovpn-112-150.ams2.redhat.com [10.36.112.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B6115D9C2;
 Thu, 14 Jan 2021 17:55:50 +0000 (UTC)
Date: Thu, 14 Jan 2021 17:55:47 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 08/12] docker: expand debian-amd64 image to include
 tag tools
Message-ID: <20210114175547.GX1643043@redhat.com>
References: <20210114165730.31607-1-alex.bennee@linaro.org>
 <20210114165730.31607-9-alex.bennee@linaro.org>
 <6234da80-d742-fd6f-888c-5d2f5debfea7@redhat.com>
 <20210114175245.GW1643043@redhat.com>
 <9f187737-f2d6-21d6-787e-b4a5ff655c42@redhat.com>
MIME-Version: 1.0
In-Reply-To: <9f187737-f2d6-21d6-787e-b4a5ff655c42@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Fam Zheng <fam@euphon.net>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 14, 2021 at 06:53:36PM +0100, Philippe Mathieu-Daudé wrote:
> On 1/14/21 6:52 PM, Daniel P. Berrangé wrote:
> > On Thu, Jan 14, 2021 at 06:50:36PM +0100, Philippe Mathieu-Daudé wrote:
> >> Hi Alex,
> >>
> >> On 1/14/21 5:57 PM, Alex Bennée wrote:
> >>> This is going to be helpful when we want to both test the tool
> >>> integration and in the case of global generate a xref doc build.
> >>>
> >>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> >>> ---
> >>>  tests/docker/dockerfiles/debian-amd64.docker | 5 ++++-
> >>>  1 file changed, 4 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
> >>> index 55075d9fce..a98314757d 100644
> >>> --- a/tests/docker/dockerfiles/debian-amd64.docker
> >>> +++ b/tests/docker/dockerfiles/debian-amd64.docker
> >>> @@ -1,7 +1,7 @@
> >>>  #
> >>>  # Docker x86_64 target
> >>>  #
> >>> -# This docker target builds on the debian Stretch base image. Further
> >>> +# This docker target builds on the Debian Buster base image. Further
> >>>  # libraries which are not widely available are installed by hand.
> >>>  #
> >>>  FROM qemu/debian10
> >>> @@ -14,7 +14,10 @@ RUN apt update && \
> >>>  RUN apt update && \
> >>>      DEBIAN_FRONTEND=noninteractive eatmydata \
> >>>      apt install -y --no-install-recommends \
> >>> +        cscope \
> >>>          genisoimage \
> >>> +        exuberant-ctags \
> >>> +        global \
> >>
> >> This clash with Daniel's series which seems ready (and harder
> >> to rebase):
> >>
> >> 'start using libvirt-ci's "lcitool" for dockerfiles'
> >> https://www.mail-archive.com/qemu-devel@nongnu.org/msg772839.html
> >>
> >> Do you mind getting it merged before your patch?
> > 
> > I don't mind either way. I'll have to get mappings for those three
> > packages added to libvirt-ci, so that we pull them in on the other
> > non-debian distros too. Aside from that it is no big deal.
> 
> Thanks for the quick feedback :)

Actually my answer was a tangent.  My series doesn't touch the
debian dockerfile(s) at all, only ubuntu, fedora, centos & suse.

I've left debian untouched because QEMU's handling that with layering
so it needs further consideration wrt libvirt-ci auto-generation.

IOW, there is no clash between these series

> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


