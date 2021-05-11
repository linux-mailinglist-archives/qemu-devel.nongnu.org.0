Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC7837AA34
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 17:06:26 +0200 (CEST)
Received: from localhost ([::1]:45178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgTxk-0001a3-Rr
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 11:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgTwK-00006L-UW
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:04:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgTwH-0001H4-Kj
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620745488;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lWgw8ZVcJy5YjS2fKVu5zseityOb6kODo0ZM/+FlAtI=;
 b=I86qRrHJtTWv674zJReLESv8mILsW9pi31h7E7/y5oGrol0mxL0a3L9zDnhZOpkE/ssxXa
 Ijbg7JOzLDKoo5DxZXBEAVcROQkCLu2WiqV7VCen+swQRT6oBWqMNeEPkgNNiXkCiH1aJY
 sE67VhueCFhAqbKv7baGa2GE/3ZbvGw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-Pdz7ZpT6MuGx7Y9BjnPhjQ-1; Tue, 11 May 2021 11:04:38 -0400
X-MC-Unique: Pdz7ZpT6MuGx7Y9BjnPhjQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A76D100806B;
 Tue, 11 May 2021 15:04:37 +0000 (UTC)
Received: from redhat.com (ovpn-115-93.ams2.redhat.com [10.36.115.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6097A60C04;
 Tue, 11 May 2021 15:04:27 +0000 (UTC)
Date: Tue, 11 May 2021 16:04:23 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 08/12] tests/vm: convert centos VM recipe to CentOS 8
Message-ID: <YJqc90tEbGktCBt1@redhat.com>
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-9-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210511132641.1022161-9-berrange@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 11, 2021 at 02:26:37PM +0100, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/vm/centos | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/vm/centos b/tests/vm/centos
> index efe3dbbb36..215da14c23 100755
> --- a/tests/vm/centos
> +++ b/tests/vm/centos
> @@ -26,13 +26,13 @@ class CentosVM(basevm.BaseVM):
>          export SRC_ARCHIVE=/dev/vdb;
>          sudo chmod a+r $SRC_ARCHIVE;
>          tar -xf $SRC_ARCHIVE;
> -        make docker-test-block@centos7 {verbose} J={jobs} NETWORK=1;
> -        make docker-test-quick@centos7 {verbose} J={jobs} NETWORK=1;
> +        make docker-test-block@centos8 {verbose} J={jobs} NETWORK=1;
> +        make docker-test-quick@centos8 {verbose} J={jobs} NETWORK=1;
>          make docker-test-mingw@fedora  {verbose} J={jobs} NETWORK=1;
>      """
>  
>      def build_image(self, img):
> -        cimg = self._download_with_cache("https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud-1802.qcow2.xz")
> +        cimg = self._download_with_cache("https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-GenericCloud-8.1.1911-20200113.3.x86_64.qcow2")
>          img_tmp = img + ".tmp"
>          sys.stderr.write("Extracting the image...\n")
>          subprocess.check_call(["ln", "-f", cimg, img_tmp + ".xz"])

This patch is broken in many ways, and I forgot to test it :-(


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


