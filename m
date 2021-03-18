Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F306340F69
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 21:54:25 +0100 (CET)
Received: from localhost ([::1]:51538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMzey-0005b5-9P
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 16:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMzdj-0004z0-SF
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 16:53:07 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:51026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMzdi-0005UT-I6
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 16:53:07 -0400
Received: by mail-wm1-x32d.google.com with SMTP id g25so4384434wmh.0
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 13:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K4nAcrGof4a5sdUxEtzWRu7RL3H2rpDVz2eBkROTnyo=;
 b=W+JBBrURmOOSD/u+UAPquAI8AZrjTCPDaeis37KV0yv3Ck/XB9lR9/UDO09Nt2W4nI
 ZhuFPkEvrZlDxLTbPjxpjkJjNUnPd0aRuxRd5WWBQ1/amvGWJXX9BD8UY16sKAjRvA0w
 6OHv7UWEFSvQuJD/Wdh9iPezH/Zxtx87g6HJdPVDfTmWsGy7+OSMlFI7Onu4sfWJfx9R
 F5S/JWX15zzYxKMGnDD/0+NX1FoEvkhzZSdTcRy/jnMQcL4TZE6gIoydGbYaIkReWVPG
 Tyd4I1ScCe7yha5lLQMC0DsayFDwlD2PQ/tLW54QCiH+mhWkqnZtO3Y8krG+qo8u1zuf
 Pbmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K4nAcrGof4a5sdUxEtzWRu7RL3H2rpDVz2eBkROTnyo=;
 b=cZwg3kifdT1OlTDcGWJsuuDc3awOoHlC8bM96BM8MHgTuw/fnCjPckxKdNwTA1oFxc
 IK7q13OqqxqU2tnhRAfdZwYD4YyEIEZN1pDEvmvTZ4Io4mGTjDUcA/4CMlPgpOrBtepq
 fK0aHmmchhBKg5fWeSUt7W/HQarEPKORmHN7WY0pt1L1dVJAEG0GUMIUsDjjJNcqQY5G
 ybDfroHTQ119AzIvZRXclqHdJuSTY3U0n++aoFafWM+RBSwCYvgjUSbIFa0CfjlmFf3a
 PpkzxHostzOIEsznaBYuUvCnwyS60mJhp9XrVUZwaL4AKHl331/b1GPyPXAhXB0s7hiL
 w+ZQ==
X-Gm-Message-State: AOAM533Yb1n7++c2zBNjxTVry7lqcpMiqdPioFwlcX1DGflcPzSBGQ8f
 qrRM9ybv15r9LstukWOEWuQ=
X-Google-Smtp-Source: ABdhPJzITIF7YBs5BdBzpiDZ+rCxLtv/W9uKhnsTj8vusLb8IJQifZ8ZwJBnayPOrw67VxfuC39V2w==
X-Received: by 2002:a1c:1f4a:: with SMTP id f71mr831380wmf.101.1616100784816; 
 Thu, 18 Mar 2021 13:53:04 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id c6sm4300364wri.32.2021.03.18.13.53.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 13:53:04 -0700 (PDT)
Subject: Re: Serious doubts about Gitlab CI
To: John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <cb9d0504-aba5-3114-d121-694a5247764c@amsat.org>
 <YFOt+R77HfpNEYFc@stefanha-x1.localdomain>
 <a4bf6d0c-e66d-1b57-edfe-b02c71c629da@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <acd9b21c-a03e-5839-4f9c-18418e37ec3b@amsat.org>
Date: Thu, 18 Mar 2021 21:53:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <a4bf6d0c-e66d-1b57-edfe-b02c71c629da@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 8:52 PM, John Snow wrote:
> On 3/18/21 3:46 PM, Stefan Hajnoczi wrote:
>> On Wed, Mar 17, 2021 at 09:29:32PM +0100, Philippe Mathieu-Daudé wrote:
>>> Now I'm having serious doubts about Gitlab usefulness for the QEMU
>>> community...
>>
>> The QEMU Project has 50,000 minutes of GitLab CI quota. Let's enable
>> GitLab Merge Requests so that anyone can submit a merge request and get
>> CI coverage.
>>
> 
> How does this workflow work?
> 
> I push to my branch, I submit a MR, CI runs?
> 
> I suppose there must be a way for me to disable a CI run on my branch if
> I intend to trigger it via a MR, to avoid eating minutes twice.
I use that alias in ~/.gitconfig:

[alias]
    skip-ci-push = push --push-option=ci.skip

Then:

$ git skip-ci-push [-f] myrepo mybranch

