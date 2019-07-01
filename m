Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD43916034
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 11:12:14 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42786 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNw90-0001kn-2i
	for lists+qemu-devel@lfdr.de; Tue, 07 May 2019 05:12:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hNw81-0001F6-AV
	for qemu-devel@nongnu.org; Tue, 07 May 2019 05:11:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hNw7w-0007k0-KN
	for qemu-devel@nongnu.org; Tue, 07 May 2019 05:11:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35776)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>) id 1hNw7w-0007jJ-El
	for qemu-devel@nongnu.org; Tue, 07 May 2019 05:11:08 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AF478C0270D3;
	Tue,  7 May 2019 09:11:07 +0000 (UTC)
Received: from [10.40.204.24] (ovpn-204-24.brq.redhat.com [10.40.204.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 04C4B377F;
	Tue,  7 May 2019 09:11:06 +0000 (UTC)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190506173353.32206-1-richard.henderson@linaro.org>
	<20190506173353.32206-4-richard.henderson@linaro.org>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <abd726f2-3f7b-f883-debd-28125c260495@redhat.com>
Date: Tue, 7 May 2019 11:11:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190506173353.32206-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 07 May 2019 09:11:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v4 03/24] crypto: Reverse code blocks in
 random-platform.c
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/05/2019 19:33, Richard Henderson wrote:
> Use #ifdef _WIN32 instead of #ifndef _WIN32.
> This will make other tests easier to sequence.
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   crypto/random-platform.c | 35 +++++++++++++++++------------------
>   1 file changed, 17 insertions(+), 18 deletions(-)
>=20

Reviewed-by: Laurent Vivier <lvivier@redhat.com>



