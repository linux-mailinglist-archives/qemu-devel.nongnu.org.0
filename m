Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DC54450F4
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 10:14:32 +0100 (CET)
Received: from localhost ([::1]:48244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miYpK-00058f-W8
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 05:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1miYoX-0004Gc-HD
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 05:13:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1miYoT-0007wg-Gy
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 05:13:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636017216;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HsQeiRXauVeZB0QkizB3ZIuCjORd5yyfZfkMFNpr50Y=;
 b=EeV/miFK+oVosDh919l/VGZmuv3mkOnMogC9EGoY/+g6ZnLsOhiYIkUuPFnHuxcDTP7q69
 nLuvutWFfJlEgFhIdlZu+ZPS6nl0MjzPFykzR0fG8AJp9JLeGgD1OSWvvnAMICf5iNGzxt
 834VuV4LAe8i6knI66YK9CRsXly9XHo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-WUUrS4VtODScjXMKsPpItA-1; Thu, 04 Nov 2021 05:13:34 -0400
X-MC-Unique: WUUrS4VtODScjXMKsPpItA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A1591B18BC1;
 Thu,  4 Nov 2021 09:13:33 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7C4A18352;
 Thu,  4 Nov 2021 09:13:31 +0000 (UTC)
Date: Thu, 4 Nov 2021 09:13:29 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 1/2] linux-user: Move the SPDX license identifier to
 first line
Message-ID: <YYOkOW/REA0uXG2L@redhat.com>
References: <20211104071541.3813306-1-f4bug@amsat.org>
 <20211104071541.3813306-2-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20211104071541.3813306-2-f4bug@amsat.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 04, 2021 at 08:15:40AM +0100, Philippe Mathieu-Daudé wrote:
> Tools consuming SPDX license identifiers benefit from having
> the SPDX tag in its own comment, not embedded with the license
> text. Move the tag to the first line.

Do you have an example of such a tool which has problems ?

AFAIK, guidance for adding SPDX tags merely says they should
be in a comment near the top of the file.

I wouldn't expect license scanners to care about the acutal
comment syntax. Proper tools would be designed to scan for
tags in *any* file format, so would be unlikely to be parsing
the C code comments at all. Rather scanners would be just
looking for the magic string "SPDX-License-Identifier" in
the file. Use of comments is merely to stop the C compiler
interpreting the tag.

It makes sense to have the SPDX tag as the first thing in
the file, but I don't see a compelling need to make it into
its own dedicated opened + closed comment, separately from
the license header comment.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


