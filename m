Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4945EE9BE
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 00:53:02 +0200 (CEST)
Received: from localhost ([::1]:49348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odfvJ-0008Vs-0c
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 18:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1odfr3-0006b2-67; Wed, 28 Sep 2022 18:48:37 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1odfqz-0004BG-Nl; Wed, 28 Sep 2022 18:48:36 -0400
Received: by mail-wr1-x42c.google.com with SMTP id l18so9899011wrw.9;
 Wed, 28 Sep 2022 15:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=nAtblsn9z2xZoGIv9o4JfIP+OBNOBYObsJtyQaLJuUo=;
 b=nTZWlqB2WSqYio1rkgCjMOJeUHjYl/jbXu/Ne0MQrPDsV/zpZ4dGNcIO9f3WY8RCPg
 WfhSquzvJbIxION8YIsLdC90IPMXnmrvodvu2LJYbdAPianxw6q1LyReJjg6qtDlA1X2
 zoBqjVt4McsnIu9ILGBK4J51zGj08hJfVprKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=nAtblsn9z2xZoGIv9o4JfIP+OBNOBYObsJtyQaLJuUo=;
 b=EvQ+n3NdOBNP0WtrFLdiu8WN8WQKFybK7WudUAfk1rkHtV858213a9bUoJpkpPWy4J
 us5MxKFCI5moyl1xN2fGVbcc5gWMg1ZcrCvDMM04/TLr5EgAZwWeGM5rj3p4LEp27pbh
 BsIwpgHmc6gMnf6pY8LhkEhacMzNeEbcY8oyZleNc/gZENj5uaKLBc9VmBpbxnIuFBFF
 dBavVg5RWO4dsAdczCsKMefpNagAly3gzIrHjDuVvdTshxV58MYNgzVwF3XoQZTMpTGS
 axtCW51jBDOn6HwtmuTnsgwxMnmyGAczE+RiChva6illUX5tnudCO8sP8+QrcebDTvAa
 wE9A==
X-Gm-Message-State: ACrzQf0pqw028G4+k3tc+NLv42f9sZQQZWj87/0G87aZ/yELPqNOLWNK
 PNabfUt5z7DEQwODOwRGyPrwCIYqk+U9CaI2cVc=
X-Google-Smtp-Source: AMsMyM4HtFNnu7/L4rvIKkz47sxV71JgLQqj7UDyFJ4fe7lmyldMQZNKqQ2lOErh1otX0NQIf63uWaRUp6hdJGs271I=
X-Received: by 2002:a5d:4044:0:b0:22c:c332:9655 with SMTP id
 w4-20020a5d4044000000b0022cc3329655mr60624wrp.315.1664405311088; Wed, 28 Sep
 2022 15:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220923084803.498337-1-clg@kaod.org>
 <20220923084803.498337-2-clg@kaod.org>
In-Reply-To: <20220923084803.498337-2-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 28 Sep 2022 22:48:19 +0000
Message-ID: <CACPK8Xe67FVgbnzyuj99AhDbsrFZfUqdsxZheL8zaybZzHiM3w@mail.gmail.com>
Subject: Re: [PATCH 1/6] tests/avocado/machine_aspeed.py: Fix typos on
 buildroot
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=joel.stan@gmail.com; helo=mail-wr1-x42c.google.com
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

On Fri, 23 Sept 2022 at 08:48, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Replace 'buidroot' and 'builroot' by 'buildroot'.
>
> Fixes: f7bc7da0724f ("test/avocado/machine_aspeed.py: Add tests using bui=
ldroot images")
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

