Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D754AFD86
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 20:32:36 +0100 (CET)
Received: from localhost ([::1]:35626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHshe-0006FO-Ml
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 14:32:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nHrtG-0005SJ-QT
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 13:40:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nHrsp-00059f-1Z
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 13:40:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644431925;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=+V/06wrL2mbZF/eep97/UNc26RAHCMmxOHkjjrX7GiM=;
 b=WNzBfuBDar/OA1w3ok+PTZ6XMDSOBK2ywTr3Zb4aNq040YA7QaYCHyKmu1GOrMXrZdhsJj
 L3uwoQW0mp2OAUU1oUGVVuBeCtqNmWCZVH5qrP4OsH6De+ujchsZhWvkWIvjpX2YDI7h18
 cujRdfC/OHt7VhvguejvYo9i0q6VuXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-RGJxyZDKOpOK98ip-J2Bkw-1; Wed, 09 Feb 2022 13:38:41 -0500
X-MC-Unique: RGJxyZDKOpOK98ip-J2Bkw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40DEE6409D;
 Wed,  9 Feb 2022 18:38:40 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BBBC7D3E4;
 Wed,  9 Feb 2022 18:38:36 +0000 (UTC)
Date: Wed, 9 Feb 2022 18:38:33 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 3/3] avocado/vnc: add test_change_listen
Message-ID: <YgQKKTU//IYmbF70@redhat.com>
References: <20220118160909.2502374-1-vsementsov@virtuozzo.com>
 <20220118160909.2502374-4-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20220118160909.2502374-4-vsementsov@virtuozzo.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: bleal@redhat.com, armbru@redhat.com, f4bug@amsat.org, wainersm@redhat.com,
 qemu-devel@nongnu.org, kraxel@redhat.com, crosa@redhat.com,
 marcandre.lureau@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 18, 2022 at 05:09:09PM +0100, Vladimir Sementsov-Ogievskiy wrote:
> Add simple test-case for new addresses argument of display-reload qmp
> command.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/avocado/vnc.py | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/tests/avocado/vnc.py b/tests/avocado/vnc.py
> index 096432988f..936285a50b 100644
> --- a/tests/avocado/vnc.py
> +++ b/tests/avocado/vnc.py
> @@ -51,3 +51,13 @@ def test_change_password(self):
>          set_password_response = self.vm.qmp('change-vnc-password',
>                                              password='new_password')
>          self.assertEqual(set_password_response['return'], {})
> +
> +    def test_change_listen(self):
> +        self.vm.add_args('-nodefaults', '-S', '-vnc', ':0')
> +        self.vm.launch()
> +        self.assertEqual(self.vm.qmp('query-vnc')['return']['service'], '5900')

Add a check that socket connect(5900)  works here and connect(5901)
and connect(5902) fails...


> +        res = self.vm.qmp('display-reload', type='vnc',
> +                          addresses=[{'type': 'inet', 'host': '0.0.0.0',
> +                                      'port': '5901'}])

I'd suggest we provide multiple addresses to test multi address
changes on distinct IPs too

                           addresses=[{'type': 'inet', 'host': '0.0.0.0',
                                       'port': '5901'},
                                      {'type': 'inet', 'host': '127.0.0.1',
                                       'port': '5902'}]

> +        self.assertEqual(res['return'], {})
> +        self.assertEqual(self.vm.qmp('query-vnc')['return']['service'], '5901')

and connect(5900) fails here, and connect(5901) + connet(5902) works .


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


