Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 845E4124100
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 09:05:22 +0100 (CET)
Received: from localhost ([::1]:50738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihUKf-0001Y4-Ju
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 03:05:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35702)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1ihUJl-00014X-Ge
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 03:04:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1ihUJi-0004eY-64
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 03:04:23 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:56792
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1ihUJe-0004aM-5F
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 03:04:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576656255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=nW0hlBNEzT4l64yZDG6eNuaO2omdiL2UaDCkJWpw2+o=;
 b=cNGUQ1bmcq9p4yFw3dkTPXidOm4ZnPhdrseqXw7mnDrJb5ve2hHBhAOYh4aYgQZ7cAJt+q
 8dsNNOPhc8gOayQyN8WbD2Lydg262U5a7FrgK+5sBMGWr/UuDgn1b7NTRRByvwXC/kdpa4
 GD+Gy/JmNMZjYkD21QF+j5T3cT4z9CM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-KEoHgkkgNIO02SE8djMsDw-1; Wed, 18 Dec 2019 03:04:12 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96C06107ACC7;
 Wed, 18 Dec 2019 08:04:11 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-150.ams2.redhat.com [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD8E4384;
 Wed, 18 Dec 2019 08:04:07 +0000 (UTC)
Subject: Re: [PATCH 4/7] configure: Always detect -no-pie toolchain support
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20191218031920.6414-1-richard.henderson@linaro.org>
 <20191218031920.6414-5-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <cffd9716-eae9-b125-0650-5642dcdd93a9@redhat.com>
Date: Wed, 18 Dec 2019 09:04:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191218031920.6414-5-richard.henderson@linaro.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: KEoHgkkgNIO02SE8djMsDw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: berrange@redhat.com, i@maskray.me, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/12/2019 04.19, Richard Henderson wrote:
> The CFLAGS_NOPIE and LDFLAGS_NOPIE variables are used
> in pc-bios/optionrom/Makefile, which has nothing to do
> with the PIE setting of the main qemu executables.
> 
> This overrides any operating system default to build
> all executables as PIE, which is important for ROMs.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  configure | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


