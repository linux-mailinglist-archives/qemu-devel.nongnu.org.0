Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5A763BC10
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 09:51:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozwIl-0008Cd-Gu; Tue, 29 Nov 2022 03:49:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ozwIa-0008AR-Oy
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 03:49:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ozwIZ-0004YV-6B
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 03:49:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669711730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1KCLPVxcFpEDhkJS0EmXJtSdQLSHbpz59QNiXG5AsFM=;
 b=X/Y9vwf1Y6fc+BkbHY877SwZk/R30RUsva7irjbXeA7IThVtgQpLc7eq5OxA4LCI4qwVVq
 Odu16eCAWZnJJCjxZspMOazJIL8046cs9nE1oU5vgHWz3a+p3xvaaAZrR8L4qT+HVs1iMR
 ICS6E2xCTBkBF3i/7lluzJpCSotdbdQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-dPytMHKDNOS2EcIr5G7-yg-1; Tue, 29 Nov 2022 03:48:44 -0500
X-MC-Unique: dPytMHKDNOS2EcIr5G7-yg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BDC41C008A1;
 Tue, 29 Nov 2022 08:48:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EFBC740E42E4;
 Tue, 29 Nov 2022 08:48:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D299D21E6921; Tue, 29 Nov 2022 09:48:40 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,  Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,  Daniel P .
 =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Igor Mammedov <imammedo@redhat.com>,  John Snow
 <jsnow@redhat.com>,  Maydell Peter <peter.maydell@linaro.org>,  Paolo
 Bonzini <pbonzini@redhat.com>,  Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org,  qemu-trivial@nongnu.org
Subject: Re: [PATCH v2] acpi/tests/avocado/bits: add SPDX license
 identifiers for bios bits tests
References: <20221125044138.962137-1-ani@anisinha.ca>
 <CAARzgwy=m4tN69cSn1msrZg1thkzL2ZfQ8_yOLw6Y77AzfFP-g@mail.gmail.com>
 <20221129000647-mutt-send-email-mst@kernel.org>
 <CAARzgwzS0tvV-Vz7PByrWfxrs9Gc6vyuvDVKriDMQMoJ1HWtPg@mail.gmail.com>
Date: Tue, 29 Nov 2022 09:48:40 +0100
In-Reply-To: <CAARzgwzS0tvV-Vz7PByrWfxrs9Gc6vyuvDVKriDMQMoJ1HWtPg@mail.gmail.com>
 (Ani Sinha's message of "Tue, 29 Nov 2022 11:16:51 +0530")
Message-ID: <874juirvrr.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Ani Sinha <ani@anisinha.ca> writes:

> On Tue, Nov 29, 2022 at 10:37 AM Michael S. Tsirkin <mst@redhat.com> wrot=
e:
>>
>> On Tue, Nov 29, 2022 at 08:02:15AM +0530, Ani Sinha wrote:
>> >
>> >
>> > On Fri, Nov 25, 2022 at 10:11 AM Ani Sinha <ani@anisinha.ca> wrote:
>> >
>> >     Added the SPDX license identifiers for biosbits tests.
>> >     Also added a comment on each of the test scripts to indicate that =
they run
>> >     from within the biosbits environment and hence are not subjected t=
o the
>> >     regular
>> >     maintenance activities for QEMU and is excluded from the dependency
>> >     management
>> >     challenges in the host testing environment.
>> >
>> >     Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> >     Cc: Paolo Bonzini <pbonzini@redhat.com>
>> >     Cc: Maydell Peter <peter.maydell@linaro.org>
>> >     Cc: John Snow <jsnow@redhat.com>
>> >     Cc: Thomas Huth <thuth@redhat.com>
>> >     Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> >     Cc: Igor Mammedov <imammedo@redhat.com>
>> >     Cc: Michael Tsirkin <mst@redhat.com>
>> >     Cc: Thomas Huth <thuth@redhat.com>
>> >     Cc: qemu-trivial@nongnu.org
>> >     Signed-off-by: Ani Sinha <ani@anisinha.ca>
>> >
>> >
>> > Is anyone going to queue this for 7.2 given it's quite trivial?
>>
>> Don't see why we should bother.
>
> Completeness?

We're about to tag -rc3.  It's too late for trivial stuff.  Anything but
release-critical fixes would be madness at this stage.

I recommend to route this via qemu-trivial into the next release.


