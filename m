Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 106104353FC
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 21:45:07 +0200 (CEST)
Received: from localhost ([::1]:58284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdHWL-0001ZI-Ve
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 15:45:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mdHEV-0005T5-Ls; Wed, 20 Oct 2021 15:26:39 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:33651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mdHEQ-0003eh-FM; Wed, 20 Oct 2021 15:26:38 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 40A2F3200F3D;
 Wed, 20 Oct 2021 15:26:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 20 Oct 2021 15:26:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=r9doomM9vq/LbqLSCiSTPZTyLj0
 CcOLRrZVMRre6U1E=; b=JRjVJFqKYfw2/ukHhm8vSChpP6RmJ3U3v/8bYIk0EDA
 oDKWHh2uAg9olzYq/aRXxPgWSen/MfggHLP7z2c4gyK9kQJHq3j0UCZhBIelzXgq
 Hqbrsn6kOCmWLSiO/1ds0ivybfe+7AZOrLSbBRd8z4gCqHy3QITThmj1nGGeITKX
 LGRimZRnH8Jxi1/1NXLP5W9Q4NiSKvaKTowDSNSWP1iSSu/+8qjF56V5echk5lnA
 ZoHspGCa7o5Np4J+LCJGgqqHpQ+OvU/400LmDfZDp8LDdcai+VX6Y1V4iR2rN8Xl
 SACHW7C5AWhbIrKGvMNHMYxv31uKuSLZIdyLsSDNF0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=r9doom
 M9vq/LbqLSCiSTPZTyLj0CcOLRrZVMRre6U1E=; b=dAlyJQdrRwDKQYPor4laeU
 rDqaOl7izm7BGD+YxVCiiXnjN6kZzJiwwqEVGwGLEWPT0QfmkjinzKuFdQMSCsdZ
 /5XN3AZ43kIGafBWkb9JT5MwKDGvoG0KAfoFGQwzCnV0McGKL8i4XLDlOtFYEyfn
 BQlrNYX147Sb3lOLMwZATZw/68t6zisUFp958sfX29aRIS3nNEXOo1DZvAmE/bAA
 CX9QNOvris9+KyeLkZ7RtovJRmMS9VW1XuD1xCZtF25MbRFAgA0LcA1Yrl8rjDh3
 aa6pZOuCUDgHQhT1+EnszZ4/6JsfFuUS4gS2oTDcP3RxA47leDEchWNy6/QV9RAQ
 ==
X-ME-Sender: <xms:ZG1wYXA4NL9pJ9y0sHFAY40QJPIqGYUfSJgTP5brX6PkTA27jZobtQ>
 <xme:ZG1wYdjDJsNBDq4TMcSJhUlNOjsfJ2eUYdQfLvwkJvSuvVtdd7ZwQXz8hE2p5AUMZ
 DBNU7eFftNtfBxWJhM>
X-ME-Received: <xmr:ZG1wYSnL9b3oKwtnoVC0W_s8dwvpAT66VnDZ-On9P61IBjMXbT3J0_Fl3Q2MALt_Ot8jCZhLBB1u8zEuGwMbFjWDCCdQXFbYDdsHX91GuII1IobTxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvgedgudeffecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ZG1wYZzC3dJRihS_QWhRq4oxL1PNJPTtvgrnIEMgTfVLL5L5lWmnKg>
 <xmx:ZG1wYcTIV_HkUyw5iRWmfptRRA4CJeBzntWbQdRy00mM5UE7RYPZjQ>
 <xmx:ZG1wYcYvVy61ZVa5PjrsqUuF5L3L7zz3V2pF3FZDWMCzLL2kJQT2dA>
 <xmx:ZG1wYSOiF1KS0az761QQQNHXxF5hdnSxV7g6-xl5M_9CtOGTVi2gWQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Oct 2021 15:26:27 -0400 (EDT)
Date: Wed, 20 Oct 2021 21:26:25 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH 10/15] hw/nvme: Make max_ioqpairs and msix_qsize
 configurable in runtime
Message-ID: <YXBtYSJN6+OXvhiw@apples.localdomain>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
 <20211007162406.1920374-11-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="f7dWupxgMUc75B58"
Content-Disposition: inline
In-Reply-To: <20211007162406.1920374-11-lukasz.maniak@linux.intel.com>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Keith Busch <kbusch@kernel.org>,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--f7dWupxgMUc75B58
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Oct  7 18:24, Lukasz Maniak wrote:
> +static void nvme_update_msixcap_ts(PCIDevice *pci_dev, uint32_t table_size)
> +{
> +    uint8_t *config;
> +
> +    assert(pci_dev->msix_cap);

Not all platforms support msix, so an assert() is not right.


--f7dWupxgMUc75B58
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmFwbV8ACgkQTeGvMW1P
DelvvQgAmimCKbOToH+8xVLQ1AlA/w1N32umiQMKcIKwxGva0LMSr4GtD7p/o2vN
ZWCh3Pe47hv09v6uEV1/IwQdsExD7F1zBfQ7q0iL9VOl/7Q4NuL2DlcWS1Na4UxE
MfKCGQakSFowqRHCkzOV9WjBtY6/yV4mFhxMmfRceuRdBAkMy2hxlPhpEutAza45
jQoL7KJNXzXjARcbESvSoK0NDeRlUm1cm8EpC7FV5yqoOAQrb7VgI09JqgI6icip
TqGHLFcBcXoCMqai+cw+pmAtNOtTNzgTvc1LxSueGk37zycMNS5V6Q1RXeAXWILz
/KFPq3uPmidEK9tGnstzbTrgZqXBwQ==
=aQ/k
-----END PGP SIGNATURE-----

--f7dWupxgMUc75B58--

