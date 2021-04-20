Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7382B365318
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 09:20:40 +0200 (CEST)
Received: from localhost ([::1]:59434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYkgZ-0008R8-Dw
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 03:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYkcb-0007qK-6o; Tue, 20 Apr 2021 03:16:33 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:44883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYkcZ-0000d8-0x; Tue, 20 Apr 2021 03:16:32 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 652381FF1;
 Tue, 20 Apr 2021 03:16:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 20 Apr 2021 03:16:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=8fwTo7vvRUSSZKluh7mOwAVqbG6
 ePTzEYsu/BJ6mue4=; b=x3bOpL3TEXCe4JgtvHV+ML4KnHEPspzDgxaeTswvKfm
 7Nrf4Usic7N3W8vphMN3RZadUrzWdK38T460vnbp+OcZeoXNxsVJzSgqyiUXwG/k
 TTpjvR34K69HSju8SXQrhOYDBnNidSczyKTsuEpE7KyvcsRPzuTiTKAEDMjY4FY3
 bwrVLjJpL7M7T6/UetMSWztE657uROE2NjqpPlTVoV4OukEntqMnEPaM/wR9YsvL
 naLhjWWu+aSGXHAC++aEaap0yLlXMNC1dt61RSEd5xEwwrgdt4CdL5n49uLTHUst
 s7ZVB3GzXGSVAuRu49a7a17jc4BzD8E4YR3Zxbgb6cA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=8fwTo7
 vvRUSSZKluh7mOwAVqbG6ePTzEYsu/BJ6mue4=; b=ATyCqshzJ1u9A9kB97rlM6
 +g9mnyVZDJIG+v5gmOx7QdO3er/vpETG2aSoXvwdvm2u5C8xc81nrFgwZZkC7IYC
 4ZzqJZRUG+G6WOXUIeBF52pxUXpMX+CmRefyUkPu5UEgb+spdKOvbpi+5tl3rj1o
 4644SA8oLVmOtjgchHf5isVMMYwnD8fov2VIpwtOZqC4uOJqaUH3T4imh+8Tf5X9
 bY2axc6pBPGXvvhRzr+I+PrtMnSzgFrcca5B4HXNMQT9OM7GkNXahg8MqsIoYOS9
 Kob+dvqMJoRN5Cio9xNMkbkKEF0loEeq0uHmhieMKxpqPx1FIRebSx15dLcJ+2Wg
 ==
X-ME-Sender: <xms:y39-YE1hQQVnhhq9Bep5odD0hMs_VcRVIFzCKZbIyvhtr2KxyHI9og>
 <xme:y39-YPG3M7uOk_7_gax5hyWOlXGSDK7TklfUu-_f6ydEeOJdNydJR7RQ9J7293WEH
 SUxiCi_7AKClPaBN1s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddthedguddulecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:y39-YM4v1LMVqPc6daYdQZYpKSlCVSkIST9DBtKJ9-t3mMRMbsGQRg>
 <xmx:y39-YN3aFi-CDZhGrh8C4E2Q1aAbF9bYIMP5d8p1HQ6OMX57fZU_AQ>
 <xmx:y39-YHGCXTuDaMvhLwD8cxilQcVRG0uAghEaYPRE4Qw3Lt7_EvLHNw>
 <xmx:zH9-YM6zrXoTguWtyDKTWOvgiJ8e-jDrO-ziITKUD_qYw50VGQXVqA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id D263E1080063;
 Tue, 20 Apr 2021 03:16:25 -0400 (EDT)
Date: Tue, 20 Apr 2021 09:16:24 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 01/14] hw/block/nvme: rename __nvme_zrm_open
Message-ID: <YH5/yApW64VaIs/H@apples.localdomain>
References: <20210419192801.62255-1-its@irrelevant.dk>
 <20210419192801.62255-2-its@irrelevant.dk>
 <485ad94d-67fa-32a4-c783-975cca188816@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="j2DwJVitRsZcpjBn"
Content-Disposition: inline
In-Reply-To: <485ad94d-67fa-32a4-c783-975cca188816@redhat.com>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--j2DwJVitRsZcpjBn
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 20 07:53, Thomas Huth wrote:
>On 19/04/2021 21.27, Klaus Jensen wrote:
>>From: Klaus Jensen <k.jensen@samsung.com>
>>
>>Get rid of the (reserved) double underscore use.
>>
>>Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>Cc: Thomas Huth <thuth@redhat.com>
>>Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>>---
>>  hw/block/nvme.c | 16 ++++++++++------
>>  1 file changed, 10 insertions(+), 6 deletions(-)
>
>I think it would be good to mention the change with NVME_ZRM_AUTO in=20
>the patch description, too.
>
>Apart from that:
>Reviewed-by: Thomas Huth <thuth@redhat.com>
>

Makes sense, thanks!

--j2DwJVitRsZcpjBn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmB+f8UACgkQTeGvMW1P
DenRxwf/ZG13KjQ0m1XnhnWYeOgFxjxsb22fB5yXuFMVZU9D5Rj8ic5TC1U6d33A
BmxMFSav5W/1fl4by4t0CoPtC64DbBsXcySofCWNgBOF2tf/ZkswDb+lg1aJ0d+b
XlSyRSm2wrSexzioelM1NznrjsvfWJrfbN1y7JG4Edoab0T+baufGO1HdZo+1SLV
8SCjh7Fymnv5nIbIPH0ZMDrl5TM89p+jNj3NfcZk+EXYe3A1fRXIyX4YB9XDs5in
BzUKYnqMAZYzmcG2/BGmHYVyBsLUemnnxL5QnHcgSwH6AHBzlHX3Hpld/VgKiPAb
w9E5mmEKDBn0YslC5B1V2WjsWiDZ8A==
=6MvX
-----END PGP SIGNATURE-----

--j2DwJVitRsZcpjBn--

