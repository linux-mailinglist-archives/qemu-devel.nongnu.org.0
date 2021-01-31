Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A970309E41
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 19:56:37 +0100 (CET)
Received: from localhost ([::1]:34872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Htk-0002ts-Cr
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 13:56:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Hs3-0001VD-Qy
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 13:54:51 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:34633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Hs2-0002HZ-C5
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 13:54:51 -0500
Received: by mail-wr1-x42c.google.com with SMTP id g10so14275513wrx.1
 for <qemu-devel@nongnu.org>; Sun, 31 Jan 2021 10:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FR1Qgn3KJQlZYF2cn6BPEB2wNOofYOMOINr06XrBFiY=;
 b=GjTFCFkHrS2IgKKCd7vdSkEuYzQZIa01Miw6JpYkLB0r/vPHzlMFUexuGXOBLuz2sm
 zYBj0l5sLm0kMQdXDq4BiM7Pq83FnjG4YkktMvWblRWBjqu3d87CVD93RRHCZFJ0kB+4
 FDu5nv/PQbEAoEctMF7rlyPdZzeInG6bMk8QZgx0S2GMlGboWsTzkVVSOrZtpSnQU5/N
 9tCQfpZYAuRsKLYuuTadPa9Ax0KnlQQzUKpO8uPJ5Q7AlRsgLvZwjzV9z2XWOjF2BBgt
 5+vSeyUGv6NDj6h3ebTIGjpFN+ajHlFGdSNt1oGj7UOvLnACunHfD13HswWqvhs4dzkR
 zxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FR1Qgn3KJQlZYF2cn6BPEB2wNOofYOMOINr06XrBFiY=;
 b=egWJP4Ft9y/l8ddUDgicn8Yt/+Qj/VYYGDZp76fUb72d+VOSmYhq99LyIMzzCoAsbv
 RCyHJeIAe7b03cxc0COreRkP6vIF0jJ/AcBs46lQF9Qa+ksO3POyoBW4HswAgXr0tmlS
 cxjwM0F5rbRySlw4I6sYKJIlt0uXhSDc9lCWsZg7W09olNcS4Jv7afckjy68oj28DbjT
 LworVa38SXLEG2yfGNggatn3vL3RaYXikg/nRrvqofnb3OBGMxAhepN6beQmYkVFI1My
 6oxsrAqfwF1fOGVmtQINHh9k+X5wzxiq8Z8uzPxRvhiiynpwYKcyTk+snXCButh02Tr/
 jlAA==
X-Gm-Message-State: AOAM531VvUMwajwM4SNjfoTp6RPiUCF3UomlPXzdZM1YHuvgvDn8mPdJ
 VKvcDvvp9KMSaHLub0WliPc=
X-Google-Smtp-Source: ABdhPJzUkcPB+r3xOLKZAYbK/j8OsewAgS73QOlIP8attOclSPS7y7JkgnNYKWVwwvcwMJbgH5iDRw==
X-Received: by 2002:adf:8145:: with SMTP id 63mr14199539wrm.8.1612119288945;
 Sun, 31 Jan 2021 10:54:48 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id w129sm19274346wmb.11.2021.01.31.10.54.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 10:54:47 -0800 (PST)
Subject: Re: [PATCH v2 1/4] meson: Do not build Xen x86_64-softmmu on Aarch64
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
References: <20210131141810.293186-1-f4bug@amsat.org>
 <20210131141810.293186-2-f4bug@amsat.org>
 <6ea50cf0-344d-cf9b-0a20-0444b3764f2d@citrix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c7e1fc51-bc83-9a1d-408b-5e0731c29f5e@amsat.org>
Date: Sun, 31 Jan 2021 19:54:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <6ea50cf0-344d-cf9b-0a20-0444b3764f2d@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.079,
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paul Durrant <paul@xen.org>, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/31/21 3:45 PM, andrew.cooper3--- via wrote:
> On 31/01/2021 14:18, Philippe Mathieu-Daudé wrote:
>> The Xen on ARM documentation only mentions the i386-softmmu
>> target. As the x86_64-softmmu doesn't seem used, remove it
>> to avoid wasting cpu cycles building it.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> As far as I understand, it only gets used at all on ARM for the
> blkback=>qcow path, and has nothing to do with I440FX or other boards. 
> i.e. it is a paravirt disk and nothing else.

Yeah the PIIX3 part is messy, this is easier to select I440FX which
provides all the required dependencies. TBH I'd rather invest my
time in other tasks, and the Xen folks don't seem interested in getting
this improved. I only did that series to reply to Paolo and pass over
to Alex Bennée.

> xenpv should not be tied to i386-softmmu in the first place, and would
> remove a very-WTF-worthy current state of things.  That said, I have no
> idea how much effort that might be.

Here the problem isn't much Xen but the rest of x86 machines in QEMU.

Regards,

Phil.

