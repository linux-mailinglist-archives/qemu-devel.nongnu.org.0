Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2CB663E66
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 11:39:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFBTd-0005Zb-Gb; Tue, 10 Jan 2023 05:03:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1pFBTV-0005Wt-12
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 05:03:21 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1pFBTQ-0006ft-Kh
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 05:03:20 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id DED9C3200958;
 Tue, 10 Jan 2023 05:03:09 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 10 Jan 2023 05:03:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1673344989; x=
 1673431389; bh=V8bpuvFxOqXgK/m+1VZXNCtvw7zxzGjsk9lD2RZSVug=; b=w
 farRBwzoot35WpvBoQbPlAxD+DNoKHFsp3zX4LAiQzh/gFjnKpWcjSTidvdLEpVY
 T5G1xbsOeMQR7z12QTYcEqZxCaGWF7D0VrIcY63VbZiz3tjRBlIbFgso2HEQvvnG
 gZYd53TV6xhB9iA3rJxRwz9UkdabnrJrQPxkSdiUfOLAHLcPYTmJhoiBnYTqbEul
 RwVv8rHTprqwIq416mpH8qnVoaEXVp10pSKvYJfkNapSjUeDW9g/yly7qY0y6HMh
 bAuLb9wxWfL+Cy9m5RgX0S9wkFmk5FoZSmANoif99QkqEkfhZEo7dNxSSjxGaDuH
 8+RaUhdUXk9tUMxETyXCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673344989; x=
 1673431389; bh=V8bpuvFxOqXgK/m+1VZXNCtvw7zxzGjsk9lD2RZSVug=; b=g
 fIOuBisHoaTQlUS5UvgUclzdG41AnjR7kjE8YbfLTST039p+OdMdycurlXJ/NBTZ
 HUuyDKGaER0QpSP/lCVsfxzBaGUQumjsrADVRiizDVMWQGNH/Zi+182Q/bSX0iK4
 thYB3CKz8oB75MlZnVUj21GCqjeGnH0zRSxbZtDYkLjyNOY5sOilyDbtutGOrgPy
 FMP0t0Cw7moOPRQymcUM4Kj0aJaGu59iEbHQVSD/N/TpKw7X1eUHmj4JwoOWbcXq
 F5/4AdwndkR/yodiZeelkP9BeNlIkneofr3RXBYbP58eLFm1pSNKn6tJOqcHLoO0
 qAc3zmYNT7OQCl6cYPSDw==
X-ME-Sender: <xms:3Te9Y8sWaBkmt3pJHa07gbVIrDUH_r4zPkDwAJTdh9-qgCIioahGWA>
 <xme:3Te9Y5cy5qpgeyT9chLk3yduW5Ke0SQPVxnlmcwRWVjMWI2kNWj6S1UtvPoigA2RQ
 Ez-7W8X2xnhfJaH_94>
X-ME-Received: <xmr:3Te9Y3yMCyLsIGnLGvRYeTm5anP-dJJvtz6_bLZblfC-CDux5hQGHvuiSkeeWMPBz5fUFb7mtMSgHRkxSJ4EZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkeekgddutdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomheprfgvthgv
 rhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrfgrth
 htvghrnhepgfduuefhvedvtdegleevhefhgefhkeejtdfhteelgeeuhfdvhfeiteduvdfg
 vdetnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpghhithhhuhgsrdgtohhmnecuve
 hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhes
 phhjugdruggvvh
X-ME-Proxy: <xmx:3Te9Y_OkVS4_IQvYIJOsk0_PKKkuUrcEE_LxrbHE8zRU34NfuYDeoA>
 <xmx:3Te9Y89R8bJ0GqDhZ6jkdiKM7wUbLQau-7Qv2OUQMnxGIYFHNp_Rag>
 <xmx:3Te9Y3Vr-m3N1E2Nf_kt2oWGafHdYLhaVXmPV6Xj8emH-SlvJ_eu0g>
 <xmx:3Te9YwYTfZn6oRntYSe6NqLCn1X5UfX5FporEuEHP3Gk5I4S5MOREg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Jan 2023 05:03:08 -0500 (EST)
Date: Tue, 10 Jan 2023 02:03:06 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com,
 wainersm@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 0/1] python/machine: Fix AF_UNIX path too long
Message-ID: <Y7032jHPt1e8gwod@pdel-mbp.dhcp.thefacebook.com>
References: <20230110082930.42129-1-peter@pjd.dev>
 <68661c26-3292-3c34-58ef-44e61e912b21@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68661c26-3292-3c34-58ef-44e61e912b21@linaro.org>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=peter@pjd.dev;
 helo=wout2-smtp.messagingengine.com
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

On Tue, Jan 10, 2023 at 09:38:38AM +0100, Philippe Mathieu-Daudé wrote:
> On 10/1/23 09:29, Peter Delevoryas wrote:
> 
> > $ make check-avocado
> 
> > Avocado crashed: TypeError: cannot pickle '_thread.RLock' object
> 
> Yeah... you have to pick Cleber's patches from
> https://gitlab.com/cleber.gnu/qemu/-/commits/WIP/tests_fixes
> and run as:
> 
> $ TMPDIR=/tmp avocado run --test-runner=nrunner ...

I guess I still get this error from `make check-avocado` on Aarch64 tests:

 (17/35) tests/avocado/replay_linux.py:ReplayLinuxAarch64.test_virt_gicv2: ERROR: Failed to fetch Fedora-Cloud-Base-31-1.9
.aarch64.qcow2 (Can't pickle local object 'url_download.<locals>.download'). (0.89 s)

But `./build/tests/venv/bin/avocado run tests/avocado` worked ok.

> 
> This is tracked on the avocado project:
> https://github.com/avocado-framework/avocado/issues/5138#issuecomment-1314551148

Thanks!
- Peter

> 

