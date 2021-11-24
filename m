Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9160F45B71A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 10:05:33 +0100 (CET)
Received: from localhost ([::1]:49158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpoDc-0005nD-4i
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 04:05:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mpoCR-00047y-Pv
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:04:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mpoCO-0004eG-ST
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:04:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637744656;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N5lF2j6laCC1uaQoi+CScajXSgVc4KAyX8jSVUwWwXg=;
 b=FSU0dr0xzBWlNZIQTscTEe2CO5ilKF0LG/2Pt6gmtviqLxMvMP598NGHJ31vBujG9H0GIe
 YPAax37dcHl9qK3Cq0wSK5WwRwwXdIr3JBQ/4ziWx2G6skFhG41zYmK83Gw0WF086axpzH
 KUyQskEdTrf6gxbMCtqGjRhHDyrSIvQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-525-oLUyTEdDMEuwe1Hhc8pbpA-1; Wed, 24 Nov 2021 04:04:08 -0500
X-MC-Unique: oLUyTEdDMEuwe1Hhc8pbpA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBEE583DD2A;
 Wed, 24 Nov 2021 09:04:06 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F00B85C1C5;
 Wed, 24 Nov 2021 09:03:11 +0000 (UTC)
Date: Wed, 24 Nov 2021 09:03:09 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [qemu-web PATCH v3] Add Sponsors page
Message-ID: <YZ3/zZyCN0vfu1IL@redhat.com>
References: <20211124080519.440677-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124080519.440677-1-philmd@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Markey <admin@fosshost.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair23@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 24, 2021 at 09:05:19AM +0100, Philippe Mathieu-Daudé wrote:
> Add a page listing QEMU sponsors.
> 
> For now, only mention Fosshost which requested to be listed:
> https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg05381.html
> 
> Cc: Thomas Markey <admin@fosshost.org>
> Resolves: https://gitlab.com/qemu-project/qemu-web/-/issues/2
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Since v2:
> - don't explicitly state /what/ we're using the resource for,
>   just that we've been granted it (danpb)
> - list Azure Cloud credits (Daniel)
> - list PLCT Lab (Paolo)
> - list Wow/CIP United again, since other are listed (Phil)
>   therefore do not include Stefan R-b tag.
> ---
>  _includes/footer.html |  3 +++
>  assets/css/style.css  |  6 +++++-
>  sponsors.md           | 21 +++++++++++++++++++++
>  3 files changed, 29 insertions(+), 1 deletion(-)
>  create mode 100644 sponsors.md

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


