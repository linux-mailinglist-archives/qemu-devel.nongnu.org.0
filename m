Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DB22FA1D4
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 14:41:08 +0100 (CET)
Received: from localhost ([::1]:50902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1UmJ-0002dw-B8
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 08:41:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l1Ujd-0001aq-Bj; Mon, 18 Jan 2021 08:38:21 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:35473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l1Ujb-0006pa-HQ; Mon, 18 Jan 2021 08:38:21 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 330AC1660;
 Mon, 18 Jan 2021 08:38:15 -0500 (EST)
Received: from imap1 ([10.202.2.51])
 by compute6.internal (MEProxy); Mon, 18 Jan 2021 08:38:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm1; bh=k1mhz
 fATNT9R6DArKVul7Ge0zcThqls3LajWZsnCZ2M=; b=Yq5ZAPe8+7elKI8yzam6A
 f+xMu/SkR3g5itwu8nsPhQ2GzqXHu/3SdV2J54yneIfmjoMrcuKBoeiBGMgxeIoT
 7ub5upZx1lcHWDxgnjXGyP+Xa2sraH+fXespCRXS0rjsA5leuVHnOwpA9GazQRwd
 fHUYFnUDmUDnwxUE61oUGmDH0X+sWqFTpbUNlziursrg2H9UxRFb9kz9z71Z0aOq
 fKziXHQj7QUna/0ynL1r81Dwm3pqmbNFoBVFFzahJP9d8kBwFAJrYBk+VAh5ZnkC
 0uUZFMNEiW0pHegfOsubEC+o9r0Wo33ba0EUkYCEQitSlUDKUR73EZy1zvyyvIbZ
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=k1mhzfATNT9R6DArKVul7Ge0zcThqls3LajWZsnCZ
 2M=; b=rGHWsd5jB9SBOYU2G9WV19IYTvJ2mkkTAtN9Khm/7+Kf3+UqhwiWb2Wwg
 DIwYo4s7iJRO/xcB0yNfqFCD7cZF9OikysYYhIZ2zpJc15OlwZYgaw0V1/a8jSg8
 7SRuFRWbIO8CBdIwWwr/Zz6MMBeHN8WKchhQ7cOjSNF8H+L/ELD/3T0l1yOLRjm5
 1FMq8szOH77RaJCVSiD0pfLMfJqP/T7uO1I1y2PydqV54NmVBzXhhSd1Z8KIPgOz
 z6v6PVdeLwYF852DGBeIurbp833ZeV0dEyIEUN3PflCwAVo+IPLC1e7PzwBZBMSB
 /jVmyEgsUExg+kGG3NC4+593ULL+g==
X-ME-Sender: <xms:RI8FYD1oG49NjUqSnTp1IJK8wWJoju8MV0TNJ9ewdX1qWUq4-1_jPQ>
 <xme:RI8FYCFMhNQkQ39rVyh-_QGP4RYfJvPsfbLQWkKMEW5B5ZO9SDOdxI6D0nCGWVOaD
 ds6TL8RJ2qg7DBni4E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdflihgr
 gihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
 enucggtffrrghtthgvrhhnpeefteegkeevfeethffgudehgedvueduvdeifedvvdelhfef
 heekteefueektdefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:RI8FYD5ohhypol032FUHZ0ANchk4431xVRISyEL1SoFFNKE4UOYJwQ>
 <xmx:RI8FYI2C7Qg-QWrANXpKBSLBLDzdUMwVvdTCf2hSr2mnD4GuwIZJYA>
 <xmx:RI8FYGEIqwyWw9RZXE49AOxiBzOp0Em6ing082TGZ-fpGAzFFkvxow>
 <xmx:Ro8FYEHDAar9kcNobc2cLZnd22WL447kxH4PAaUynYiWDE1ep1auyxzG8SuAONbi>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B8FAEC200A6; Mon, 18 Jan 2021 08:38:12 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-45-g4839256-fm-20210104.001-g48392560
Mime-Version: 1.0
Message-Id: <fb7308f2-ecc7-48b8-9388-91fd30691767@www.fastmail.com>
In-Reply-To: <20210118101159.GC1789637@redhat.com>
References: <20210118063808.12471-1-jiaxun.yang@flygoat.com>
 <20210118063808.12471-10-jiaxun.yang@flygoat.com>
 <20210118101159.GC1789637@redhat.com>
Date: Mon, 18 Jan 2021 21:37:49 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v2 9/9] gitlab-ci: Add alpine to pipeline
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.26;
 envelope-from=jiaxun.yang@flygoat.com; helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 BALATON Zoltan via <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Mon, Jan 18, 2021, at 6:11 PM, Daniel P. Berrang=C3=A9 wrote:
> On Mon, Jan 18, 2021 at 02:38:08PM +0800, Jiaxun Yang wrote:
> > We only run build test and check-acceptance as their are too many
> > failures in checks due to minor string mismatch.
>=20
> Can you give real examples of what's broken here, as that sounds
> rather suspicious, and I'm not convinced it should be ignored.

Mostly Input/Output error vs I/O Error.

- Jiaxun

