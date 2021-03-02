Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BDF329A72
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 11:34:31 +0100 (CET)
Received: from localhost ([::1]:40686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH2MI-00032e-T6
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 05:34:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lH2Kj-0000pg-RN
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 05:32:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lH2Ki-0002rM-24
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 05:32:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614681171;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Hq0kbkh3Fz02WNjIZNwPZXnQle648EM9rmJuBUMm24=;
 b=WuXb174f2B0rh0ahmKW4tw1uWbi/edU+td9JQGlWdwzrfRlMk+UVzm4zIzYGWWnnaq2HbN
 c3+L0PaAJVtat2v8jhDVEY4M9ni+xin21YIeTmKIQh1aWUfkqyRCMHfB3DP5wpFBkB8H38
 fgDrk8q7g0ZLJFgXIO78iShVBAQPn4w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-6JLEvlc9M76K6n0d7Gdmlg-1; Tue, 02 Mar 2021 05:32:49 -0500
X-MC-Unique: 6JLEvlc9M76K6n0d7Gdmlg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9EB980197A;
 Tue,  2 Mar 2021 10:32:48 +0000 (UTC)
Received: from redhat.com (ovpn-113-132.ams2.redhat.com [10.36.113.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B5445D9E2;
 Tue,  2 Mar 2021 10:32:42 +0000 (UTC)
Date: Tue, 2 Mar 2021 10:32:39 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2] qemu-storage-daemon: add --pidfile option
Message-ID: <YD4UR76yqy4KUVz6@redhat.com>
References: <20210302092926.163080-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210302092926.163080-1-stefanha@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, afrosi@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, "Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 02, 2021 at 09:29:26AM +0000, Stefan Hajnoczi wrote:
> Daemons often have a --pidfile option where the pid is written to a file
> so that scripts can stop the daemon by sending a signal.
> 
> The pid file also acts as a lock to prevent multiple instances of the
> daemon from launching for a given pid file.
> 
> QEMU, qemu-nbd, qemu-ga, virtiofsd, and qemu-pr-helper all support the
> --pidfile option. Add it to qemu-storage-daemon too.
> 
> Reported-by: Richard W.M. Jones <rjones@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> v2:
>  * Add documentation about startup order [Rich, Daniel]
> 
>  docs/tools/qemu-storage-daemon.rst   | 14 ++++++++++++
>  storage-daemon/qemu-storage-daemon.c | 34 ++++++++++++++++++++++++++++
>  2 files changed, 48 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


