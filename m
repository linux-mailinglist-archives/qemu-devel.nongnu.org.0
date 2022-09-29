Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC00E5EEB79
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 04:12:58 +0200 (CEST)
Received: from localhost ([::1]:54058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odj2n-0006pI-CL
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 22:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1odizt-00059H-Bk; Wed, 28 Sep 2022 22:09:57 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1odizq-0007vb-Ph; Wed, 28 Sep 2022 22:09:57 -0400
Received: by mail-wr1-x42b.google.com with SMTP id c11so22322342wrp.11;
 Wed, 28 Sep 2022 19:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=B1pfu69ui5Tj2U6pHvBeXeW/vQQ4GR/AM72AWuyVQyg=;
 b=Ithgil0u7cUMiHyDeoetTt2vgB+o8UCpoVE29np7r8xlhh1+0OQxqGUM081CK/wuCS
 WbUl0+5vVHPWF+ca/xRyGu2NvAT4UoC3UGvB9l+HGeWIJ1zKQIxY1Wiv1tk6RzadGfIV
 4lNjkdGZrx6tb35vmi9l3XhFjGLYgRmhLyBpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=B1pfu69ui5Tj2U6pHvBeXeW/vQQ4GR/AM72AWuyVQyg=;
 b=u4iGOLtARbizb421tswAMERyWUew67aeK6K4VAurr7ehAQ5oa/bzA/yoB38Bd9qlgY
 cNNkg4NcuX+WNjneiTm7k4zg/qArhmrqdj/2MpQLvQ9c3UOSZbusShLqLsHIMNQMF6eu
 0/fa4/gYCz0FOxs7WHsXNG2n0pgpD+3O5dl8c78fFB+NwjUwjN4y/EcJUiaLYoQSywlW
 ++ul9L7hgJbDItGjce+MkQ8s/Y4xJ2cIM96hsIk7HA4Ip7dsXVsI4xHRNZ2dAFIeTXDy
 EwGZ17H3wviRT463tW33TRNfdB4sx/Vm1WlhoJCe7ehI1oHC2s+HCAFiYgP7DjyVkzSf
 ewgw==
X-Gm-Message-State: ACrzQf0PWoKxpDnzVBLiatzqUVLIVF5XDnZjnYG5KPuly1GNsE77HZIC
 ZT6d+dtf94Co/z668X13TDxcLo/PPUVBe2a4RTA=
X-Google-Smtp-Source: AMsMyM7PNN1odiO19BQXVQQyADDz7j71T2YBXf4pqmrJjsZ5/fR+wzR8RrcjUkXtcPSYq8AAG631FfrFed0osYgsvQ8=
X-Received: by 2002:a5d:52c9:0:b0:22c:c9e0:8547 with SMTP id
 r9-20020a5d52c9000000b0022cc9e08547mr424720wrv.3.1664417392191; Wed, 28 Sep
 2022 19:09:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220928164719.655586-1-clg@kaod.org>
 <20220928164719.655586-3-clg@kaod.org>
In-Reply-To: <20220928164719.655586-3-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 29 Sep 2022 02:09:39 +0000
Message-ID: <CACPK8XckTGxZ6H=0kMkaS7yfxJG2gkPVtRrZYCGBJH=3ZyLxiA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ast2600: Drop NEON from the CPU features
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=joel.stan@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Wed, 28 Sept 2022 at 16:47, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Currently, the CPU features exposed to the AST2600 QEMU machines are :
>
>   half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva idivt
>   vfpd32 lpae evtstrm
>
> But, the features of the Cortex A7 CPU on the Aspeed AST2600 A3 SoC
> are :
>
>   half thumb fastmult vfp edsp vfpv3 vfpv3d16 tls vfpv4 idiva idivt
>   lpae evtstrm
>
> Drop NEON support in the Aspeed AST2600 SoC.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

