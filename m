Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D5E36D6C1
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 13:47:21 +0200 (CEST)
Received: from localhost ([::1]:58474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbif1-0000iL-Q8
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 07:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lbidc-0008Vq-Eb
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:45:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lbidV-0004wo-6J
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:45:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619610343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zxmppk2qG4mTSysqdQw3kMx4ptbhXtEj5YHiiBdAAIk=;
 b=WU4ij24AzWCaDdHh1jlAdEzPRKeFIaWEdc4/1ujxEsHg7AfKkHLo1FY65BYex9zkXJyK7Q
 DlXYwXNgDccTMRlXPmr8JVZSKwqbNWj3K3FYkViFY6Gw4+XQb86vd6mVlFsDZRrZC5YF6f
 4WAuFQlrodHSzwkBF86SzLFs269YaHI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-SVh8BUqpPRyA2VUpagf63Q-1; Wed, 28 Apr 2021 07:45:41 -0400
X-MC-Unique: SVh8BUqpPRyA2VUpagf63Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE20610054F6;
 Wed, 28 Apr 2021 11:45:39 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-113.ams2.redhat.com
 [10.36.113.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4EF16EF40;
 Wed, 28 Apr 2021 11:45:32 +0000 (UTC)
Date: Wed, 28 Apr 2021 13:45:30 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH] hw/s390x/ccw: Register qbus type in abstract
 TYPE_CCW_DEVICE parent
Message-ID: <20210428134530.2d84ff43.cohuck@redhat.com>
In-Reply-To: <20210424145313.3287400-1-f4bug@amsat.org>
References: <20210424145313.3287400-1-f4bug@amsat.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eric Farman <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 24 Apr 2021 16:53:13 +0200
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> Instead of having all TYPE_CCW_DEVICE children set the bus type to
> TYPE_VIRTUAL_CSS_BUS, do it once in the abstract parent.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> RFC because I don't know these devices, maybe there is a reason
> for setting the bus type in the children (but it should be documented
> IMO).

We just missed moving the setup from the virtio-ccw device to the ccw
device when we introduced the latter; this is a nice cleanup.

> ---
>  hw/s390x/ccw-device.h | 1 +
>  hw/s390x/3270-ccw.c   | 1 -
>  hw/s390x/ccw-device.c | 1 +
>  hw/s390x/s390-ccw.c   | 2 --
>  hw/s390x/virtio-ccw.c | 1 -
>  5 files changed, 2 insertions(+), 4 deletions(-)

Thanks, applied.


