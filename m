Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 899265175C4
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 19:30:01 +0200 (CEST)
Received: from localhost ([::1]:37280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlZs0-0003XL-If
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 13:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nlZqi-0002g7-P8
 for qemu-devel@nongnu.org; Mon, 02 May 2022 13:28:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nlZqh-0001YC-8g
 for qemu-devel@nongnu.org; Mon, 02 May 2022 13:28:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651512518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tCEuljwwhl6/RWGzbvnHeY4eIRonyLeMPG8hLyDf2Zg=;
 b=Y5ET2u038+ilSI741jo49qEYKxrqnBPRQ7xJIqZDYJYF1EajutlP8CnBWiZxVVWgScSE7s
 C3mKTeFMTTw8WsE59A1UJQLBKavYi5Avh0Le72M2hz+vbhy9I/KUyRrgHycuBVqgyby3c8
 jZrVerCvBMAsJDQX/EvOcJbZc+aR+Qk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-ebnyuH8gOiuQBBAMn234Bw-1; Mon, 02 May 2022 13:28:36 -0400
X-MC-Unique: ebnyuH8gOiuQBBAMn234Bw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F08E4811E7A;
 Mon,  2 May 2022 17:28:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C71A354F898;
 Mon,  2 May 2022 17:28:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C1CD421E68BC; Mon,  2 May 2022 19:28:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Subject: Re: [PATCH 0/7] qapi: Primarily whitespace tweaks
References: <20220429154758.354610-1-abologna@redhat.com>
 <8735hsm7ef.fsf@pond.sub.org>
 <CABJz62OtARwupzSAii5EcaKYO80vSG6wi+yhyBpdvdiFKUKVkg@mail.gmail.com>
Date: Mon, 02 May 2022 19:28:34 +0200
In-Reply-To: <CABJz62OtARwupzSAii5EcaKYO80vSG6wi+yhyBpdvdiFKUKVkg@mail.gmail.com>
 (Andrea Bolognani's message of "Mon, 2 May 2022 10:36:49 -0400")
Message-ID: <87a6bzkfnh.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-?= =?utf-8?Q?Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Andrea Bolognani <abologna@redhat.com> writes:

> On Mon, May 02, 2022 at 02:43:52PM +0200, Markus Armbruster wrote:
>> PATCH 1-5 queued, because no-brainers :)
>
> Thanks!
>
> How do you want me to handle respinning 6/7 and 7/7? Send out the
> entire series again with those two patches tweaked, wait for your
> pull request to make it into the tree, something else... ?

If you like, I can post a pull request tomorrow morning.

Respinning the complete series is fine with me.

> What about the changes you suggested to the commit message of 3/7?

If you respin the complete series, you get to can amend it.  Else I do.


