Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 290AA58F367
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 22:04:38 +0200 (CEST)
Received: from localhost ([::1]:56296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLrwS-0004PO-D9
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 16:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vitalybuka@google.com>)
 id 1oLrsd-0001Ib-Vp
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 16:00:39 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:43851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vitalybuka@google.com>)
 id 1oLrsc-0002Kh-Fy
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 16:00:39 -0400
Received: by mail-ed1-x52d.google.com with SMTP id o22so20444319edc.10
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 13:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=ou86LLdED76z/lbLFTbrzGT3hDQw3Ch0izyhLgn8VMo=;
 b=JuHk75Brkl8Qi3JDXJCwLQWJppk8b8KjcqyXc+pteTsGeCskadFfin50jvq+c7rWBD
 vcvFLXteO2Gd1QJ/3fZxrBdDLKGksJ5fqoO+RmirP2V2BmwOhOqbMXXPqeE5SK5cEAbq
 Tmw4HtjuBFMyYgutDO6xlDnl1cPCh4o7A+F6wjtqQSvE11LWv/qirlNQIImQCApvJd/q
 XQgc+oczM9HjifGl4aRvEz/JB3IZcmQjeflSnJ2wgg7Yt/7pRE5ab7+jRNkB0/rwa4Jj
 rg3uzDh5z49VZjh5QwNuFk8AHVLDiH+BWrz9P8t3UIt4BBuFjvBNFaAJ3gMbb9e2bwCk
 SYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=ou86LLdED76z/lbLFTbrzGT3hDQw3Ch0izyhLgn8VMo=;
 b=c9ixs8XzcWBLZv6KOu3ASqFBzSwYR5szldzYpRMqrln1eGYaP0z8eGKT3ZNbRJyYet
 VN8y/A9HVGG8ULZXrsyzOkn/8Z8hg3qpBFxxodnF8NqOJHnLb+QQmYfx9KgFl5kWy5Ej
 t0S+X/nPiDcvhNdFgY2K95S/QDrCsuYY3IQ3IsZbIcJ66Q89fGLqddN5p3S4JTQVvJ/J
 h4fFo+zGqMdtI7z4jUAB3UaO12Z3oCFUsGi3uonNUk75jOBkrgHu8pXpCVBPiAWp1QAL
 RET2z2NUcALZF5hv6X3Q+C4r40pbXTt/Pzk0weyqUydJqLbyi0CdFK2ryxUswLs6H8p2
 SC/A==
X-Gm-Message-State: ACgBeo3O+U5d84BC/XK7OFlX1ptoSVFP+Hwf8Zq3SsH/wmUY7ZN0z00R
 80FuDdewUD5YuI2pn3tojqtxfePa1ub88HLpuT/tZA==
X-Google-Smtp-Source: AA6agR7wOieOkvvmTn+52+QtbLDgvv9JssARvSsOR+Q8zCuK7MnUi/eudVieG5F+SKv+6ltEJ5kj3DODIKrAWkpYKyE=
X-Received: by 2002:a05:6402:354e:b0:440:5398:cd65 with SMTP id
 f14-20020a056402354e00b004405398cd65mr20241515edd.43.1660161635673; Wed, 10
 Aug 2022 13:00:35 -0700 (PDT)
MIME-Version: 1.0
From: Vitaly Buka <vitalybuka@google.com>
Date: Wed, 10 Aug 2022 12:59:59 -0700
Message-ID: <CAPjTjwsb0jAsQq4PHOsFGW7SjpAe=Ug2b_fxhdccEEnzh=cQUA@mail.gmail.com>
Subject: Re: [PATCH] [PATCH] linux-user/aarch64: Reset target data on
 MADV_DONTNEED
To: richard.henderson@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000090edfd05e5e88075"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=vitalybuka@google.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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

--00000000000090edfd05e5e88075
Content-Type: text/plain; charset="UTF-8"

How can we land this one?

--00000000000090edfd05e5e88075
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">How can we land this one?</div>

--00000000000090edfd05e5e88075--

