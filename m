Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B14D312400A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 08:06:05 +0100 (CET)
Received: from localhost ([::1]:50392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihTPI-0002cv-Je
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 02:06:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39995)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1ihTOX-000273-3C
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 02:05:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1ihTOV-0002DQ-6H
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 02:05:16 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:40282
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1ihTOU-0002A5-ML
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 02:05:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576652713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=OUKa4oOowAAkvE9sZVsmE2Dmq4VwkDBs8aDu/k9ioa8=;
 b=M9ccheZJbP8duQwbkZ/HfHmhtF+AvT5yKVra40gooLrZw2tuqiMAPbnHjxpV6bTSLsXywT
 8geNonOBJAIwLuULrsnEz3m9iexpexJ/XWVSMjD+E61LeQ7tIErk0OuXt1GjQ5llK2tup8
 wk9rv4gP/w1bE12jVzbUs+sClP4Bnzs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-Zuu03WIZPfy1YPK6YqtXVA-1; Wed, 18 Dec 2019 02:05:12 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08FC210054E3;
 Wed, 18 Dec 2019 07:05:11 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-150.ams2.redhat.com [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48711384;
 Wed, 18 Dec 2019 07:05:07 +0000 (UTC)
Subject: Re: [PATCH 3/7] configure: Do not force pie=no for non-x86
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20191218031920.6414-1-richard.henderson@linaro.org>
 <20191218031920.6414-4-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <19a90c1c-3407-522c-72c7-1612ba66147c@redhat.com>
Date: Wed, 18 Dec 2019 08:05:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191218031920.6414-4-richard.henderson@linaro.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: Zuu03WIZPfy1YPK6YqtXVA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
> PIE is supported on many other hosts besides x86.
> 
> The default for non-x86 is now the same as x86: pie is used
> if supported, and may be forced via --enable/--disable-pie.

The original commit that introduce this code (40d6444e91c) said:

 "Non-x86 are not changed, as they require TCG changes"

... are these "TCG changes" in place nowadays? Did you check on non-x86
systems? If so, please mention this in the commit message.

 Thomas


