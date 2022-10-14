Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE20D5FED36
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 13:34:03 +0200 (CEST)
Received: from localhost ([::1]:35794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojIx0-0002P2-L5
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 07:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ojImn-0003V3-Jz
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 07:23:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ojImk-0000PH-6V
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 07:23:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665746605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z3+FG5El3he5uSlcNSTAX0oRH0X1rebQ7PYWHOf69xA=;
 b=PLn0u4hnBDjOkZleNaVYS/YpDWYWIPou6dj8IOlC41QMmfN9z78mUDb4UkHeNCaT4ybpyV
 G2wdrBBDCEVgah7kiFGFhJawWNeB9/cfBRRCIC49t+jaS4NJRCb/GNcWN4mGrh77m8O5YG
 iozoKYh5HWmv9M6LuBX76RsVSD5/v24=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-tPuiJhCFP2OPi3j8G0c-PA-1; Fri, 14 Oct 2022 07:23:19 -0400
X-MC-Unique: tPuiJhCFP2OPi3j8G0c-PA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54EAC85A59D;
 Fri, 14 Oct 2022 11:23:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2514B2144B2D;
 Fri, 14 Oct 2022 11:23:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A91F121E691D; Fri, 14 Oct 2022 13:23:17 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org,
 pbonzini@redhat.com,  stefanha@redhat.com,  peter.maydell@linaro.org,
 agraf@csgraf.de
Subject: Re: [RFC PATCH 1/4] docs/devel: add a maintainers section to
 development process
References: <20221012121152.1179051-1-alex.bennee@linaro.org>
 <20221012121152.1179051-2-alex.bennee@linaro.org>
 <222c561c-4771-c3ae-6749-5c0f4ea4c6ef@ilande.co.uk>
Date: Fri, 14 Oct 2022 13:23:17 +0200
In-Reply-To: <222c561c-4771-c3ae-6749-5c0f4ea4c6ef@ilande.co.uk> (Mark
 Cave-Ayland's message of "Fri, 14 Oct 2022 10:26:25 +0100")
Message-ID: <871qrasl7e.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:

> On 12/10/2022 13:11, Alex Benn=C3=A9e wrote:

[...]

>> +Becoming a maintainer
>> +---------------------
>> +
>> +Maintainers are volunteers who put themselves forward to keep an eye
>> +on an area of code. They are generally accepted by the community to

Do you mean "expected by the community"?

>> +have a good understanding of the subsystem and able to make a positive
>> +contribution to the project.
>
> Is it worth making this a bit stronger such as "having a demonstrable tra=
ck record of providing accepted upstream patches"? I'm not sure if this is =
being a bit too=20
> nit-picky, however someone could have good understanding of a subsystem s=
uch as PCI but be still unfamiliar with the QEMU's PCI APIs and how they sh=
ould be used.

I think existing practice varies.

For something that is widely used, we generally require enough of a
track record (contributions *and* reviews) to inspire confidence.

But if you submit something new, say a machine, we may ask you to stick
around and maintain it as a prerequisite for merging.

[...]


