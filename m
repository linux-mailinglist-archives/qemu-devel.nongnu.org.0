Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4868B36EAD9
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 14:48:55 +0200 (CEST)
Received: from localhost ([::1]:52766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc669-00074g-TH
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 08:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lc5yb-000215-Rq
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:41:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lc5yX-0001Qi-12
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 08:41:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619700058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RofBAGtM3ydjbZUKdau75sKHmNAHYojN+EZGE6egHUY=;
 b=UKY6Lk1Akdl1HfjCGtc7DZPIf4PrOblnOo022b8u+xwP/JaZccYNtdUApjzSJrKoQxhb/7
 s+LYKR3eMrIFnaGaJAPoPoK5R+CBQKdEVTl1JGg86lM36QQH7zQh2zZrmZGuG1Ajk2lF2V
 pYnWbaclYcZzGlwwIVpLx66OrpyYDE0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-90TAerEmNIGqKKei8wewyg-1; Thu, 29 Apr 2021 08:40:57 -0400
X-MC-Unique: 90TAerEmNIGqKKei8wewyg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2847107ACCD;
 Thu, 29 Apr 2021 12:40:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C52F42BC73;
 Thu, 29 Apr 2021 12:40:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4DBCE1800604; Thu, 29 Apr 2021 14:40:49 +0200 (CEST)
Date: Thu, 29 Apr 2021 14:40:49 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Let's remove some deprecated stuff
Message-ID: <20210429124049.z7qtkufk2wgvvd5i@sirius.home.kraxel.org>
References: <87y2d1csxe.fsf@dusky.pond.sub.org>
 <bd90409c-14d0-2732-0056-9fec8383479a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <bd90409c-14d0-2732-0056-9fec8383479a@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, dirty.ice.hu@gmail.com,
 Robert Hoo <robert.hu@linux.intel.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> For this to go away, I'd rather have something like the -nic option that
> provides an easy way to set up the front end and back end.
> 
> In other words you would do something like -audiohw
> <audiodev-args>,model=xxx and it gets desugared automatically to either
> 
>    -audiodev <audiodev-args>,id=foo -device devname,audiodev=xxx
> 
> or
> 
>    -audiodev <audiodev-args>,id=foo -M propname=foo

Suggestions how to do that in a clean way?
Given that -audiodev is qapi-based I tried it this way:

--- a/qapi/audio.json
+++ b/qapi/audio.json
@@ -419,3 +419,22 @@
     'sdl':       'AudiodevSdlOptions',
     'spice':     'AudiodevGenericOptions',
     'wav':       'AudiodevWavOptions' } }
+
+##
+# @AudioDevice:
+#
+# TODO
+##
+{ 'enum': 'AudioDevice',
+  'data': [ 'pcspk', 'ac97', 'hda' ] }
+
+##
+# @AudioConfig:
+#
+# TODO
+##
+{ 'struct': 'AudioConfig',
+  'base': 'Audiodev',
+  'data': {
+    'model': 'AudioDevice'
+}}

But qemu doesn't like the schema:
qapi/audio.json: In struct 'AudioConfig':
qapi/audio.json:436: 'base' requires a struct type, union type 'Audiodev' isn't

We could easily support the case that no additional options are
specified, like this:

+{ 'struct': 'AudioConfig',
+  'data': {
+    'driver': 'AudiodevDriver',
+    'model': 'AudioDevice'
+}}

But then you have to switch to the long form as soon as you want
specify any audiodev config option.  Maybe that is ok, dunno how
much configuration options -nic supports.

take care,
  Gerd


