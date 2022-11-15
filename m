Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B25462A283
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 21:09:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov2El-0000oa-DZ; Tue, 15 Nov 2022 15:08:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1ov2Eh-0000nv-Au; Tue, 15 Nov 2022 15:08:47 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1ov2Ef-00006b-1I; Tue, 15 Nov 2022 15:08:46 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id C64B8320090B;
 Tue, 15 Nov 2022 15:08:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 15 Nov 2022 15:08:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668542921; x=
 1668629321; bh=91RTlUlBAcBpsLSH9w39LnCZGBo5dAZ1yTkneUGdJnY=; b=A
 0U4H/Py6QAmtu93JF7G4jU4UjxnlrVlDhmMqNki+YS84SKVSnd9P8iZgABAOY5CP
 tQ2j7E6U2E1uGo+DvLsojlhUtWs/IeIIdI1hKJGUrG5EmxNWbQEEQZWVBb4/aZkG
 QM4P90o2fKWrc8ioTIj5iGJPcnzGc4QTXSRudI8omsXhVQM6hsbZHSiFWCs5GRuK
 drQFuqgiNT3DY9SMmzgYC5DX9GVUmgyn3HuWCTpDESytGTmM0dnUliPGUXHj9k0M
 4xLWFQrsIASKZlzl+Smg/pvIi+JZ7E27DCo+Pej4AJqAcQXCVxOZPjc8e4iGYhJm
 lwa8bKdkraIWESrRED2qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668542921; x=
 1668629321; bh=91RTlUlBAcBpsLSH9w39LnCZGBo5dAZ1yTkneUGdJnY=; b=S
 ync1QQoQWwcvL0icS/OJ3pFTrkeIX+VSNuNohMQ5woZOQBDZtYXLXPckehvkj2kM
 E6bbJm8tuzstAgC6+XYWcaRJVcN6fyNvT1MqPr73+ye42dgvzkE5ZjkkanMbHI4W
 SL57pSqgLaU4sHEbtAXXgARxyrRL1K6opz3U0q9Cmrx7rsPGlVMj0RcsqcStCXOD
 4GAxqBWuWJlEovB3qzoBKyHZSrF03wGsbHHIew5vl1/8A5zPH0veGZZXDkiszsM7
 VsGFU5D08XUvj7aLM0PIiCsUg90Mk3tYAlfPgVkbQW86ABU5wn21ji5hhhZyc5q+
 98XYl3K4WkNRMm/w0sj0A==
X-ME-Sender: <xms:yfFzY3iJZ7hyCYOI0lde0Zy2190yUMDjPCPTBoN-eJd7xfjCFDzjSg>
 <xme:yfFzY0B0LZyZroVVCSyhPCYBOjQognZ8vliMHG8dg0A1K47QXPZ8Y0X3pQzBJtUuV
 keBUMVi2ZvDEx21Sxw>
X-ME-Received: <xmr:yfFzY3FXLPj4uav9ZAiJcj45gL5jLLANmP46IvXY9Rqbae7n6znvnDdTGwUz0cp_TIPeeabXeDto>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeggddufeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpefhgeffvedufeevteegkeetieejhffhudeujedvgedvheffheejveethffh
 ffefueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:yfFzY0QtgGBgGUq7QBeXx53MsX_FBPeE2aSiWV9OFHqNhmpaPVgbLA>
 <xmx:yfFzY0wiMi49jcZnqQWMPV7nC2KqskaOO5dTlznYHoBVLeq1V8becw>
 <xmx:yfFzY65-H71HvVFuuf31cy1RNP0sKpWCMt2kFnfZ2uQATkFjMBq3EA>
 <xmx:yfFzY3yO3KEcnWCm1J8ix8ee4WU8_m_RWDDI5pFG96myj4ykSW4igA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Nov 2022 15:08:40 -0500 (EST)
Date: Tue, 15 Nov 2022 12:08:38 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Alistair Francis <alistair@alistair23.me>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2] m25p80: Improve error when the backend file size does
 not match the device
Message-ID: <Y3Pxxh3IeNg0GF/q@pdel-fedora-MJ0HJWH9>
References: <20221115151000.2080833-1-clg@kaod.org>
 <c0f160c6-b0db-e518-bd9f-0328ddaa9278@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c0f160c6-b0db-e518-bd9f-0328ddaa9278@linaro.org>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=peter@pjd.dev;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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

On Tue, Nov 15, 2022 at 04:50:11PM +0100, Philippe Mathieu-Daudé wrote:
> On 15/11/22 16:10, Cédric Le Goater wrote:
> > Currently, when a block backend is attached to a m25p80 device and the
> > associated file size does not match the flash model, QEMU complains
> > with the error message "failed to read the initial flash content".
> > This is confusing for the user.
> > 
> > Use blk_check_size_and_read_all() instead of blk_pread() to improve
> > the reported error.
> > 
> > Signed-off-by: Cédric Le Goater <clg@kaod.org>
> > ---
> >   hw/block/m25p80.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 

Thanks Cedric!

Reviewed-by: Peter Delevoryas <peter@pjd.dev>

