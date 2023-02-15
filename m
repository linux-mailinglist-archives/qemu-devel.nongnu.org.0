Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF2A6981D4
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 18:21:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSLTO-0002FX-72; Wed, 15 Feb 2023 12:21:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSLTM-0002CK-CU
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:21:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSLTL-0003Oj-0H
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:21:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676481694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wnfPDUariUNRaEDw7kyd28pXmOUFAT/jsoUHTy1r1gc=;
 b=No9SsKDv05CPgQ0Nhe69g27WHR5hiNQPFo1T6LHZvA5k53RYbrdvk59oQdcxTePsakIcj2
 rFSeKZQkY2VUtS1s5I4mlDCnvgytAkXMBx6/lWHSs3DT5mQJsvVK1/921CwcQBzfCkh4Sx
 oQrmZdfl5/viarrc8+oQbTj8AJg79Ls=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-274-pv1iU0s8O163ovCawdBcnw-1; Wed, 15 Feb 2023 12:21:31 -0500
X-MC-Unique: pv1iU0s8O163ovCawdBcnw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5198C85CCE5;
 Wed, 15 Feb 2023 17:21:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13BA718EC1;
 Wed, 15 Feb 2023 17:21:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DAB8421E6A1F; Wed, 15 Feb 2023 18:21:28 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,  Bernhard Beschow
 <shentey@gmail.com>,  qemu-devel@nongnu.org,  marcel.apfelbaum@gmail.com,
 jonathan.cameron@huawei.com
Subject: Re: [PATCH v2 0/7] include/hw/pci include/hw/cxl: Clean up includes
References: <20221222100330.380143-1-armbru@redhat.com>
 <B98EF322-5449-4942-8718-D3504B863B96@gmail.com>
 <87edsremti.fsf@pond.sub.org>
 <20221222142149-mutt-send-email-mst@kernel.org>
 <87k02i7kr8.fsf@pond.sub.org>
 <20221224063930-mutt-send-email-mst@kernel.org>
 <871qmr9hx9.fsf@pond.sub.org>
 <a16ece12-fb6b-bae9-3e1d-69957aeef429@linaro.org>
Date: Wed, 15 Feb 2023 18:21:28 +0100
In-Reply-To: <a16ece12-fb6b-bae9-3e1d-69957aeef429@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 15 Feb 2023 16:05:54
 +0100")
Message-ID: <87ttzm6e07.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 15/2/23 14:28, Markus Armbruster wrote:
>> "Michael S. Tsirkin" <mst@redhat.com> writes:
>>=20
>>> On Fri, Dec 23, 2022 at 06:27:07AM +0100, Markus Armbruster wrote:
>>>> "Michael S. Tsirkin" <mst@redhat.com> writes:

[...]

>>>>> It would be even better if there was e.g. a make target
>>>>> pulling in each header and making sure it's self consistent and
>>>>> no circularity. We could run it e.g. in CI.
>>>>
>>>> Yes, that would be nice, but the problem I've been unable to crack is
>>>> deciding whether a header is supposed to compile target-independently =
or
>>>> not.  In my manual testing, I use trial and error: if it fails to
>>>> compile target-independently, compile for all targets.  This is s-l-o-=
w.
>>
>> To spice things up, we also have headers that provide additional
>> contents in target-dependent context.  These need to be tested in both
>> contexts.
>
> Do we need to figure a way to get rid of this problem
> in order to build a single qemu-system binary?

I don't know.


