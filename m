Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F7954FAB8
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 18:03:15 +0200 (CEST)
Received: from localhost ([::1]:39780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2ERF-0006Ot-9Q
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 12:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Brice.Goglin@inria.fr>)
 id 1o2ENp-0004AQ-30
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 11:59:41 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:35774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Brice.Goglin@inria.fr>)
 id 1o2ENm-0001I8-JZ
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 11:59:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to;
 bh=9AEG6+PpoJDIzD529+Cg3XWUTSTxDCtGo8rNmeayufM=;
 b=A3/9Z2zOdsxmehAvA7OqtyxoYLtrfQvlt9TdwrJDNevxD7KjoAQA7jFA
 RRy71QLzmTWL3v/6fZiFyHZPpv6HLxbOHY1aUexndFrTgPL1vB7/HO1nn
 ByIr2mmEOjS0SlFpVuxwAEIKVmRgUo4OGcOOfi7nFcixcBJBILhPIvTS3 s=;
Authentication-Results: mail3-relais-sop.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Brice.Goglin@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.92,306,1650924000"; d="scan'208";a="17095300"
Received: from clt-128-93-180-198.vpn.inria.fr (HELO [128.93.180.198])
 ([128.93.180.198]) by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2022 17:59:34 +0200
Subject: Re: [PATCH] hmat acpi: Don't require initiator value in -numa when
 hmat=on
From: Brice Goglin <Brice.Goglin@inria.fr>
To: qemu-devel@nongnu.org
Cc: Liu Jingqi <jingqi.liu@intel.com>, Tao Xu <tao3.xu@intel.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>
References: <44e67628-7d58-600d-2268-dbc7c77a8d27@inria.fr>
Message-ID: <5e7978ef-9938-95e7-45b1-5588036726ff@inria.fr>
Date: Fri, 17 Jun 2022 17:59:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <44e67628-7d58-600d-2268-dbc7c77a8d27@inria.fr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="reDTWKiJYcKzuyezVtkT8SgQrePqm0f3j"
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
--reDTWKiJYcKzuyezVtkT8SgQrePqm0f3j
Content-Type: multipart/mixed; boundary="HmEBI87tSCDrJfLeZS3IxZvkvRxOlZ0vg";
 protected-headers="v1"
From: Brice Goglin <Brice.Goglin@inria.fr>
To: qemu-devel@nongnu.org
Cc: Liu Jingqi <jingqi.liu@intel.com>, Tao Xu <tao3.xu@intel.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>
Message-ID: <5e7978ef-9938-95e7-45b1-5588036726ff@inria.fr>
Subject: Re: [PATCH] hmat acpi: Don't require initiator value in -numa when
 hmat=on
References: <44e67628-7d58-600d-2268-dbc7c77a8d27@inria.fr>
In-Reply-To: <44e67628-7d58-600d-2268-dbc7c77a8d27@inria.fr>

--HmEBI87tSCDrJfLeZS3IxZvkvRxOlZ0vg
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hello

Could somebody please apply (or reject) this commit?

Thanks

Brice


Le 06/04/2022 =C3=A0 14:29, Brice Goglin a =C3=A9crit=C2=A0:
> From: Brice Goglin<Brice.Goglin@inria.fr>
>
> The "Memory Proximity Domain Attributes" structure of the ACPI HMAT
> has a "Processor Proximity Domain Valid" flag that is currently
> always set because Qemu -numa requires initiator=3DX when hmat=3Don.
>
> Unsetting this flag allows to create more complex memory topologies
> by having multiple best initiators for a single memory target.
>
> This patch allows -numa with initiator=3DX when hmat=3Don by keeping
> the default value MAX_NODES in numa_state->nodes[i].initiator.
> All places reading numa_state->nodes[i].initiator already check
> whether it's different from MAX_NODES before using it. And
> hmat_build_table_structs() already unset the Valid flag when needed.
>
> Tested with
> qemu-system-x86_64 -accel kvm \
>   -machine pc,hmat=3Don \
>   -drive if=3Dpflash,format=3Draw,file=3D./OVMF.fd \
>   -drive media=3Ddisk,format=3Dqcow2,file=3Defi.qcow2 \
>   -smp 4 \
>   -m 3G \
>   -object memory-backend-ram,size=3D1G,id=3Dram0 \
>   -object memory-backend-ram,size=3D1G,id=3Dram1 \
>   -object memory-backend-ram,size=3D1G,id=3Dram2 \
>   -numa node,nodeid=3D0,memdev=3Dram0,cpus=3D0-1 \
>   -numa node,nodeid=3D1,memdev=3Dram1,cpus=3D2-3 \
>   -numa node,nodeid=3D2,memdev=3Dram2 \
>   -numa hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dmemory,data-type=3D=
access-latency,latency=3D10 \
>   -numa hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dmemory,data-type=3D=
access-bandwidth,bandwidth=3D10485760 \
>   -numa hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=3D=
access-latency,latency=3D20 \
>   -numa hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=3D=
access-bandwidth,bandwidth=3D5242880 \
>   -numa hmat-lb,initiator=3D0,target=3D2,hierarchy=3Dmemory,data-type=3D=
access-latency,latency=3D30 \
>   -numa hmat-lb,initiator=3D0,target=3D2,hierarchy=3Dmemory,data-type=3D=
access-bandwidth,bandwidth=3D1048576 \
>   -numa hmat-lb,initiator=3D1,target=3D0,hierarchy=3Dmemory,data-type=3D=
access-latency,latency=3D20 \
>   -numa hmat-lb,initiator=3D1,target=3D0,hierarchy=3Dmemory,data-type=3D=
access-bandwidth,bandwidth=3D5242880 \
>   -numa hmat-lb,initiator=3D1,target=3D1,hierarchy=3Dmemory,data-type=3D=
access-latency,latency=3D10 \
>   -numa hmat-lb,initiator=3D1,target=3D1,hierarchy=3Dmemory,data-type=3D=
access-bandwidth,bandwidth=3D10485760 \
>   -numa hmat-lb,initiator=3D1,target=3D2,hierarchy=3Dmemory,data-type=3D=
access-latency,latency=3D30 \
>   -numa hmat-lb,initiator=3D1,target=3D2,hierarchy=3Dmemory,data-type=3D=
access-bandwidth,bandwidth=3D1048576 \
>
> This exposes NUMA node2 at same distance from both node0 and node1 as s=
een in lstopo:
>
> Machine (2966MB total) + Package P#0
>    NUMANode P#2 (979MB)
>    Group0
>      NUMANode P#0 (980MB)
>      Core P#0 + PU P#0
>      Core P#1 + PU P#1
>    Group0
>      NUMANode P#1 (1007MB)
>      Core P#2 + PU P#2
>      Core P#3 + PU P#3
>
> Signed-off-by: Brice Goglin<Brice.Goglin@inria.fr>
> ---
>   hw/core/machine.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index d856485cb4..9884ef7ac6 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1012,9 +1012,7 @@ static void numa_validate_initiator(NumaState *nu=
ma_state)
>  =20
>       for (i =3D 0; i < numa_state->num_nodes; i++) {
>           if (numa_info[i].initiator =3D=3D MAX_NODES) {
> -            error_report("The initiator of NUMA node %d is missing, us=
e "
> -                         "'-numa node,initiator' option to declare it"=
, i);
> -            exit(1);
> +            continue;
>           }
>  =20
>           if (!numa_info[numa_info[i].initiator].present) {
> --=20
> 2.30.2
>
>


--HmEBI87tSCDrJfLeZS3IxZvkvRxOlZ0vg--

--reDTWKiJYcKzuyezVtkT8SgQrePqm0f3j
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEelpOgOQAl7r26tY4RJGQ8yNavTsFAmKspOUFAwAAAAAACgkQRJGQ8yNavTsC
qA//TNKr5pqC8RO7CLnYYNI88mmnkItIIUZj2EqXl3UFcJjxK2Ukd+2usbhTzvcuUdSF1cj9JFPG
QwYIvVY59DwwLjqXK3E/7XC9GoPOkN5+ac57/ZgQuvuWOYjL2FF2VepzFQ3uQ+WRVzvhieKEQDK7
5UIBKBPaWPACAUJnmkc0cLtGCKkQEsjdyJAi8h6L10uQ+O4xB6Q9ba5loeHQotDcOR2e0815BhcQ
5qXlsrSYd4haIiC+h+ciHheldwslcFAeoHs+61PxnoVGHpU36UUTvvpNmwHol87MEv9ptChXlJU+
TMnBfIhYP3xSajSWX/TDW46zK8sxvDu/FEna7jUDi4dqtG1V56A0V6v3lxz1jvyshZe4NSqaSNHb
Hf8ep83BA5cp3C+932GiW7y3NWY3WS9p3yw9wY7y2gAFlRwwHJBjgQSgMIa+W5HIHTj/UaX9Pgjs
3hB4oe7EeiNVku3Kpqqsa46KiFGIic6B9+an4BytLw6sJlQ2461VyGOo/no0kcayu/iRSemO+TMA
Wlh4f6wu8EfiJBWD3aGuYd8TAx8rIOI6honqzaGEFS5ABs3iywpdVie3L5myrDofplWDuyuzq0p9
LdeN1BypITL7G/gVMhR9RnWjcxC26IyWvIYZCp+32B9gQMFpyDfIesnPTBPeo0RFhi4nCrnWkNia
Ej8=
=QssJ
-----END PGP SIGNATURE-----

--reDTWKiJYcKzuyezVtkT8SgQrePqm0f3j--

