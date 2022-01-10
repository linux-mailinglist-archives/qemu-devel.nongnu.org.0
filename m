Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 231F748950A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 10:18:29 +0100 (CET)
Received: from localhost ([::1]:53158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6qot-0002js-Nl
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 04:18:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n6qlm-0000wn-W4
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 04:15:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n6qlj-0002O8-Sw
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 04:15:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641806110;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hai8dcuW3ErIgCASO0uCunjIqbWRWGdL9Lpo4suXv9U=;
 b=Fd3CuXqLFcez8hU28WuneioHq0Q9b+3zsPI4QB7HKDOx2EqZIed8WLhRj3xmNqCxxKu6qc
 PU6mrGTbxFXOtmC/xyl4JA2356Y5rKkOu/pBivwyDMSgjGgvLtYNzZJuUdrIKZ/R9Sbaoh
 7bPzOV3wqpB+NNYBIZthhWCZ03U47SI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-yAQ0B7UGMkqxLe9rMif9dw-1; Mon, 10 Jan 2022 04:15:04 -0500
X-MC-Unique: yAQ0B7UGMkqxLe9rMif9dw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B479A83DD21;
 Mon, 10 Jan 2022 09:15:02 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 30ABA1F42D;
 Mon, 10 Jan 2022 09:14:57 +0000 (UTC)
Date: Mon, 10 Jan 2022 09:14:54 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 6/6] gitlab-ci: Support macOS 12 via cirrus-run
Message-ID: <Ydv5DpznbamD0yi1@redhat.com>
References: <20220109170612.574104-1-f4bug@amsat.org>
 <20220109170612.574104-7-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20220109170612.574104-7-f4bug@amsat.org>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
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
Cc: qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jan 09, 2022 at 06:06:12PM +0100, Philippe Mathieu-Daudé wrote:
> Add support for macOS 12 build on Cirrus-CI, similarly to commit
> 0e103a65ba1 ("gitlab: support for ... macOS 11 via cirrus-run").
> 
> Disable deprecation warnings on Objective C to avoid:
> 
>   [2789/6622] Compiling Objective-C object libcommon.fa.p/ui_cocoa.m.o
>   ui/cocoa.m:1411:16: error: 'setAllowedFileTypes:' is deprecated: first deprecated in macOS 12.0 - Use -allowedContentTypes instead [-Werror,-Wdeprecated-declarations]
>       [openPanel setAllowedFileTypes: supportedImageFileTypes];
>                  ^
>   /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/AppKit.framework/Headers/NSSavePanel.h:215:49: note: property 'allowedFileTypes' is declared deprecated here
>   @property (nullable, copy) NSArray<NSString *> *allowedFileTypes API_DEPRECATED("Use -allowedContentTypes instead", macos(10.3,12.0));
>                                                   ^
>   /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/AppKit.framework/Headers/NSSavePanel.h:215:49: note: 'setAllowedFileTypes:' has been explicitly marked deprecated here
>   FAILED: libcommon.fa.p/ui_cocoa.m.o
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Generated using lcitool from:
> https://gitlab.com/libvirt/libvirt-ci/-/merge_requests/210
> ---
>  .gitlab-ci.d/cirrus.yml           | 16 ++++++++++++++++
>  .gitlab-ci.d/cirrus/macos-12.vars | 16 ++++++++++++++++
>  2 files changed, 32 insertions(+)
>  create mode 100644 .gitlab-ci.d/cirrus/macos-12.vars

There's going to be a minor interaction with my patches that integrate
lcitool more formally in QEMU. Alex has them queued here:

  https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg00558.html

could you rebase on top of that series - all it will really mean
in this case is including the git submodule update on top, and
updating the refresh script to include macos-12 too

 https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg00571.html

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


