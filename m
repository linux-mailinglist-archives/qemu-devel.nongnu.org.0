Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 574E664EEF1
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 17:24:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6DUi-00021c-To; Fri, 16 Dec 2022 11:23:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6DUP-0001uH-CT
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 11:23:23 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6DUN-0008Tr-MQ
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 11:23:13 -0500
Received: by mail-wm1-x32a.google.com with SMTP id o15so2229237wmr.4
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 08:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Zzd0/BdCZ/+l4OzDOx8Ksl2bGpR+aWBwsv+XryeBnbU=;
 b=M0IOxkSqadXXSs9Sstobo3P0BFUiKbotexMVKWKMq2lNQgi5tK3bvE4QXK1gmBkXTe
 vEnUCU8B5bdLNdNDuXYM5tulXu/Q3EJhqm48Ose2jHcI7TlMP41+MNy78QcwzbzDJ/6N
 i73vRSICE1muGAAAodvleppeZA376SOZHqDplDEXXH3VQ/a+LeTMveiAZhS9FKzwoLYh
 opASfktEzC7G56uyhbnFfbXHTrZG/e8qBr49gOYQDHpv59LyZeGw96gcqsHsMBcr6RkB
 nto9xOqVuWVu6CPVluoFpeXEVle6BV3EebI0fPPq3jUu2/iTvOvA0sQHXsu6eiRdBOzn
 GGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zzd0/BdCZ/+l4OzDOx8Ksl2bGpR+aWBwsv+XryeBnbU=;
 b=CmqOJKZALjjm3dRvGlBhDgVJezEjQqrN9u/5/U9CaeDa16nG7rbpf+EZkcQZzvlVya
 o1rdua97NYArlY8R/aWv/qLfw/09sQI0K1fiMkAfl95Uko1A7oaTfnAToe6GLBb2eA2i
 2k76Obmi9Cm+6QFcs0l+U9EPxhxTMEP/6cxdbOCiU66w97xXZdAbOsQd4cAxEwOFbuNW
 rCbQ74ONWCfhX6D8CzplugE0mGc7Uq6YWzCVSHTQcRw2CECMshktVRgWTTAREFIl9zkq
 UGXX5wiR4R5nWDOE0g1/j++lunQQqBXOcBnqYhrAJRZIXVeLHvQ3FPDd7lzf2p8A2K3S
 CY0Q==
X-Gm-Message-State: ANoB5pnuk9y2CSYoXpq1NBRIUnn3BlZShdAG2rSZuJFPmWCyb4lJh22X
 lV5pTh5xVTbQ8GOKKwToGOdQHQ==
X-Google-Smtp-Source: AA0mqf5WxlHu5deqzFVBj1OvFVKXBYBSFJOHhUFLgLFeKwuZ+M7N5iOqRkCXBp/b5ghcrdFCqkiEvQ==
X-Received: by 2002:a05:600c:5386:b0:3c6:e63d:b893 with SMTP id
 hg6-20020a05600c538600b003c6e63db893mr25562269wmb.2.1671207788980; 
 Fri, 16 Dec 2022 08:23:08 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c468c00b003cf483ee8e0sm12241088wmo.24.2022.12.16.08.23.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 08:23:08 -0800 (PST)
Message-ID: <ae141ea8-8bfa-b941-b4aa-80bf1b5150b9@linaro.org>
Date: Fri, 16 Dec 2022 17:23:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: can we reduce the time taken for the msys2 jobs?
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <CAFEAcA_FuURPMDso7+ws0fe33mm+9aAHGByc65YbbN6dEuZWMA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_FuURPMDso7+ws0fe33mm+9aAHGByc65YbbN6dEuZWMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16/12/22 15:55, Peter Maydell wrote:
> The msys2-32bit job currently seems to run into the 70 minute CI timeout
> quite frequently. This successful pass took 61 minutes:
> https://gitlab.com/qemu-project/qemu/-/jobs/3479763757
> so I don't think it's a "time limit is fine but job has intermittent
> hang" situation.
> 
> msys2-64bit also is quite close to the timeout, eg this job
> https://gitlab.com/qemu-project/qemu/-/jobs/3482192864
> took 61 minutes.

The 64-bit variant is building WHPX.

> Can we cut down or split up these CI jobs?

We can add --disable-tools to the slower.


What I don't understand is why the docker image is rebuilt, it should
be pulled from the registry.

