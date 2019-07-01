Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2377B497CC
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 05:35:05 +0200 (CEST)
Received: from localhost ([::1]:53462 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hd4tk-0007a9-Bd
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 23:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34219)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jasowang@redhat.com>) id 1hd4q9-0005lM-Pe
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 23:31:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1hd4q8-00013C-5F
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 23:31:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47994)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1hd4q6-00010E-C4
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 23:31:18 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7318330832C6
 for <qemu-devel@nongnu.org>; Tue, 18 Jun 2019 03:31:14 +0000 (UTC)
Received: from [10.72.12.155] (ovpn-12-155.pek2.redhat.com [10.72.12.155])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3495380DF2;
 Tue, 18 Jun 2019 03:31:12 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20190604115221.28364-1-armbru@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <565fb562-8c16-3d26-b08d-df41f76787df@redhat.com>
Date: Tue, 18 Jun 2019 11:31:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190604115221.28364-1-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Tue, 18 Jun 2019 03:31:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 0/3] Some qemu-bridge-helper work
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


On 2019/6/4 =E4=B8=8B=E5=8D=887:52, Markus Armbruster wrote:
> Markus Armbruster (3):
>    MAINTAINERS: Add qemu-bridge-helper.c to "Network device backends"
>    net: Deprecate tap backend's parameter "helper"
>    qemu-bridge-helper: Document known shortcomings
>
>   MAINTAINERS          |  1 +
>   qapi/net.json        |  3 ++-
>   qemu-bridge-helper.c | 12 +++++++++++-
>   qemu-deprecated.texi |  4 ++++
>   qemu-options.hx      | 18 ++----------------
>   5 files changed, 20 insertions(+), 18 deletions(-)
>

I've queued patch 1 and 3. For patch 2, it still require more thought=20
since tap is not tied to bridge in fact, it could be used independently.

Thanks


