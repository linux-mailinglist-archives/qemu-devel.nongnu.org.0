Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E1724FDBF
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Aug 2020 14:26:43 +0200 (CEST)
Received: from localhost ([::1]:48334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kABYg-0006kX-JZ
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 08:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kABXZ-0005w0-Fw
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 08:25:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kABXX-0001Ks-VF
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 08:25:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598271931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a6PcnCsw1Sv0DdUdqJSYK+7GoPI37rFufmu6OzDBodM=;
 b=PetLy1D7FsDEfWTOefWRORWjE3h/pXt0NTo4ohu6HnLZQX2vUjGOIRkdkhaCWMJvN9TKHd
 3oPMYLXIMNxaYGYCbCE6mdbScPUjeT7GO4SINHUC0a9kwjtn3ZY6z+K74ZUYWLE7yV/9fP
 J+hmNZIxzNc84HgjS0x19JvmWdDl/cg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-wbbFEOoiPEqHsrRdR35xLg-1; Mon, 24 Aug 2020 08:25:29 -0400
X-MC-Unique: wbbFEOoiPEqHsrRdR35xLg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 390A580732F;
 Mon, 24 Aug 2020 12:25:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-74.ams2.redhat.com
 [10.36.112.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BB7119C58;
 Mon, 24 Aug 2020 12:25:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B16641138648; Mon, 24 Aug 2020 14:25:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: zhaolichang <zhaolichang@huawei.com>
Subject: Re: [PATCH RFC 09/10] qapi/: fix some comment spelling errors
References: <20200812101500.2066-1-zhaolichang@huawei.com>
 <20200812101500.2066-10-zhaolichang@huawei.com>
Date: Mon, 24 Aug 2020 14:25:26 +0200
In-Reply-To: <20200812101500.2066-10-zhaolichang@huawei.com>
 (zhaolichang@huawei.com's message of "Wed, 12 Aug 2020 18:14:59
 +0800")
Message-ID: <87pn7gqlhl.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 04:38:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.956,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

zhaolichang <zhaolichang@huawei.com> writes:

> I found that there are many spelling errors in the comments of qemu,
> so I used the spellcheck tool to check the spelling errors
> and finally found some spelling errors in the qapi folder.

I'd omit this sentence.  Same for the other patches.

> Signed-off-by: zhaolichang <zhaolichang@huawei.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>


