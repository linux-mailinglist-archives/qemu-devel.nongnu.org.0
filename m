Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A57693A14D9
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 14:48:26 +0200 (CEST)
Received: from localhost ([::1]:47076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqxdB-0004yY-Mt
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 08:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lqxbD-0003QB-8S
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:46:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lqxbA-0002Wr-Of
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:46:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623242780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U/mH3S3A1OoStXmoySZaPlb3MX9AR8S+t6HOVpruvwQ=;
 b=EfGvcivrBNED++ilu7xGH5kwoU8XidLx/88BD+XwJKSsXZQLb66lC1x6kHquSwB456bKyf
 tOvTYZ3NKU16wFIFB/AGJ+Bb2GHFgVvvbXUwVEf5dfDn/cemnndeYAC4mncgwpXeiLybhA
 SNN/UlOq175NwaRZx8phD3YVPR/09Dk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-4HxNSdu1P5-VWdiFLk1isA-1; Wed, 09 Jun 2021 08:46:18 -0400
X-MC-Unique: 4HxNSdu1P5-VWdiFLk1isA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7938210068F4;
 Wed,  9 Jun 2021 12:46:17 +0000 (UTC)
Received: from localhost (ovpn-113-134.ams2.redhat.com [10.36.113.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FD9D5C1C2;
 Wed,  9 Jun 2021 12:46:16 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] configure: Check whether we can compile the s390-ccw
 bios with -msoft-float
In-Reply-To: <20210525142032.156989-1-thuth@redhat.com>
Organization: Red Hat GmbH
References: <20210525142032.156989-1-thuth@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Wed, 09 Jun 2021 14:46:15 +0200
Message-ID: <87fsxr1a08.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 25 2021, Thomas Huth <thuth@redhat.com> wrote:

> The -msoft-float switch is not available in older versions of Clang.
> Since we rely on the compiler to not generate floating point instructions
> unexpectedly, we block those old compilers now via a test in the configure
> script. Note that for some weird reasons, the Clang compiler only complains
> about the missing soft-float support if no other flags are passed via
> "-Wl,..." to the linker. So we have to use "compile_object" instead of
> "compile_prog" for this check.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied.


