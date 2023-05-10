Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EC16FD7EF
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 09:13:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwe02-0004Vr-TP; Wed, 10 May 2023 03:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pwe00-0004VG-JD; Wed, 10 May 2023 03:12:32 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pwdzy-00025b-Kz; Wed, 10 May 2023 03:12:32 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id AE4D658035C;
 Wed, 10 May 2023 03:12:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 10 May 2023 03:12:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
 1683702747; x=1683709947; bh=JwNLOWDmx8X5jGyC6z0jdlCEO5VjziJtkp1
 psZHciWY=; b=cwYjx0PGS89THA7+dKLflE1eh3FnmaLYZrSqzOpgOpw0ee+WmKI
 iL57V7Nd/Ix8ciFR02Uw++xnz0A/YfXwVdigFBRm5tWVgYBJU3DWfXDUI/833UVj
 JVSOKaPQRZV3ae9WbcsheVXzF6K5ie6iZFy4JOCBby/spZ3v0atvoVJRv+0vJqSK
 itdBcAHk3WgV+knXGIiH3MZt0thtjw2+80S9sn2gtCLoFWXBpVituylnZn2TvV1I
 pEGxH6dNOiM5dRY/PRxds870B7ygL3E3vIGGy0HMmf4r/QvSIpd8PPFIYECRrAVy
 Mf4JYYAE8/3IkWzeEjlaYCNIMkG8G2bpBTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1683702747; x=1683709947; bh=JwNLOWDmx8X5jGyC6z0jdlCEO5VjziJtkp1
 psZHciWY=; b=CqX5H9LXnaUoSnVL/EXGszh63axNXg1w8CO1K65z80MRd0fggPR
 mP4G0mnnKADtX63LLMMQGevCccPovDVmyU+dm6urRNcLXMdcAn1CGGVoq4hN2mhp
 KZHDqMNHZF8P+6NC7egtcKAuqx50N2o099BE6sp6vdNHqYUw0h0xb/YG/6TvmhCw
 mvWm2UCDvfPpfQ3uZyfmLSc5Ay7q3AsJV/aXf8aOz5CzxwFI35vOIXayEanMU5sd
 PftaIe5BHFxF7orssHyw0J3p0WxPMFfMp7/VVadxqoA9/oOILm9Gu6+kn8eXeJSG
 WZmLFVUd0DXGq0I3uXeRXTfGzDSOo6hXbJw==
X-ME-Sender: <xms:2kNbZObwW_qii_JishhhQaMNZQWMao7pAOHkmTERUV36W0xSfqsrXw>
 <xme:2kNbZBZSkgP1t_5zUOnjEGCrtp7enhu27kAucriqsAgzZLzTroRU6o0TjV_o-5C3T
 XROekruVnsyJ3c_Q2s>
X-ME-Received: <xmr:2kNbZI8PtbL8GGU_Xfk9SO1Y4c7pXrWlx8SotCt3rg4BDtDHxBk0YD_nghNaXfm6OE2x>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeegfedgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
 gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
 cuggftrfgrthhtvghrnhephfduueeguefhuefgheevfedttddujeffjeeujeehheegtddt
 teffjeefleeiudelnecuffhomhgrihhnpehmihhpshdrtghomhenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehf
 lhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:2kNbZAqGyWGA9aekjuPQqhvRqBwF3_N7xFZU1H-Yfsv6-6K1dMemOw>
 <xmx:2kNbZJrStio0rTS0Y6k7tUqZWPmrYuxjMz8k85acqm1FPqKyJM4Ijg>
 <xmx:2kNbZOSj7KMQmTY0tX4_fcAVVlpA-CeeNHMeE0Cu-EOOe2ewBtsOOg>
 <xmx:20NbZM-ynCzyKDvgoc2EfWamGOymrMnEWJg7_qa-G2l9jPXBgHPzBw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 May 2023 03:12:21 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH 21/22] tests/avocado: use http for mipsdistros.mips.com
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20230503091244.1450613-22-alex.bennee@linaro.org>
Date: Wed, 10 May 2023 08:12:10 +0100
Cc: QEMU devel <qemu-devel@nongnu.org>, Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Helge Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?utf-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Joel Stanley <joel@jms.id.au>,
 =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9F16A468-D51F-4462-9720-D4B60C2B13B6@flygoat.com>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-22-alex.bennee@linaro.org>
To: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
X-Mailer: Apple Mail (2.3731.500.231)
Received-SPF: pass client-ip=66.111.4.224;
 envelope-from=jiaxun.yang@flygoat.com; helo=new2-smtp.messagingengine.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> 2023=E5=B9=B45=E6=9C=883=E6=97=A5 10:12=EF=BC=8CAlex Benn=C3=A9e =
<alex.bennee@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> As the cached assets have fallen out of our cache new attempts to
> fetch these binaries fail hard due to certificate expirty. It's hard
> to find a contact email for the domain as the root page of mipsdistros
> throws up some random XML. I suspect Amazon are merely the hosts.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Hi  all,

Just reached MIPS to get certification fixed.

Thanks
- Jiaxun=

