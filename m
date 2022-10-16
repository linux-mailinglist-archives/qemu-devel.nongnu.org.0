Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B33F600171
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Oct 2022 18:40:22 +0200 (CEST)
Received: from localhost ([::1]:38690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ok6gX-0000Mu-5R
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 12:40:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hi@alyssa.is>) id 1ok6eW-0007LL-AD
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 12:38:17 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:41591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hi@alyssa.is>) id 1ok6eT-0004jO-TD
 for qemu-devel@nongnu.org; Sun, 16 Oct 2022 12:38:15 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id EE95F5C00D2;
 Sun, 16 Oct 2022 12:38:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sun, 16 Oct 2022 12:38:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1665938290; x=1666024690; bh=kG8k4GZ2Vy
 NHjlWxoIRAfBOmMyyHdZka6FurBCPkwn8=; b=AIaJoSyIgnf391hpOxH11aD4qv
 w2QsgV/dGrK8XXE8s5pA+GZWxByOcCUzT55s93WIiDqfBbUY6/Y9R8W8LOjFQc6O
 Wuf87byMo7LXilvdgfbVvLpoTeDrFqUvFeNr5EJ3SGh1+Tn84v/ib/4qYrVUvris
 PyzOnzjjvlOqwmlx5wR3wbvYHKDyEyKOM4+AacUa8wk8vWHY9EsJebYUjCkPYiEJ
 vHzOgd1G1HDtqYzhl5/u/Sc89JWiCxlUPfcTbu+Masvsbw7dsHvJcWobvmoRs/un
 rn5YFw8b6NydgwX8bxPsOJ0X3iADFUPlklnqoCHIXfWgJxBy0SeCUDkpU6vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1665938290; x=1666024690; bh=kG8k4GZ2VyNHjlWxoIRAfBOmMyyH
 dZka6FurBCPkwn8=; b=p+gTKI4qtFW7DFCQwGwinNNo9AXQy3C5pbb4cqjJpmUv
 7xaVA4iEaThRBCdlZUeAiA/tRkUXFU4EtSxCufhwMujqiG/uSI2idHx8NLpiBqpZ
 l2vuPUmSO/uUUNBIgjp/oBAp24hL8OLI0WxH1uDDStFKIeERrDvuzx5P3ndpq70E
 QsLFaNqvdmP6s8ln3NhGG3UhTZgMsTcuh2AjJDDAzfLYCOYgCCErsuZohdaB1DUk
 p3i+cK/RiN4yYKlJhBS8TWo2hUc2Tzq35aX3Hc0N40OgkWhcmIw9yg8Gx7cmzf2m
 nWztoxTcpxKmsITw7Y4vZd82qE0rDAfWGaTTQXRCAg==
X-ME-Sender: <xms:cjNMY1M4swkcd9e4CY_OxNKKEeqhQY7BE1PiUTFDaokJAJqUXpp-Eg>
 <xme:cjNMY3-pY1Riz53pOqFEpo2foJBbLBJJqFWlUZV_Ry-MXr2h4o4M83XixM8VEAK8c
 2nI-C6Qw0BYePK7kA>
X-ME-Received: <xmr:cjNMY0SdK9MBxRngMNFXzF6E4QgqREhTi5-_Gatmc7Obllm8C1kEevBsAprdfuiZqJvk1h7I2HZYcC2IhqfFIytB0_Rp8pC3Iw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeekjedguddtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefujghffffkgggtsehgtd
 erredttddtnecuhfhrohhmpeetlhihshhsrgcutfhoshhsuceohhhisegrlhihshhsrgdr
 ihhsqeenucggtffrrghtthgvrhhnpedvudefgffhjeeufeefhfevgfdtvdeghedvudetje
 fhveekgedvhffhudetgfehieenucffohhmrghinhepnhhonhhgnhhurdhorhhgnecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhephhhisegrlhihsh
 hsrgdrihhs
X-ME-Proxy: <xmx:cjNMYxt6cFC_XCDT-ENOzk5q7CgJs88Qogx94n-GKmpy7ZxPD3yOYA>
 <xmx:cjNMY9cDwIRih0uAPjyBXHQtIqAgBv5b2_5cSomXIKm2WKHlUaLmTw>
 <xmx:cjNMY91oT4Ypfloktp9_DthpEnhQ_UZkJoqfHBJr0B1OCjfdRG3dfg>
 <xmx:cjNMY9mebW4CbkIVrgGxN4J_IkLMEIpUNR3OVR5aylKmD5ubz8mabA>
Feedback-ID: i12284293:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Oct 2022 12:38:10 -0400 (EDT)
Received: by x220.qyliss.net (Postfix, from userid 1000)
 id 259F724E; Sun, 16 Oct 2022 16:38:08 +0000 (UTC)
From: Alyssa Ross <hi@alyssa.is>
To: Linus Heckemann <git@sphalerite.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] docs/devel: remove incorrect claim about git send-email
In-Reply-To: <ygay1tmej9f.fsf@localhost>
References: <20220913165214.97241-1-git@sphalerite.org>
 <87sfkqmq2u.fsf@alyssa.is> <87o7vemq0c.fsf@alyssa.is>
 <ygay1tmej9f.fsf@localhost>
Date: Sun, 16 Oct 2022 16:37:59 +0000
Message-ID: <87h703rafs.fsf@alyssa.is>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
Received-SPF: pass client-ip=66.111.4.25; envelope-from=hi@alyssa.is;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--=-=-=
Content-Type: text/plain

Linus Heckemann <git@sphalerite.org> writes:

> Alyssa Ross <hi@alyssa.is> writes:
>
>> Alyssa Ross <hi@alyssa.is> writes:
>>
>>> Linus Heckemann <git@sphalerite.org> writes:
>>>
>>>> While it's unclear to me what git send-email actually does with the
>>>> -v2 parameter (it is not documented, but also not rejected), it does
>>>> not add a v2 tag to the email's subject, which is what led to the
>>>> mishap in [1].
>>>>
>>>> [1]: https://lists.nongnu.org/archive/html/qemu-devel/2022-09/msg00679.html
>>>
>>> It does for me!
>>>
>>> Tested with:
>>>
>>>        git send-email -v2 --to hi@alyssa.is HEAD~
>>>
>>> X-Mailer: git-send-email 2.37.1
>>
>> I wouldn't be surprised if it only adds it when it's generating the
>> patch though.  Did you perhaps run git format-patch first to generate a
>> patch file, and then use git send-email to send it?
>
> Yes! I didn't realise that git send-email can be used without the
> intermediate format-patch step. I guess it's a git bug that git
> send-email will silently ignore -v when used with a patch file. I'll
> have a look at fixing that.

Yeah, that sounds like the best way to go.  I think it'll swallow /any/
format-patch options when used that way.  Would be nice if it warned.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEH9wgcxqlHM/ARR3h+dvtSFmyccAFAmNMM2gACgkQ+dvtSFmy
ccC73BAAkUL9+iOboSRJfSb2wknEV4zJS6eo2z1QdGLqIfUHhPINajK0sJvoLCcI
+0ef7CgXxLYQJyKvVHvsK4DmsKSnGdcGUJQu5eJZOGg63hIM5OKu7zYoW4adx/Fd
vRC6x80yLMuM0HpoWPEFnZA2vKg2hY3XvsGh2R63F2x3Rvvq6qp5C2JdVS86TqNn
XEHLubxQuJF9KQl2QyVppJXaZLuM/vP1doSM0MCIlr/ZZMR5Bjb8bPB30217h/nt
GbpXCrlZtATQWNdTuTCMmdouwTfCOQd31QHkNG+jB7GV++OU9hGVynBae9CHK6fN
BKfQWJxkmWnW+4/owDBSnagaw+m0Vt5WNU3Rfa6wOoyftdGPdye11tatcTXSRuY8
Kpj5fQdreGTJgTR+PDOoOtH6n1VCiwshN3uMH/XFD9krm3S9elU+KppjlRv5BAm6
2uTsIqCjr8YTIzfhCP4/fmHfNj90ez9fn3mmA7VL+8I2sqpJvI/kfjXaSHlfSBRD
APHGrn5h0WxGEot9wf9LeAdvmuYUQwlUIwgTIpXDGg5I1zvEsjvtnaahP0Z6Oa44
/qQpwp+JYPi+eRQT0Fde4WbaAMkCK9yHBahlZHbOhhSoQlZ90i3izf222u03JedM
7jqe8a5MMGLlQR9LEMpoo4OvTZlXURCPB0eOFZjuKl9gcOp91c8=
=gzrt
-----END PGP SIGNATURE-----
--=-=-=--

