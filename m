Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 529485E713C
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 03:12:31 +0200 (CEST)
Received: from localhost ([::1]:41200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obXF0-0005ei-0D
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 21:12:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1obXCZ-0003Q3-N1
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 21:09:59 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:36809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1obXCT-0006pj-TZ
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 21:09:59 -0400
Received: by mail-qv1-xf31.google.com with SMTP id g4so8103482qvo.3
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 18:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=tskRT081hWH3d3xDE1iHxsa1gdCEQL1vSAq4Y2wlpQU=;
 b=Bi8TVTZ6t2w1MUduJpZIJHgTtTBJADm5dRzsC5V+S+2Z2/QD96HkZVWhHq2prwHgoP
 YYjTeuOMXBji/nZjJs+4Jq7eaMp6zvOU1mfkWkWOKE1sfy1ILuDWBExcaV40Tpti4cUP
 0VC8XeOR654hjs4EVAfmy6RGJgyqIDBCoOy1bzDueRZskjwTojNPGDkIY1/ZJlPFWzp6
 wojZF7/dyjiVgw7D1IjzdL/yNyCTpqP+qIyHMl8jcnNcNb2CUYoxuraz9munAm7UZDFc
 uCW03PsCAoJCnGsCSu8i5f7PfXd3alfX2Y1qSwyofbbImTm6wfKMByyJMMCKG7QWDIj3
 MmZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=tskRT081hWH3d3xDE1iHxsa1gdCEQL1vSAq4Y2wlpQU=;
 b=ExvdS3NNYbTPLlv9xyVjGtyL3o0LLVusTIy5fytOQPNPFjetTytSGELA6GuSm6Oph6
 cwhcOrbtw6esje+VsPKj8S+0j1UyaQ0IziCayMnZPhpWzlD2F3iQqFGkDKH9O3nn+/e3
 9xBYePvTJJ1FJCprcNdQvyJiIShGXJYzUnal6b4dqEAL39AhOIGLBG51YE99Q3eOU5dK
 sHURNcrQjLH3rUB9BlJnwbbpJKGGI6ol2HhlM0x6+nEbyi/IB5BbdI+f53OcG0brmB9p
 PWTzVWQvO9nsy8ZtIgxiJtukz++tQ0wQBlCwZojNbaIZCjMf5jhW0Y4cEnlvxSmX44ed
 Xdzw==
X-Gm-Message-State: ACrzQf2ZFhTfhoLC0b3gNhpTqEkv4Q17a0eBZJc1Wi4K+zwGyFpae8sL
 aRuDks4xTkdlQ12aocm87Hm7W2Gu8euPAbEHEa8=
X-Google-Smtp-Source: AMsMyM50c4huSwtVus6ujMwl6Ne1tYBtD2/zv7vw/1+vm9crWeW8oMEo2rDV5VugtcD5S1x58ZHXq+mtQtCe7uY8Lqw=
X-Received: by 2002:a05:6214:1947:b0:4aa:9e87:d032 with SMTP id
 q7-20020a056214194700b004aa9e87d032mr4950519qvk.114.1663895391975; Thu, 22
 Sep 2022 18:09:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-2-bmeng.cn@gmail.com>
 <CAJ+F1CKiCiWBwr5CGAODZukJ8eYoJerhQ01AQYqWMLktsVDM2Q@mail.gmail.com>
In-Reply-To: <CAJ+F1CKiCiWBwr5CGAODZukJ8eYoJerhQ01AQYqWMLktsVDM2Q@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 23 Sep 2022 09:09:41 +0800
Message-ID: <CAEUhbmXV8SBNfW3teZw+A-EKxbjv-UwJZrND4mWOdxUKQT_MCw@mail.gmail.com>
Subject: Re: [PATCH v2 01/39] tests: Change to use g_mkdir()
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 23, 2022 at 3:32 AM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Tue, Sep 20, 2022 at 1:48 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> Commit 413bebc04603 ("tests: Use g_mkdir_with_parents()") replaces
>> the mkdir() call in the test codes with glib's g_mkdir_with_parents(),
>> but the exact portable replacement for mkdir() should be g_mkdir().
>>
>> I probably was misled by the GTK glib doc [1] before, thinking that
>> g_mkdir() is not a supported API from glib. But the glib sources do
>> not support this statement. It is probably that the GTK documentation
>> was not built to include all APIs.
>>
>> [1] https://docs.gtk.org/glib/?q=3Dmkdir
>>
>> Fixes: 413bebc04603 ("tests: Use g_mkdir_with_parents()")
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
>
> I wouldn't bother anymore, I'd keep mkdir_with_parents for now. YMMV
>

Yep but some maintainers pointed out in other patches in v1 that
g_mkdir() is the strict replacement for mkdir() :)

@Thomas Huth Would you share your thoughts?

Regards,
Bin

