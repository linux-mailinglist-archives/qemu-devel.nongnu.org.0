Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DA6C1669
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Sep 2019 18:55:47 +0200 (CEST)
Received: from localhost ([::1]:41158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iEcU6-0002lw-CJ
	for lists+qemu-devel@lfdr.de; Sun, 29 Sep 2019 12:55:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56078)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1iEcE9-0006ae-To
 for qemu-devel@nongnu.org; Sun, 29 Sep 2019 12:39:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1iEcE7-0003O9-Tk
 for qemu-devel@nongnu.org; Sun, 29 Sep 2019 12:39:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38059)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1iEcE1-0003Hs-Sm; Sun, 29 Sep 2019 12:39:10 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F3CEB3DE04;
 Sun, 29 Sep 2019 16:39:07 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9185600F8;
 Sun, 29 Sep 2019 16:39:06 +0000 (UTC)
Message-ID: <f75b8ef0b9ab5d3589f93d6a97790f8ec68df900.camel@redhat.com>
Subject: Re: [PATCH 17/18] iotests: Disable data_file where it cannot be used
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Date: Sun, 29 Sep 2019 19:39:05 +0300
In-Reply-To: <20190927094242.11152-18-mreitz@redhat.com>
References: <20190927094242.11152-1-mreitz@redhat.com>
 <20190927094242.11152-18-mreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Sun, 29 Sep 2019 16:39:08 +0000 (UTC)
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
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  tests/qemu-iotests/007 | 5 +++--
>  tests/qemu-iotests/014 | 2 ++
>  tests/qemu-iotests/015 | 5 +++--
>  tests/qemu-iotests/026 | 5 ++++-
>  tests/qemu-iotests/029 | 5 +++--
>  tests/qemu-iotests/031 | 6 +++---
>  tests/qemu-iotests/036 | 5 +++--
>  tests/qemu-iotests/039 | 3 +++
>  tests/qemu-iotests/046 | 2 ++
>  tests/qemu-iotests/048 | 2 ++
>  tests/qemu-iotests/051 | 5 +++--
>  tests/qemu-iotests/058 | 5 +++--
>  tests/qemu-iotests/060 | 6 ++++--
>  tests/qemu-iotests/061 | 6 ++++--
>  tests/qemu-iotests/062 | 2 +-
>  tests/qemu-iotests/066 | 2 +-
>  tests/qemu-iotests/067 | 6 ++++--
>  tests/qemu-iotests/068 | 5 +++--
>  tests/qemu-iotests/071 | 3 +++
>  tests/qemu-iotests/073 | 2 ++
>  tests/qemu-iotests/074 | 2 ++
>  tests/qemu-iotests/080 | 5 +++--
>  tests/qemu-iotests/090 | 2 ++
>  tests/qemu-iotests/098 | 4 +++-
>  tests/qemu-iotests/099 | 3 ++-
>  tests/qemu-iotests/103 | 5 +++--
>  tests/qemu-iotests/108 | 6 ++++--
>  tests/qemu-iotests/112 | 5 +++--
>  tests/qemu-iotests/114 | 2 ++
>  tests/qemu-iotests/121 | 3 +++
>  tests/qemu-iotests/138 | 2 ++
>  tests/qemu-iotests/156 | 2 ++
>  tests/qemu-iotests/176 | 7 +++++--
>  tests/qemu-iotests/191 | 2 ++
>  tests/qemu-iotests/201 | 6 +++---
>  tests/qemu-iotests/214 | 3 ++-
>  tests/qemu-iotests/217 | 3 ++-
>  tests/qemu-iotests/220 | 5 +++--
>  tests/qemu-iotests/243 | 6 ++++--
>  tests/qemu-iotests/244 | 5 +++--
>  tests/qemu-iotests/250 | 2 ++
>  tests/qemu-iotests/267 | 5 +++--
>  42 files changed, 116 insertions(+), 51 deletions(-)
> 

No iotest 267 on master branch, same as patch 9

Best regards,
	Maxim Levitsky



