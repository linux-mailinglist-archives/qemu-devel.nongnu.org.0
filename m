Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAEC2A7C7B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 11:58:52 +0100 (CET)
Received: from localhost ([::1]:55054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kacyh-0006bq-Ca
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 05:58:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kacx3-0005Ux-23
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 05:57:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kacx1-0005je-9r
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 05:57:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604573826;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OG5rVkFiA71JanbBjhLLLDZe7JlWLNuTk+fh3tSImgU=;
 b=bGzBq4OHp0qvihgWCnThmrkRasnk7TqdjqDUZobZCaJrik10Otiqe/roYUoL9TMgKIyhMi
 kusOviBmXpST7a8/CC0yudbLQElkoI2xvQrfvUTRlERULI7acPcmNLrZSvFL0w7AYeQ87W
 5RaPu/7+gIvwEwSC2d0Bco91828dUlU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-CVCphl90O9STwmXMgyGziA-1; Thu, 05 Nov 2020 05:56:59 -0500
X-MC-Unique: CVCphl90O9STwmXMgyGziA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65157804745;
 Thu,  5 Nov 2020 10:56:58 +0000 (UTC)
Received: from redhat.com (ovpn-115-13.ams2.redhat.com [10.36.115.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7731360C17;
 Thu,  5 Nov 2020 10:56:52 +0000 (UTC)
Date: Thu, 5 Nov 2020 10:56:48 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 2/4] gitlab: force enable docs build in Fedora, Ubuntu,
 Debian
Message-ID: <20201105105648.GF630142@redhat.com>
References: <20201102130926.161183-1-berrange@redhat.com>
 <20201102130926.161183-3-berrange@redhat.com>
 <04a3654c-de8c-d16d-f45a-66cbc6ffbef0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <04a3654c-de8c-d16d-f45a-66cbc6ffbef0@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/04 22:46:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 02, 2020 at 03:50:39PM +0100, Philippe Mathieu-Daudé wrote:
> On 11/2/20 2:09 PM, Daniel P. Berrangé wrote:
> > Meson runs a test to see if Sphinx works, and automatically disables it
> > on error. This can lead to the CI jobs skipping docs build without
> > maintainers noticing the problem. Use --enable-docs to force a fatal
> > error if Sphinx doesn't work on the jobs where we expect it to be OK.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  .gitlab-ci.yml | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> Shouldn't this patch go first in your series? Inverting 1<->2.

Doesn't really matter.  The jobs already build docs. It was simply
that in creating this series I inserted a bug that broke the detection
of sphinx by configure and I didn't notice and wondered why docs were
not being created. So I just added this as a safety net to make it
easier to detect future messups.

> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


