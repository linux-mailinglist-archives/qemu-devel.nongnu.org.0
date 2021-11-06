Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0F1446D37
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 10:24:14 +0100 (CET)
Received: from localhost ([::1]:53696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjHvp-0003h4-9Q
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 05:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mjHuX-0002rA-5v; Sat, 06 Nov 2021 05:22:53 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mjHuV-0001DP-FF; Sat, 06 Nov 2021 05:22:52 -0400
Received: by mail-wr1-x433.google.com with SMTP id r8so17470298wra.7;
 Sat, 06 Nov 2021 02:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wLBpViOPM77sUs1xGya6n5ZCmDjflhc7Ie2eQM8uzXY=;
 b=cBzk4pq3iqD9O6VDPNCmF2OAdxFuTzLA13N05UAkGgOblf5+Cu2TqRvL1XdfqiVVRQ
 tsAP+8EcKEiIYqZkkorsl2tEF3+XVZ8WCQ/MVqZQxX1aj1Fm59HRG+7r9QRzsTpkfRUv
 1kBkX7lO8XmZFtmG2cu3TJfazz+wlGcgoHMbNBT16naqaIQphWk+IdwucRv6b7jSEGVX
 nqoBIPUKEN0uI1twERg/MW7KWU7eMPxaqjIK7WCCLtJiqykLDAthSYxxNOoJf0no6Y8R
 7QT5c831B6OjSOAmKRc2erH9AbWTl6i0J20pOYXn+TORXFQGzIHsFsQnXcfIiRrqah08
 w7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wLBpViOPM77sUs1xGya6n5ZCmDjflhc7Ie2eQM8uzXY=;
 b=o3OPri/YVFFUc53fIaoBWoKk4326jsjt3kf6Eqw9MxEW5sfnXDJMP+NmeNaNoeniGj
 WuWlcBSzvQv1YQklhOiMUw9+cH7ZZ6TDXxYGfiqgC2Q4BOkdZY+7AS73CBQ6kbScccwk
 diUk7oys2FNLCCHmo7tiIT8Y/YC5WM3tss9mBDtPa7g4wYbgyisN0U+xO3qR9J01hBvS
 uxk8rEph5vCB5MNpLpheBoWoDizgwbi+NHI7uINwWdCmAzVYicH2n4Uqa90xRaGaYXMC
 mx9iPnZdjzAucpg1Dm2QVKWfzbY3CRGMgDHKOoKgqtFM+yaCqRWaRJfYqWGWoQhGxY9a
 CNxA==
X-Gm-Message-State: AOAM530yj0FUBwnOE4x54jphQ2ye+aZDqEKTvwMSS2T4HIJlKdJIVada
 aQFC1UyGaFK7MgggDL1U/CY=
X-Google-Smtp-Source: ABdhPJx9g+5yaFAT5b4m7ZhL3d1XWtbZHweyl1YMdEPIaUjUbNQzrItWCLYgG2+uVfv8aKSNNQ/mAQ==
X-Received: by 2002:a5d:584c:: with SMTP id i12mr42551362wrf.95.1636190569571; 
 Sat, 06 Nov 2021 02:22:49 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id q123sm13156906wma.30.2021.11.06.02.22.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Nov 2021 02:22:48 -0700 (PDT)
Message-ID: <bb0f4cb9-1c95-c45c-8eb9-b5504787fb1b@amsat.org>
Date: Sat, 6 Nov 2021 10:22:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] target/ppc, hw/ppc: Change maintainers
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20211105034640.53754-1-david@gibson.dropbear.id.au>
 <8e05f98a-6a46-f728-5035-fab10f5a209a@gmail.com>
 <880124b9-5cd1-7fcb-fdc6-3d3f8a1da2b6@amsat.org>
 <d7c12a79-107d-dfe6-ad7b-fde51f64ddf1@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <d7c12a79-107d-dfe6-ad7b-fde51f64ddf1@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.407,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org, groug@kaod.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/6/21 00:00, Cédric Le Goater wrote:
>> In term of the MAINTAINERS file:
>>
>>          S: Status, one of the following:
>>             Supported:   Someone is actually paid to look after this.
>>             Maintained:  Someone actually looks after it.
>>
>> The PPC entries have a 'Maintained' status. You say "IBM will shoulder
>> this responsibility", does that mean the entries will be 'Supported'
>> as in "someone paid to look after them"?
>> I wonder because both Cédric and you have some commits with an IBM
>> email, but both are registering a non-IBM email as contact. 
> 
> Lotus Notes was not designed for patch communication. You don't want
> me to send patches with it I assure you :)
> 
>> I don't
>> mind the email technical detail, but I am curious about the status
>> and expectations.
> 
> We have other IBM commitments. IBM is willing to share some/most of
> our time for QEMU-PPC maintenance.
> 
> What we are going do will depend on inputs really. We have pseries
> and KVM in focus because there is still business using the software
> stack. TCG is extremely useful for pseries and powernv. We clearly
> want to keep that running and improve it. Some parts have been barely
> touched (and probably used) in the last 15 years. I think we should
> drop some support to modernize the useful parts and ease maintenance.

Here let me recommend the ant work approach I'm doing for MIPS. Instead
of dropping ISA extensions, I'm splitting them in various compile units,
that way 1/ we can chose to build without them and 2/ sub-maintainers
can maintain them separately. Having a finer grained MAINTAINERS
entries allow to filter-out/in and reduce reviewers pressure.

