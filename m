Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1376C34E787
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 14:35:05 +0200 (CEST)
Received: from localhost ([::1]:39522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRDaJ-00075C-JM
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 08:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRDYR-0006BZ-VT
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:33:08 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRDYQ-0007mU-Bb
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:33:07 -0400
Received: by mail-wr1-x434.google.com with SMTP id j7so16105679wrd.1
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 05:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yrd+yXK0SNafUkeVhpoJxtLAcoyIW4/5K8gxS4WVvns=;
 b=o1NWUKzFzgfIlkAa+Bhl6HsnJfuoBee45pKgmifUTJhiRn+XbRO8TUaBywgYoMLzAQ
 wtiI0sn3OpAZy5iU1+KsmtXCfOmZ/2PC881er5m83YozlCGAjGDb+Wwxc0y9YYp+jpBz
 F6SYtGTxKrdEkucRwd6HB1Aq6tixB/2Y/903v1qsvJS6Leo9dweWmyIu7dDfOTBLz7vu
 hW2eUZBdCL2/QkA5Zf9YaAvsr0vUB8018MHHiCAF6fTqZ1x1/9V8E3PydciYUxfH2vyG
 S0bkVlxWQmMOPV2zYziVi7ZFDuEhIH+HNsYaacLWlKOgx+xelikSk7WSOy1ujz6M+Lv+
 w/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yrd+yXK0SNafUkeVhpoJxtLAcoyIW4/5K8gxS4WVvns=;
 b=R9IwKXO97uxTBQtc6qMN8e5Myl7RQk66+Bv0CdtDtct8gRV4eKVvm3K20k5l4XN7Cq
 UPSRT/4Qj3wvcnxHW8QlFTSUrQOO9RYwNcf+36ymdCkeYZ+zJWGB9+0Fg4oX2wHtjWDr
 +l3kQiRw6OMNaydg8r+Sen9w25+bnlPniKLCdIX4bq+FRmLu4oDQgo/STB4Krei5SPWv
 0fwA6YHxF6JS9Z9xe6bDwAKvZnUUCbRKlksM1cdnnPghkJ9TBCDrzxlCM/Qz2inGXuKZ
 jUZRCbujSvDAv6NJ7A2UIu3KR+xIj68kNCVxpZUIWFY2IHaaDtfcYozPADUhb2sMMCug
 2P9w==
X-Gm-Message-State: AOAM530smUdJsdhKDECS1cWILLCIMNhEDwbSnp+ivDNPXXOFaW/qmADq
 PbzMEoKOoMq0GokAqUyr+PQ=
X-Google-Smtp-Source: ABdhPJydG4sDRuEtyBZoZRkKVtFs/TyAF0vECAWt/+zJswmwt4ENs7/Ca78DtK4088pqqQFf0mLosw==
X-Received: by 2002:a5d:4f0e:: with SMTP id c14mr22595549wru.286.1617107583810; 
 Tue, 30 Mar 2021 05:33:03 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id l21sm3138809wmg.41.2021.03.30.05.33.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 05:33:03 -0700 (PDT)
Subject: Re: Serious doubts about Gitlab CI
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <cb9d0504-aba5-3114-d121-694a5247764c@amsat.org>
 <YFOt+R77HfpNEYFc@stefanha-x1.localdomain>
 <2d1e40c6-5fa4-271f-5ecc-74da7c04ffea@redhat.com>
 <YFRv9zMvBXtpfN3t@stefanha-x1.localdomain>
 <20210319101848.ebdwkfttay73jajr@kamzik.brq.redhat.com>
 <cad173cb-7715-1286-eba2-75e9816e6177@redhat.com>
 <b351f107-a9fd-f7cf-1f27-2d435cea612a@amsat.org>
 <d05a40b2-ff80-d9c8-8dfe-5dfce2e57d3d@redhat.com>
 <YGHf3HjYTRJwktbf@stefanha-x1.localdomain> <YGMJSoIGa5VoVDB1@redhat.com>
 <04e5e251-7a09-dcf6-82ad-31bf696bc248@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5799156b-0363-28aa-908e-9237b16787f0@amsat.org>
Date: Tue, 30 Mar 2021 14:33:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <04e5e251-7a09-dcf6-82ad-31bf696bc248@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL_A=0.1 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/30/21 1:55 PM, Thomas Huth wrote:
> On 30/03/2021 13.19, Daniel P. Berrangé wrote:
>> On Mon, Mar 29, 2021 at 03:10:36PM +0100, Stefan Hajnoczi wrote:

>>> Traditionally ccache (https://ccache.dev/) was used to detect
>>> recompilation of the same compiler input files. This is trickier to do
>>> in GitLab CI since it would be necessary to share and update a cache,
>>> potentially between untrusted users. Unfortunately this shifts the
>>> bottleneck from CPU to network in a CI-as-a-Service environment since
>>> the cached build output needs to be accessed by the linker on the CI
>>> runner but is stored remotely.
>>
>> Our docker containers install ccache already and I could have sworn
>> that we use that in gitlab, but now I'm not so sure. We're only
>> saving the "build/" directory as an artifact between jobs, and I'm
>> not sure that directory holds the ccache cache.
> 
> AFAIK we never really enabled ccache in the gitlab-CI, only in Travis.

Back then the Travis setup was simpler, and it took me 2 to 3 weeks
to get it right (probably spending 3 to 4h a day on it).

>>> This is as far as I've gotten with thinking about CI efficiency. Do you
>>> think these optimizations are worth investigating or should we keep it
>>> simple and just disable many builds by default?
>>
>> ccache is a no-brainer and assuming it isn't already working with
>> our gitlab jobs, we must fix that asap.
> 
> I've found some nice instructions here:
> 
> https://gould.cx/ted/blog/2017/06/10/ccache-for-Gitlab-CI/
> 
> ... and just kicked off a build with these modifications, let's see how
> it goes...

But we cross-build in Docker containers, so you need to mount the
cache dir in the container and set the CCACHE_DIR env var, isn't it?

Watch out about custom runners. If we do too many changes on the
free-tier runners, we'll never have the custom runner series integrated.

My 2 cents.

Regards,

Phil.

