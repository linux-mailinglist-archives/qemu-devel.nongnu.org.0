Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AE1108FFE
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Nov 2019 15:31:19 +0100 (CET)
Received: from localhost ([::1]:44682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZFOY-0002Y0-M9
	for lists+qemu-devel@lfdr.de; Mon, 25 Nov 2019 09:31:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51061)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iZFNJ-0001rf-JG
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 09:30:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iZFNI-00076B-11
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 09:30:01 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:38450
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iZFNH-000754-UC
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 09:29:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574692198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f4N1anJTy6jp3i0s5tloOI+fkwziQcjAChkMt5/oVUM=;
 b=a3T4JdO8UWANY30I/N/wzmWmFbiE96zqepnaJ5HTrGUsrLFIFp8QdjArMyR+cWEUsx5GSf
 quLnOwfHKHMfzynJJhnw0jAXxy7aqFljFWQr0jWFBBZ283X1JCg3bxB7I7/CuXudvAFRCp
 TqRvOSt5mBtpUfH9TxoJlDimi9vVd3E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-fdNILsyhOpifxHLBtgVziA-1; Mon, 25 Nov 2019 09:29:56 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFA6F8FC075;
 Mon, 25 Nov 2019 14:29:55 +0000 (UTC)
Received: from [10.3.116.163] (ovpn-116-163.phx2.redhat.com [10.3.116.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 50CF360C18;
 Mon, 25 Nov 2019 14:29:55 +0000 (UTC)
Subject: Re: [PATCH 2/2] test-keyval: Tighten test of trailing crap after size
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20191125133846.27790-1-armbru@redhat.com>
 <20191125133846.27790-3-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <b06f7807-b201-5a52-5a62-b50f52cc4d44@redhat.com>
Date: Mon, 25 Nov 2019 08:29:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191125133846.27790-3-armbru@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: fdNILsyhOpifxHLBtgVziA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: qemu-trivial@nongnu.org, tao3.xu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/25/19 7:38 AM, Markus Armbruster wrote:
> test_keyval_visit_size() should test for trailing crap after size with
> and without suffix.  It does test the latter: "sz2=16Gi" has size
> "16G" followed by crap "i".  It fails to test the former "sz1=16E" is
> a syntactically valid size that overflows uint64_t.  Replace by
> "sz1=0Z".
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   tests/test-keyval.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/test-keyval.c b/tests/test-keyval.c
> index 09b0ae3c68..e331a84149 100644
> --- a/tests/test-keyval.c
> +++ b/tests/test-keyval.c
> @@ -478,7 +478,7 @@ static void test_keyval_visit_size(void)
>       visit_free(v);
>   
>       /* Trailing crap */
> -    qdict = keyval_parse("sz1=16E,sz2=16Gi", NULL, &error_abort);
> +    qdict = keyval_parse("sz1=0Z,sz2=16Gi", NULL, &error_abort);

Does this actually test both failure cases, or does it abort the parse 
after the first failure (sz1=0Z) without ever hitting the second half of 
the parse (sz2=16Gi)?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


