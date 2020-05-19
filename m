Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B49181D8F5D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 07:47:55 +0200 (CEST)
Received: from localhost ([::1]:51786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jav6Y-0004K6-Qj
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 01:47:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jav5T-0003T5-F0
 for qemu-devel@nongnu.org; Tue, 19 May 2020 01:46:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42260
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jav5S-0003GK-Gs
 for qemu-devel@nongnu.org; Tue, 19 May 2020 01:46:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589867205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4y5U8X0SEiPlkgflDRsrhx82HtV07E51of8kRWHLQUc=;
 b=ZsQf847iPdDrfYZkr4PgWhWTCLHikmnLoVVbY6y07+mCIU3WMPJhbE9UDbKonx9axde+aB
 yig+9TiOETH1riqO19v/5T6AqKKEkYfiUhcYMCv8EUJWG/yx1UAjlmUEeS67W3D8hZa32U
 jtqLkm1So32bpmIKQA85oc42qgQJ4OQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-iVv_2PJkOQ-brfQgyBm-9A-1; Tue, 19 May 2020 01:46:41 -0400
X-MC-Unique: iVv_2PJkOQ-brfQgyBm-9A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1587D835B41;
 Tue, 19 May 2020 05:46:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B8FE782ED0;
 Tue, 19 May 2020 05:46:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4F57E11358BC; Tue, 19 May 2020 07:46:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 05/24] aspeed: Don't create unwanted "cortex-a7-arm-cpu"
 devices
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-6-armbru@redhat.com>
 <fbd7151f-159f-7568-77cb-7ce86f4948ba@kaod.org>
 <CACPK8Xf+Qf0BkOiDWj_wKXT-yF+2N0Ton01Nq7Xm5yie+fqqwA@mail.gmail.com>
Date: Tue, 19 May 2020 07:46:38 +0200
In-Reply-To: <CACPK8Xf+Qf0BkOiDWj_wKXT-yF+2N0Ton01Nq7Xm5yie+fqqwA@mail.gmail.com>
 (Joel Stanley's message of "Tue, 19 May 2020 00:40:00 +0000")
Message-ID: <87r1vg5vep.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 00:34:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, berrange@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Joel Stanley <joel@jms.id.au> writes:

> On Mon, 18 May 2020 at 12:24, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>>
>> On 5/18/20 7:03 AM, Markus Armbruster wrote:
>> > The number of CPUs is controlled by property "num-cpus".
>> > aspeed_soc_ast2600_init() creates the maximum supported number.
>> > aspeed_soc_ast2600_realize() realizes only the wanted number.  Works,
>> > although it leaves unrealized devices hanging around in the QOM
>> > composition tree.  Affects machines ast2600-evb and tacoma-bmc.
>> >
>> > Make the init functions create only the wanted ones.  Visible in "info
>> > qom-tree"; here's the change for ast2600-evb:
>> >
>> >      /machine (ast2600-evb-machine)
>> >        [...]
>> >        /soc (ast2600-a1)
>> >          [...]
>> >          /cpu[0] (cortex-a7-arm-cpu)
>> >            /unnamed-gpio-in[0] (irq)
>> >            /unnamed-gpio-in[1] (irq)
>> >            /unnamed-gpio-in[2] (irq)
>> >            /unnamed-gpio-in[3] (irq)
>> >     -    /cpu[1] (cortex-a7-arm-cpu)
>> >     -      /unnamed-gpio-in[0] (irq)
>> >     -      /unnamed-gpio-in[1] (irq)
>> >     -      /unnamed-gpio-in[2] (irq)
>> >     -      /unnamed-gpio-in[3] (irq)
>> >          /ehci[0] (platform-ehci-usb)
>> >
>> > Cc: "C=C3=A9dric Le Goater" <clg@kaod.org>
>> > Cc: Peter Maydell <peter.maydell@linaro.org>
>> > Cc: Andrew Jeffery <andrew@aj.id.au>
>> > Cc: Joel Stanley <joel@jms.id.au>
>> > Cc: qemu-arm@nongnu.org
>> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>
>> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>>
>> Joel, Andrew,
>>
>> Shouldn't we enforce a default/min/max number of CPUs of 2 for the AST26=
00 ?
>> That's the SoC definition. The fact it is configurable in the Aspeed mod=
el
>> was nice to have during bringup but we are now done.
>
> Agreed, we want there to always be two CPUs for the 2600.

Follow-up patch welcome!


