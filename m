Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B92495013
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 15:26:27 +0100 (CET)
Received: from localhost ([::1]:34552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAYOQ-0007sz-NA
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 09:26:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nAVg3-0006RW-CI
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 06:32:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nAVg1-000733-Ov
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 06:32:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642678345;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dvUMFSlUX+TNvP8JB1UoKbWUuFAKE3Db7X7w7K+gm6s=;
 b=K6Puy+80xbIaAqqEKh+XrtOesTuZaN9o8Tnp3KrL/LxkN2mXhoD1gNTdBJSKoAmaAC+TCs
 q+Fz2cOqlDLhV9Bhkj+m4djEtfCjG5saARgl6aZKAVY+GUOBAbnJq7mKpEFDSy3hVReLIp
 KM8SNj8yb7f+50mczrB7Ci5OBgmK3HU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-YoMl9-ToMUycfSC9lhg0Dg-1; Thu, 20 Jan 2022 06:32:21 -0500
X-MC-Unique: YoMl9-ToMUycfSC9lhg0Dg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CC8618C8C00;
 Thu, 20 Jan 2022 11:32:20 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D577A752CE;
 Thu, 20 Jan 2022 11:32:06 +0000 (UTC)
Date: Thu, 20 Jan 2022 11:32:03 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 5/6] tests/lcitool: Remove libxml2
Message-ID: <YelIMyyJFKoMSqud@redhat.com>
References: <20220120110545.263404-1-f4bug@amsat.org>
 <20220120110545.263404-6-f4bug@amsat.org>
 <YelELTScffI7Ln7R@redhat.com>
 <c38f570a-3fde-e5ae-a427-895e9841b52b@amsat.org>
 <67f7c8de-ea0a-0728-b3a4-38c7db0b9ae4@amsat.org>
MIME-Version: 1.0
In-Reply-To: <67f7c8de-ea0a-0728-b3a4-38c7db0b9ae4@amsat.org>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Ed Maste <emaste@freebsd.org>, qemu-block@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Andrea Bolognani <abologna@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 20, 2022 at 12:21:01PM +0100, Philippe Mathieu-Daudé wrote:
> (+Andrea)
> 
> On 1/20/22 12:18, Philippe Mathieu-Daudé wrote:
> > On 1/20/22 12:14, Daniel P. Berrangé wrote:
> >> On Thu, Jan 20, 2022 at 12:05:44PM +0100, Philippe Mathieu-Daudé wrote:
> >>> The previous commit removed all uses of libxml2.
> >>>
> >>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> >>> ---
> >>>  tests/docker/dockerfiles/alpine.docker        | 1 -
> >>>  tests/docker/dockerfiles/centos8.docker       | 1 -
> >>>  tests/docker/dockerfiles/fedora.docker        | 1 -
> >>>  tests/docker/dockerfiles/opensuse-leap.docker | 1 -
> >>>  tests/docker/dockerfiles/ubuntu1804.docker    | 1 -
> >>>  tests/docker/dockerfiles/ubuntu2004.docker    | 1 -
> >>>  tests/lcitool/projects/qemu.yml               | 1 -
> 
> BTW what is the difference between QEMU's qemu.yml and libvirt-ci's one?

The intention is to remove the one in libvirt-ci.git as it is not
used now we maintain it directly in qemu.git

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


