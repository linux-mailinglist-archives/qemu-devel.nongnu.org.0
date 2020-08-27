Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB54253C6F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 06:06:26 +0200 (CEST)
Received: from localhost ([::1]:58540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kB9BB-0000B2-68
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 00:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kB9AU-0008C2-L4
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 00:05:42 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:33483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kB9AS-0005Or-OH
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 00:05:42 -0400
Received: by mail-pf1-x443.google.com with SMTP id u20so2473577pfn.0
 for <qemu-devel@nongnu.org>; Wed, 26 Aug 2020 21:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uSCUBQBjTpehSkUSit53YrBqHOYQIBIiLjLYenbKSLk=;
 b=wPUOF34dAAbGNVqZxEAIGWv10bWRQpLh2tnQ+wCvK+m7xEJYb15TRgGIwwblA97UhL
 aM+GNjHTAvoZZmLXtykJpKdfDTjYqJniYfcToIgpnI/6q877D27obEdykBpFdKJ5rpwh
 n9DIauPUs3lOAJmG1cuvjCLMDENrtADp6K9qOF5aUNJGZO8WrE7eMEyySewefOZtq6qO
 IshJ5v3u/Mv8utGrnsQ079CgLof7eWd9xTXTtMP73K6frer7IGysBtEpsb+UQE/KqX5g
 HkT6UFQxfm1RV554U5MvEgiuFwaDrEcvpGRtn6vVUR3DIsCgB8UqPbPX0bs838mhfMcE
 DvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uSCUBQBjTpehSkUSit53YrBqHOYQIBIiLjLYenbKSLk=;
 b=qYJFo5Ox6snxrOgch3hOgJ6gMKabK5FqgfGOQRU0Ha1hn0xlJ3tB8I9SRgoOuF0rKn
 BLGrC8mzgYiDuWcqqa5xlKH9RtIjJAfdwsGIwR0CvC/TIfuRd2+lBOy280TIjJak+Ho6
 I/WI6LCkCN/nFVdILSUteT7+2W/PtamawYwBj1YGqCnuWnIBz/Aw2fBOFMVnxvu/2Mpy
 Uf+UvN0aestnULgmi37m20HgoKsYMa+UvglOupj/wiwf6xWfwUt+LuNHlYPb5rDZGK6m
 4zAmB0ROmDOq7nXYoD40Q6C2wR8Fm6mUFiGOk4VuKTwqeT2SNohIjbaDBfYds9UpnIUZ
 qZJA==
X-Gm-Message-State: AOAM531IsHnMCu5qV8XG/jWf0Qfi46dPzk7Z7cWds0bAHsbTb4hderdC
 TPkTLTF7eJonhPyrM0jfU134CQ==
X-Google-Smtp-Source: ABdhPJy8nkY3KrZNtvEroX5uNn7ZtKNXJLcadJqudcL2eHudkbA+LcDNLBG4Hau3PaU8uAWTnIrH/Q==
X-Received: by 2002:a17:902:6a8b:: with SMTP id
 n11mr14264042plk.156.1598501135388; 
 Wed, 26 Aug 2020 21:05:35 -0700 (PDT)
Received: from [192.168.101.174] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id mp24sm566442pjb.42.2020.08.26.21.05.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2020 21:05:34 -0700 (PDT)
Subject: Re: [RFC PATCH v3 24/34] Hexagon (target/hexagon) opcode data
 structures
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1597765847-16637-1-git-send-email-tsimpson@quicinc.com>
 <1597765847-16637-25-git-send-email-tsimpson@quicinc.com>
 <290827a0-6f54-d75a-9576-de7c8e826cd1@linaro.org>
 <BYAPR02MB4886CAE48350DD3145089260DE540@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f685e5d6-9a99-59ee-5c19-2c1530aac8a3@linaro.org>
Date: Wed, 26 Aug 2020 21:05:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB4886CAE48350DD3145089260DE540@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.239,
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
Cc: "ale@rev.ng" <ale@rev.ng>, "riku.voipio@iki.fi" <riku.voipio@iki.fi>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "laurent@vivier.eu" <laurent@vivier.eu>,
 "aleksandar.m.mail@gmail.com" <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/26/20 4:52 PM, Taylor Simpson wrote:
>> And using qemu/bitops.h if possible, as discussed earlier vs attribs.h.
> 
> Do you mean replace the GET_ATTRIB macro with test_bit from qemu/bitops.h?

No, just define GET_ATTRIB in terms of test_bit, and define opcode_attribs
using BITS_TO_LONGS.


r~

