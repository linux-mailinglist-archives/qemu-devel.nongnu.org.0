Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F6910D732
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Nov 2019 15:40:50 +0100 (CET)
Received: from localhost ([::1]:59784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iahRx-00041V-Hh
	for lists+qemu-devel@lfdr.de; Fri, 29 Nov 2019 09:40:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34804)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iahMa-0000wL-7f
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 09:35:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iahMV-0001km-OL
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 09:35:13 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:25838
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iahMV-0001dZ-9n
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 09:35:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575038110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=1Z5rX7W3GSkZKxd/UhGy05HaP5TvMv3HiHG/oehqhMg=;
 b=FBb12qTW9xiLpCTsyde5SZ0rp2IoJdmI8rMwwfs6K8cYlBZOqN3FYcO7sU7tB0t4y16xOM
 xbNwHXzTSiMq9WS2kZXeKPZHfiZKeP+sS+fKDjMd2Whh7jIFLXfBe6W56QuWPrcqhKV+K1
 MMxKWh3Tgr2qo6+I/58Ih4Q7bUyrKiY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-OO2RtMf1M_WoVQcNFGXqOQ-1; Fri, 29 Nov 2019 09:35:08 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A3681800D42
 for <qemu-devel@nongnu.org>; Fri, 29 Nov 2019 14:35:07 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-159.ams2.redhat.com [10.36.116.159])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69B90608F8;
 Fri, 29 Nov 2019 14:35:06 +0000 (UTC)
Subject: Re: [PATCH] ci: Use libcap-ng
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, pbonzini@redhat.com
References: <20191129142126.32967-1-dgilbert@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <599354a5-029a-12b3-b019-4fa27be68351@redhat.com>
Date: Fri, 29 Nov 2019 15:35:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191129142126.32967-1-dgilbert@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: OO2RtMf1M_WoVQcNFGXqOQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/11/2019 15.21, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> We currently enable libcap-dev in build-clang to pick up the 9p proxy
> helper.  Paolo's patch changes that to use libcap-ng, so switch to using
> it.  This also means we'll be testing the scsi pr manager and the bridge
> helper.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  .gitlab-ci.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index be57c6a454..62a9609798 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -59,7 +59,7 @@ build-user:
>  
>  build-clang:
>   script:
> - - apt-get install -y -qq clang libsdl2-dev libattr1-dev libcap-dev
> + - apt-get install -y -qq clang libsdl2-dev libattr1-dev libcap-ng-dev
>        xfslibs-dev libiscsi-dev libnfs-dev libseccomp-dev gnutls-dev librbd-dev
>   - ./configure --cc=clang --cxx=clang++ --enable-werror
>        --target-list="alpha-softmmu arm-softmmu m68k-softmmu mips64-softmmu

Acked-by: Thomas Huth <thuth@redhat.com>


