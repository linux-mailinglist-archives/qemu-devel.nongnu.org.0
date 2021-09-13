Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6B140976C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 17:35:08 +0200 (CEST)
Received: from localhost ([::1]:60042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPnz9-0005c9-FV
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 11:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mPnwZ-00044R-1K
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 11:32:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mPnwW-0005FN-7e
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 11:32:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631547143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mG4Bfyddno/YwkHbEDnV7jN/gpJ3Doc0TlMKgHgEWxg=;
 b=Reui2KbNHn3E/tPuCdMRt1Pa/P18Tvot9+axMTS6q7moTZQMssTsTzI8dFnowH9MBWlaCX
 oo2oRBET0mFq2eI/zNcjrhiylDlTB+nnxc81brxDzw5fbMqikpXwzjOU7ARXFNw3ELhInN
 qgU8s9Ac75C8med2yl7p5J1eihOVV7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-6tkPOUIFPd2LETAKYBBV9A-1; Mon, 13 Sep 2021 11:32:22 -0400
X-MC-Unique: 6tkPOUIFPd2LETAKYBBV9A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 526011882FA4
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 15:32:14 +0000 (UTC)
Received: from redhat.com (ovpn-113-222.phx2.redhat.com [10.3.113.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EF256D98F;
 Mon, 13 Sep 2021 15:32:09 +0000 (UTC)
Date: Mon, 13 Sep 2021 10:32:07 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 18/22] test-clone-visitor: Wean off __org.qemu_x-Union1
Message-ID: <20210913153207.qrvpmdwkykie4mby@redhat.com>
References: <20210913123932.3306639-1-armbru@redhat.com>
 <20210913123932.3306639-19-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210913123932.3306639-19-armbru@redhat.com>
User-Agent: NeoMutt/20210205-772-2b4c52
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: marcandre.lureau@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 13, 2021 at 02:39:28PM +0200, Markus Armbruster wrote:
> test_clone_complex3() uses simple union __org.qemu_x-Union1 to cover
> arrays.  Use UserDefOneList instead.  Unions are still covered by
> test_clone_complex1().
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  tests/unit/test-clone-visitor.c | 70 ++++++++++++++++++---------------
>  1 file changed, 38 insertions(+), 32 deletions(-)
> 
> diff --git a/tests/unit/test-clone-visitor.c b/tests/unit/test-clone-visitor.c
> index 8357a90e60..4048018607 100644
> --- a/tests/unit/test-clone-visitor.c
> +++ b/tests/unit/test-clone-visitor.c
> @@ -153,42 +153,48 @@ static void test_clone_complex2(void)
>  
>  static void test_clone_complex3(void)
>  {
> -    __org_qemu_x_Struct2 *src, *dst;
> -    __org_qemu_x_Union1List *tmp;
> +    UserDefOneList *src, *dst, *tail;
> +    UserDefOne *elt;

This unit test loses coverge of RFQDN downstream extensions, but I
think we still adequately cover that elsewhere in the testsuite, and
that it was not the primary focus of this test.  Meanwhile, what this
test is really focused on (an accurate clone of a union) is still
preserved.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


