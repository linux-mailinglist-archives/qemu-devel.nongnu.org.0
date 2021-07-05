Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A24543BBB44
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 12:33:09 +0200 (CEST)
Received: from localhost ([::1]:38378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0LuW-000265-Mc
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 06:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0Lsy-0008OY-Ec
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:31:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0Lsw-00050t-F6
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:31:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625481089;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gtnBr15v/BEmpJxzvqa2nUAoKF5gVMmfasxmarXhIrs=;
 b=LsP4qRJzslLri4t97DYdqI+EHlH4VoMlhy4dOAB5wp3Cofdj1SQezQQWV1fGRtSHRKamoy
 mAJ7L32CuRmojVleUTUyczn+Go0M/fwqXqgOOmuZuwjQOC2f/NJG9n0EEM60gIfZbLxW2x
 oiMz2tzOQMelhGHx8IOjc0eJhFhXnfE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-_2wAXcdSNmqIFQWQU0d-SA-1; Mon, 05 Jul 2021 06:31:27 -0400
X-MC-Unique: _2wAXcdSNmqIFQWQU0d-SA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AE6B800D62;
 Mon,  5 Jul 2021 10:31:26 +0000 (UTC)
Received: from redhat.com (ovpn-114-184.ams2.redhat.com [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 300A160864;
 Mon,  5 Jul 2021 10:31:24 +0000 (UTC)
Date: Mon, 5 Jul 2021 11:31:20 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 6/7] docs: Add license note to the HTML page footer
Message-ID: <YOLfeGqkvgh7SGoH@redhat.com>
References: <20210705095547.15790-1-peter.maydell@linaro.org>
 <20210705095547.15790-7-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210705095547.15790-7-peter.maydell@linaro.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 05, 2021 at 10:55:46AM +0100, Peter Maydell wrote:
> The standard Sphinx/RTD HTML page footer gives a copyright line
> (based on the 'copyright' variable set in conf.py) and a line "Built
> with Sphinx using a theme provided by Read the Docs" (which can be
> disabled via the html_show_sphinx variable, but we leave it enabled).
> As a free software project, we'd like to also mention the license
> QEMU and its manual are released under.
> 
> Add a template footer.html which defines the 'extrafooter' block that
> the RtD theme provides for this purpose.  The new line of text will
> go below the existing copyright and sphinx-acknowledgement lines.
> (Unfortunately the RTD footer template does not permit putting it
> after the copyright but before the sphinx-acknowledgement.)
> 
> We use the templating functionality to make the new text also be a
> hyperlink to the about/license.html page of the manual.
> 
> Unlike rst files, HTML template files are not reported to our depfile
> plugin, so we maintain a manual list in meson.build.  New template
> files should be rare, so not being able to auto-generate the
> dependency info is not too awkward.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I know nothing about Jinja, and have merely cargo-culted the
> "make a link to a document" stuff from the handling of the
> optional copyright link in /usr/share/sphinx_rtd_theme/footer.html ...
> ---
>  docs/_templates/footer.html | 12 ++++++++++++
>  docs/meson.build            |  3 ++-
>  MAINTAINERS                 |  1 +
>  3 files changed, 15 insertions(+), 1 deletion(-)
>  create mode 100644 docs/_templates/footer.html

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


