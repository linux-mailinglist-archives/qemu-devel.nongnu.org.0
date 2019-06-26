Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C583E56D83
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jun 2019 17:21:06 +0200 (CEST)
Received: from localhost ([::1]:41042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hg9jO-0004Bh-0b
	for lists+qemu-devel@lfdr.de; Wed, 26 Jun 2019 11:21:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40650)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <antonio.ospite@collabora.com>) id 1hg9fc-00021D-Ln
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 11:17:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <antonio.ospite@collabora.com>) id 1hg9fX-0005cx-HC
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 11:17:09 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40396)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <antonio.ospite@collabora.com>)
 id 1hg9fS-0005VY-IP
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 11:17:04 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: ao2)
 with ESMTPSA id B50D8286280
To: Antonio Ospite <ao2@ao2.it>, qemu-devel@nongnu.org
References: <20190526144747.30019-1-ao2@ao2.it>
From: Antonio Ospite <antonio.ospite@collabora.com>
Message-ID: <adce6062-9289-afe8-b26a-949144700656@collabora.com>
Date: Wed, 26 Jun 2019 17:16:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190526144747.30019-1-ao2@ao2.it>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.235.227.227
Subject: Re: [Qemu-devel] [PATCH v3 0/2] configure: disallow spaces and
 colons in source path and build path
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/05/19 16:47, Antonio Ospite wrote:
> Hi,
> 
> Here is a v3 set to address
> https://bugs.launchpad.net/qemu/+bug/1817345
> 
> CCing Laurent Vivier as the patch is going through the trivial-patches
> branch.
>

Ping.

I cannot see this in the trivial-patches repository nor in mainline qemu.

Thanks,
    Antonio

> The series follows up to:
> https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg00562.html
> 
> Changes since v2:
>    - Shorten 'if' check as suggested by Eric Blake in
>      https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg01190.html
> 
>    - Added Reviewed-by tags by Eric Blake.
> 
> 
> Changes since v1:
>    - Add a preparatory patch to set source_path only once and in a more
>      robust way.
> 
>    - Move the checks in configure after the source_path definition to
>      avoid using realpath which is not available everywhere.
> 
>    - Cover also the build path in Makefile. An extensive explanation of
>      why I think this is needed is here:
>      https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg05398.html
> 
> Thank you,
>     Antonio
> 
> 
> Antonio Ospite (2):
>    configure: set source_path only once and make its definition more
>      robust
>    configure: disallow spaces and colons in source path and build path
> 
>   Makefile  |  4 ++++
>   configure | 11 ++++++++---
>   2 files changed, 12 insertions(+), 3 deletions(-)
> 


