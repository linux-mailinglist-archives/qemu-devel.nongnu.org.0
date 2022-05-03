Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9DC517F70
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 10:08:23 +0200 (CEST)
Received: from localhost ([::1]:52090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlna1-0004Ov-HC
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 04:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ldoktor@redhat.com>)
 id 1nlnCs-0005XQ-US
 for qemu-devel@nongnu.org; Tue, 03 May 2022 03:44:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ldoktor@redhat.com>)
 id 1nlnCr-0004u0-8e
 for qemu-devel@nongnu.org; Tue, 03 May 2022 03:44:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651563864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:autocrypt:autocrypt;
 bh=6eF/JiLfBCK/LchoqXUKiVeYT/UI8o+bVDtL6Bq8YOU=;
 b=iVJq6UROfs3coOIfLIz1fBYFOT7Yc0Ui8sOKzniaAAgWMs7/aLwlpeeHE2UTqFVws1cSFo
 OnE3zqtVO1MzCnV3+LIiXom+JPPlsSAetdRkSd6b1GmorUreboY4ZUQd2hOHchUHQSDKGD
 ZWJkU+I0ynsg1lXTNaJP4+TMGioD87c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-wPUMz7rAPO2FBTgK4r2rFQ-1; Tue, 03 May 2022 03:43:18 -0400
X-MC-Unique: wPUMz7rAPO2FBTgK4r2rFQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADE2886B8AC;
 Tue,  3 May 2022 07:43:17 +0000 (UTC)
Received: from [10.40.192.30] (unknown [10.40.192.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D055C40D1B9A;
 Tue,  3 May 2022 07:43:16 +0000 (UTC)
Message-ID: <35dd4da8-5278-767e-4193-ccf53e836969@redhat.com>
Date: Tue, 3 May 2022 09:43:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
From: =?UTF-8?B?THVrw6HFoSBEb2t0b3I=?= <ldoktor@redhat.com>
Autocrypt: addr=ldoktor@redhat.com; keydata=
 xsBNBFcV6vsBCADa8NUYov+a+AmCEEUB3stiiMM0NQc1WwlcxGoMxKHcqqIj/kdPhUDvFS32
 V94V7en1Lx+cpXKRMZP3n+3WG+VZWLwaktJgqrECZ161zE7xF5d1H3CLmwStbe6Cw1oR4LYQ
 HBpuqFEA5znoLuTTsP1uXs9h1cYNzX7hmOTvPCLJfDJ1iv954FsgCGtoVvl4CoxaR3u2VNOs
 hXsTTVyJM6gDTsyqn0uvLOHGWGIGVhDkLV4hv6pSdiKrtQKWIUji3Z8x41MbZybmJxHkpOVz
 Jl3jnNE3CbiEq77Is9LMI4yTF2CESs3V4XMBLfZPLrQBC0gzjeRxwCnbdOZRwY5KI457ABEB
 AAHNK0x1a2FzIERva3RvciAoUmVkIEhhdCkgPGxkb2t0b3JAcmVkaGF0LmNvbT7CwJUEEwEI
 AD8CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAFiEEpApMRcQDTeAqWtSDJrNi5H/PIsEF
 AmAzSoUFCQzmojUACgkQJrNi5H/PIsGM4Qf+OmO8PqPg28arBfxGSjdxb4744E1bnLESNudf
 8VY5/UEca0X65KW9L5vd6XUjusy2T4iyUcbZhCxYcHQLqP6y3AIyVfgJz91HEAt2thMFPfbj
 IhqVlyP0xEyvCNLk83M4PLN9IhugvSLce6R6cliETevP/m7RQSiP1o0fKu0uAUrEKWD9DZMF
 99BaI635YZOPHQwQlkWnFBEKpKLjkuKpn/QSkW34mkaByn6zLhF5QeIp/9FQVUZCeOy/zR0G
 s8ggfDyr4vJuDU4gI9NGZs6zycTflmFpA46P03LgmdRL/C6U7vbUB6B+v0YddYJoaarLUKpa
 L4dG8h/m8RdXNA33YM7ATQRXFer7AQgAw8JIK9pZUfZWNZirBIwOevkdZu1aLhgH84EfXw40
 ynMEFa1t/c0baOiuLNcVbdnHLGvUAQJ2oN/+rdGpEWITVSjDxFYf3JOnySZJhLnQgGMG4j3m
 dFZMubPG1GJEuubPAAB0huRfjQTvOvpIK03J2H5cMoug862OHOnT+mfonGruTkSO0PBq3wtf
 P+Z3gLCuEDkmEZSh4IKxs0CoLU4KxWRQHpoTOxcAiHzj8cm5qbu3Cb1KrXz8dEmYhCq2fpFf
 /h+GfEO8gU/ICJD8WQUHYcVK0bbiZskCcSOGtStjwq0QqitZMbcsPEset/2L3z44MLPuVApv
 c9wORs/3iT9BhwARAQABwsB8BBgBCAAmAhsMFiEEpApMRcQDTeAqWtSDJrNi5H/PIsEFAmAz
 So0FCQzmojUACgkQJrNi5H/PIsFS9Qf/WZ31JQQnQQSbmtm7IOAHYC7kvlQy8mejWlgeDrPW
 h3zQIXxiarBpAnYGsHNVOWJ+sjdELYc9bvOcGwXSRRxURArOYfkUOk4KmNmqd6eIrOvnFfap
 Lh0xRNx+9y0gYqB9TH/JaCLMPnH+jRGM0ZisNEHyXhemEXlXPy4vniEvajr4VnvFzD6gExzD
 jUqIel42BOOyHuXjZQDMEWf2eULSTGHTWXGdV2XErdS1v4YI/DGvQQPB29UHmb2RsZhKtntq
 0yoxFD60HzSHlVeiLmG/hAHLDY3dBs/GW3RJAbOVttS31llstDtdMEHLn+P81M4dVYzt5mEE
 NPy43Lf+YxM9FQ==
To: longpeng2@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Fio regression caused by f9fc8932b11f3bcf2a2626f567cb6fdd36a33a94
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------IPSTK0ud02ryhEffSZlWOST6"
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=ldoktor@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
--------------IPSTK0ud02ryhEffSZlWOST6
Content-Type: multipart/mixed; boundary="------------Gr9tVzOH2LrQYOJl0Oa10wZq";
 protected-headers="v1"
From: =?UTF-8?B?THVrw6HFoSBEb2t0b3I=?= <ldoktor@redhat.com>
To: longpeng2@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Message-ID: <35dd4da8-5278-767e-4193-ccf53e836969@redhat.com>
Subject: Fio regression caused by f9fc8932b11f3bcf2a2626f567cb6fdd36a33a94

--------------Gr9tVzOH2LrQYOJl0Oa10wZq
Content-Type: multipart/mixed; boundary="------------FW0HhDifU0Nlv6qJ1rx00EHY"

--------------FW0HhDifU0Nlv6qJ1rx00EHY
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Mike, Paolo, others,

in my perf pipeline I noticed a regression bisected to the f9fc8932b11f3b=
cf2a2626f567cb6fdd36a33a94 - "thread-posix: remove the posix semaphore su=
pport" commit and I'd like to ask you to verify it might have caused that=
 and eventually consider fixing it. The regression is visible, reproducib=
le and clearly bisectable to this commit with the following 2 scenarios:

1. fio write 4KiB using the nbd ioengine on localhost
2. fio read 4KiB using #cpu jobs and iodepth=3D8 on a rotational disk usi=
ng qcow2 image and default virt-install=20

    <disk type=3D"file" device=3D"disk">
      <driver name=3D"qemu" type=3D"qcow2"/>
      <source file=3D"/var/lib/libvirt/images/RHEL-8.4.0-20210503.1-virtl=
ab506.DefaultLibvirt0.qcow2"/>
      <target dev=3D"vda" bus=3D"virtio"/>
    </disk>

but smaller regressions can be seen under other scenarios as well since t=
his commit. You can find the report from bisections here:

https://ldoktor.github.io/tmp/RedHat-virtlab506/v7.0.0/RedHat-virtlab506-=
f9fc8932b11f3bcf2a2626f567cb6fdd36a33a94-RHEL-8.4.0-20210503.1-1.html
https://ldoktor.github.io/tmp/RedHat-virtlab506/v7.0.0/RedHat-virtlab506-=
f9fc8932b11f3bcf2a2626f567cb6fdd36a33a94-RHEL-8.4.0-20210503.1-2.html

Regards,
Luk=C3=A1=C5=A1
--------------FW0HhDifU0Nlv6qJ1rx00EHY
Content-Type: application/pgp-keys; name="OpenPGP_0x26B362E47FCF22C1.asc"
Content-Disposition: attachment; filename="OpenPGP_0x26B362E47FCF22C1.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
8/rqvLjMTzM6tdemLxcoLF6iT4FhmF9/QXWrBLLK/xgAR6oCmOeHbU3TJxWWRVaM
JKAkodgJf1/zkpOcKcmGaxGHijTCwJQEEwEIAD8CGwMGCwkIBwMCBhUIAgkKCwQW
AgMBAh4BAheAFiEEpApMRcQDTeAqWtSDJrNi5H/PIsEFAl4caiwFCQsFbrUACgkQ
JrNi5H/PIsErWAf2OeTv2KSo5ukikdSA/iNItDXqqMhgrN0JbMadb82VYKKCFP+N
XQy26NQqcKjaJlmv1Q4rYDfLvz+1gvnir6l9gg47g/EPC5s2UxGOlGz8fzgHcHne
02PFEUKCNSlSZTJW8DCwFKN4VkPGqungJvDd9i8gC9B/TB3HH4IHr82mA3BnQ3wm
l9KHKXRoEJVR15cd6kKU55MRG0mq6VzYnW5Wwyxf0ZC6+R2tQgzxsvxRVPvQXSbc
Gv3kWoPgRo5a8IWzMB194tWVYNaqhMUPKZsgBUGF3JdzrwgDBAuC16mKgyMDrzH3
X0ZZ3TXH+mQBXu/px5L8BMz/WAibkjPVTeqe0c8Bzv8BEAABAQAAAAAAAAAAAAAA
AP/Y/+AAEEpGSUYAAQEAAAEAAQAA/9sAQwAIBgYHBgUIBwcHCQkICgwUDQwLCwwZ
EhMPFB0aHx4dGhwcICQuJyAiLCMcHCg3KSwwMTQ0NB8nOT04MjwuMzQy/9sAQwEJ
CQkMCwwYDQ0YMiEcITIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIy
MjIyMjIyMjIyMjIyMjIy/8AAEQgAkgB7AwEiAAIRAQMRAf/EAB8AAAEFAQEBAQEB
AAAAAAAAAAABAgMEBQYHCAkKC//EALUQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUS
ITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5
OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeY
mZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq
8fLz9PX29/j5+v/EAB8BAAMBAQEBAQEBAQEAAAAAAAABAgMEBQYHCAkKC//EALUR
AAIBAgQEAwQHBQQEAAECdwABAgMRBAUhMQYSQVEHYXETIjKBCBRCkaGxwQkjM1Lw
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3D
=3DKNPg
-----END PGP PUBLIC KEY BLOCK-----

--------------FW0HhDifU0Nlv6qJ1rx00EHY--

--------------Gr9tVzOH2LrQYOJl0Oa10wZq--

--------------IPSTK0ud02ryhEffSZlWOST6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEpApMRcQDTeAqWtSDJrNi5H/PIsEFAmJw3RMFAwAAAAAACgkQJrNi5H/PIsGG
HAgA2RdQ4vtyyWDN1oGh4ilFTbLP8Le7heKRQklRbOiZJ75I/fo8ZoCwaeU97OQFz8mbag4Qyr08
ncyX1lGc48KMsxi+v8G71mnwSTt+D9ioikg2HAiRRxV5XQ5kpdmrFo2t6A7oaY1Dm+TujcEC0k2V
x7RJnpB5XctQvtgfo+sE2cezCrm5AJdXuJeg5ZhP4hu3Htz+8Bw5RyjRxAam6WR45Kydt52KItiQ
dYPDBxBoiRcZHB/p4Y1hNgrnbWb/T9girRDVhReZkSC9SWymOXnmNELn7WV1jgf/DnoPW7CvoxYe
1vz1cUv3qFG9jawpd9zFPkwPu92dh5hDM9ZQzrNUCw==
=xbvp
-----END PGP SIGNATURE-----

--------------IPSTK0ud02ryhEffSZlWOST6--


