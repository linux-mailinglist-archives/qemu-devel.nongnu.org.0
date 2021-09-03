Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C5C400415
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 19:27:07 +0200 (CEST)
Received: from localhost ([::1]:34566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMCy2-0004hk-Ip
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 13:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mMCx7-00042f-Sh
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:26:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mMCx6-0001H6-HH
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:26:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630689967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=geTlWbdTo2F7GvDM0Y0jfdkQ3nWjiwAOYKq1guelMus=;
 b=hiCXbC9iwMLMyQgcSM16NEFGWGrC+pYgziTPqudDj748Sbs6hgiZaNP3pY/FQM5oOLuci/
 svFtIhaAFG3zNWV9ktzCEVIN3VpOgitoyk0a0ologBM+Kedam7tdVZF72jslbgms20XSmj
 2VnRBGExyTE99m4NW5E6VcTGv8B5bVA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-tf7SLhWkNHidPZkQO7vc4g-1; Fri, 03 Sep 2021 13:26:06 -0400
X-MC-Unique: tf7SLhWkNHidPZkQO7vc4g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B38AC80198A
 for <qemu-devel@nongnu.org>; Fri,  3 Sep 2021 17:26:05 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.phx2.redhat.com [10.3.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 81DDF10013D7;
 Fri,  3 Sep 2021 17:26:01 +0000 (UTC)
Date: Fri, 3 Sep 2021 12:25:59 -0500
From: Eric Blake <eblake@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 5/5] meson_options.txt: Document that "configure"
 reads this file, too
Message-ID: <20210903172559.leqdpsyradnkshbx@redhat.com>
References: <20210903081358.956267-1-thuth@redhat.com>
 <20210903081358.956267-6-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210903081358.956267-6-thuth@redhat.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 03, 2021 at 10:13:58AM +0200, Thomas Huth wrote:
> Add a comment that meson_options.txt is also parsed by the configure
> script and that the options need a certain layout for this to succeed.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  meson_options.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/meson_options.txt b/meson_options.txt
> index 2c89e79e8b..86b3c03c7d 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -1,3 +1,9 @@

Huh - we don't have any copyright header in this file.  Oh well, not your fault.

> +# Note: This file is also parsed by "configure" to automatically handle the
> +# 'feature' options for its --enable-* and --disable-* parameters. To be able
> +# to use this automation, make sure that the corresponding options() have their
> +# "type: 'feature'" in the very first line, and their "description:" in their
> +# second line.
> +
>  option('qemu_suffix', type : 'string', value: 'qemu',
>         description: 'Suffix for QEMU data/modules/config directories (can be empty)')

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


