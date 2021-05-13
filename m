Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 581D237F59A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 12:29:13 +0200 (CEST)
Received: from localhost ([::1]:60484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh8ae-0006Nt-EX
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 06:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lh8RS-0000j7-0Z
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:19:42 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lh8RQ-0003Cu-Cs
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:19:41 -0400
Received: by mail-wr1-x435.google.com with SMTP id r12so788310wrp.1
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 03:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BWAWBq+M6woac/0GbUpjkikyqtd+Sios9YAKx9HDG/A=;
 b=UCtnLGgvtug4CsNs4tjFDhBw7bNVF/H7d0FRgnYNwQ8HkesoEKXVUEr7zVPJ4gZCOf
 GQkUkBed3sN0wEXnfr/i0+61j9arStds/i4Y3bIvNmDEScmSCcXUkFxdjxoiyfkL2ozu
 scynBJGV0z8a+eQmWKN2wSU+cbSt4+p54HafdoZRod90EH1h6IYYWT3Js1vprDpW/oGC
 XB7LPaf1ugaNYTYv+yTvKm6IUJEt2X66GAt9kSrw9K5boBVGiCeFgRv999GKyHxigfTh
 Bwwjljc6vTCOytI5RIunDMm9jkh/DByWITGU57L16GyWGSfXjW5wipfrCB3+w055GpUE
 oa2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BWAWBq+M6woac/0GbUpjkikyqtd+Sios9YAKx9HDG/A=;
 b=aXu4ZdIj2n+Sv150BJOlHB25nu3jRsH4r3hkr0dkkK+Hc9yD3r4VXRtdzUttEoQMzi
 YX69isFrIgpmC8cbfYZ0RgSk5WJFC/oxQOfoDtKHDl57naj2o4C9QER7QYu7ZIq/rYEa
 MHRU88zEJnbC6lqOtwxD6pv4FIY3nvEkSIgEUT247pxnjf94c34JQxcGvQC+vJRSov7O
 n0rlV4efvc5+XugePfnvpcN4OINW3RczINZOB648XFBYoEzsSnNfyUqfI3J7K+OLaHtt
 jbYULB207wxceKeVsH2uby3bVJ/1seqYX/f1SsljE8fyy/23VEY+SD9y7dMnLjGm+BP5
 jpmQ==
X-Gm-Message-State: AOAM5314xf7pubZccHlBx0XyOjdfhOKuOMvxLLse7Pc/mvKWIZdwcmLy
 S/Ts8AUpRr2uv7BkzAGwfR0=
X-Google-Smtp-Source: ABdhPJxf76ojl2ppF8JAK6GhwqSrrYab5pvEvCtj4YIxrPlmJhDn32PTga5ix4ZyUIeStsRUE41F2g==
X-Received: by 2002:a5d:53c3:: with SMTP id a3mr47836134wrw.376.1620901178754; 
 Thu, 13 May 2021 03:19:38 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id f20sm2177842wmh.41.2021.05.13.03.19.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 03:19:38 -0700 (PDT)
Subject: Re: [PATCH v3 09/22] tests/docker: fix mistakes in ubuntu package
 lists
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210513095519.1213675-1-berrange@redhat.com>
 <20210513095519.1213675-10-berrange@redhat.com>
 <6c43d991-fed9-f7c9-2aa8-f9753f8a3eae@amsat.org>
 <YJz8XMKexr4m+YxV@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d37f8c05-b1fa-c1f6-fa93-c5e630b5216e@amsat.org>
Date: Thu, 13 May 2021 12:19:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJz8XMKexr4m+YxV@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/21 12:15 PM, Daniel P. Berrangé wrote:
> On Thu, May 13, 2021 at 12:12:33PM +0200, Philippe Mathieu-Daudé wrote:
>> On 5/13/21 11:55 AM, Daniel P. Berrangé wrote:
>>> librados-dev is not required by QEMU directly, only librbd-dev.
>>>
>>> glusterfs-common is not directly needed by QEMU.
>>>
>>> QEMU uses ncursesw only on non-Windows hosts.
>>>
>>> The clang package is clang 10.
>>>
>>> flex and bison are not required by QEMU.
>>
>> I included them to use the same Docker file to build Linux kernel
>> we test. Not a blocker, this is the QEMU project, and I'd rather
>> get the vmlinux images prebuilt from elsewhere, so:
> 
> If we want containers in which we can build the kernel, we can
> also create a dedicated set of dockerfiles containing only the
> deps that Linux kernel builds needs, separate from QEMU.

Yes, this is how I understand lci-tool can help.

