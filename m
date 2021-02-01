Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBCE30AF46
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 19:30:48 +0100 (CET)
Received: from localhost ([::1]:52722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6dyJ-0006mS-3h
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 13:30:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l6dwc-0006If-Jk
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 13:29:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l6dwZ-0006rA-GA
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 13:29:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612204138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a6myyxdNKo//JpVQoF9ZM4rdfGisOO05LIS2RJoSks8=;
 b=UUUy/1f2eKVSDfKl1t+8WH8K1TEgAByAAyid4xg01qjjylCT9Y3aXpvis80a+wr/Ztng+n
 uJ2hjSciptKFr9RWz5AttAaDkooBc4CXWZHgWOqfVDN6VfTE6hjqMAlBGTy87P4Pxle7vd
 vydSoL5uo2gWr4TRbvu8WCjejZYAFvc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-CKigg8ThNJ-UrGcOhXjIaw-1; Mon, 01 Feb 2021 13:28:56 -0500
X-MC-Unique: CKigg8ThNJ-UrGcOhXjIaw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04FDF9CC02;
 Mon,  1 Feb 2021 18:28:55 +0000 (UTC)
Received: from localhost (ovpn-3-197.rdu2.redhat.com [10.22.3.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DAE7B614FC;
 Mon,  1 Feb 2021 18:28:51 +0000 (UTC)
Date: Mon, 1 Feb 2021 13:28:51 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH RFC 1/4] docs: add a table showing x86-64 ABI
 compatibility levels
Message-ID: <20210201182851.GC3872207@habkost.net>
References: <20210201153606.4158076-1-berrange@redhat.com>
 <20210201153606.4158076-2-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210201153606.4158076-2-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Florian Weimer <fweimer@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 01, 2021 at 03:36:03PM +0000, Daniel P. Berrangé wrote:
> It is useful to know which CPUs satisfy each x86-64 ABI
> compatibility level, when dealing with guest OS that require
> something newer than the baseline ABI.
> 
> These ABI levels are defined in:
> 
>   https://gitlab.com/x86-psABIs/x86-64-ABI/
> 
> and supported by GCC, CLang, GLibC and more.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
[...]
> diff --git a/docs/system/cpu-models-x86-abi.csv b/docs/system/cpu-models-x86-abi.csv
> new file mode 100644
> index 0000000000..4565e6a535
> --- /dev/null
> +++ b/docs/system/cpu-models-x86-abi.csv
> @@ -0,0 +1,121 @@
> +Model,baseline,v2,v3,v4
> +486,,,,
> +486-v1,,,,
> +Broadwell,✅,✅,✅,
> +Broadwell-IBRS,✅,✅,✅,
> +Broadwell-noTSX,✅,✅,✅,
> +Broadwell-noTSX-IBRS,✅,✅,✅,
> +Broadwell-v1,✅,✅,✅,
> +Broadwell-v2,✅,✅,✅,
> +Broadwell-v3,✅,✅,✅,
> +Broadwell-v4,✅,✅,✅,

Unversioned names like "Broadwell" are machine-type-dependent
aliases.  I don't think they should be present in the table.

Models with suffixes like -IBRS, -noTSX, etc. are also aliases to
specific versions.  Maybe they could appear in the table for
completeness, but I'm not sure.

-- 
Eduardo


