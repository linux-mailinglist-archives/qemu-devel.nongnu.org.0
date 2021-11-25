Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5EA45D852
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 11:36:50 +0100 (CET)
Received: from localhost ([::1]:51536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqC7T-0006Tr-RD
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 05:36:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mqC6A-0005Ej-5P
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 05:35:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mqC66-00082r-FJ
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 05:35:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637836521;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TK2JpcWns58A6yWrRp26bGJJbhzAefmKKmgJOE4MwQY=;
 b=bZQXGjwuF8LTvgQb3P0ldq4QH71xC62ZuLhuKXXBt+g5uQKMoZhmymdPcGXUdvlbsWADSb
 6BMI5qGmeF+c7rJGgZcIQ22s5DooFSPJahHeutbuh25Nl06Hc8gefXYHw/SB3RO95GSaJN
 VgRYZOxZjjARMWwvXoIuTqIATbDU28I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-560-DdUpU0Q6NnSUATTqzT5G3w-1; Thu, 25 Nov 2021 05:35:14 -0500
X-MC-Unique: DdUpU0Q6NnSUATTqzT5G3w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B63661800D41;
 Thu, 25 Nov 2021 10:35:13 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46CBA79446;
 Thu, 25 Nov 2021 10:35:11 +0000 (UTC)
Date: Thu, 25 Nov 2021 10:35:08 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: Give the fosshost.org VM a purpose or a retirement
Message-ID: <YZ9m3Fx2ufyGIEG8@redhat.com>
References: <CA+bd_6JS0t_COHiw2Y3Ej1gAeOGVTScNoS-=Seo+7udAe5wqZw@mail.gmail.com>
 <cc136013-2632-c149-d258-e2e7f964b07f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cc136013-2632-c149-d258-e2e7f964b07f@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Warner Losh <imp@bsdimp.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 24, 2021 at 03:55:55PM +0100, Philippe Mathieu-Daudé wrote:
> On 11/24/21 15:16, Cleber Rosa wrote:
> > Hi,
> > 
> > Fosshost.org was kind enough to supply the QEMU project with a public
> > VM hosted by them.  The original use case we anticipated was to set up
> > a GitLab CI runner, because we assumed the VM was KVM capable, but
> > that turned out not to be the case.
> > 
> > So, at this point, adding it as a GitLab CI runner would not add any
> > significant improvement over the shared runners already provided, and
> > it would require more maintenance effort.
> > 
> > If there are any ideas for making use of this resource, and volunteers
> > to configure and maintain it, please let me know.
> > 
> > Otherwise, it seems fair to relinquish the resource back to Fosshost.org.
> 
> Cc'ing Warner, since for FreeBSD testing we use Cirrus-CI (via
> libvirt-ci and have sometime hit GitLab timeout)

We're not seeing timeouts since we dropped the redundant jobs that
were running on master.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


