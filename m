Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D62015DE51
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Feb 2020 17:04:08 +0100 (CET)
Received: from localhost ([::1]:40836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2dRm-0001s8-K3
	for lists+qemu-devel@lfdr.de; Fri, 14 Feb 2020 11:04:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55583)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j2dQj-0001EZ-MD
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 11:03:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j2dQi-0003om-8V
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 11:03:01 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:33887
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j2dQh-0003n2-Sz
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 11:03:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581696178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YvtuS8Zh+JN1aCzOm9q9gg26Yn2Ez1xrwKZSJNcWKBI=;
 b=GLzHLvr51gcCLlqTjERt+fcNJeWB/v5YVYaSDbdsL46TpXzynp9UKIjjRQVvHcP4ZjgHSr
 VePckE7MNgaRsWwwBjeu6jJtEFJ+Tq21LWk9WBY/gm59lX9nRKcgb30T3842cX182NTVC8
 7EgVwz7cKIB6jRi7J+WEsMpgTfEw5PA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-8JFP34wfPoWN84ZdYu2xiw-1; Fri, 14 Feb 2020 11:02:54 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 419F0133657D;
 Fri, 14 Feb 2020 16:02:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-234.ams2.redhat.com
 [10.36.117.234])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 798655DA7D;
 Fri, 14 Feb 2020 16:02:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0147611385C9; Fri, 14 Feb 2020 17:02:48 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 16/30] qapi: Add blank lines before bulleted lists
References: <20200213175647.17628-1-peter.maydell@linaro.org>
 <20200213175647.17628-17-peter.maydell@linaro.org>
 <878sl5tf01.fsf@dusky.pond.sub.org>
Date: Fri, 14 Feb 2020 17:02:48 +0100
In-Reply-To: <878sl5tf01.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Fri, 14 Feb 2020 15:33:50 +0100")
Message-ID: <87wo8pqhqv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 8JFP34wfPoWN84ZdYu2xiw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: John Snow <jsnow@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> rST insists on a blank line before and after a bulleted list,
>> but our texinfo doc generator did not. Add some extra blank
>> lines in the doc comments so they're acceptable rST input.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Hmm, PATCH 06 appears to do the same, among other things.  Sure you want
this separate?


