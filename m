Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AC02B8122
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 16:48:38 +0100 (CET)
Received: from localhost ([::1]:37318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfPhF-0008Fp-K9
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 10:48:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kfPdo-0005el-5K
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:45:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kfPdm-0005UG-Fi
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:45:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605714301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aRi7/XSjem3SWpJ7bDoW127xmZg0mbuPjRdUutfFbJY=;
 b=bn4cTgJIpSJ99vZ9NZQbesTAJUKJJoHf8COK7Nw9ih+zIOZ9R0pnZSkTmAef9kIjv+rILs
 vA8Psgewj+iY2fHSEbTD4kFE4hx0V7kdGYJb+QRgeE3C8E9Kkk93aLZu4hFxkVupb6o3+C
 wIbcd7eh0XuDcmBQnjlQIUmd/jStZMU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-0aKLn81vM2qc2xfBMA9kJg-1; Wed, 18 Nov 2020 10:44:59 -0500
X-MC-Unique: 0aKLn81vM2qc2xfBMA9kJg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76BD18145E0;
 Wed, 18 Nov 2020 15:44:58 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-43.ams2.redhat.com [10.36.115.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A4B25D9CA;
 Wed, 18 Nov 2020 15:44:57 +0000 (UTC)
Date: Wed, 18 Nov 2020 16:44:56 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Masayoshi Mizuma <msys.mizuma@gmail.com>
Subject: Re: [PATCH 2/2] tests/test-image-locking: Pass the fd to the
 argument of qemu_has_ofd_lock()
Message-ID: <20201118154456.GC11988@merkur.fritz.box>
References: <20201106040102.13892-1-msys.mizuma@gmail.com>
 <20201106040102.13892-2-msys.mizuma@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20201106040102.13892-2-msys.mizuma@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 06.11.2020 um 05:01 hat Masayoshi Mizuma geschrieben:
> From: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
> 
> Pass the file descriptor of /dev/null to qemu_has_ofd_lock() because
> former patch is changed the argument.
> 
> Signed-off-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
> ---
>  tests/test-image-locking.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/test-image-locking.c b/tests/test-image-locking.c
> index ba057bd66c..2b823e1588 100644
> --- a/tests/test-image-locking.c
> +++ b/tests/test-image-locking.c
> @@ -144,14 +144,19 @@ static void test_set_perm_abort(void)
>  
>  int main(int argc, char **argv)
>  {
> +    int fd;
> +
>      bdrv_init();
>      qemu_init_main_loop(&error_abort);
>  
>      g_test_init(&argc, &argv, NULL);
>  
> -    if (qemu_has_ofd_lock()) {
> +    fd = open("/dev/null", O_RDONLY);
> +
> +    if ((fd != -1) && (qemu_has_ofd_lock(fd))) {

The parentheses are redundant.

>          g_test_add_func("/image-locking/basic", test_image_locking_basic);
>          g_test_add_func("/image-locking/set-perm-abort", test_set_perm_abort);
> +        close(fd);
>      }

Please merge this with patch 1, otherwise the build will fail with only
patch 1 applied (breaks bisectability).

Kevin


