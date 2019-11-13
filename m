Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ACEFBA79
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Nov 2019 22:12:54 +0100 (CET)
Received: from localhost ([::1]:51082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUzwb-0006fE-B8
	for lists+qemu-devel@lfdr.de; Wed, 13 Nov 2019 16:12:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47579)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iUzuO-0005q5-P9
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 16:10:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iUzuM-0007vM-Hj
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 16:10:36 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37430)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iUzuK-0007ti-Hl
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 16:10:32 -0500
Received: by mail-wr1-x433.google.com with SMTP id t1so4040233wrv.4
 for <qemu-devel@nongnu.org>; Wed, 13 Nov 2019 13:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1Lne2vF/q8LO1oTs9cClK1bZe4proiP5e37Bhwd8bR8=;
 b=axCxgJJ4bCT+0d6jXT1WUbSrc4TeE5LVrR/rBr+FjK0s46QibSQbuUhFm92lcZ6N+c
 WmvUrMkjELP1kv5XgsBk8DrN904kB7erW38pPOzMB3Yxa0Qs8QbYifYTcn5oFWGtV3Hv
 9zX5eFXo1jw5AbOOyY8QITeVUV3gMwMxnHI5hLQ5BJAuTjitShJkswrvUe9Cves0QsqH
 9O1gzhRCyYZgBvftadsKu3m1KYrIzaKYhYXolTbmoLGzV9JH4ifoj18MyxH/RZfCYj3o
 0RORP9RzJH2ZDVrr3cHE2UrXyKznIP/WZZ5daIFcA04Oelrbw2SAQyKSGRyWlhGyFvhC
 usjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1Lne2vF/q8LO1oTs9cClK1bZe4proiP5e37Bhwd8bR8=;
 b=SJ7GDealUYbVhGR7825cvjIaOmibrsEVWt+hcReGZaPGM+LfGog6Jkd6Y5B99su68z
 2fKQXc2zzgpkxWFOMdVVVLSS6/bIRlMo0E+C0bqCWnMR8U5RFlSsBnOKdLhfT+HPwRNn
 4wHGnLKDj6dEb8tsSSUXNFM1CckQXZThRH43rG+QY3h9izSHM841ZqZj+LrTsRCaFC52
 2tde2r/pEjNjDVw2P+gr0bxh3vbsar68TeJa1kcTG6Q7QUfsEDxDR3RO/xrhisOvFvWi
 ZH6UDJxC77idk485OwDpgRYPpW5AgV7cHSY4AvTGYDYWGa4NLPI/bUAtbvngOigx2MFn
 TiYw==
X-Gm-Message-State: APjAAAUWmsxacQpsWznukCxDL/LOltcfwM/U4Y35sv2aWR7v2xd6TOGR
 wOXOPXD0D5EuaatkrDuUrRa1KA==
X-Google-Smtp-Source: APXvYqx/vzKUcKHbQAICNRiSKOIELvGevtmye5ex+Cu+ir587PxZqrEtbiSX94mfXuUnirT45HPYRw==
X-Received: by 2002:adf:fe0b:: with SMTP id n11mr4571315wrr.218.1573679430959; 
 Wed, 13 Nov 2019 13:10:30 -0800 (PST)
Received: from [192.168.8.102] (219.red-37-158-56.dynamicip.rima-tde.net.
 [37.158.56.219])
 by smtp.gmail.com with ESMTPSA id u18sm4355990wrp.14.2019.11.13.13.10.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Nov 2019 13:10:30 -0800 (PST)
Subject: Re: QEMU for Qualcomm Hexagon - KVM Forum talk and code available
To: Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <BYAPR02MB48863165DEE32E5C563E93F4DE650@BYAPR02MB4886.namprd02.prod.outlook.com>
 <CAL1e-=jvmJNiZR4iLDL-97qm=v+2s0cwn5YTzJQ=JZ_gwOe4tQ@mail.gmail.com>
 <BYAPR02MB4886C8D82898F1E406C124F8DE7E0@BYAPR02MB4886.namprd02.prod.outlook.com>
 <BYAPR02MB48865884056A88B660B620FCDE770@BYAPR02MB4886.namprd02.prod.outlook.com>
 <87d0dw83uz.fsf@linaro.org>
 <BYAPR02MB48866E2D82D9C76ABBECA842DE760@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ffe58977-f251-df34-4bd0-62e32f78cc1a@linaro.org>
Date: Wed, 13 Nov 2019 22:10:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB48866E2D82D9C76ABBECA842DE760@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::433
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
Cc: Alessandro Di Federico <ale@rev.ng>, "nizzo@rev.ng" <nizzo@rev.ng>,
 =?UTF-8?Q?Niccol=c3=b2_Izzo?= <izzoniccolo@gmail.com>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/13/19 8:31 PM, Taylor Simpson wrote:
> [Taylor] Currently, I have the generator and the generated code sitting in the source tree.  I'm flexible on this if the decision is to regenerate it every time.

I would prefer to regenerate every time, and not store the generated code in
the source tree at all.  It makes it a no-brainer to modify the source and not
have to remember how to regenerate, because the rules are right there in the
makefile.


r~

