Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD9A2F4C0A
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 14:11:53 +0100 (CET)
Received: from localhost ([::1]:34962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzfwG-0001D9-Sh
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 08:11:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzfuA-0000b6-JV
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 08:09:42 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzfu6-0004Jy-Mc
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 08:09:41 -0500
Received: by mail-wr1-x433.google.com with SMTP id r7so2060849wrc.5
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 05:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZtHZ0sscuEeoKWmZZQOgzehe/cENvfcs/efW7IfJlPU=;
 b=sFGYQDE2iQsWuMz4afjdtVzgF2mKFWj9kNl7+0WuLIVZlmaClQmhyIx9xjpScAtOV8
 kcY1d4+0ImiGFeIVqeYdRiSQ0IAaSe7hqaKcmFvrGv5pr4A9pnmBEn6cFe8nSAwqeqm+
 EdZFrUIDwbTk+SYmn/I4DSAznZCUNI/mDR+cD5cWXnALw7Cmr2Hb9JfGnAz1USkxLC58
 6e+ZLY+wWxkJgj2piiKLzrqBCUwhP9z+p663d6zrKgz2aKoxc7Tbyk+RGQrSYph3yrrF
 St0bixsSaH40gURWylpXlgpF3rM+MBXPsBvdjouAwVAP+7b6kWeujk00ZUE2H84mxOpF
 vbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZtHZ0sscuEeoKWmZZQOgzehe/cENvfcs/efW7IfJlPU=;
 b=YljYUlAglk8lBr9iMEq9Anbj8pH00Z2F/sSGpqdpgmcRxmta++K92N/y8QEaLKeMV1
 C+n3ri4q4w9qYWP/JJFNMs2Zq8DvHc38qZ/d9m4eQwhphYnVgHop/308Iz9a5RoiVvqv
 NvKpn+JhQ12ZrFGvK81XsExyUu/KQCSP98RkukHwYXqN6kzoAan3HXyxinAUyGffZmXc
 1jM7ZZgf5/cqy7Ey/cP1Zq6csIpHUh66nXQn6rrpMKvr4YkGI1Qx7qjQU7JQ6pMz5Oc/
 yITbtXPxl6/FQ0PB0w2LEp2ujuXCxx0VUU9PNnkODmVEliaJUu8uIsaTWw8HFrfnzixH
 7Usg==
X-Gm-Message-State: AOAM533kcB6tChOIrwAylmzo3rim9hnkj0Ofzn/X58LrDr1XpEE3M1Hp
 HhttTBjXlsY88wUutWQdqOA=
X-Google-Smtp-Source: ABdhPJyS0OLxR94cfvU//FYWzpVpcqcnsJUs3tHAocCN5cg7XsltGsjxChfMpwhah+D7Nxm1k7AIRg==
X-Received: by 2002:a05:6000:90:: with SMTP id
 m16mr2577309wrx.165.1610543375992; 
 Wed, 13 Jan 2021 05:09:35 -0800 (PST)
Received: from [192.168.1.36] (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id v4sm3445545wrw.42.2021.01.13.05.09.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 05:09:34 -0800 (PST)
Subject: Re: [PATCH 1/8] build-system: clean up TCG/TCI configury
To: Aurelien Jarno <aurelien@aurel32.net>, Stefan Weil <sw@weilnetz.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Helge Deller <deller@gmx.de>, debian-hppa@lists.debian.org,
 debian-superh@lists.debian.org
References: <20210107140039.467969-1-pbonzini@redhat.com>
 <20210107140039.467969-2-pbonzini@redhat.com>
 <CAFEAcA9yyUUmd+hj6kgAV8KWtCC41Q55JRfE0q1zTaDaOofgOQ@mail.gmail.com>
 <a5cd4c43-2f12-2dbf-8db7-21acc7abc73d@redhat.com>
 <20210107160653.GD1029501@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d1b5a493-0658-3bba-b1b4-0116f337031d@amsat.org>
Date: Wed, 13 Jan 2021 14:09:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210107160653.GD1029501@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing TCI, SH4 and PA contacts FWIW.

On 1/7/21 5:06 PM, Daniel P. Berrangé wrote:
> On Thu, Jan 07, 2021 at 04:50:36PM +0100, Paolo Bonzini wrote:
>> On 07/01/21 16:01, Peter Maydell wrote:
>>> On Thu, 7 Jan 2021 at 14:03, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>>>
>>>> Make CONFIG_TCG_INTERPRETER a Meson option, and enable TCI (though with
>>>> a warning) if the host CPU is unsupported, making it more similar to
>>>> other --enable-* options.
>>>
>>> The current behaviour is kind of deliberate. Using the TCG
>>> interpreter is a terrible idea and think it's better if we
>>> don't let users end up using it without realising that they have.
>>> (Personally I would vote to deprecate-and-delete TCI, and also
>>> to just have configure error out on unknown host CPU architectures.)
>>
>> Fair enough, I can change this back of course.  The missing targets are
>> parisc, ia64 and sh4 I guess.
> 
> ia64 is a dead host architecture and doesn't exist in any OS distro that
> we target anymore, so I don't think we need to consider it.
> 
> Likewise parisc/hppa doesn't seem exist in Debian since Squeeze, so I
> think we can rule that out too.
> 
> Only sh4 still seems to be supported in Debian. I expect the primary
> need there is for sh4 guest support rather than sh4 host support.
> 
> Regards,
> Daniel
> 


