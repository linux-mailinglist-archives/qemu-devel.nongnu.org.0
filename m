Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E0B15438E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 12:54:17 +0100 (CET)
Received: from localhost ([::1]:37340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izfjc-0008NL-7x
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 06:54:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53816)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1izfis-0007qB-Iv
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 06:53:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1izfiq-0003Y9-8V
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 06:53:30 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26274
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1izfiq-0003S6-3Z
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 06:53:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580990002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=mWUjmp5cx8KJYXljDzVO1j4MjhpYM5jHR7a9shKoZdA=;
 b=H8tcsW00p5X/KJx6tt4IRNq1tX6aBKSHZhK7eG1PrzNF0CuEsZU6SGpHRMlmxkq1VotQs2
 v+mKCf/699zzYCLOcmoqLmly+kXAJs2V9QDHlhqRwAojqHIdi29UGvo57/EOAZeV9hZQCF
 se/WCcVIW4eruFVDU0e0kemBGY31vl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-HLEtgVxhNEa4z_3hYp3fZw-1; Thu, 06 Feb 2020 06:53:21 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16B491336569
 for <qemu-devel@nongnu.org>; Thu,  6 Feb 2020 11:53:20 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-151.ams2.redhat.com [10.36.116.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E67360C05;
 Thu,  6 Feb 2020 11:53:14 +0000 (UTC)
Subject: Re: [qemu-web PATCH] Add Outreachy 2020 announcement to blog
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20200206113949.84022-1-stefanha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <59216e27-d439-7a8b-5167-c0e649c73e15@redhat.com>
Date: Thu, 6 Feb 2020 12:53:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200206113949.84022-1-stefanha@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: HLEtgVxhNEa4z_3hYp3fZw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, jusual@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/02/2020 12.39, Stefan Hajnoczi wrote:
> Let people know that we are participating in Outreachy again this year.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  .../2020-02-06-outreachy-internships-2020.md  | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 _posts/2020-02-06-outreachy-internships-2020.md
>
Thanks, looks fine, so I've pushed it now to the server.

 Thomas


