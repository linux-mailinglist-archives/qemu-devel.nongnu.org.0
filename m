Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A088B51FF60
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 16:20:54 +0200 (CEST)
Received: from localhost ([::1]:34906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no4Fp-00026H-Pn
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 10:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu-daude@fungible.com>)
 id 1nnyvy-0002kd-Fk
 for qemu-devel@nongnu.org; Mon, 09 May 2022 04:40:02 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu-daude@fungible.com>)
 id 1nnyvw-0002Zw-Ev
 for qemu-devel@nongnu.org; Mon, 09 May 2022 04:40:01 -0400
Received: by mail-wr1-x42d.google.com with SMTP id i5so18346120wrc.13
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 01:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fungible.com; s=google;
 h=from:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=dHz3LRdb0gyoCcDW/eU/8YCBe3jFUd3CBfJhjAydpm0=;
 b=h3+c7y22w69suC0xK3xh6Krx9SMrDqttfkCTdevurFo6s0x819fZXgtp4P5Smruy16
 0za6HO8IExDKGfrwArIU1jhe3stRwGttDQJc+0PPItEgCTg8fYjXmM31lZ/4dabDrHPK
 q8+Gp3V9rYSgs5yf/oQUpEw+P8s6XPmCmmpZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=dHz3LRdb0gyoCcDW/eU/8YCBe3jFUd3CBfJhjAydpm0=;
 b=rCKn2ntlUO0FsudSXr4WX3a6M4mgEbPV1mX1plgk63BazVhPNx03CENsbBqojSAPjJ
 mcqdRis/9j1qvDRtW4Lrn1gkLcQRtnWEH0dnm8JuEYYmtfX26wDtcOpQ/ERlLyWWiqdg
 Oe+pLsk253kLQLG/HtbWrRSPDFfirniMf9DNUmmb4RZAmQg/fl5vQu13iz9pfSpjHCwt
 rAu1Mcte3Zo2YQxpj1Yudtas5jgQfEcuwKSs+muc20PQ9A6Nl6K6iSfm6PGEL76YZoMu
 NS3m8MBiOrbYpDA4qrQs18XzSiCfVNkG1L4jF5oTFPlYavRn27lOXHwyk3ZXLEYb0vA+
 mVsw==
X-Gm-Message-State: AOAM533FS5U27z9/KJj6Wfwl0u58mMk7QxpIP4OBbMefw1osj7nM2BDG
 hDg7zTBBpH+ifET/9DO4R8yoMw==
X-Google-Smtp-Source: ABdhPJy9tSeWA5mpor3gHVuNj2Bs6WONiqOuNKsoSlAlsimTeBuEx0mEPgaMPcXSP6mbtPfjetRMGw==
X-Received: by 2002:a5d:64ec:0:b0:20c:62d4:3917 with SMTP id
 g12-20020a5d64ec000000b0020c62d43917mr12582771wri.480.1652085598239; 
 Mon, 09 May 2022 01:39:58 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a1c544b000000b003942a244f30sm18830045wmi.9.2022.05.09.01.39.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 01:39:57 -0700 (PDT)
From: "=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?="
 <philippe.mathieu-daude@fungible.com>
X-Google-Original-From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
Message-ID: <fb2fe0a9-be82-928e-8e48-0837f94e3ff2@amsat.org>
Date: Mon, 9 May 2022 10:39:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: Signing QEMU up for GitLab for Open Source?
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 pbonzini@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
References: <YmZ8WpmZfdX5CsA/@stefanha-x1.localdomain>
 <8735i17278.fsf@linaro.org> <YmaunCsOBmTZyt2Z@redhat.com>
 <87o80m4wmm.fsf@linaro.org> <Ympd3xpIu6EOz8hG@stefanha-x1.localdomain>
In-Reply-To: <Ympd3xpIu6EOz8hG@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu-daude@fungible.com;
 helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 09 May 2022 10:16:49 -0400
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

>> Daniel P. Berrangé <berrange@redhat.com> writes:
>>
>>> On Mon, Apr 25, 2022 at 01:53:28PM +0100, Alex Bennée wrote:
>>>>
>>>> Stefan Hajnoczi <stefanha@redhat.com> writes:
>>>>
>>>>> [[PGP Signed Part:Undecided]]
>>>>> Hi,
>>>>> QEMU needs to enroll in GitLab for Open Source before July 1st to
>>>>> receive 50,000 CI/CD pipeline minutes and GitLab Ultimate features:
>>>>>
>>>>> https://about.gitlab.com/blog/2022/02/04/ultimate-perks-for-open-source-projects/
>>>>> https://about.gitlab.com/solutions/open-source/
>>>>>
>>>>> CI/CD minutes also become available to personal forks for open source
>>>>> repos so contributors can run CI pipelines without hitting CI limits as
>>>>> easily.

https://about.gitlab.com/pricing/faq-efficient-free-tier/#managing-cicd-usage

   Q. I am an active contributor to GitLab. Will the same limits be
      applicable to me as well?

   A. All free tier users receive 50,000 CI/CD minutes for running
      pipelines on public forks of public open source projects, like
      GitLab. Contributions to all other projects by free tier users
      are subject to the new limits.

Wow, this is a great news!

>>>>> Alex, Paolo, Peter, and I are qemu-project owners on GitLab. Has anyone
>>>>> already submitted an application?
>>>>
>>>> No but if we are happy with the terms we should go ahead. I don't recall
>>>> SFLC having any major objections and GitLab seem to be pretty engaged in
>>>> ensuring open source projects are well treated.
>>>
>>> Yep, they've been pretty receptive to feedback myself & other maintainers
>>> been giving about the usage & needs of QEMU/libvirt and other major OSS
>>> projects.


