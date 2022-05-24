Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 402A1532B60
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 15:34:45 +0200 (CEST)
Received: from localhost ([::1]:53204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntUgO-00040x-CW
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 09:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntUf5-00039y-Iv
 for qemu-devel@nongnu.org; Tue, 24 May 2022 09:33:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ntUf3-0006n3-MB
 for qemu-devel@nongnu.org; Tue, 24 May 2022 09:33:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653399199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hARJq6kjLRnAHbTitq9wG+0WKUV7noUnr+7Zp85uuHM=;
 b=WkIDYklsCVta+0YDe6U0ZvlJZ23U/+z9Gt0ABKH0O4LPVmNMCgNEyyhf0GDQZMtViDKVeZ
 K03yVjEMymvFBPQnSsELQofYljxh02Bnb4TeeI129SdkMPIJzy9eskX+NDhBOcdc9e0JJU
 ptEU1AfuI0+/cyxVr1Ws3ExGhyu+ZCM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-rPI6Q5Z2MkOy7-Oj58YyYQ-1; Tue, 24 May 2022 09:33:17 -0400
X-MC-Unique: rPI6Q5Z2MkOy7-Oj58YyYQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 j17-20020adfe511000000b0020ff91f52faso394580wrm.13
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 06:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=hARJq6kjLRnAHbTitq9wG+0WKUV7noUnr+7Zp85uuHM=;
 b=hsn7P8X2sAmWXBVty5VuehZdhXWG/4Kwd2PoW0u23uFKbE9rv6YZVClbAlMZEupLjv
 RXizGWIlbrXZyH2UKxHnp3l/c066mWZQKhtvhnYaO+6mtRVMmcwW7UZVpXXCMGxQFu78
 xBzj0S4ebBdmT2p2wkVEhjQGImM/A3ujNVMYhzdcYj4iPjcmAhwFlB5v6rTZ2MCHL1ou
 bynX1SZme/WRO/ox6cKqXwpPVShZfRP1M1IiMOXtE1KcpjYHB/cLbZU5YabQ/aquT8on
 oUNyt4Ub60x80if8NhhGbBKoQ6+YHX6GFQM2s1Fq2Wjsi3GUBWmd+m4HH/GpTGVu1HKO
 ww7Q==
X-Gm-Message-State: AOAM5304ywSnVEUrPHKmKizcf8Vjim64FaaZIyOLnkXWWJ0FhbYAjGDK
 BqZGrcOEMdSQDMlKCZpjWiZJoWQHw01PL39QZQXwEn8PZTmYp7nT8Xf2OfwAFxlW9Py/NUeXlA+
 knVwRbU/ebMoqSyU=
X-Received: by 2002:adf:e60e:0:b0:20e:6532:51f0 with SMTP id
 p14-20020adfe60e000000b0020e653251f0mr22824730wrm.673.1653399196307; 
 Tue, 24 May 2022 06:33:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXNoryNcZFvbFfVteGrndO51SS7gmOZVFHIJ0plK49jDZAfLPavwXMStzZ6dUmPl5yphZMeA==
X-Received: by 2002:adf:e60e:0:b0:20e:6532:51f0 with SMTP id
 p14-20020adfe60e000000b0020e653251f0mr22824700wrm.673.1653399195993; 
 Tue, 24 May 2022 06:33:15 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 q11-20020adfaa4b000000b0020fc6590a12sm8262609wrd.41.2022.05.24.06.33.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 06:33:14 -0700 (PDT)
Message-ID: <6c589e29-0e62-0bbf-8dae-785d7c616ebd@redhat.com>
Date: Tue, 24 May 2022 15:33:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PULL 2/3] qga-win32: Add support for NVME but type
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: Konstantin Kostiuk <kkostiuk@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20220523194111.827805-1-kkostiuk@redhat.com>
 <20220523194111.827805-3-kkostiuk@redhat.com>
 <541f46cf-fc45-f7bb-e121-2aad216e11d5@linaro.org>
 <CAPMcbCq7fzubG4ej7p164vwQkCMChjWBubx27R=kVxukWDhuBg@mail.gmail.com>
 <CAPMcbCqeQ_7YuJg+eS9Qqtq9ptRb57_wfT=jGOuHYtx64M5azA@mail.gmail.com>
 <CAMxuvawvaZBp0sxV-jwQuDwxahuFjN10BDcBcgOn88XpN87RPA@mail.gmail.com>
 <f4f5afc8-0b01-e134-bb83-b3d0ded0439a@redhat.com>
 <CAPMcbCr8_zgYcMQ9Q0GSQL-TgvOGY-q16sMoVNxBpvwG4JDEng@mail.gmail.com>
 <449f117b-32c9-e066-55dd-1208313bce3f@redhat.com>
 <CAPMcbCpgyNnggdMTY9K3=nv_BBF8Fbsp_MoAQ6ubeUEA5-aL=A@mail.gmail.com>
 <59b8bdee-ef2f-83b4-fbc7-4283cb964c33@redhat.com>
In-Reply-To: <59b8bdee-ef2f-83b4-fbc7-4283cb964c33@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 24/05/2022 15.28, Thomas Huth wrote:
> On 24/05/2022 15.17, Konstantin Kostiuk wrote:
>>
>>
>> On Tue, May 24, 2022 at 4:13 PM Thomas Huth <thuth@redhat.com 
>> <mailto:thuth@redhat.com>> wrote:
>>
>>     On 24/05/2022 15.00, Konstantin Kostiuk wrote:
>>      >
>>      >
>>      >
>>      >
>>      > On Tue, May 24, 2022 at 1:24 PM Thomas Huth <thuth@redhat.com
>>     <mailto:thuth@redhat.com>
>>      > <mailto:thuth@redhat.com <mailto:thuth@redhat.com>>> wrote:
>>      >
>>      >     On 24/05/2022 12.14, Marc-André Lureau wrote:
>>      >      > Hi
>>      >      >
>>      >      > On Tue, May 24, 2022 at 12:02 PM Konstantin Kostiuk
>>      >     <kkostiuk@redhat.com <mailto:kkostiuk@redhat.com>
>>     <mailto:kkostiuk@redhat.com <mailto:kkostiuk@redhat.com>>> wrote:
>>      >      >>
>>      >      >> Hi Richard and Marc-André
>>      >      >>
>>      >      >> I looked into the compilation problem and have 2 solutions:
>>      >      >> 1. We can add some conditions to the win2qemu definition and
>>      >      >> skip NVME support when old mingw-headers are used.
>>      >      >> 2. We can bump the version of the Fedora docker image to 36 
>> or 37
>>      >      >> that is used for cross-compilation tests.
>>      >      >>
>>      >      >> I think the second option is more valuable because we remove
>>      >      >> pregenerated qga-vss.tlb file and now we can check VSS 
>> build only
>>      >      >> at Fedora 37.
>>      >      >>
>>      >      >> What do you think?
>>      >      >
>>      >      > I'd try to do both: fix compilation with older headers, and
>>     bump our
>>      >      > CI to f36. I don't know if our windows build environment has
>>     strict
>>      >      > requirements like the unix/distro (build on old-stable for 2y).
>>      >
>>      >     See
>>     https://www.qemu.org/docs/master/about/build-platforms.html#windows
>>     <https://www.qemu.org/docs/master/about/build-platforms.html#windows>
>>      >      
>>  <https://www.qemu.org/docs/master/about/build-platforms.html#windows
>>     <https://www.qemu.org/docs/master/about/build-platforms.html#windows>> :
>>      >
>>      >     "The project supports building QEMU with current versions of the
>>     MinGW
>>      >     toolchain, either hosted on Linux (Debian/Fedora) or via MSYS2 on
>>     Windows."
>>      >
>>      >     Since Fedora 35 is still a supported build host, I think you
>>     should make
>>      >     sure that it works with the MinGW toolchain from that distro, too.
>>      >
>>      >
>>      > Currently, CI uses Fedora 33 which is already EOL. Fedora 35 has 
>> updated
>>      > mingw-headers and the current version of code compiles without any
>>     errors.
>>      > So if we want to support only Fedora 35+, we can just bump the CI
>>     docker image.
>>
>>     Ah, right, I was looking at the wrong file. So yes, in that case, please
>>     simply update the docker image.
>>
>>     What about Debian (since this is mentioned on the support page, too)? I
>>     think we don't have to worry about Debian 10 anymore, since Debian 10 
>> will
>>     already be EOL once we release QEMU 7.1 ... but what about Debian 11? Do
>>     the
>>     MinGW packages there contain the updated headers, too?
>>
>>
>> As I know we do not test cross-compilation at Debian. Debian does not have
>> even mingw-glib2. Debian only has the mingw-gcc toolkit.
> 
> Oh, interesting! Then I wonder why Debian is mentioned there ... seems like 
> it has been added here:
> 
>   https://git.qemu.org/?p=qemu.git;a=commitdiff;h=e6e80fcfd6c47823
> 
> Daniel, do you remember whether we supported Debian for MinGW 
> cross-compilation in the past?

Ah, well, stupid me, we did use it, and I was even the one who once removed 
the container:

https://git.qemu.org/?p=qemu.git;a=commitdiff;h=e3755276d1f54

... but since this was using a third party repository, I think we don't have 
to worry about this here anymore.

  Thomas


