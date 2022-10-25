Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE4260C911
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 11:58:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onGfb-0005XD-76; Tue, 25 Oct 2022 05:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1onGfK-0004Z3-9V
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 05:56:10 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1onGfH-00031p-TB
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 05:56:09 -0400
Received: by mail-oi1-x230.google.com with SMTP id p127so13519720oih.9
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 02:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=78eSym+4lWA94Zhr79FfTNIZNX89gJ/GZ59eL7b1XUk=;
 b=gEuukLeBYM0Et4iwBL/l1Nyebweyxidzq0jHc5rlIhGlQ9Lxb/dXX+3qQej2lwMA02
 Ix70xXWXwEOSQdUjI4e4FQiumy8hnnodHS49OUVEAhskKXy67qnWJPapRKN6A6dbYdUV
 /j22yiVSF2kUElfIDjSUX+HJq5+7lXcxinbFYzgHrR1e/9aSgRzi5Ue6DcBGgaZqC9Zj
 fdhrC0Uu8c47YhMfp+t8U0OM+S4GGUIh4tiWdIVByrcCpGI+mP0EG/94l9L5a6HyZ864
 FqpjxpVI0/jEXI8jmaLEQG4+i8FYEsC0fM2OBit+ALhgwLom64504UowosojlFVuohIp
 Rvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=78eSym+4lWA94Zhr79FfTNIZNX89gJ/GZ59eL7b1XUk=;
 b=myWamUJwfAz/ApRNKGjcoZZja2dCYHpTcBAovOF3BM0swcF+rWgcrg51eKZJPPSNXl
 L3WsEkPgpf9FkeqPgDWmVu52bylg+ogmL/fQO0YfyZkyrSWRyO3Es+1uaARM29PTDsB9
 MoPJbC/nSI+q+1XQsKAywgArELLWnWxn6u6Pqr5Is+qvoSgUDziRQsHx6q4LhJyV7AsS
 J3rTpZQiBUmet2BcHcmSCfn4rkBQtE2XMlzt0TKafGjb/gnMOkAIuQFRq1J5qpkJdVmy
 JyWBu0meko3yUzjGokcUnJe3JeeJwj3tTwbwBKQWXOAIbLTVwm4el0rhfJxxCSRlRit3
 8KNA==
X-Gm-Message-State: ACrzQf1ixlFLaxx58WwLknrx3EaiLu3WOPlRjfm/1/isyUuAqLcajClr
 RM1OTROmWKGI2ZhF49DfCrY=
X-Google-Smtp-Source: AMsMyM6QTPIYQlL/kXrSzR1bL0oiWoF8AkUDGRGi3E9gCfYz3lJlbquy0TLr18c1OqOd52SJpVnUBw==
X-Received: by 2002:a05:6808:138e:b0:355:2b42:1580 with SMTP id
 c14-20020a056808138e00b003552b421580mr24558232oiw.91.1666691764433; 
 Tue, 25 Oct 2022 02:56:04 -0700 (PDT)
Received: from [192.168.10.102] ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a4a9b8a000000b004805c328971sm914702ooj.42.2022.10.25.02.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 02:56:04 -0700 (PDT)
Message-ID: <a29c36f4-a5fe-7aae-0c4c-05944720d34e@gmail.com>
Date: Tue, 25 Oct 2022 06:55:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] avocado: use sha1 for fc31 imgs to avoid first time
 re-download
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20221022170350.936685-1-danielhb413@gmail.com>
 <Y1ZUsauC6F3yDuny@redhat.com>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <Y1ZUsauC6F3yDuny@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x230.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 10/24/22 06:02, Daniel P. Berrangé wrote:
> On Sat, Oct 22, 2022 at 02:03:50PM -0300, Daniel Henrique Barboza wrote:
>> 'make check-avocado' will download any images that aren't present in the
>> cache via 'get-vm-images' in tests/Makefile.include. The target that
>> downloads fedora 31 images, get-vm-image-fedora-31, will use 'avocado
>> vmimage get  --distro=fedora --distro-version=31 --arch=(...)' to
>> download the image for each arch. Note that this command does not
>> support any argument to set the hash algorithm used and, based on the
>> avocado source code [1], DEFAULT_HASH_ALGORITHM is set to "sha1". The
>> sha1 hash is stored in a Fedora-Cloud-Base-31-1.9.{ARCH}.qcow2-CHECKSUM
>> in the cache.
> 
>> For now, in QEMU, let's use sha1 for all Fedora 31 images. This will
>> immediately spares us at least one extra download for each Fedora 31
>> image that we're doing in all our CI runs.
>>
>> [1] https://github.com/avocado-framework/avocado.git @ 942a5d6972906
>> [2] https://github.com/avocado-framework/avocado/issues/5496
> 
> Can we just ask Avocado maintainers to fix this problem on their
> side to allow use of a modern hash alg as a priority item. We've
> already had this problem in QEMU for over a year AFAICT, so doesn't
> seem like we need to urgently do a workaround on QEMU side, so we
> can get Avocado devs to commit to fixing it in the next month.

Sure, I think it would be better if we can get an Avocado side fix to make
the current QEMU usage viable.

For now I'll use this patch locally because this issue is 100% reproducible
on my home machine :( apparently my internet is capable of 4k streaming but,
for some reason, it doesn't manage to download 350Mb from the Fedora mirror
in less that 180 seconds. 'make check-avocado' always gives me a timeout in
'test_pseries_tcg'.


Thanks,


Daniel

> 
> 
> With regards,
> Daniel

