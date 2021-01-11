Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C352F22A1
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 23:22:47 +0100 (CET)
Received: from localhost ([::1]:39780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz5aH-0004GU-U3
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 17:22:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kz5YA-0003iW-9l
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 17:20:34 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:35227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kz5Y7-00072x-GF
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 17:20:33 -0500
Received: by mail-ed1-x52a.google.com with SMTP id u19so158628edx.2
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 14:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aWJqLsCNUIWUCR0BFazB399w2iASkG8MPrPkt9Xk9dk=;
 b=C/tkpW414YyaZAAK/al9re3TaJ8MoeeML0mgbFMuen2bXE9hQtENBCe5aOpFgjqoGu
 tHQj2CRnWrSlP1dWO2+qmpe0nfBDLxdqb3EqzBbr/616QyJlpC09WcxqO1Vj19bTsp7M
 ADvlMPDcm37q+EvGgUy2TKooCMgVmV2UH2eaDiE/QkzzWbkz7qYCEMRmVrIVjNzt/vDi
 M2hZqqnZ9ZQ+NDvB1hwQ7LtinIFiJu5sIEQljDrkS1fUy1l1gEMKvn3HbXVEJXqsSsKG
 75dq5vqK9flWpj+7Tp8KMdK1EB7EGd/zrVP3KPYxZzaTcevgqGyjegA1ohas9kJl1EOP
 IrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aWJqLsCNUIWUCR0BFazB399w2iASkG8MPrPkt9Xk9dk=;
 b=n6NdAqBumy+zRAWOrKjrNApDAqz79GoiujmVoqq/DhgBZOUHcJnu3KAnpePcf0CI/r
 QJLD/fxOg8fXjlbmcGB7m1UiC+qDjTPWoj1BlLYP7fJpv783uiyV0Ecd5Zm81iV9hF8E
 6rs1YlpBeSErAZZmSG0eg522DuOAhNS+Z/FnFQwijWTVSecigHCXtD4rGW1u8p6XfEnR
 1GHykSqMuKdp9B8YeGj2rnDtcBypVCkEQnq7/rr+zgqDlBK3De8eqbpfx5Dn7P8cGewy
 kDFJzLuHOU7euLP8Wzz8x0TgKozh/8/O+eZ6jHgtFWQWMghQW6oy09nXBbkuTXT+BR7J
 ZCKQ==
X-Gm-Message-State: AOAM5336HVCX4Y08LF12Y+uV5vfzl+RqTgITAEnqw+l2WhbbE99DBtly
 503dH96/kq/Lxh0RDoVr9BI=
X-Google-Smtp-Source: ABdhPJxhX0HlQBCvHveVkw8A+EMEBKzIoFcBKPBZZv9zDLmK3urSS1IxYOv3j0jb5LRN5t5KurYDUA==
X-Received: by 2002:a50:f089:: with SMTP id v9mr1065390edl.353.1610403629951; 
 Mon, 11 Jan 2021 14:20:29 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id be6sm536345edb.29.2021.01.11.14.20.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 14:20:29 -0800 (PST)
Subject: Re: [PATCH v6 05/35] Hexagon (disas) disassembler
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
References: <1610080146-14968-1-git-send-email-tsimpson@quicinc.com>
 <1610080146-14968-6-git-send-email-tsimpson@quicinc.com>
 <6da5929b-1c66-1e08-7998-1823aa716c60@amsat.org>
 <BYAPR02MB48868E6F215E4C1315543246DEAB0@BYAPR02MB4886.namprd02.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8d39b0b1-3056-e407-6feb-e27b0b5ada60@amsat.org>
Date: Mon, 11 Jan 2021 23:20:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB48868E6F215E4C1315543246DEAB0@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Thomas/Daniel/Peter.

On 1/11/21 10:14 PM, Taylor Simpson wrote:
>> -----Original Message-----
>> From: Qemu-devel <qemu-devel-
>> bounces+tsimpson=quicinc.com@nongnu.org> On Behalf Of Philippe
>> Mathieu-Daudé
>> Sent: Saturday, January 9, 2021 3:38 PM
>> To: Taylor Simpson <tsimpson@quicinc.com>; qemu-devel@nongnu.org
>> Cc: ale@rev.ng; Brian Cain <bcain@quicinc.com>;
>> richard.henderson@linaro.org; laurent@vivier.eu
>> Subject: Re: [PATCH v6 05/35] Hexagon (disas) disassembler
>>
>> Hi Taylor,
>>
>> On 1/8/21 5:28 AM, Taylor Simpson wrote:
>>> +/*
>>> + *  Copyright(c) 2019-2020 Qualcomm Innovation Center, Inc. All Rights
>> Reserved.
>>
>> 2019-2021 :)
>>
>>> + *
>>> + *  This program is free software; you can redistribute it and/or modify
>>> + *  it under the terms of the GNU General Public License as published by
>>> + *  the Free Software Foundation; either version 2 of the License, or
>>> + *  (at your option) any later version.
>>> + *
>>> + *  This program is distributed in the hope that it will be useful,
>>> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> + *  GNU General Public License for more details.
>>> + *
>>> + *  You should have received a copy of the GNU General Public License
>>> + *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>>
>> If possible please also include the SPDX identifier (or simply it):
>>
>> SPDX-License-Identifier: GPL-2.0-or-later
> 
> I'll confirm with our legal department.  Which is preferred - the identifier alone or the text and the identifier?

Obviously IANAL, but my understanding from explanations from Thomas and
Daniel is -- if one day QEMU switches to using SPDX -- when both are
provided, it is very hard to remove a text license (which often is
copy/pasted with mistakes). So the identifier alone is better (assuming
your legal department confirms it has the same value).

Now if you ask if there is any plan QEMU switch to SPDX, I'd say this
is a gray zone. Peter expressively said he prefers a full switch or
nothing. We don't have the resources for it. Meanwhile some companies
prefer their employees to send new contributions with SPDX as it eases
their compliance audit tools.

I guess Thomas spend 1 week on this topic. TBH I spent more than 2 weeks
and barely added the SPDX tag to a bit more than 30% of the codebase
then had to give up because my time was over (this was when I understood
I couldn't remove the text and had to redo the work).

Not sure how this can be coordinated. As long as there is no strong
corporate interest, this might stay in this gray zone...

Regards,

Phil.

