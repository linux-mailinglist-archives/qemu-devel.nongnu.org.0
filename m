Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9C34CEEDB
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 00:58:53 +0100 (CET)
Received: from localhost ([::1]:52640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR0m4-0007xD-6Y
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 18:58:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR0l0-0006nh-AP; Sun, 06 Mar 2022 18:57:46 -0500
Received: from [2a00:1450:4864:20::331] (port=45983
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR0ky-00055w-Su; Sun, 06 Mar 2022 18:57:46 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 k29-20020a05600c1c9d00b003817fdc0f00so8316727wms.4; 
 Sun, 06 Mar 2022 15:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FmGKt5Ps8WkmvlQS52E59Eh5O0glI+V8imZ9k49DHxc=;
 b=dj7fDrSbEaeuHyaV9gkz2aKUEgcAgNCyWtYNEq6zt+TT3ytxp6/5ET6pmvM0/icJfL
 UN2bbO8X3WaQD4dAAy/5s/7/lIvemgeiVCfm5rZ7iimqQ207vbLdsDY7NzO4By0qOwGM
 g5UtMcju4adhcZ96R98gDPTHIItu7rV65Q7kUQCyXsRQMjOWTT5l0VBZ30PVAtfg+q7v
 WF0Oz/LuIkD9bOUFaWV2bgBeUPiKawzP8HtU9w0WPXiWw6zMeYd9mTlYPqRuV8ZnB7lQ
 733ZtdDX4rTAVhi5LLWcVI5MCCM5qu3CYf9Sj8bANlJ+2Wl7Y8nV0IGQHcTSUUOZeCoF
 yRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FmGKt5Ps8WkmvlQS52E59Eh5O0glI+V8imZ9k49DHxc=;
 b=l2ttPv46VY+4lBOzn21KHK7CYjT2nQNqzbF5a01rzxlk0JvCOaCiG08KtAJBafKI0z
 gQKFlZzbGm07r1ANB2pFwz/4w9RpGY2fSX/3dLmD8C1TOBluuV5WSorZWK8PDc+ZGe1R
 k1zQQbrOuofORyj75pfmiZ29DEjORV9IFkXz4uiUgAJnIcZMIS4kOM6B4L/61sPWXybB
 xx5gt+JSCrdE6ZhXUDz8Xy5OyIVKxVYvlp+KjgMwLgk+w0XS0RpEL6xbWn73r0XbBuo3
 RiNKPT88SC4Esp2rqktbZBmDkWUyDgIalLBpK6TpRdFwhE7bBBGWWffOZANRzEHnoB+0
 w69g==
X-Gm-Message-State: AOAM530u2d+i+lp4DMZcEZ9zU1MYLy0dRU0KC+9ee+MarkfB+zavt4bQ
 AQiJliBjc32nh8NDr9seOOg=
X-Google-Smtp-Source: ABdhPJxdhuQJ4Pq0gW6+ZNM47/OcltWQ4Zp2crQzg/pAlHwLXbif5ugMVm165ljTo5dAZuwo+oFZfA==
X-Received: by 2002:a05:600c:35c2:b0:381:6cbc:7192 with SMTP id
 r2-20020a05600c35c200b003816cbc7192mr6767816wmq.146.1646611062561; 
 Sun, 06 Mar 2022 15:57:42 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v124-20020a1cac82000000b0037c3d08e0e7sm18143399wme.29.2022.03.06.15.57.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 15:57:42 -0800 (PST)
Message-ID: <8f7d11b1-528c-e49d-ee5f-ed64ed5c5336@gmail.com>
Date: Mon, 7 Mar 2022 00:57:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 5/9] tests/avocado/linux_ssh_mips_malta.py: add missing
 accel (tcg) tag
Content-Language: en-US
To: Cleber Rosa <crosa@redhat.com>
References: <20220225210156.2032055-1-crosa@redhat.com>
 <20220225210156.2032055-6-crosa@redhat.com>
 <aa0e1eb4-ef43-b386-e7a3-c034f666181b@gmail.com>
 <8735jzmdib.fsf@p50.localhost.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <8735jzmdib.fsf@p50.localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
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
 Huacai Chen <chenhuacai@kernel.org>, Eric Farman <farman@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 Fabien Chouteau <chouteau@adacore.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/22 13:13, Cleber Rosa wrote:
> 
> Philippe Mathieu-Daudé <philippe.mathieu.daude@gmail.com> writes:
> 
>> On 25/2/22 22:01, Cleber Rosa wrote:
>>> Being explicit about the accelerator used on these tests is a good
>>> thing in itself, but it will also be used in the filtering rules
>>> applied on "make check-avocado".
>>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>>> ---
>>>    tests/avocado/linux_ssh_mips_malta.py | 3 +++
>>>    1 file changed, 3 insertions(+)
>>> diff --git a/tests/avocado/linux_ssh_mips_malta.py
>>> b/tests/avocado/linux_ssh_mips_malta.py
>>> index c0f0be5ade..0179d8a6ca 100644
>>> --- a/tests/avocado/linux_ssh_mips_malta.py
>>> +++ b/tests/avocado/linux_ssh_mips_malta.py
>>> @@ -23,6 +23,9 @@
>>>    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
>>
>> Should we remove this line then? ^^^
>>
> 
> Yes, we definitely should.  But, I thought it should be a next step.

OK.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

And queued to mips-next.

