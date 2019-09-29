Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6979DC1645
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Sep 2019 18:36:43 +0200 (CEST)
Received: from localhost ([::1]:40962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iEcBd-0002nJ-JW
	for lists+qemu-devel@lfdr.de; Sun, 29 Sep 2019 12:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54983)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1iEc7z-0000mZ-F7
 for qemu-devel@nongnu.org; Sun, 29 Sep 2019 12:32:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1iEc7y-00033d-Bl
 for qemu-devel@nongnu.org; Sun, 29 Sep 2019 12:32:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36250)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1iEc7t-0002yp-Uv; Sun, 29 Sep 2019 12:32:50 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 370ED308A9E0;
 Sun, 29 Sep 2019 16:32:49 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0E595D9C9;
 Sun, 29 Sep 2019 16:32:47 +0000 (UTC)
Message-ID: <846ad1f0f54e677486f36fb7c6f4ebcf97af3b15.camel@redhat.com>
Subject: Re: [PATCH 06/18] iotests: Inject space into -ocompat=0.10 in 051
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Date: Sun, 29 Sep 2019 19:32:47 +0300
In-Reply-To: <20190927094242.11152-7-mreitz@redhat.com>
References: <20190927094242.11152-1-mreitz@redhat.com>
 <20190927094242.11152-7-mreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Sun, 29 Sep 2019 16:32:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2019-09-27 at 11:42 +0200, Max Reitz wrote:
> It did not matter before, but now that _make_test_img understands -o, we
> should use it properly here.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  tests/qemu-iotests/051 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/051 b/tests/qemu-iotests/051
> index 53bcdbc911..9cd1d60d45 100755
> --- a/tests/qemu-iotests/051
> +++ b/tests/qemu-iotests/051
> @@ -157,7 +157,7 @@ echo
>  echo === With version 2 images enabling lazy refcounts must fail ===
>  echo
>  
> -_make_test_img -ocompat=0.10 $size
> +_make_test_img -o compat=0.10 $size
>  
>  run_qemu -drive file="$TEST_IMG",format=qcow2,lazy-refcounts=on
>  run_qemu -drive file="$TEST_IMG",format=qcow2,lazy-refcounts=off
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>



