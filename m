Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4004D2E66
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 12:48:19 +0100 (CET)
Received: from localhost ([::1]:50746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRuni-0001Uq-96
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 06:48:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nRukI-0007UP-3j
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:44:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nRukF-0003A4-GM
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 06:44:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646826282;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dlQIkcmcmvUT6hgJ46+JhOLKwjR6MSsKBzCgcuxFLTE=;
 b=JIuMm1Q41fni0ZLEmX4F1Qof19bBmkUMA6oxyYcvURd4/5kTVZtvc5p2+7tPlhUafy0kHh
 Ynu8dTqYLcr6G2DpmihJwlTcs5PdzSwUfWkw25+0k0wTuJBaiQXhgHq5nhCSXucrXSZ9AH
 HWeqM+cFDbRL8rnPJzwVU1zojepQbM8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-KsAeGtUZOAu-VrZq7CyEtQ-1; Wed, 09 Mar 2022 06:44:25 -0500
X-MC-Unique: KsAeGtUZOAu-VrZq7CyEtQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF35A1091DA1;
 Wed,  9 Mar 2022 11:44:23 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F385C842C8;
 Wed,  9 Mar 2022 11:44:19 +0000 (UTC)
Date: Wed, 9 Mar 2022 11:44:16 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: MAINTAINERS: macOS host support (was: MAINTAINERS: take edk2)
Message-ID: <YiiTEAAqRIdRAlEf@redhat.com>
References: <20220308145521.3106395-1-kraxel@redhat.com>
 <20220309081607.gzoucriu7a3qxtjf@sirius.home.kraxel.org>
 <0fcec2e8-97dc-8cf5-3f9e-285a86c0b566@gmail.com>
 <2263450.oHEczLTUl7@silver>
MIME-Version: 1.0
In-Reply-To: <2263450.oHEczLTUl7@silver>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 09, 2022 at 11:40:42AM +0100, Christian Schoenebeck wrote:
> On Mittwoch, 9. März 2022 11:05:02 CET Philippe Mathieu-Daudé wrote:
> > Not sure what you have in mind. I'm totally new to the macOS/Darwin
> > world, and have no choice but to use it as primary workstation and
> > for CI builds, so I can help with overall testing / maintenance.
> > 
> > Peter, since you take some macOS patches, would you like to maintain
> > this officially? Since I doubt you want to take yet another
> > responsibility, what about having a co-maintained section, including
> > technical expertise from Akihiko / Joelle / Christian? (Cc'ed)
> > 
> > Regards,
> 
> Also CCing Cameron on this, just in case someone at Apple could spend some 
> slices on QEMU macOS patches in general as well.
> 
> As for my part: I try to help out more on the macOS front. As there's now 
> macOS host support for 9p I have to start QEMU testing on macOS locally 
> anyway. Too bad that macOS CI tests on Github are no longer available BTW.

Note QEMU gets macOS CI coverage in GitLab. We use a clever trick by
which we use 'cirrus-run' from the GitLab job to trigger a build in
Cirrus CI's macOS builders, and pull the results back when its done.

Any contributor can get this working on their QEMU fork too, if they
configure the needed Cirrus CI API token. See the docs in

   .gitlab-ci.d/cirrus/README.rst

This is enough for build + automated tests.

Obviously of limited use for testing UI functionality or general host
OS integration like audio, which pretty much requires access to a real
machine for a maintainer to use interactively.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


