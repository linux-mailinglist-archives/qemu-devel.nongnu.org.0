Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBAC4D9CFF
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 15:09:58 +0100 (CET)
Received: from localhost ([::1]:57350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU7s5-0001Fj-JS
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 10:09:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU7qF-000851-Gm; Tue, 15 Mar 2022 10:08:03 -0400
Received: from [2607:f8b0:4864:20::102c] (port=43579
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU7qA-0004HP-O1; Tue, 15 Mar 2022 10:08:03 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 z12-20020a17090ad78c00b001bf022b69d6so2518327pju.2; 
 Tue, 15 Mar 2022 07:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=n5RJV7EKOnS1kazx80dECSrxKL3JUdNPyUQ+rH9sbVY=;
 b=HJForaCGjZ8+I/OPktEd9hFdMN585TTk+jl0Z7jRfAN/CjsP95sSEv7t3CUHUya9Fq
 cmUxhqCxwnY8Jq9ZkM9jf+mTNdryW8tioEHIGLTnxomd2LGvSvmFeOEFu1+TJUQv/gsA
 YaORRHawDzG1lXX9EHWybS1bRAYDLNtJF2kJHqL54XciTXijv6ZA3GOWFkvtFiHLZ+SA
 4kf26f+rEExuA6NlZ1qB3stka8I1CYBJz/5JQegh/lDX4u2BnNEce4wHmJ5LrJiopGsP
 QZQsfwz8N7g6wzUwgwsojTXJm7WfA39eegwwQBtQsfwcFCsGITjD3GnOhrtFtvdHKflj
 KUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n5RJV7EKOnS1kazx80dECSrxKL3JUdNPyUQ+rH9sbVY=;
 b=FqP4nlQr5bRdJPrcjqyQTLiQDopDh1wPSDFC+WrNsJEE5pu9EK8jGLG2dhneO7WIQr
 fV5I9egx/4kGVRqaQP2O/j7FT59siss/jXScQPWU0/xLf8loJffKdtpJsFhtZyx0mG9f
 8choZAU3lYB2OKG1XyFMIxcqMT0DWuoPxuyLmfciQmN2OSFTs+I44Rx49VbbjBq3RjL2
 fZ91ncBiDWDJozwqWg+vcp52VGgYWZuXBN+c65tD6NzM+qBd7uhpyWVPff4t7Ds3JJDA
 jp3x7FbnhVN+ZsxRAwN0+sdR/8vQxzv44kZIj1xE9WbnI/vzM1iTCRN7ow9WZu4SDe28
 Qmjg==
X-Gm-Message-State: AOAM530zXE0PSLBJKy6rTUjZbnflHzxUJS7TjZCQwrQbCRxf0N/GI5C+
 /z9nACkiR6dr7h/3X0zR/2o=
X-Google-Smtp-Source: ABdhPJzx03KXda7KzQgJ08jUr9c6CHZ/lPdQQFMd5dF0oFpdZHS7Vx/Bjs3VhxRjXoejIy7drn4agA==
X-Received: by 2002:a17:902:9b97:b0:153:85ac:abc0 with SMTP id
 y23-20020a1709029b9700b0015385acabc0mr7132480plp.100.1647353275700; 
 Tue, 15 Mar 2022 07:07:55 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m125-20020a628c83000000b004f7baad5c20sm10671055pfd.144.2022.03.15.07.07.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 07:07:55 -0700 (PDT)
Message-ID: <02307072-4bff-dbbb-67fb-ca9800c34b3c@gmail.com>
Date: Tue, 15 Mar 2022 15:07:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 3/3] Use g_new() & friends where that makes obvious sense
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220314160108.1440470-1-armbru@redhat.com>
 <20220314160108.1440470-4-armbru@redhat.com> <87y21c401e.fsf@linaro.org>
 <875yofl3k3.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <875yofl3k3.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Reinoud Zandijk <reinoud@netbsd.org>,
 Eric Blake <eblake@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Juan Quintela <quintela@redhat.com>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Kamil Rytarowski <kamil@netbsd.org>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Michael Roth <michael.roth@amd.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Amit Shah <amit@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, haxm-team@intel.com,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Fabien Chouteau <chouteau@adacore.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Keith Busch <kbusch@kernel.org>,
 qemu-ppc@nongnu.org, David Hildenbrand <david@redhat.com>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x@nongnu.org, Patrick Venture <venture@google.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Corey Minyard <cminyard@mvista.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Igor Mammedov <imammedo@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/3/22 14:59, Markus Armbruster wrote:
> Alex Bennée <alex.bennee@linaro.org> writes:
> 
>> Markus Armbruster <armbru@redhat.com> writes:
>>
>>> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
>>> for two reasons.  One, it catches multiplication overflowing size_t.
>>> Two, it returns T * rather than void *, which lets the compiler catch
>>> more type errors.
>>>
>> <snip>
>>> diff --git a/semihosting/config.c b/semihosting/config.c
>>> index 137171b717..6d48ec9566 100644
>>> --- a/semihosting/config.c
>>> +++ b/semihosting/config.c
>>> @@ -98,7 +98,7 @@ static int add_semihosting_arg(void *opaque,
>>>       if (strcmp(name, "arg") == 0) {
>>>           s->argc++;
>>>           /* one extra element as g_strjoinv() expects NULL-terminated array */
>>> -        s->argv = g_realloc(s->argv, (s->argc + 1) * sizeof(void *));
>>> +        s->argv = g_renew(void *, s->argv, s->argc + 1);
>>
>> This did indeed break CI because s->argv is an array of *char:
>>
>> ../semihosting/config.c:101:17: error: assignment to ‘const char **’ from incompatible pointer type ‘void **’ [-Werror=incompatible-pointer-types]
>>    101 |         s->argv = g_renew(void *, s->argv, s->argc + 1);
>>        |                 ^
>> cc1: all warnings being treated as errors
>>
>> So it did the job of type checking but failed to build ;-)
> 
> You found a hole in my compile testing, thanks!
> 
> I got confused about the configuration of my build trees.  Catching such
> mistakes is what CI is for :)

FYI Alex fixed this here:
https://lore.kernel.org/qemu-devel/20220315121251.2280317-8-alex.bennee@linaro.org/

So your series could go on top (modulo the Coverity change).


