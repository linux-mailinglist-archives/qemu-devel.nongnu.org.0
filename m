Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E12199BC
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 10:33:51 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38939 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hP0yU-00007f-AX
	for lists+qemu-devel@lfdr.de; Fri, 10 May 2019 04:33:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59827)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hP0wn-0007tS-Jg
	for qemu-devel@nongnu.org; Fri, 10 May 2019 04:32:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hP0wm-0006BM-Oa
	for qemu-devel@nongnu.org; Fri, 10 May 2019 04:32:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56120)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>) id 1hP0wm-0006B8-JL
	for qemu-devel@nongnu.org; Fri, 10 May 2019 04:32:04 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E0233C062EC4;
	Fri, 10 May 2019 08:32:03 +0000 (UTC)
Received: from [10.40.205.9] (unknown [10.40.205.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EBEB960CC0;
	Fri, 10 May 2019 08:32:02 +0000 (UTC)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190510012458.22706-1-richard.henderson@linaro.org>
	<20190510012458.22706-17-richard.henderson@linaro.org>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <b46e111b-beff-d42a-1cff-b416cd9187df@redhat.com>
Date: Fri, 10 May 2019 10:32:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190510012458.22706-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 10 May 2019 08:32:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v5 16/24] linux-user: Remove srand call
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/05/2019 03:24, Richard Henderson wrote:
> We no longer use rand() within linux-user.
>=20
> Cc: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/main.c | 11 -----------
>   1 file changed, 11 deletions(-)
>=20

Reviewed-by: Laurent Vivier <lvivier@redhat.com>



