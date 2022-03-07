Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7B24CF28D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 08:25:44 +0100 (CET)
Received: from localhost ([::1]:35482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR7kV-0001bs-6O
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 02:25:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nR7cM-0000mQ-46
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:17:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nR7cK-0002qf-GJ
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:17:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646637435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FDQFY/ZefPK1xMk9ojQ5BzC4JBgJ0wxrWYHDoMFPI+E=;
 b=iYDQ/PW8YR9JfuveR1QzyyJLkIwx40lh2SrN59rn+TlnUw290kYEbh3LdXYv3VAWzWbOT0
 2U5/M8x795blEe3ox6aRWkWeQb1DqrZjsJOdPltMgh8fqmjRmVM+jJNxrn2aNjj2KVnqNZ
 SQ30a9wk6BqXoXemK+zOa9ZtgySRWg4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-t3tzlQG1PROrnwKHOSrCTg-1; Mon, 07 Mar 2022 02:17:14 -0500
X-MC-Unique: t3tzlQG1PROrnwKHOSrCTg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E906F1006AA5;
 Mon,  7 Mar 2022 07:17:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C2C567667;
 Mon,  7 Mar 2022 07:17:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9F58321E6A00; Mon,  7 Mar 2022 08:17:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 2/2] ui/cocoa: add option to swap Option and Command
References: <20220306111114.18285-1-akihiko.odaki@gmail.com>
 <20220306111114.18285-3-akihiko.odaki@gmail.com>
 <a2a389c-b253-133b-9415-ecc5a352c2e@eik.bme.hu>
Date: Mon, 07 Mar 2022 08:17:07 +0100
In-Reply-To: <a2a389c-b253-133b-9415-ecc5a352c2e@eik.bme.hu> (BALATON Zoltan's
 message of "Sun, 6 Mar 2022 12:46:03 +0100 (CET)")
Message-ID: <87lexmw7t8.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Eric Blake <eblake@redhat.com>, Gustavo Noronha Silva <gustavo@noronha.dev.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

BALATON Zoltan <balaton@eik.bme.hu> writes:

> On Sun, 6 Mar 2022, Akihiko Odaki wrote:
>> From: Gustavo Noronha Silva <gustavo@noronha.dev.br>
>>
>> On Mac OS X the Option key maps to Alt and Command to Super/Meta. This change
>> swaps them around so that Alt is the key closer to the space bar and Meta/Super
>> is between Control and Alt, like on non-Mac keyboards.
>>
>> It is a cocoa display option, disabled by default.
>>
>> Acked-by: Markus Armbruster <armbru@redhat.com>
>> Signed-off-by: Gustavo Noronha Silva <gustavo@noronha.dev.br>
>> Message-Id: <20210713213200.2547-3-gustavo@noronha.dev.br>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>> ---
>> qapi/ui.json    |  8 ++++++-
>> qemu-options.hx |  3 ++-
>> ui/cocoa.m      | 64 ++++++++++++++++++++++++++++++++++++++++++-------
>> 3 files changed, 65 insertions(+), 10 deletions(-)
>>
>> diff --git a/qapi/ui.json b/qapi/ui.json
>> index 1e9893419fe..b082e1a7dee 100644
>> --- a/qapi/ui.json
>> +++ b/qapi/ui.json
>> @@ -1270,10 +1270,16 @@
>> #             a global grab on key events. (default: off)
>> #             See https://support.apple.com/en-in/guide/mac-help/mh32356/mac
>> #
>> +# @swap-option-command: Swap the Option and Command keys so that their key
>> +#                       codes match their position on non-Mac keyboards and
>> +#                       you can use Meta/Super and Alt where you expect them.
>> +#                       (default: off)
>> +#
>> # Since: 6.1
>> ##
>> { 'struct'  : 'DisplayCocoa',
>> -  'data'    : { '*full-grab'     : 'bool' } }
>> +  'data'    : { '*full-grab'           : 'bool',
>> +                '*swap-option-command' : 'bool' } }
>
> This option name is too long to type. Could we abbreviate it somehow?

We've largely avoided abbreviations in the QAPI schema, for better or
worse.

> Like swap-opt-cmd or swap-alt-meta?

We should stick to how the keys are generally called on this platform.
I can't say (I'm not using it).


