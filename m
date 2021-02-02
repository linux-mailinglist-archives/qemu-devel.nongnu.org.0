Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 079A530BE22
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:26:54 +0100 (CET)
Received: from localhost ([::1]:55700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6ulh-0000NV-1s
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:26:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6ujy-0007oP-3L
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:25:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6ujv-0007Ku-J9
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:25:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612268702;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qkPMzKss0vsAk855Cf4f4EZw8tPvL6D2jgjyHCxs2WY=;
 b=KirNgfNgJry8Noy83dwNLHjraZStbLDLTAk8yFBnl7apK+lGYp8WyTTR+7OmwBA4dOSXrz
 bSUYQMy6lqnuOiHblbUHy3scQNYSs+QQ0H/2cpC+XNwLCDT5cLbRo/4CNIpGoOl1Kap4xH
 VhiwoFQ/S1MW/N0crqpBudqNNVNgY4U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-Y1tUTHt5NVuGWCmsfEJh6Q-1; Tue, 02 Feb 2021 07:25:00 -0500
X-MC-Unique: Y1tUTHt5NVuGWCmsfEJh6Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5E59106BAE3;
 Tue,  2 Feb 2021 12:24:59 +0000 (UTC)
Received: from redhat.com (ovpn-112-202.ams2.redhat.com [10.36.112.202])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 347745D6CF;
 Tue,  2 Feb 2021 12:24:54 +0000 (UTC)
Date: Tue, 2 Feb 2021 12:24:52 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH RFC 1/4] docs: add a table showing x86-64 ABI
 compatibility levels
Message-ID: <20210202122452.GD4168502@redhat.com>
References: <20210201153606.4158076-1-berrange@redhat.com>
 <20210201153606.4158076-2-berrange@redhat.com>
 <20210201182851.GC3872207@habkost.net>
MIME-Version: 1.0
In-Reply-To: <20210201182851.GC3872207@habkost.net>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Florian Weimer <fweimer@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 01, 2021 at 01:28:51PM -0500, Eduardo Habkost wrote:
> On Mon, Feb 01, 2021 at 03:36:03PM +0000, Daniel P. Berrangé wrote:
> > It is useful to know which CPUs satisfy each x86-64 ABI
> > compatibility level, when dealing with guest OS that require
> > something newer than the baseline ABI.
> > 
> > These ABI levels are defined in:
> > 
> >   https://gitlab.com/x86-psABIs/x86-64-ABI/
> > 
> > and supported by GCC, CLang, GLibC and more.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> [...]
> > diff --git a/docs/system/cpu-models-x86-abi.csv b/docs/system/cpu-models-x86-abi.csv
> > new file mode 100644
> > index 0000000000..4565e6a535
> > --- /dev/null
> > +++ b/docs/system/cpu-models-x86-abi.csv
> > @@ -0,0 +1,121 @@
> > +Model,baseline,v2,v3,v4
> > +486,,,,
> > +486-v1,,,,
> > +Broadwell,✅,✅,✅,
> > +Broadwell-IBRS,✅,✅,✅,
> > +Broadwell-noTSX,✅,✅,✅,
> > +Broadwell-noTSX-IBRS,✅,✅,✅,
> > +Broadwell-v1,✅,✅,✅,
> > +Broadwell-v2,✅,✅,✅,
> > +Broadwell-v3,✅,✅,✅,
> > +Broadwell-v4,✅,✅,✅,
> 
> Unversioned names like "Broadwell" are machine-type-dependent
> aliases.  I don't think they should be present in the table.
> 
> Models with suffixes like -IBRS, -noTSX, etc. are also aliases to
> specific versions.  Maybe they could appear in the table for
> completeness, but I'm not sure.

I guess just skip the CPUs with "alias-of" reported is easiest


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


