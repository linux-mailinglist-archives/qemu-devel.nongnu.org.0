Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB476AACF7
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 23:24:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYaHf-0006hr-I1; Sat, 04 Mar 2023 17:23:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pYaHc-0006hU-Je
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 17:23:16 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pYaHa-0003tU-T7
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 17:23:16 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 7B5D65C00B9;
 Sat,  4 Mar 2023 17:23:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sat, 04 Mar 2023 17:23:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1677968592; x=1678054992; bh=gBCLBiriKG4Ed35YzmoztTuWPcrHgHCfd96
 X3EUybwE=; b=SS+pZF3lVltukFwH4WnsTXEWxd4yqJ1KgtxoM6ifUZBv8WlLvgI
 CGCiUUdUSUJmpeUwr0UHGTJoFOY0ZIBjP/v523PKCea9vxCEhlV9HY6Pnz56j4mI
 8IVyDXwBmx3j8nKWBPXhxs+Uy2aWtmm4CFRL8vaQohBKx+9rDVsPKdQehpujheyO
 suCs3A2LlX8kLQl5Th+JTYpe0285tfAuyGbO20NGCXpliNSKC+htCB6dgikTQXuD
 QjrHsWbrEdp/6lwo7pQ+Etal9QKthsKAMrOIAJJsZ2ETBYyw2GH1z4qvSwCDo7Ya
 k18pieFBtYMB17Z/+b63rQZdZg6SDpR8T7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1677968592; x=1678054992; bh=gBCLBiriKG4Ed35YzmoztTuWPcrHgHCfd96
 X3EUybwE=; b=ZDOFI4dPeBW4w53KB0spe7Pc9B3vQCjAoAbuaNdzurM0Yo/R6X6
 Ti7rQ4BmJ21yxx1vNI4GZsf4SjnD7PqHWRRAGeGFhZAeqlJL38iWg5XF+uHlvwT9
 9wKcAbm9PA13jqg64mwiBaAwxR966GpO4OCfkttzGQVzcmBRzuwanwsQQGI6QBU5
 vLwJbX7GWVZbDBJr8lVCrpFsARjUfOhJ8bQM9fW0Y102dNp2UUq8nNb7LehNUrHh
 NUj0WM0qLL0AYZGlYdCFRdbA7nGOC5N/VRsgICYlarM4ZBf5+KjrGQreKdji6vIu
 di9BjHpZtW+XR/XN4w+UbuiPxlmENykmbew==
X-ME-Sender: <xms:z8QDZPCUH9I1SjxvQkEMzB6smlvk7hmFhElj7cdDcEZUFt4PgcLpqA>
 <xme:z8QDZFgmeIz0zvwUjsxPPIK5H85qLYrEDoxSPOEy8Ywdm05QLnpij_BzrE4ljHy4L
 hXb8HMBJ0GWdMcACb0>
X-ME-Received: <xmr:z8QDZKm7G2LBVLrn_GWMKIJtZR_0z3q5oMpdCDztNTXXf_L40mdPprN6Dz2JpLqjiOfe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtuddgudehjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpegtggfuhfgjffevgffkfhfvofesthhqmhdthhdtjeenucfhrhhomheplfhi
 rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
 enucggtffrrghtthgvrhhnpedutdejffetteefkeejieehfeeuieeguedtveeijeeviefh
 ffelvdfgudeihfdvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:0MQDZBwpGIM6cfgDV3STwjAFAASEnD0eN7HO4ZIbVtVTW-Ii2BPtmg>
 <xmx:0MQDZERtTPCK6BH1W7GuYwaB1GBAvtf-52Q857NYyJtoEA0u8TRnIw>
 <xmx:0MQDZEY6TC6PYz8i3s8oRs6f4Jzc9AFVA0YP8gN5QPaxWY1aC4HZ4g>
 <xmx:0MQDZKdiyxthOHPhnfWfOsp3sU-7hv2zfIXAtuuC0YopAUr6Shf_-g>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 4 Mar 2023 17:23:11 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH v3 03/20] target/mips: Drop tcg_temp_free from
 mips16e_translate.c.inc
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20230304181900.1097116-4-richard.henderson@linaro.org>
Date: Sat, 4 Mar 2023 22:23:00 +0000
Cc: QEMU devel <qemu-devel@nongnu.org>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <AC3A6A41-C357-4C9A-83F3-3EBC384CDFAE@flygoat.com>
References: <20230304181900.1097116-1-richard.henderson@linaro.org>
 <20230304181900.1097116-4-richard.henderson@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
Received-SPF: pass client-ip=66.111.4.28; envelope-from=jiaxun.yang@flygoat.com;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> 2023=E5=B9=B43=E6=9C=884=E6=97=A5 18:18=EF=BC=8CRichard Henderson =
<richard.henderson@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Translators are no longer required to free tcg temporaries.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Thanks.

> ---
> 2.34.1
>=20


