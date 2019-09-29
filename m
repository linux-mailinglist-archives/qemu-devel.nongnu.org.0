Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9EEC1649
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Sep 2019 18:39:38 +0200 (CEST)
Received: from localhost ([::1]:40994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iEcET-0005Tt-15
	for lists+qemu-devel@lfdr.de; Sun, 29 Sep 2019 12:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54854)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1iEc7M-0000Cy-4R
 for qemu-devel@nongnu.org; Sun, 29 Sep 2019 12:32:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1iEc7L-0002LA-4I
 for qemu-devel@nongnu.org; Sun, 29 Sep 2019 12:32:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50056)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1iEc7I-0002Gs-UI; Sun, 29 Sep 2019 12:32:13 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 27DB810576CB;
 Sun, 29 Sep 2019 16:32:12 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0F1819D70;
 Sun, 29 Sep 2019 16:32:10 +0000 (UTC)
Message-ID: <c4ee5a11101febfcf1dbc56e03f53375360b8042.camel@redhat.com>
Subject: Re: [PATCH 03/18] iotests: Drop compat=1.1 in 050
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Date: Sun, 29 Sep 2019 19:32:09 +0300
In-Reply-To: <20190927094242.11152-4-mreitz@redhat.com>
References: <20190927094242.11152-1-mreitz@redhat.com>
 <20190927094242.11152-4-mreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Sun, 29 Sep 2019 16:32:12 +0000 (UTC)
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
> IMGOPTS can never be empty for qcow2, because the check scripts adds
> compat=1.1 unless the user specified any compat option themselves.
> Thus, this block does not do anything and can be dropped.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  tests/qemu-iotests/050 | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/tests/qemu-iotests/050 b/tests/qemu-iotests/050
> index 211fc00797..272ecab195 100755
> --- a/tests/qemu-iotests/050
> +++ b/tests/qemu-iotests/050
> @@ -41,10 +41,6 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
>  _supported_fmt qcow2 qed
>  _supported_proto file
>  
> -if test "$IMGFMT" = qcow2 && test $IMGOPTS = ""; then
> -  IMGOPTS=compat=1.1
> -fi
> -
>  echo
>  echo "== Creating images =="
>  
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky


