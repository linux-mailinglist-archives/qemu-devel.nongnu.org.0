Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C225E89FF
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 10:17:48 +0200 (CEST)
Received: from localhost ([::1]:37518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc0M6-0003i3-Oq
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 04:17:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oc0IZ-0000VW-0Y
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 04:14:07 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:41743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oc0IW-0005bx-B2
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 04:14:05 -0400
Received: by mail-qk1-x72c.google.com with SMTP id k12so1421724qkj.8
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 01:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=SxWAIv9JMLCbvTFlw0GI+T+lWYZUXb6MAPOcbMs2oY8=;
 b=OBcmWuoupg3tf7E4fF8rdCkKdvBHEMr7B2h99GdWFgFf8mZNlwj+xXOErWGWUjPP9p
 3kjcALRgSArQCkSZq0nWnD/WxMXGGJKplLyZHIp7lwNujfaSrcHT5b/xgKm6hWA5IDut
 kBWMIXrgio06bRo6jh9lwU199QrgaQZObzg1Oa4G51vCDlz/8Ud6kZ2phcVs6zV37dGC
 0R03y/WtJnF5Fbfet4nAr3lfJYjq2+xLy+5D2iqaJO88ec2CbLwvYZjKtkJCGRZ7M3hA
 BK2zTF8ocz6/q4b0gKYv5Hlfw3pELsPe/EdVVr9yNVk/DRLMpXs1bGD++Qr0NBfO3wtn
 8DDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=SxWAIv9JMLCbvTFlw0GI+T+lWYZUXb6MAPOcbMs2oY8=;
 b=36NTxmhoPsDmhxxongaspty/l0uvK9TAZOCWmHesHSF41Nw3m6vijuEUN6tbfxnwnl
 ELUZn9ZxnKhLY7bV+BQEU+tnBcchrS5Fh+39FaSLBNT9WTd53RKU+5ZhirMfA4VIHPSP
 jBoc9T7CNB3MTXfyLp+l3lG0fdXJiMIKtMPeIHKbHKz6dd15HasOLilKZjf0LWJPhI8V
 5uCqHYTP7nvXggqYxU/OMULwOR8GvPLOzTxdxPJCUVEXLDdOv2IHpWUzKq9qS+Lm28vD
 hmqWaj3tG1QAXy8FMk7IgyABCl/rB5v5lTrM7NyqFBT7IKQ3T1Z4/lYq7qHIi4JPWMnm
 ksfg==
X-Gm-Message-State: ACrzQf228PmlYK6d1/avhFBhhRRvmxli9Q9oThHyzHzQqRjeg6+ZDVPS
 kzCLB5RATQL/A6DS3k4p6UmXGxCCV3U8KuYQTlm+hU+W
X-Google-Smtp-Source: AMsMyM4pQZz0zsylLgHWyyz2zhLvy9rTWQUniK5WOMzMUznHJHhEZZ/8LWfMJF99ZpNQmzsokA7nblwO4s+dSzI7xEM=
X-Received: by 2002:ae9:dd42:0:b0:6cc:ead5:14b4 with SMTP id
 r63-20020ae9dd42000000b006ccead514b4mr8065553qkf.94.1664007243133; Sat, 24
 Sep 2022 01:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-39-bmeng.cn@gmail.com>
 <CAJ+F1CK5A1K=YgOxzXg2fbc+GOC-FmgxwDDnD=TgSKsDt6rDHw@mail.gmail.com>
In-Reply-To: <CAJ+F1CK5A1K=YgOxzXg2fbc+GOC-FmgxwDDnD=TgSKsDt6rDHw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 24 Sep 2022 16:13:52 +0800
Message-ID: <CAEUhbmV+eat4_m6=meS0e5x75k+X2R9u=pG9PHPAass98uf7Rg@mail.gmail.com>
Subject: Re: [PATCH v2 38/39] tests/qtest: Enable qtest build on Windows
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72c.google.com
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

On Fri, Sep 23, 2022 at 4:18 AM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Tue, Sep 20, 2022 at 3:37 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> Now that we have fixed various test case issues as seen when running
>> on Windows, let's enable the qtest build on Windows.
>>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> ---
>>
>> Changes in v2:
>> - new patch: "tests/qtest: Enable qtest build on Windows"
>>
>>  tests/qtest/meson.build | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
>> index 455f1bbb7e..ceab141824 100644
>> --- a/tests/qtest/meson.build
>> +++ b/tests/qtest/meson.build
>> @@ -1,6 +1,5 @@
>> -# All QTests for now are POSIX-only, but the dependencies are
>> -# really in libqtest, not in the testcases themselves.
>> -if not config_host.has_key('CONFIG_POSIX')
>> +# Build all QTests for POSIX and Windows
>> +if not config_host.has_key('CONFIG_POSIX') and not config_host.has_key(=
'CONFIG_WIN32')
>>    subdir_done()
>>  endif
>
>
> I wonder, but I suppose we can just remove the conditions. No?

Yes, I think so.

Regards,
Bin

