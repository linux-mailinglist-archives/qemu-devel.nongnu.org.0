Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6076EE5FA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 18:45:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prLnA-0005N8-KT; Tue, 25 Apr 2023 12:45:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1prLn1-0005I7-DU
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 12:45:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1prLmz-00027d-Ib
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 12:45:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682441112;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sQUykpgiCWpDHiNFIQnP5cTHRC444Ccig68PA3LPF0M=;
 b=ekKoVm6wOig9eIvt6XXDt50pjoi4IZOLGxo33AyFQd0vtNeRHlyFLebCoVbIXEbo3HWMm7
 aLbnHgJ/dSeEjeXoajvaBiaOntD5qsYUcdfhBg+RL+FN7xh6alPpgqQ0ZCKTBfOo7hreya
 EYW3mwcugnLzcXnmklA0cufcPkQrh8Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-d0b3SwTkOPCqHQOoKju_Fg-1; Tue, 25 Apr 2023 12:45:08 -0400
X-MC-Unique: d0b3SwTkOPCqHQOoKju_Fg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B71FA0F383;
 Tue, 25 Apr 2023 16:45:08 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A17E12166B3A;
 Tue, 25 Apr 2023 16:45:04 +0000 (UTC)
Date: Tue, 25 Apr 2023 17:45:01 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, Warner Losh <imp@bsdimp.com>,
 Beraldo Leal <bleal@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH v3 11/20] tests/vm: add py310-expat to NetBSD
Message-ID: <ZEgDjbHhHxNZ83fu@redhat.com>
References: <20230424200248.1183394-1-jsnow@redhat.com>
 <20230424200248.1183394-12-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230424200248.1183394-12-jsnow@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Apr 24, 2023 at 04:02:39PM -0400, John Snow wrote:
> NetBSD cannot successfully run "ensurepip" without access to the pyexpat
> module, which NetBSD debundles. Like the Debian patch, it would be
> strictly faster long term to install pip/setuptools, and I recommend
> developers at their workstations take that approach instead.

This sounds a bit like a NetBSD packaging bug surely ?  If we've got
ensurepip installed and it doesn't work due to missing expat I would
have though NetBSD should add a dependancy.

None the less, we'll need a fix in QEMU until that's addressed.

> 
> For the purposes of a throwaway VM, there's not really a speed
> difference for who is responsible for installing pip; us (needs
> py310-pip) or Python (needs py310-expat).
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/vm/netbsd | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


