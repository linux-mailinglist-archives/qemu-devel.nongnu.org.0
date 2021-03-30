Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F3734E778
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 14:24:47 +0200 (CEST)
Received: from localhost ([::1]:34932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRDQL-0004eQ-IG
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 08:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRDPP-0004CX-2T
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:23:47 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:38875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lRDPM-00028q-JH
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:23:45 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 m20-20020a7bcb940000b029010cab7e5a9fso10193860wmi.3
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 05:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Fx6VmbKrbj7CBkWC1RXBlp8ZyS1JjopKA9Q3pydGIPs=;
 b=RoflAgekjLwROrZWqnJf054qiDYjN9WQlfp+J1dl+16fkYOjG/nZ+e02qEj2tuxfEt
 r0sKseTs2EewQzv/KgonKM5A3HukGJmuTOSuG0H3OciegE9v1NhqClRZ1T5ou1ScJ0tx
 oYFaY2tsiYRwrxuRI1dtLl5g9qTkZZxl0D0xCYWTfKcA0G+czmTGJecuaIUnaJVA7m7T
 epSktoNooz4m0/QZE1fe60t6LcqRtFKiFx8KpdimK8va8y3/A26O30I/Ty2HttzCq4C7
 Ip/NdS1Am8ij1MDRsKcYFlck9L78yKyLcEwoK1GaRlx6RkDAmOoW93KCBYYr6cYmGQgN
 HmUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fx6VmbKrbj7CBkWC1RXBlp8ZyS1JjopKA9Q3pydGIPs=;
 b=c/iT6UPuOD0bHusRvS8fuvjcnqet/iKOoQm9UpCakPG6bKJVimK5WEOwxlZB3ITGhR
 upou8Zt2eag2Uiko0PQd+0dn9mz2gD7+cevX+nrheJa5YG3FRcIB4fkcj4yvxo3VsdYk
 NRl3EvrAMsffZ8IPdkq7JD1kAEaZl2aIDb/7N2wovmkGTahiYhKPCINmId0MDyZHQMCT
 ncYjXkztNehhxUkPOL3XKfQNsvDk0tDd4ui3vBlF1uFSEVsISUHa2E54kp+/0X7Eg8aE
 jEzvqxDq6yLImYyL1bh7y2QAqcRBJnVJz4UmgXWvM5Gh4Hzdc1GswubIghIRSN5pFBu4
 LEbQ==
X-Gm-Message-State: AOAM530WQ6sEba8Z3Vi46Ezx5L1uWwt1JvsJEVLvbHgrQSvh21DHGDy8
 57XIYqdb05zlPtfxj7BwDrE=
X-Google-Smtp-Source: ABdhPJybrgai6wpkJfiz34nnpKJoRZWxCuAeXiL8m57hCBMOX/icU4jx67I18Y3aRQGgXuEm33ks5A==
X-Received: by 2002:a05:600c:3541:: with SMTP id
 i1mr3800969wmq.97.1617107021580; 
 Tue, 30 Mar 2021 05:23:41 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id x14sm33795023wrw.13.2021.03.30.05.23.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 05:23:41 -0700 (PDT)
Subject: Re: Serious doubts about Gitlab CI
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
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
 <902a93ca-bd71-504b-fcf5-fec2480f9ec0@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a5a40558-4f5a-223d-a7ea-c02f7fc14eef@amsat.org>
Date: Tue, 30 Mar 2021 14:23:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <902a93ca-bd71-504b-fcf5-fec2480f9ec0@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/30/21 2:09 PM, Paolo Bonzini wrote:
> On 30/03/21 13:55, Thomas Huth wrote:
>>
>> Also I wonder whether we could maybe even get rid of the capstone and
>> slirp submodules in QEMU now
> 
> At least for slirp, we probably want to stay more on the bleeding edge
> which implies having to keep the submodule.

FYI QEMU libSLiRP submodule doesn't point to bleeding edge branch but to
the stable branch (which should be what distributions package).

