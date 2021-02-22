Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 287A1321E29
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:33:31 +0100 (CET)
Received: from localhost ([::1]:53598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEF5O-0005Wi-3j
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:33:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lEEwn-0005IB-8G
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:24:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lEEwl-0006kG-Pe
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:24:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614014674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H5mrm3DZDcM5fraUv4fndEkj6st2YNZQP0B5Q36J9Uo=;
 b=UvhiIsg+yiL6fHdGsdyDyoF/KXJvWZutXFSxGq4YPfPkwZThK7yOrBZIs34mMvUdui21QP
 AqcKIE+bk0KIjDmZhkz2L3uUg51TnNgRYGiq+SwzSRS2oLUzxU8TP4tbGo5A5ittPwkUrA
 CB7UVj0nmsPCkwzRqI2xAd2qFsUsaCo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-1b80s02bMCOR2lkI1fzehA-1; Mon, 22 Feb 2021 12:24:29 -0500
X-MC-Unique: 1b80s02bMCOR2lkI1fzehA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 498CB1936B68;
 Mon, 22 Feb 2021 17:24:26 +0000 (UTC)
Received: from gondolin (ovpn-113-115.ams2.redhat.com [10.36.113.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1AD85D9D3;
 Mon, 22 Feb 2021 17:24:07 +0000 (UTC)
Date: Mon, 22 Feb 2021 18:24:05 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH v2 01/11] accel/kvm: Check MachineClass kvm_type()
 return value
Message-ID: <20210222182405.3e6e9a6f.cohuck@redhat.com>
In-Reply-To: <20210219173847.2054123-2-philmd@redhat.com>
References: <20210219173847.2054123-1-philmd@redhat.com>
 <20210219173847.2054123-2-philmd@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Leif Lindholm <leif@nuviainc.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Feb 2021 18:38:37 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> MachineClass::kvm_type() can return -1 on failure.
> Document it, and add a check in kvm_init().
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/hw/boards.h | 3 ++-
>  accel/kvm/kvm-all.c | 6 ++++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index a46dfe5d1a6..68d3d10f6b0 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -127,7 +127,8 @@ typedef struct {
>   *    implement and a stub device is required.
>   * @kvm_type:
>   *    Return the type of KVM corresponding to the kvm-type string option=
 or
> - *    computed based on other criteria such as the host kernel capabilit=
ies.
> + *    computed based on other criteria such as the host kernel capabilit=
ies
> + *    (which can't be negative), or -1 on error.
>   * @numa_mem_supported:
>   *    true if '--numa node.mem' option is supported and false otherwise
>   * @smp_parse:
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 84c943fcdb2..b069938d881 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2057,6 +2057,12 @@ static int kvm_init(MachineState *ms)
>                                                              "kvm-type",
>                                                              &error_abort=
);
>          type =3D mc->kvm_type(ms, kvm_type);
> +        if (type < 0) {
> +            ret =3D -EINVAL;
> +            fprintf(stderr, "Failed to detect kvm-type for machine '%s'\=
n",
> +                    mc->name);
> +            goto err;
> +        }
>      }
> =20
>      do {

No objection to this patch; but I'm wondering why some non-pseries
machines implement the kvm_type callback, when I see the kvm-type
property only for pseries? Am I holding my git grep wrong?


