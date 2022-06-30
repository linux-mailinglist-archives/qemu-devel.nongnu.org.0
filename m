Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78444561A9C
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 14:46:47 +0200 (CEST)
Received: from localhost ([::1]:47476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6tZG-0004lo-Hp
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 08:46:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Brice.Goglin@inria.fr>)
 id 1o6tT3-00071Z-8M
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 08:40:28 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:26998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Brice.Goglin@inria.fr>)
 id 1o6tSz-00077o-UB
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 08:40:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to;
 bh=71b0sue9/LXcNLjuFtfp15xyG+jkVnvxyZhrLP0FqAA=;
 b=W7j28FYGPEKbIdxDIQq/F5sgHTTKqyQJGcDkU9K1Y89fWgXPEhl89wk5
 DShcsxj/Wkweyqg+nyImINY2Kk3IZ0nxGED0jJbdbiwpLNZ9Az//6nsiW
 GNnEl5wkEOOdiJwsd/YFGeeXHdhfhFegrg4JyCs5lj5ywBRSgOl/4pYUf o=;
Authentication-Results: mail3-relais-sop.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Brice.Goglin@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.92,234,1650924000"; d="scan'208";a="18188139"
Received: from clt-128-93-178-41.vpn.inria.fr (HELO [128.93.178.41])
 ([128.93.178.41]) by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2022 14:40:14 +0200
Subject: Re: [PATCH v4 0/4] hmat acpi: Don't require initiator value in -numa
To: Igor Mammedov <imammedo@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Liu Jingqi
 <jingqi.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
References: <ed23accb-2c8b-90f4-a7a3-f81cc57bf678@inria.fr>
 <20220630142347.22485226@redhat.com>
From: Brice Goglin <Brice.Goglin@inria.fr>
Message-ID: <17551978-4608-f9e4-8aab-d5d7512dc5a7@inria.fr>
Date: Thu, 30 Jun 2022 14:40:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220630142347.22485226@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Wi5CvxucgJ4pi967HDeiGvCjfyB7ZPbEr"
Received-SPF: pass client-ip=192.134.164.104;
 envelope-from=Brice.Goglin@inria.fr; helo=mail3-relais-sop.national.inria.fr
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Wi5CvxucgJ4pi967HDeiGvCjfyB7ZPbEr
Content-Type: multipart/mixed; boundary="fq5XD9yVf8NHsbJVfOMqgQheR4WaYz8S7";
 protected-headers="v1"
From: Brice Goglin <Brice.Goglin@inria.fr>
To: Igor Mammedov <imammedo@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Liu Jingqi
 <jingqi.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
Message-ID: <17551978-4608-f9e4-8aab-d5d7512dc5a7@inria.fr>
Subject: Re: [PATCH v4 0/4] hmat acpi: Don't require initiator value in -numa
References: <ed23accb-2c8b-90f4-a7a3-f81cc57bf678@inria.fr>
 <20220630142347.22485226@redhat.com>
In-Reply-To: <20220630142347.22485226@redhat.com>

--fq5XD9yVf8NHsbJVfOMqgQheR4WaYz8S7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


Le 30/06/2022 =C3=A0 14:23, Igor Mammedov a =C3=A9crit=C2=A0:
> On Thu, 30 Jun 2022 09:36:47 +0200
> Brice Goglin <Brice.Goglin@inria.fr> wrote:
>
>> Allow -numa without initiator value when hmat=3Don so that we may
>> build more complex topologies, e.g. NUMA nodes whose best initiators
>> are not just another single node.
>>
> patches looks fine code-wise,
> however something wrong with them, i.e. 'git am' doesn't like them
> nor ./scripts/checkpatch (which one should use before sending patches).=

>
> I've checked it's not my mail server/client issue(or whatever)
> that corrupts them (ones downloaded from patchew are broken as well)


I don't know what's going on. These 4 patches are in=20
https://github.com/bgoglin/qemu/commits/hmat-noinitiator (rebased on=20
master 10mn ago).

Do whatever you want with them. I am not allowed to spend more time on th=
is.

Brice




--fq5XD9yVf8NHsbJVfOMqgQheR4WaYz8S7--

--Wi5CvxucgJ4pi967HDeiGvCjfyB7ZPbEr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEelpOgOQAl7r26tY4RJGQ8yNavTsFAmK9ma0FAwAAAAAACgkQRJGQ8yNavTtK
WhAAm+/H916jyaAM5rYyxMMGTgCL4EiIx9EGgwGGzkpS8H6rP72/zaitN5EnQFUczYNRZPiautJ4
CDPRKSc92Wpmz8CmVrWHo0hExEjg0fWqY7n0lgNq7+dawkhwLzvFBKuAn/VEwV8lkrYh1zvEveVt
EEeudlTdf+gCd/TX4yrWKKMLTlcwp/aaSPrqMvlWNXS9N+IWhcCDxhjrGx5vRI4UV8FpqJAeMP5y
OOgmdOJhnN7ekpeaGKfUmmVaxy2If74UdJxdiwRWC93IHxdAk/w9EvVlzazCmi3h3BGNao1j4nKy
O3J01XcsYEl2Vv+kI55BUmA15LTzR8miqAYcOvVnZK30LlBT2+/uMdOrZXsJJgNPaIv59ln0LO4O
07NA+vr7he6N05MrAQF6Y78WE7ZCSPRqqmFT/JnZQZWfAnYHbkaJmhTvkKCeHJ1OVtkrv0c7mcz4
v5mu/fdc7/Otmsi/yFyVIuAkIs3M4pjl7TBYGE8gUJGmRdEkYT2PeUHEjRzd9YGsFzAsxPOWcZBy
32OrpKjGUAlCdkCxw9h0E6l8n0j6X2Rdygnj5g3cognL2j3EugTR32oCNBSKcHqNWX8GZo6YwLk0
/L/UOstnIdMinzTvMsf8oLJdraVDv8ge/ZGJMkpX/jRWjHYOt3BSWm05W4gJg5KzqB6YIyZxqyuG
8x8=
=zx/J
-----END PGP SIGNATURE-----

--Wi5CvxucgJ4pi967HDeiGvCjfyB7ZPbEr--

