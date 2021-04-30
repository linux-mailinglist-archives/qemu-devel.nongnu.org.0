Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D248F36F8FC
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:14:22 +0200 (CEST)
Received: from localhost ([::1]:42730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcR6D-0000d9-Tj
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcQgf-0007KM-6H
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:47:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcQgb-0008PS-Vq
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:47:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619779672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CeDJoe8c0U3A2mEbwnMuA+faPBZM2av00QFQsyCUjj4=;
 b=GbticVl/Y2CcK+AeBCNB73l2o1/wHJ6yJnuByjrw8l9kCJKnakrm7QMu1lP502HV5sSDdO
 vNw28j1loUTOvx37qsMQki2oVnACS5TZFLDeC0W1ZXp3rD5gJmXAc+Ug+abcyFX7CD/2fa
 xrnkoK0pX0jqP1LiVOud2jUQRwifoTk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-zTRllVMxMeOW9al7BJcW_A-1; Fri, 30 Apr 2021 06:47:49 -0400
X-MC-Unique: zTRllVMxMeOW9al7BJcW_A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CD11805EF1;
 Fri, 30 Apr 2021 10:47:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCAA15F707;
 Fri, 30 Apr 2021 10:47:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 37AB0113525D; Fri, 30 Apr 2021 12:47:39 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: Let's remove some deprecated stuff
References: <87y2d1csxe.fsf@dusky.pond.sub.org>
 <20210429101842.hupkajdlkttq6l4v@sirius.home.kraxel.org>
 <YIqJY1Z4jqruCu17@redhat.com>
 <CAFEAcA-_UTcs-XgPD6OLnKBUYJ9xnYRg9FAorinxejp7XZCxpQ@mail.gmail.com>
 <YIqL7dSxR/C6URkX@redhat.com>
 <20210429105555.kmw4is3qq72zwnvs@sirius.home.kraxel.org>
Date: Fri, 30 Apr 2021 12:47:39 +0200
In-Reply-To: <20210429105555.kmw4is3qq72zwnvs@sirius.home.kraxel.org> (Gerd
 Hoffmann's message of "Thu, 29 Apr 2021 12:55:55 +0200")
Message-ID: <871rasyrp0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, dirty.ice.hu@gmail.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gerd Hoffmann <kraxel@redhat.com> writes:

>   Hi,
>
>> IOW, if QEMU was to be conservative, you can drop all env vars except
>> the main QEMU_AUDIODRIVER.
>
> As already mentioned above I want drop all legacy audio bits at once.
>
> Leaving in the compatibility bits in for one or two more releases is
> IMHO better than removing it partly now and the remaining bits in a
> year.

The message starting this thread was a "polite request to consider
whether the time for removal has come."  "Not now" is a perfectly fine
answer.  Thanks!


