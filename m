Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D719F11B950
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Dec 2019 17:57:06 +0100 (CET)
Received: from localhost ([::1]:45876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1if5IP-0007CX-KT
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 11:57:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47525)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1if5Ec-0006TM-OL
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 11:53:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1if5Eb-0003rr-M7
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 11:53:10 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:50948)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1if5Eb-0003q4-78
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 11:53:09 -0500
Received: from [172.16.11.102] (crumble.bar.greensocs.com [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPSA id C740F96EF0;
 Wed, 11 Dec 2019 16:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1576083187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CnrWkKOFlTIZjuerx/bEks/RiVFDcBeVc1OZ92+UnUo=;
 b=O/k3wMnO+dipNPn2souDSi8SfX3BM8Xd6HkE3nEFb3j/alUbE+MMMmf9Mfh63emiZgzFZE
 hj6Wq926rZCzy2ZnOMboUJubyyq207nxtH6S3F3mzCkVo7kFncJoilwS4lu5XRsXs2Tx3G
 /G+GeAyMPcGBdTcgGIVJWPsFR/BXapI=
Subject: Re: [PATCH 03/26] qdev: remove extraneous error
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
References: <20191201111531.1136947-1-marcandre.lureau@redhat.com>
 <20191201111531.1136947-4-marcandre.lureau@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <dedffcf7-3d6e-0af8-c4c0-2e0ca8dd5a70@greensocs.com>
Date: Wed, 11 Dec 2019 17:53:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191201111531.1136947-4-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1576083187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CnrWkKOFlTIZjuerx/bEks/RiVFDcBeVc1OZ92+UnUo=;
 b=3PmD0TaTbSwlNcOUGkVZeItsTJAQnmmySOE9pnudXQLP9AXtQKrVYlkVL8myJdlBez77kJ
 we6hcL6DTbHjTR/9LrF9r54Y6ypt+e7k53+V3EB7GEIGq2BfGvEGCefTvvQ1QL6hcK9nXE
 FhEl5D8QL9GbSViemqyOaP0GtPAUSe8=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1576083187; a=rsa-sha256; cv=none;
 b=WkYLOhN+ZglahL/SxSaUMylbhkMrf3QG5CykM/BfG4XjmIukvChb0vzXxoFXuCeWNYiIdY
 ZvINzs5NoquZRCoWzOXsdPKOnUiu/o6v100vXE4GuaGJ+TTA5XH05nan72pyy/448R0aa7
 7AIP71OQb5wB6kMzCCLoModthEpZe9o=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.135.226.135
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
Cc: pbonzini@redhat.com, berrange@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/1/19 12:15 PM, Marc-Andr=C3=A9 Lureau wrote:
> All callers use error_abort, and even the function itself calls with
> error_abort.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/core/qdev.c               | 15 ++++-----------
>  include/hw/qdev-properties.h |  3 +--
>  target/arm/cpu.c             | 33 +++++++++++----------------------
>  3 files changed, 16 insertions(+), 35 deletions(-)
>=20

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>

Regards,
--
Damien

