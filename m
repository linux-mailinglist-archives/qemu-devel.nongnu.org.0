Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE87296FD6
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 15:02:16 +0200 (CEST)
Received: from localhost ([::1]:50162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVwhz-0000kG-Dc
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 09:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1kVwg6-0008MR-81; Fri, 23 Oct 2020 09:00:18 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:34702
 helo=v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1kVwg4-0006je-02; Fri, 23 Oct 2020 09:00:17 -0400
Received: from localhost (localhost [127.0.0.1])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id 9A0D5DB1A32;
 Fri, 23 Oct 2020 15:00:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
 by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id VMatCTq90L7l; Fri, 23 Oct 2020 15:00:10 +0200 (CEST)
Received: from macbook02.fritz.box (p57b42e50.dip0.t-ipconnect.de
 [87.180.46.80])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 20756DB1908;
 Fri, 23 Oct 2020 15:00:10 +0200 (CEST)
To: Chetan Pant <chetan4windows@gmail.com>, qemu-trivial@nongnu.org
References: <20201014134248.14146-1-chetan4windows@gmail.com>
 <20201023123624.19891-1-chetan4windows@gmail.com>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH 24/30] w32: Fix Lesser GPL version number
Message-ID: <7c7c4739-5649-165d-6be5-b68fad318047@weilnetz.de>
Date: Fri, 23 Oct 2020 15:00:09 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201023123624.19891-1-chetan4windows@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=v2201612906741603.powersrv.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 09:00:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.108,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.10.20 um 14:36 schrieb Chetan Pant:

> There is no "version 2" of the "Lesser" General Public License.
> It is either "GPL version 2.0" or "Lesser GPL version 2.1".
> This patch replaces all occurrences of "Lesser GPL version 2" with
> "Lesser GPL version 2.1" in comment section.
>
> Signed-off-by: Chetan Pant <chetan4windows@gmail.com>
> ---
>   util/oslib-win32.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> index c654daf..48e34c1 100644
> --- a/util/oslib-win32.c
> +++ b/util/oslib-win32.c
> @@ -367,7 +367,7 @@ char *qemu_get_exec_dir(void)
>    * This library is free software; you can redistribute it and/or
>    * modify it under the terms of the GNU Lesser General Public
>    * License as published by the Free Software Foundation; either
> - * version 2 of the License, or (at your option) any later version.
> + * version 2.1 of the License, or (at your option) any later version.
>    *
>    * This library is distributed in the hope that it will be useful,
>    * but WITHOUT ANY WARRANTY; without even the implied warranty of


LGPL 2.0 was the GNU Library General Public License,
but in COPYING.LIB we already use LGPL 2.1, so

Reviewed-by: Stefan Weil <sw@weilnetz.de>




