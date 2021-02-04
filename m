Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E7E30FBB4
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:40:44 +0100 (CET)
Received: from localhost ([::1]:51506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7jYZ-0004pB-3k
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:40:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7iYQ-0000AY-I5
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:36:31 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:45404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7iYM-0004U0-0j
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:36:29 -0500
Received: by mail-pf1-x42e.google.com with SMTP id j12so2526730pfj.12
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 09:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YVUTz602NeO/csx2sRJBiTFQclO5Mo7hNXT1JJDtaR4=;
 b=F8bj9G4AlhJyHhAtPcOLc/ZBO/RydsmMTDTXbHBg2ctZ6UR9cUroMmeq2TtNCZrJuE
 MqMyTxprhpGMdiD6sAZOLdL6P7MAJ2uGgJOGpOz1ii+TqEhp+m++aCFRksVthgRt7B5A
 wZxzuKK/hxIZQIKh/2a+u0ilzWTP2ceRPR60K7o+g5mdO5UM79fB+b00bAflTGapiZ3Z
 lIziqlsSm3TaopXfl2l3ex1kBRci/0Rd3MOGoeZuf3Z4pbUZ5iwalVGbvORg+Bvvf5ZK
 q9jo2Gukm7wEylInVTpgNDCmvyhgAb2il31c8kGiX8FWgwILFtrE3XtdzEw4C8g+n8JA
 y9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YVUTz602NeO/csx2sRJBiTFQclO5Mo7hNXT1JJDtaR4=;
 b=dCLW8vFAYwWOptTgd/SQuYZwmrKqY3Sbxkt6VKKlOL/1f7rgCIou4JtJ9ABuY+c7I4
 Bv/tFRrxd7NAEy+1JxHPwc384ydmz/O5ptpK+yXNnLkiJOjGRuZ4YVv9jUQo7hXwAFBT
 YuvVUZGcfs5WDYoCVYnQrMLdH8Cq6NKojgfwzEKU6CMkqRkGJ62zvMRI84kcEg7TLU/C
 lvPojye8L1ytiIk7vguiW8dRM6Yt9PgsUy8DhufwH4Ga0Ecp/8/lzHhJ7bqRzGlHIRwq
 4Y+ub4RMs7BDgttCqXQK9HKInoKf6HWfKta2Y8ic5U4Pgvml3ILYjGHPkJAt3WXtvevB
 fVvw==
X-Gm-Message-State: AOAM530Sy+LjPnaKEUlnqOdcvfYfjoo5PCY8nXrD+ARjV2rqfqxSZIMq
 4LyCxjiUno86SzA0+tg1Go/IMw==
X-Google-Smtp-Source: ABdhPJxOmXOOJH0kxjIB6kBrPcRuVqjmo3paywLfUHpovYsfnf1wymFMsmQbLkTvT+58HmOFZMfqpA==
X-Received: by 2002:a63:db10:: with SMTP id e16mr76229pgg.404.1612460184112;
 Thu, 04 Feb 2021 09:36:24 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id g22sm6379609pfu.200.2021.02.04.09.36.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 09:36:22 -0800 (PST)
Subject: Re: gitlab containers are broken
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <567366a0-0e5a-3ab6-8e8e-ad66b46264b2@linaro.org>
 <756e4707-b0ae-f26c-6e09-67fe205ec098@redhat.com>
 <8238fe1d-c7c0-ab72-fa2f-c4cf9ce018bc@linaro.org>
 <6ec7bebe-587d-df2d-0221-e12cb6f4c775@redhat.com>
 <20210204100009.GE549438@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9e716df9-3be3-4c79-dff3-e6475b13fdc5@linaro.org>
Date: Thu, 4 Feb 2021 07:36:19 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210204100009.GE549438@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.182,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 12:00 AM, Daniel P. Berrangé wrote:
>>> Hmm.  Is there any way to get the full output of the container build?  At
>>> present it's being truncated:
>>>
>>> #7 [4/5] RUN yum install -y bzip2     bzip2-devel     ccache     csnappy-de...
>>>
>>>
>>> In particular, I'm trying to add a new test, and I have added libffi-devel.i686
>>> to the fedora-i386-cross.docker file, but then the actual build fails because
>>> the libffi header file is missing.
...
> Alternatively just make your changes to the dockerfiles and thne push
> the branch to gitlab. Gitlab will run the build and you can pull down
> the docker image from your fork's docker registry

That's what I did, with the results as described above.


r~

