Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EA91FEE94
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 11:24:33 +0200 (CEST)
Received: from localhost ([::1]:39660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlqme-0008QW-1R
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 05:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jlqlk-0007vq-Gp
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 05:23:36 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41223
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jlqli-0001uC-OJ
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 05:23:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592472214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jAAX1RgXnPdWB4IWR40uYbxUyoN1NwKLyCZ7e+TIRFU=;
 b=gGjAwCwZnu6gaC7t5xzf3XrwpJrjSkgpXMK6Y3m+D+pKiDpGrmSAsHfruS/rY9mIhmgw7L
 oitr55zYuQhyrN36zJLoTktqZipDMpXBok9nD9LtyDnBQeA+N9k8ExUKmGpHKhpYMnpeIm
 4II3N33TyquNZFyYFWN498FhBatSwRk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-1qqh0X_0MWOiY2rJlYB3yA-1; Thu, 18 Jun 2020 05:23:31 -0400
X-MC-Unique: 1qqh0X_0MWOiY2rJlYB3yA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB2481005512;
 Thu, 18 Jun 2020 09:23:29 +0000 (UTC)
Received: from linux.fritz.box (ovpn-114-87.ams2.redhat.com [10.36.114.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A01F7BA1A;
 Thu, 18 Jun 2020 09:23:21 +0000 (UTC)
Date: Thu, 18 Jun 2020 11:23:19 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 0/7] python: create installable package
Message-ID: <20200618092319.GA6012@linux.fritz.box>
References: <20200603001523.18085-1-jsnow@redhat.com>
 <20200617195241.GA434320@localhost.localdomain>
 <32791435-4aa4-7eaa-e2c6-b53165f2e28d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <32791435-4aa4-7eaa-e2c6-b53165f2e28d@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 01:47:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.06.2020 um 22:27 hat John Snow geschrieben:
> > In the Avocado project, we have a `make develop` rule that does that
> > for the main setup.py file, and for all plugins we carry on the same
> > tree, which is similar in some regards to the "not at the project root
> > directory" situation here with "qemu/python/setup.py".
> > 
> 
> Ah, yeah. If we're going this far, I'd prefer using a VENV over
> modifying the user's environment. That way you can blast it all away
> with a `make distclean`.
> 
> Maybe the "make develop" target could even use the presence of a .venv
> directory to know when it needs to make the environment or not ...
[..]
> For QEMU developers, installing with develop is going to be the smart
> way to go. When your git tree is updated, your package will be updated
> along with it. You can do it once and then probably forget about it.

I don't think we can make this a manual step at all. Building QEMU
requires running some Python scripts (e.g. the QAPI generator), so the
setup needs to be done either in configure or in a Makefile target that
is specified as a dependency of any rule that would run a Python script.
Building QEMU once would then be enough.

Doing it automatically also means that we have to keep things local to
the QEMU directory rather than installing them globally into the user
directory. This is desirable anyway: Most of us deal with more than one
QEMU source tree, so conflicts would be inevitable.

Kevin


