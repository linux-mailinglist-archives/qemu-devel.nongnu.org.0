Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 173A8699B63
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:37:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSiBJ-00061E-Hv; Thu, 16 Feb 2023 12:36:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pSiBG-00060A-Ht; Thu, 16 Feb 2023 12:36:26 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pSiBE-0002Tt-7X; Thu, 16 Feb 2023 12:36:26 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 8978A3200997;
 Thu, 16 Feb 2023 12:36:14 -0500 (EST)
Received: from imap46 ([10.202.2.96])
 by compute6.internal (MEProxy); Thu, 16 Feb 2023 12:36:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1676568974; x=
 1676655374; bh=l6FZhVTIy5ItcT2X41A2WYVkaFPPLK7yu2aZ4aeClpA=; b=k
 OkQUq39d9zLrYbqp9bxw6YQ3ivPpw/0FK0f5nOCx0kyvfKU112y68TKp6PYCipQ4
 oNYH5Wa+NFP+yiFeQsn1sTinejcJof7F95j62CCAg3I/clR+3FqYHkC7WyHVYpB7
 ArmpRNMEKtX1NQiwO+aJI6Qk98HNpOXSSzO7a+B6tTFLdcW4MHPxnE238KBp0vfS
 ocxHC1NOPIj0fbKEbUQvQj2Cko9KrcHjV6w2/6lUmP2XuIwlfr0MVX2pzdJ23Qlg
 6JHPAFOfpafm+0XY0RWwbERj+opZzk7/ig68n5ohETwzgIKkbi7YoC+CIeOXOnFg
 aBjevUlfCm/GjcshQCh/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1676568974; x=
 1676655374; bh=l6FZhVTIy5ItcT2X41A2WYVkaFPPLK7yu2aZ4aeClpA=; b=M
 C/HHk8ZF318BRJsHgNsPYJ/d66oEgw0n1YtFRcCcWhoNQTItZ6qqsoKnsEmLZncj
 +PaWanZgln/WTFzJwqfxqyvdhPG/QhAb3zdCcnN5qcCqYT55gS+Z8rx8Vrne+HBt
 PMBJ3z1Ogpinw2AKoKuAtBnTo3dfA6Li4/MVMAPKS5MqtjO2D/gRnpPh4ojVSfeF
 +b7VPf6I1ybOCgzngpQlDzOOwhMSlMpXr/58Mss50f1/6Hrp83rlf+T1f6+7gzzb
 793kyHEbIl0c3PlyC739MOjPQse4yqdUQHt4Zpa0isZUDTUqNaxGGiVYx9gubdqR
 hK+M1IDlL1Ei88kB1P/XA==
X-ME-Sender: <xms:jWnuY65rxHJYfk3emHZjTYuahAPecDh1s72YQMpsjiOgJBjh9b8i2g>
 <xme:jWnuYz5JvsYj68OCDp_MS_GOLo1dubDp6v17k2C0Z7iwQVXzC773lSOo9aBTH8sIP
 0Xh0jfl33FZUNCwDwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeijedguddtudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
 mfhlrghushculfgvnhhsvghnfdcuoehithhssehirhhrvghlvghvrghnthdrughkqeenuc
 ggtffrrghtthgvrhhnpeevfedttdeuhefhudfggffhgedvgfdtgeelueegkeeigfevvedt
 vdelffelteelveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:jWnuY5c7W9XP3muoF-BGS52F4IgM2q67Tyrq--RHLpVwEv-IGN3Lfw>
 <xmx:jWnuY3J1efWTnTkya1Yr8RGDwBAUWGcdZ2pDMyMz_mmCLWqPk4eipw>
 <xmx:jWnuY-IxlwGMQb8bE2NkRVkXzf7fTTDkzfXeblBm63GyI4bit8WFNA>
 <xmx:jmnuY_qeZFXB7own2Qrm_BNCGxPR9rWWIjIboR5PQu-RlMj6vvae9g>
Feedback-ID: idc91472f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0BC9D2A20080; Thu, 16 Feb 2023 12:36:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-156-g081acc5ed5-fm-20230206.001-g081acc5e
Mime-Version: 1.0
Message-Id: <f1c9dd4e-be82-415f-bd27-554962b97eb4@app.fastmail.com>
In-Reply-To: <Y+5ml5+YGC+kpU86@kbusch-mbp>
References: <20230216164806.233533-1-jwd@defmacro.it>
 <20230216164806.233533-5-jwd@defmacro.it> <Y+5ml5+YGC+kpU86@kbusch-mbp>
Date: Thu, 16 Feb 2023 18:35:27 +0100
From: "Klaus Jensen" <its@irrelevant.dk>
To: "Keith Busch" <kbusch@kernel.org>, "Jesper Devantier" <jwd@defmacro.it>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9_via?= <qemu-block@nongnu.org>,
 "Fam Zheng" <fam@euphon.net>, "Stefan Hajnoczi" <stefanha@redhat.com>,
 "Hanna Reitz" <hreitz@redhat.com>, "Kevin Wolf" <kwolf@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Klaus Jensen" <k.jensen@samsung.com>
Subject: Re: [PATCH 4/5] hw/nvme: basic directives support
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On Thu, Feb 16, 2023, at 18:23, Keith Busch wrote:
> On Thu, Feb 16, 2023 at 05:48:05PM +0100, Jesper Devantier wrote:
>> +enum NvmeDirective {
>> +    NVME_DIRECTIVE_SUPPORTED =3D 0x0,
>> +    NVME_DIRECTIVE_ENABLED   =3D 0x1,
>> +};
>
> What's this?

That=E2=80=99s a left-over from my rebase. I=E2=80=99ll fix that one up.

