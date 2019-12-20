Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3985127B28
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 13:38:00 +0100 (CET)
Received: from localhost ([::1]:54660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiHXc-0003yz-21
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 07:38:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50386)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iiHWm-0003Mj-1e
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 07:37:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iiHWj-0004Be-AR
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 07:37:06 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:36563
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iiHWi-00045i-O8
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 07:37:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576845423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZURHf47599Oiqaj5pNcilS7XuQaE5mSWf5ACWnpwbXo=;
 b=RxfbZFy9T7zbHRd145cqIoHCzrBNnSBbRAy5m8wdrSDyqC0ykzVDT+mDQx+SFT8PmD3nrE
 8lX+DlyOh1ifdDTPRuoE/959OkEefR9pwEOnuCNm23NirMTrERlG7xnuawjpSl0XRqCncC
 i9Ga1RbgWavRR1SNOVjxM7kMC9utYtc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-uHoDzBo6P8mfJ0XtotAa9g-1; Fri, 20 Dec 2019 07:37:02 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D84B800053;
 Fri, 20 Dec 2019 12:37:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-42.ams2.redhat.com
 [10.36.116.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB05E60BEC;
 Fri, 20 Dec 2019 12:37:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0C1C411386A7; Fri, 20 Dec 2019 13:36:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/6] QAPI patches for 2019-12-17
References: <20191217081454.8072-1-armbru@redhat.com>
 <CAFEAcA8r-wai+vMa8WiCjUFyRGwTQQs9fZo_ddRmAdr_6GAcTw@mail.gmail.com>
 <875zie81ov.fsf@dusky.pond.sub.org>
 <CAFEAcA-TiK6y+VhYw5iaRWgxoWc+qk+gHwEusa74pDd4+Dtf9Q@mail.gmail.com>
Date: Fri, 20 Dec 2019 13:36:58 +0100
In-Reply-To: <CAFEAcA-TiK6y+VhYw5iaRWgxoWc+qk+gHwEusa74pDd4+Dtf9Q@mail.gmail.com>
 (Peter Maydell's message of "Thu, 19 Dec 2019 17:05:22 +0000")
Message-ID: <87y2v7golx.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: uHoDzBo6P8mfJ0XtotAa9g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 18 Dec 2019 at 08:42, Markus Armbruster <armbru@redhat.com> wrote=
:
>> Perplexing.  None of the files involved gets changed by this pull
>> request.  My qapi-types-crypto.h has
>>
>>     typedef struct QCryptoBlockOptionsQCow QCryptoBlockOptionsQCow;
>>     [...]
>>     struct QCryptoBlockOptionsQCow {
>>         bool has_key_secret;
>>         char *key_secret;
>>     };
>>     [...]
>>     struct QCryptoBlockOpenOptions {
>>         /* Members inherited from QCryptoBlockOptionsBase: */
>>         QCryptoBlockFormat format;
>>         /* Own members: */
>>         union { /* union tag is @format */
>>             QCryptoBlockOptionsQCow qcow;
>>             QCryptoBlockOptionsLUKS luks;
>>         } u;
>>     };
>>
>> before and after.  May I see yours?
>
> Unfortunately not -- I've already discarded this build attempt
> and continued with processing other merge requests.

Alright, I closed the curtains, lighted some incense sticks, stared deep
into the crystal ball, and beheld the number two.  Two as in Python 2.

Are we ready to ditch Python 2 in 5.0?


