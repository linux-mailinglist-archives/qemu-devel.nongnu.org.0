Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CBC340136
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 09:51:58 +0100 (CET)
Received: from localhost ([::1]:44056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMoNp-0008Tb-9Z
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 04:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMoMe-0007pT-1D
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 04:50:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMoMZ-0005ht-Fd
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 04:50:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616057433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=78pKWXpbcIWuhCqLEK3ZXU02J3Drhqrp6DagmDdIOJI=;
 b=g55KasZcWP91I9w95916bcT3LOlXkcRLvD9RFLDQYRTHyBi1qkjsSlc6Cd4DnbXbDZuHly
 wEqCVvezXQc+SjLMToqjxdzRq3R02ld6oBlqTLufv5dz0urbjXkb/mQHpNPNCUT2UWketo
 9YCvhlgMkotRgXcAc409EkVyYLjK/cw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-hGjbdI4jMxSbHmvz48hVXw-1; Thu, 18 Mar 2021 04:50:29 -0400
X-MC-Unique: hGjbdI4jMxSbHmvz48hVXw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4745F18C8C03;
 Thu, 18 Mar 2021 08:50:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0ED4583BE0;
 Thu, 18 Mar 2021 08:50:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8249C1132C12; Thu, 18 Mar 2021 09:50:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Yonggang Luo <luoyonggang@gmail.com>
Subject: Re: [PATCH 0/2] *** This is based on pull request from Alex
 =?utf-8?Q?Benn=C3=A9e?= ***
References: <20210317191115.1445-1-luoyonggang@gmail.com>
Date: Thu, 18 Mar 2021 09:50:25 +0100
In-Reply-To: <20210317191115.1445-1-luoyonggang@gmail.com> (Yonggang Luo's
 message of "Wed, 17 Mar 2021 19:11:13 +0000")
Message-ID: <877dm4lub2.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Please use the subject line for explaining the purpose of the series.
"Based on" information should go into the body.  Ideally also in
machine-readable form, like

    Based-on: <20171220185924.32756-1-armbru@redhat.com>

where the thing in <anglular brackets> is the pull request's Message-id.

Note: I used one of my pull requests, not Alex's, for this example.

Yonggang Luo <luoyonggang@gmail.com> writes:

> *** BLURB HERE ***

Recommend to delete this placeholder next time :)

> The pull request
> https://patchew.org/QEMU/20210317072216.16316-1-alex.bennee@linaro.org/
>
> Yonggang Luo (2):
>   plugins: Update qemu-plugins.symbols to match qemu-plugins.h
>   plugins: Move all typedef and type declaration to the front of the
>     qemu-plugin.h
>
>  include/qemu/qemu-plugin.h   | 187 +++++++++++++++++------------------
>  plugins/qemu-plugins.symbols |  25 +++--
>  2 files changed, 104 insertions(+), 108 deletions(-)


