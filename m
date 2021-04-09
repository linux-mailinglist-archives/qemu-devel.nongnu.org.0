Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A8D359232
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 04:48:54 +0200 (CEST)
Received: from localhost ([::1]:51502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUhCX-00022B-MZ
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 22:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lUhBF-0001RS-G4; Thu, 08 Apr 2021 22:47:33 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:38213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lUhBD-0006cn-RB; Thu, 08 Apr 2021 22:47:33 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id A4EF55C00E2;
 Thu,  8 Apr 2021 22:47:28 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 08 Apr 2021 22:47:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=PVJwX
 J+/T2T7noZW/iJN898Q3uCmsWbu4RjBtmPc2L4=; b=eadcugFJIzQOO3s2hVomM
 aGZKoIyTTSI+KEpCv3xKepqp3lQYB/FGLfsn47yPh+lL035wbL5BF7sgVRZ88vYZ
 PeKoiPI164j+W9wsfx53fWKPT61oNQxNrFcIaWeon+EELEzn1ogn3IWVH/fQP6Su
 z5UQaBP18zKbx6HgUrrSw7QCm6/qeiwIK3fjSIMPvI63YlFDwkMyhBeMHPqpYjrQ
 Sba184eymKStsac9rQCYTcvNiskZglEcr/iTuiCEZodenhSaO3Mu2NhgeugGiMpb
 LaRWwGn89/pSRBdPzzSVXTg3wcOIKQKpHkvqjZoPCq4hKYC5nkgcx18liuux8TEY
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=PVJwXJ+/T2T7noZW/iJN898Q3uCmsWbu4RjBtmPc2
 L4=; b=aGi8z4/K/5vAgenkY3MOHn6UCMp/xqAw75gIc+tg99lqSxUjGTVQuMsOR
 nAQlu2qlrfKDI7qzhmXnAdCgJHjVTRrIvnxfmuJMzCvZ7rYhBb/B/BrB6z8ThSow
 j7yxrqLM8KS0B9wE8s4HJENKnOcTerL647lasDh/x6qJOjsOKbVIIYynw+s93scG
 fkUQg40KpuUmYXQ6Wb+DPNWJjpgahmzL5vJAV/wIwVzWpQoQ+Jy9xu0FpLOpKcl3
 pDeTlAxSKrq1kbeG5EVMF5ASsZI49Yfe2hMFYNKYwHBwIdfhVG4VgJJrdtwdGXfB
 F5WSWllvUoIGUFdQ6hn9HIbEcHVrQ==
X-ME-Sender: <xms:P8BvYLdR3Xq0XU_7n5mTCCkh1_lu6KPv3FX6gD9CyIlT-l4d6K6mWg>
 <xme:P8BvYBNRUHZM5Zc5cWyJL9LSFDH_rl8YZ9hfxWbWbkD2396khkRDlvMMkSsHb182D
 ZgJaH95_k3VzP7yZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudektddgiedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpedvgeekheegfedvhfethefhudetteegueeggfeiieegueehkedugedt
 kefglefgheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:P8BvYEjv7be4_AJfZld1lt_CNk728wQCMMnNw-7OTC4_smXnyLyHuw>
 <xmx:P8BvYM_9jGAECkxEgTQ69hBaGGfiewxzHCMg4ZmnLcVSABM6MzsYlQ>
 <xmx:P8BvYHvPJ4Hfw_-8T71qSFXdPpodrU5jm6tUVudLrrUT1P2Yfk9Ldw>
 <xmx:QMBvYBK8t3aGHnuTo_KfyDTqU2Q1NfCgGXfbNNYXDjXr1U4yU7ckTA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 158F2A0007C; Thu,  8 Apr 2021 22:47:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <639a3837-718e-43f7-bfb4-2cfbfa97b7c3@www.fastmail.com>
In-Reply-To: <20210409000253.1475587-2-joel@jms.id.au>
References: <20210409000253.1475587-1-joel@jms.id.au>
 <20210409000253.1475587-2-joel@jms.id.au>
Date: Fri, 09 Apr 2021 12:17:05 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH v5 1/3] hw: Model ASPEED's Hash and Crypto Engine
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.26; envelope-from=andrew@aj.id.au;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Fri, 9 Apr 2021, at 09:32, Joel Stanley wrote:
> The HACE (Hash and Crypto Engine) is a device that offloads MD5, SHA1,=

> SHA2, RSA and other cryptographic algorithms.
>=20
> This initial model implements a subset of the device's functionality;
> currently only MD5/SHA hashing, and on the ast2600's scatter gather
> engine.
>=20
> Co-developed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

