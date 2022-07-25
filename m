Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 476BA58060F
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 22:58:58 +0200 (CEST)
Received: from localhost ([::1]:41536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oG5AG-0004mv-PL
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 16:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oG57X-0002UE-6P
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 16:56:07 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:50991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oG57R-0004FB-5g
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 16:56:06 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 3DFDF5C0111;
 Mon, 25 Jul 2022 16:55:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 25 Jul 2022 16:55:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1658782557; x=1658868957; bh=W+
 NOMza7q6gUzt4xOVW3kK3GS1TK1GMf1lvIPvyZ8IQ=; b=apLi8sEFHH8j5eGxlE
 DlNOBFGx6W2WFtJN01Vnzq/2Hnvn3kbYZVoHqgvQ2r8lD/IEwn93+Da0MttQmHQY
 cTif6WD3xasq+ijOogXj4cM4nGFhVDF0MCQuYtl4M9weFeGlIMbsUxhQ5vsMg7QC
 X99nDhLokVDhei5mW/zkx8hwrCIKS5pERYFlaMxtePNLyuWBTmJaXuLQQYRhPamw
 1TkX1PwS28d9HRR73oJu0BpqM1MalydXjFWMG3XNbOvduoM36Mp/9PBDjhD0rpt6
 zRV+qESI7G974ynpiXCd4ZOACGxyZodI/qrwxpvC79Bh/j3DfruabXxTzPNx+Iy4
 gvtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1658782557; x=1658868957; bh=W+NOMza7q6gUzt4xOVW3kK3GS1TK
 1GMf1lvIPvyZ8IQ=; b=LkQBv8buqTLA8ZAk8rKTBTtoVQexjdpBiuByeohi50wP
 wi+KBuhZJYaJC1/ICRZ0rrY1Bl8y6jjLFZwHqwjFmUna2BKfbG5mUBLfhhUzhAk1
 LNzHw8gLDWrmSns8gzRUTyhLdhQ6vCn6sO1/8E8xQJdu3J0oGit+7jBn6hpALnUX
 1jb2/JdFqZF8W7VX+H0ui4B3SvhNC/zU/GhXnum+XB/JFzRFH8EJdDP+1tV5CmMd
 tGxqx4jAo22FJjdbSZJDrPNGqS6zsCXzrg2OxSxPub4g56hX842ZB1qgwEj92TEa
 1+HKvWN0BL04+A+/Ff9Dsd0yu1WR23IeI8E8V/7I7A==
X-ME-Sender: <xms:XAPfYl6ddqP7E8hzXRYAe62pepf_vH4ul5dI5Y5lgOCi1OWuG6vgTA>
 <xme:XAPfYi6RgQkLw0uilXAvW8MsLrntnQFanIlY0PWAoRVal7EhB4GSxywsT25lv80c4
 aoKuAe9f3pjOcROJSQ>
X-ME-Received: <xmr:XAPfYsd8YiYR1dm7I9w41sBsO-Pk3oK_K4jzA51HTfTMDWcLbjixzxqTnsBigYB8zB4Vz0hy2qO5gs1ZDw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtkedgudehfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesgh
 dtreertddtjeenucfhrhhomhepmfhlrghushculfgvnhhsvghnuceoihhtshesihhrrhgv
 lhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvghrnhepjefgjeefffdvuefhieefhffggf
 euleehudekveejvedtuddugeeigeetffffjeevnecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:XAPfYuJWYbL8hxVKOM2iaWksa5p_aByQZp57D07spZ7BDtV27zzMJA>
 <xmx:XAPfYpLOHLiygbHvi2hSMHIlGb7Loj2xHbmqNyPn4c-b0NNxOFUEPA>
 <xmx:XAPfYny8WdFJ3mx1TJ8pR2lKvULeKoy7k0bJoHQmsvipaaLqZB3XwQ>
 <xmx:XQPfYgVc6OXXaas698Lc-GkXek3rMsMiKPk_RnJgbjxAxuGXDM3o6g>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Jul 2022 16:55:55 -0400 (EDT)
Date: Mon, 25 Jul 2022 22:55:53 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org
Subject: Re: [PATCH v4] hw/nvme: Use ioeventfd to handle doorbell updates
Message-ID: <Yt8DWWg8qPLxL0fk@apples>
References: <20220705142403.101539-1-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ck9b0i/JjH5aUEEb"
Content-Disposition: inline
In-Reply-To: <20220705142403.101539-1-fanjinhao21s@ict.ac.cn>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


--ck9b0i/JjH5aUEEb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul  5 22:24, Jinhao Fan wrote:
> Add property "ioeventfd" which is enabled by default. When this is
> enabled, updates on the doorbell registers will cause KVM to signal
> an event to the QEMU main loop to handle the doorbell updates.
> Therefore, instead of letting the vcpu thread run both guest VM and
> IO emulation, we now use the main loop thread to do IO emulation and
> thus the vcpu thread has more cycles for the guest VM.
>=20
> Since ioeventfd does not tell us the exact value that is written, it is
> only useful when shadow doorbell buffer is enabled, where we check
> for the value in the shadow doorbell buffer when we get the doorbell
> update event.
>=20
> IOPS comparison on Linux 5.19-rc2: (Unit: KIOPS)
>=20
> qd           1   4  16  64
> qemu        35 121 176 153
> ioeventfd   41 133 258 313
>=20
> Changes since v3:
>  - Do not deregister ioeventfd when it was not enabled on a SQ/CQ
>=20
> Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
> ---
>  hw/nvme/ctrl.c | 114 ++++++++++++++++++++++++++++++++++++++++++++++++-
>  hw/nvme/nvme.h |   5 +++
>  2 files changed, 118 insertions(+), 1 deletion(-)
>=20

We have a regression following this patch that we need to address.

With this patch, issuing a reset on the device (`nvme reset /dev/nvme0`
will do the trick) causes QEMU to hog my host cpu at 100%.

I'm still not sure what causes this. The trace output is a bit
inconclusive still.

I'll keep looking into it.

--ck9b0i/JjH5aUEEb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmLfA1gACgkQTeGvMW1P
DendVQgAs3Rvquyd4u7jCXkiMpqT4wF0kJKqmeMzSexJymRYg0UUsmgRpyTrVcoq
wmVDG4OnZbqb0FGl6v01/vRdWN3soHvjl49H6jHxh/nYVRdzGEu/RPu0VYBRBbte
1hqWUSfzy6jZrPQP+htbgbhK3HwJ9eNpTA5oUUn/ZZEPPCDPPS4ADPv1NSL4+IY+
UX35urTH8bEiQt7JqcJc3by7lM14hBn03aCmSDAPB2MZ19Cbpw5HKrpUPC0nLo0I
bJbOGoHxyT4kp24sjgiOtwdorZOH4rYmGyMYvN7pgUJvPSYUS3mTscZAirbNZFr2
dK1kPxvkPC5JSkrV9SrS7hAmXK+Kjw==
=toZm
-----END PGP SIGNATURE-----

--ck9b0i/JjH5aUEEb--

