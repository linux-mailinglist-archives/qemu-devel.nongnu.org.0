Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C820210C83E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Nov 2019 12:54:47 +0100 (CET)
Received: from localhost ([::1]:48178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iaINh-0004MH-LZ
	for lists+qemu-devel@lfdr.de; Thu, 28 Nov 2019 06:54:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34694)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iaIIy-0002or-8L
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 06:49:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iaIIt-0000LI-52
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 06:49:49 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55157
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iaIIs-00009D-Ml
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 06:49:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574941784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uTm7iTybVXeDkjxkw/eA+qgrb2FnEWpoM2hbsEGxqgQ=;
 b=JoGcr0Wx9dApbPFURwWbllFBDEvzS5KQzuCO0QEq/fV9CZswsCasNW4PH1T7FxOuiK5Xpp
 VUtpWQ4ZQM/4b0osBW7gTyg7OgRlH8fWrrI93By+6yNGQdTGDh2Kd2tkchG6IfTVS2QOo8
 KsKHKw9J48YkshfKNLkGfIT7SOKc6qo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-BiX63fl9MIqI8uO59-PDvA-1; Thu, 28 Nov 2019 06:49:41 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91B998BEEBF;
 Thu, 28 Nov 2019 11:49:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-134.ams2.redhat.com
 [10.36.116.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15C955C1B2;
 Thu, 28 Nov 2019 11:49:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 984E81138606; Thu, 28 Nov 2019 12:49:34 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Tao Xu <tao3.xu@intel.com>
Subject: Re: [PATCH v19 7/8] tests/numa: Add case for QMP build HMAT
References: <20191128082109.30081-1-tao3.xu@intel.com>
 <20191128082109.30081-8-tao3.xu@intel.com>
Date: Thu, 28 Nov 2019 12:49:34 +0100
In-Reply-To: <20191128082109.30081-8-tao3.xu@intel.com> (Tao Xu's message of
 "Thu, 28 Nov 2019 16:21:08 +0800")
Message-ID: <87pnhcnru9.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: BiX63fl9MIqI8uO59-PDvA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: lvivier@redhat.com, thuth@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 jonathan.cameron@huawei.com, sw@weilnetz.de, fan.du@intel.com,
 mdroth@linux.vnet.ibm.com, qemu-devel@nongnu.org, jingqi.liu@intel.com,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tao Xu <tao3.xu@intel.com> writes:

> Check configuring HMAT usecase
>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Tao Xu <tao3.xu@intel.com>
> ---
>
> Changes in v19:
>     - Add some fail cases for hmat-cache when level=3D0
>
> Changes in v18:
>     - Rewrite the lines over 80 characters
>
> Chenges in v17:
>     - Add some fail test cases (Igor)
> ---
>  tests/numa-test.c | 213 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 213 insertions(+)
>
> diff --git a/tests/numa-test.c b/tests/numa-test.c
> index 8de8581231..aed7b2f31b 100644
> --- a/tests/numa-test.c
> +++ b/tests/numa-test.c
> @@ -327,6 +327,216 @@ static void pc_dynamic_cpu_cfg(const void *data)
>      qtest_quit(qs);
>  }
> =20
> +static void pc_hmat_build_cfg(const void *data)
> +{
> +    QTestState *qs =3D qtest_initf("%s -nodefaults --preconfig -machine =
hmat=3Don "
> +                     "-smp 2,sockets=3D2 "
> +                     "-m 128M,slots=3D2,maxmem=3D1G "
> +                     "-object memory-backend-ram,size=3D64M,id=3Dm0 "
> +                     "-object memory-backend-ram,size=3D64M,id=3Dm1 "
> +                     "-numa node,nodeid=3D0,memdev=3Dm0 "
> +                     "-numa node,nodeid=3D1,memdev=3Dm1,initiator=3D0 "
> +                     "-numa cpu,node-id=3D0,socket-id=3D0 "
> +                     "-numa cpu,node-id=3D0,socket-id=3D1",
> +                     data ? (char *)data : "");
> +
> +    /* Fail: Initiator should be less than the number of nodes */
> +    g_assert(qmp_rsp_is_err(qtest_qmp(qs, "{ 'execute': 'set-numa-node',=
"
> +        " 'arguments': { 'type': 'hmat-lb', 'initiator': 2, 'target': 0,=
"
> +        " 'hierarchy': \"memory\", 'data-type': \"access-latency\" } }")=
));

Code smell: side effect within assert().

Harmless here, because compiling tests with NDEBUG is pointless.  Still,
it sets a bad example.  Not your idea, the pattern seems to go back to
commit c35665e1ee3 and fb1e58f72ba.

The non-smelly pattern would be

    resp =3D qtest_qmp(...);
    g_assert(resp);
    g_assert(qdict_haskey(rsp, "error"));
    qobject_unref(resp);

It's a bit longwinded.  We could create a suitable function, but then
the assertion points to the function, which is less useful than pointing
to the test.  A macro could avoid that.

Can be cleaned up on top.

[...]


