Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C584CDCFF
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 19:54:07 +0100 (CET)
Received: from localhost ([::1]:46226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQD42-0002Gk-OD
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 13:54:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQC9F-0001E2-0T
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 12:55:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQC9D-0003Nn-DF
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 12:55:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646416522;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GyBJ+iIOfuBj9xOIOkUosNiQLzXgO0fWZppuuB3hrH8=;
 b=RFHib/DD3V2y7okPL13y2RobzKfyDFQjVNH8LAOm0Yo2Cd7eLS9TpzcnJtdzbmbXeKhqu3
 tzHSKmNOgYQQszqLDGpa1jHs1q1qdjUlnBacTCvvHrjwtywfUI42b2mf3fgOnPNy/fwmpf
 fGrmBuVreAoHkdaVyImSsFeIBOS5FlM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-l0Q08JJQOUynQLWiYrhrXA-1; Fri, 04 Mar 2022 12:55:19 -0500
X-MC-Unique: l0Q08JJQOUynQLWiYrhrXA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C021A51DC;
 Fri,  4 Mar 2022 17:55:18 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DF09804D7;
 Fri,  4 Mar 2022 17:55:12 +0000 (UTC)
Date: Fri, 4 Mar 2022 17:55:09 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 05/10] python/aqmp: squelch pylint warning for too many
 lines
Message-ID: <YiJSfU74MvklpcFW@redhat.com>
References: <20220225205948.3693480-1-jsnow@redhat.com>
 <20220225205948.3693480-6-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220225205948.3693480-6-jsnow@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 25, 2022 at 03:59:43PM -0500, John Snow wrote:
> I would really like to keep this under 1000 lines, I promise. Doesn't
> look like it's gonna happen.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/aqmp/protocol.py | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> 
> diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
> index 56f05b9030..631bcdaa55 100644
> --- a/python/qemu/aqmp/protocol.py
> +++ b/python/qemu/aqmp/protocol.py
> @@ -10,6 +10,9 @@
>  class.
>  """
>  
> +# It's all the docstrings ... ! It's long for a good reason ^_^;
> +# pylint: disable=too-many-lines

Indeed that is a crazy check if it can't be made to only consider
non-comment lines in its metric.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


