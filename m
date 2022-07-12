Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F6B5714E7
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 10:42:55 +0200 (CEST)
Received: from localhost ([::1]:50806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBBTq-0006U9-DC
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 04:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oBBAP-0000cS-QX
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 04:22:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oBBAM-0004ap-3V
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 04:22:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657614162;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ppR7HMH1fhR6YtGe7GzJzwOONv2RyhCUY/BzycWpB7I=;
 b=BcwYZTYcMaNpWh3vTlNpgUe8s1hQEeVZVWbHToHrZouyeuWQNeXkb1/PXGPVy5qeBthMr7
 70ZJiocHfUWUQTGVdEkLt/uF45ZFSDqWz+h0QLEmWwziV8M7jgNeEaGZ3JGYlt7Y5zW5fH
 cccQRgNlVUijAjzLzcglKiuT4kOl/7g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-sMVkqKtEMT2GMjsMd2eCVQ-1; Tue, 12 Jul 2022 04:22:29 -0400
X-MC-Unique: sMVkqKtEMT2GMjsMd2eCVQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0B5918E5340;
 Tue, 12 Jul 2022 08:22:28 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E819400EA85;
 Tue, 12 Jul 2022 08:22:27 +0000 (UTC)
Date: Tue, 12 Jul 2022 09:22:25 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: Re: lcitool update required
Message-ID: <Ys0vQXxWE2aXDkK0@redhat.com>
References: <7cd15bdb-578e-4d28-6c8b-a101c9f8f4e6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7cd15bdb-578e-4d28-6c8b-a101c9f8f4e6@linaro.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 12, 2022 at 12:31:35PM +0530, Richard Henderson wrote:
> Hi guys,
> 
> Cirrus FreeBSD builds are now broken, because we're trying to install py38-*
> packages that no longer exist.  There was, yesterday, an update to lcitool
> that addresses this.  However in the meantime there has been a major change
> to the way lcitool is packaged such that we cannot merely update the
> submodule and 'make lcitool-rebuild'.

Oh the source files were slightly re-arranged to make it look more like
a normal python app, but functionally it should still be the same.

> I'm planning to edit the cirrus ci files by hand for the moment, in an
> effort to re-green the ci, but please update our automation.

I'll send an update.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


