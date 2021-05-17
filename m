Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E142D382511
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 09:09:01 +0200 (CEST)
Received: from localhost ([::1]:60694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liXN6-0001Fz-Nx
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 03:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liXAX-0005BK-0c; Mon, 17 May 2021 02:56:01 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:36057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1liXAS-0007Sy-9f; Mon, 17 May 2021 02:56:00 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 267D5804;
 Mon, 17 May 2021 02:55:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 17 May 2021 02:55:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=mU/M5394a5laCbjNlMxZBFG2S0J
 xzGgbeUXs3WpdlEo=; b=dG4Ha2NyP0lbDGXxORlQBP+jAYnNZRyB9ALxWke7Qp3
 GrM78MNs2mJgDOUWaIZPJi+Lit7OnCP/7aZXWKLwl+U1Qit3SXeZ0+LcGioHU3M+
 aYz2S3VCB/wBPYe8HHeRh9eaxDOca9849NaCo4onNQ6YcmNsnsWxJHftvfQbKoUp
 +KewjbQbqMhXaV+Wy59dgSnC4qfSW9ukL3NS/nMobtRvFqs/nYXMDM7ZL31X19cf
 fCzu7pr8VIoPGW97LEZQoIzwedRs5NrMyhrAbqomlG4hc03+SwyrsAawEScCqrdr
 pWb3/1Cn4EtXsh97bc3Os7DeQ1m2oF3QtG/iOx8YKHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=mU/M53
 94a5laCbjNlMxZBFG2S0JxzGgbeUXs3WpdlEo=; b=po0y0XOTXN/NUHKaSt9eE9
 sKOKFsLzTVdGjDdH7R36iHFPt0/6PxRskkJV/bb1wLfRc9t/rM4rK02qzwcfr2S1
 OUBHfzsecZWLKGWup255YLou7b9WZS88ipe5eABOmQ5LJZGfvMWK2SRjvgr6Ufjl
 H+oiOeeTcTTGsAAUhhgtR8yT9s2r3ydoxWCAqNSqEHze4nzDMyIebffn5hgWAp8B
 Ka9nrb+BNZQQVxJZx3pYT6/xkQVpL+KcZKgtAbyM1UQVsP7f1nd9OHZsiTHmm6H5
 k+hr/TWVUQxysZNpZykoDRDX+b6J0sYUhVmKTH8hvD50AWE7CKn+KoBwK43GRshw
 ==
X-ME-Sender: <xms:eROiYHry4nrJpl9qVfuIIW1Ui0x-cWPHqlg_ojtznETa6KizSGSk5w>
 <xme:eROiYBr26NT4_GHsh_-CF7PAHHMVvP1pkdYJzPppHabFonh-xsTd7O30VjeBvCsvK
 sbl8tdgQa625kkUUp4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeigedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:eROiYEN9pFfekG2uHqUeRV4vIm1tasgUEqenCqJgYSJzALSm3wGYag>
 <xmx:eROiYK7zOvJ8JS4ODXyLj7I_lbIhlN3lxW_orvxwe6oFNvCNdlr-uA>
 <xmx:eROiYG7Zs94JFuOyyMB6dsjFh4__ojNqjxtndSJvHhi3TiZvoSxygw>
 <xmx:eROiYMnGoIS_HaLUKFDZqc5EFaf6MPyNx5RI5LjFiGs8cW_ptNj05Q>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 17 May 2021 02:55:52 -0400 (EDT)
Date: Mon, 17 May 2021 08:55:50 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: making a qdev bus available from a (non-qtree?) device
Message-ID: <YKITdgeMFo6hfzB/@apples.localdomain>
References: <YJrKRsF4/38QheKn@apples.localdomain>
 <87im3o2m8l.fsf@dusky.pond.sub.org>
 <YJ0xar/7H5vvEnQy@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="D/UjMFe65b1e2ZdL"
Content-Disposition: inline
In-Reply-To: <YJ0xar/7H5vvEnQy@stefanha-x1.localdomain>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: mst@redhat.com, Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--D/UjMFe65b1e2ZdL
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May 13 15:02, Stefan Hajnoczi wrote:
>On Wed, May 12, 2021 at 02:02:50PM +0200, Markus Armbruster wrote:
>> Klaus Jensen <its@irrelevant.dk> writes:
>> > I can then call `qdev_set_parent_bus()` and set the parent bus to the
>> > bus creates in the nvme-subsys device. This solves the problem since
>> > the namespaces are not "garbage collected" when the nvme device is
>> > removed, but it just feels wrong you know? Also, if possible, I'd of
>> > course really like to retain the nice entries in `info qtree`.
>>
>> I'm afraid I'm too ignorant on NVME to give useful advice.
>>
>> Can you give us a brief primer on the aspects of physical NVME devices
>> you'd like to model in QEMU?  What are "controllers", "namespaces", and
>> "subsystems", and how do they work together?
>>
>> Once we understand the relevant aspects of physical devices, we can
>> discuss how to best model them in QEMU.
>
>One specific question about the nature of devices vs subsystems vs
>namespaces:
>
>Does the device expose all the namespaces from one subsystem, or does it
>need to be able to filter them (e.g. hide certain namespaces or present
>a mix of namespaces from multiple subsystems)?
>

Subsystems are fully isolated. There are no interaction possible between=20
different subsystems. Within a subsystem, all the "resources"=20
(controllers and namespaces) are potentially "shared". That is, there=20
may exists many-to-many relationships. A controller may have multiple=20
namespaces attached and namespaces may be attached to multiple=20
controllers.

>The status of the namespace as a DeviceState is a bit questionable since
>the only possible parent it could have is a device, but multiple devices
>want to use it. I understand why you're considering whether it should be
>an --object...
>

When you say parent, I think you mean parent in terms of bus-device=20
relationship? In that case, then the parent can actually be the=20
subsystem, since if the namespace is not attached to any controllers,=20
then it is just an entity/object in the subsystem that the controllers=20
(the actual devices) may attach to[1].

Yes, the more I think about this and understand qdev I realize that it=20
was a mistake to define nvme-ns to be a TYPE_DEVICE, since it does not=20
act as a piece of virtual hardware. It is just an entity (object). The=20
biggest mistake right now seems to be the bus_type use. It just worked=20
wonderfully in the absence of subsystem support, but I feel that that=20
choice is coming back to haunt me now. If we'd used a 'ctrl' link=20
property we could just add a 'subsys' link property now and be happy.

Is there any way that we can "overload" the implicit "bus=3D" parameter to=
=20
provide backwards compatibility (while basically changing it to function=20
like a "link" parameter)?

Thanks for you help!

--D/UjMFe65b1e2ZdL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmCiE3QACgkQTeGvMW1P
Dem1Lgf/bJJxAWrvcd2Spzw5AyXEvjyibaLnzqgY/eE7lp9Sgh6x0krCLoIBfgPh
1q/T5at6dZIEnCqA8RdN8flnp2jhGmgRilbCjvYcThTAsdFWI9R79CO8FxbhSGo1
eXdIr+7p0gdv+jJpFJlWMtPO6X8YZTgPdZqtmq7e/aiXqYKxGJ1uXSWbFKhBVd5S
4CT4OqGaamnj+j9tRbO8mfqSahgm82xA8cQWLROCPfJkq2TQDuMDNJqbMnIn8muf
AJ+yMO1CQoyG5k5Xi8CmMH77In3I7ta/rDuOixxDe73MHQApB7dd4dkSNrqG674C
vlUeiLk4ZBLkv5HIxX49gnD69ACl2A==
=NuQw
-----END PGP SIGNATURE-----

--D/UjMFe65b1e2ZdL--

