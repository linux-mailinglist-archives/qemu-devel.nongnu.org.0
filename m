Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D92157503A
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 16:02:32 +0200 (CEST)
Received: from localhost ([::1]:60498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBzQE-0008PA-OB
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 10:02:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oBzKx-0004Jz-Iq
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 09:57:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oBzKr-0005hx-2H
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 09:57:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657807014;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=iUmDlMSHcuG75gokyWXePVoHO4aGqdAyc/vBrdEu1YI=;
 b=MUNkMv7uEdSeET0xr7AujtgieutwXopXrSJZlQZy0d9qBrar80AQbGvClZ30YgbrNz0B+i
 Vews4kKQpD/yyK4ZjJcGNUN8iFFqdDFXH7KmHCS++SyPTz9a9GqD2aSzKl57OMO2WreH0S
 7/rKHYUq5xdn/evR0EaLyf0pPNTEyy8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-404-RhWsRcY5NaKclvdf0IaL7A-1; Thu, 14 Jul 2022 09:56:45 -0400
X-MC-Unique: RhWsRcY5NaKclvdf0IaL7A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 610BD395AFE3;
 Thu, 14 Jul 2022 13:56:45 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4259618ECC;
 Thu, 14 Jul 2022 13:56:43 +0000 (UTC)
Date: Thu, 14 Jul 2022 14:56:40 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: qemu-devel@nongnu.org, thuth@redhat.com, peter.maydell@linaro.org,
 jsnow@redhat.com, pbonzini@redhat.com, imammedo@redhat.com, mst@redhat.com
Subject: Re: [PATCH v2 02/11] acpi/tests/bits: add SPDX license identifiers
 for bios bits tests
Message-ID: <YtAgmD+EJSCK4MG2@redhat.com>
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-3-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220710170014.1673480-3-ani@anisinha.ca>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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

On Sun, Jul 10, 2022 at 10:30:05PM +0530, Ani Sinha wrote:
> Added the SPDX license identifiers based on the following output from the
> licensee tool for bios bits:
> 
> $ licensee detect bits/
> License:        NOASSERTION
> Matched files:  COPYING
> COPYING:
>   Content hash:  7a1fdfa894728ea69588977442c92073aad69e50
>   License:       NOASSERTION
>   Closest non-matching licenses:
>     BSD-3-Clause-Clear similarity:  85.82%
>     BSD-4-Clause similarity:        83.69%
>     BSD-3-Clause similarity:        77.27%

This report looks pretty bogus to me.

smbios.py license header pretty clearly matches BSD-3-Clause with
99% similarity.

   https://spdx.org/licenses/BSD-3-Clause.html

and is pretty different from

   https://spdx.org/licenses/BSD-3-Clause-Clear.html

which adds a statement about patent rights which doens't exist.


If we're going to add SPDX tags to existing files it needs to be
done by a human, not an automated tool. If not possible, we should
leave off SPDX tags, because adding incorrect SPDX tags creates
more harm


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


