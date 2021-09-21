Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 332DA4133EA
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 15:17:36 +0200 (CEST)
Received: from localhost ([::1]:33620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSfeR-0000QZ-9S
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 09:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mSfbT-00077v-Be
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 09:14:31 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mSfbR-0004TH-Sq
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 09:14:31 -0400
Received: by mail-wr1-x434.google.com with SMTP id u18so37304382wrg.5
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 06:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fU0gpYSRe4pR4NRwMubLRk1eMKX2PJSzVAsfVLE4v0o=;
 b=DdvcUoZWUygd8HMFb/l0CeGDgm5jGEteLSe7xf+NMCrqSxZRWg5SvGUj88FNjQ3Mc2
 5jw8tRHAoXCx3gkCdfTRrItnHgmodlAC6+JTnXcOZaBvXxBgcaU7P/ZX0TF8Gb22wcoG
 1bOjGFCT+lLr3vWQHPejVc0mr6o2GybrD+zEeQbKO/7qU5oGitetrmIbsu9UzPEK6Pep
 lUGcjevDgr17hsn+CSja9shSuYtK7lt9ysrlbCZXKT37HbUaR/gNvVf6BZGCdMJOzijt
 tKzZxnMbTRXPjKmxMNQAdeHzO7mLlEBUq8bgSiJURv8TJYbzHEVXofmRICYGbngjq+Y6
 03wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fU0gpYSRe4pR4NRwMubLRk1eMKX2PJSzVAsfVLE4v0o=;
 b=BLc8WV3lrgH6swIOzOa9Z3pWdgKtNbWVDSkiKClr0jQBK9qjZuzZj5rB1GvEKhZScT
 Wt6zYePxISDi5+5YCEDQ9aPbMf4oXyqbOMY5bSGswC0ReP3Zedw4reTAqVIGblEovxAL
 tkC2RcUlYvUyoPpILFglem6KNGYRykrr0nbE+EtIJMMhanon/tSh5PN9UERLazge1NIg
 YazhOFXThrP4gWYhKZ0bWLv89Lbf08AYCN4KaA8qHQ/RNU57Q5N3S1fdPsvwTyPIQsOV
 6LMAiRQ47B2VEeQoZy+4+Xb6sBLjRYHkpbrSWAvJuYODAhaKtUHSfDdX8OEkneBdkJpf
 0NNw==
X-Gm-Message-State: AOAM533Zwm8uvArnCOfDM12g9wzs0IWC1ZbLjkoGMTBJAyKORZWFsp9W
 tOXCcNSZr5DVKhT0fdrPgTgKCzyIVc4=
X-Google-Smtp-Source: ABdhPJxySJcXi0BNJAplbFLkOk+rdZnqImGUlpndN+YmcrFwyP0krUR16VnP36qCfYJGZFc/hRx51g==
X-Received: by 2002:a1c:a757:: with SMTP id q84mr4576958wme.26.1632230068042; 
 Tue, 21 Sep 2021 06:14:28 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id 14sm3112041wmb.29.2021.09.21.06.14.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 06:14:27 -0700 (PDT)
Subject: Re: [PULL 0/3] Update meson version
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210918093140.5797-1-pbonzini@redhat.com>
 <CAFEAcA_07d87j7y1qnBeTuoKQw=9=fY0Ci=6ky=XxBQbuEqDnw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6671910c-7ef5-f749-a795-9389859674fc@redhat.com>
Date: Tue, 21 Sep 2021 15:14:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_07d87j7y1qnBeTuoKQw=9=fY0Ci=6ky=XxBQbuEqDnw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/09/21 14:40, Peter Maydell wrote:
> even after having blown
> away the build directory and re-created it:

Doesn't look like you fully blew away the build directory though.

Paolo

