Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA936C344A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 15:33:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ped1z-0006Cf-Kj; Tue, 21 Mar 2023 10:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ped1x-0006CC-Mz
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 10:32:06 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ped1v-0002wg-Fx
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 10:32:04 -0400
Received: by mail-ed1-x532.google.com with SMTP id t5so23675738edd.7
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 07:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679409120;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RlSmtvnx+pVEn6IwecIlYGhQIit3Ji/BkTC/o4PR1iM=;
 b=tQQXhz9SKnu3fi9wp1bPgAB2yATezKSa9eM9N6ZIJC4ST6Ijqe3FY5306Zznz/dSfp
 GrEODnYUnMJ/dJ20vV6R4I2mCRcnw3bnY1ybL/j7GDM/7Ys1o6j+1hGdy/28mYLxDIzb
 X++QNFwp/msUvhr9qXKoQJh/yK8Uq6+ldQaffAndZtjQ4xDsmPe9uokKS9KfiG9Yarw3
 udVyrxjfLiNxLqQ6IY+gClnq8LDs92JECn3KFWEAVUHLaruK/yRsganm7+Bj4ockpxQk
 peETyYnZJbcwzobzTYcpG07lJhx5bsb0ed0MUf+7x/6cKGpghxYwXCTXIxKWiqVyK3us
 BPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679409120;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RlSmtvnx+pVEn6IwecIlYGhQIit3Ji/BkTC/o4PR1iM=;
 b=nNqq4jGq4Eqqq4PpCWRkSNGFUrTogQPlprau3XevAIKvEJ05Ws4wmZSOCGYegRq0mP
 6+eGAfadSY4yuFwIEn/blOqOGe/iTe9ChCLh4bxStCa2gcQgh9NPNtVctXweGrrnZ1Bo
 pn5E/faQqqUPojMcBnYCLpNUiQMzv9xtDWplnPPLmzznh/ZQdhbX4fXwDwvGtyAnsBsb
 lvBxstd5c8CVNoRd7COxOwuF6XpomX2cgcc4VIjuAUaDU11YYUA//PgVdfZKpJ9Dpns7
 7zco7da4A9cbrmClc4ckdC/ZCS+qC9m3nzksxCX5peCAZPELEQ+goxgQCuI7OCt9KEfb
 TAww==
X-Gm-Message-State: AO0yUKUUTVZrb+iT/RDsjUlVDwnIOjQOi0/RpYwh3Red8VIQz7RlZZ2K
 thVl2mPozlKoUI5quyCbAfojQw==
X-Google-Smtp-Source: AK7set+dhstKKGR6zZVbqMMAkMI4WSTBMXLjSZL/M3QsJyzV8BNv6hk7EHj9MoO41NySJULoKmdgGQ==
X-Received: by 2002:a17:906:7846:b0:931:67ef:5f47 with SMTP id
 p6-20020a170906784600b0093167ef5f47mr3056387ejm.40.1679409120343; 
 Tue, 21 Mar 2023 07:32:00 -0700 (PDT)
Received: from [192.168.69.115] (did75-h03-176-184-22-219.dsl.sta.abo.bbox.fr.
 [176.184.22.219]) by smtp.gmail.com with ESMTPSA id
 c5-20020a170906924500b0092be625d981sm5887908ejx.91.2023.03.21.07.31.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 07:31:59 -0700 (PDT)
Message-ID: <aad2628c-196a-3f91-d184-20c034518de7@linaro.org>
Date: Tue, 21 Mar 2023 15:31:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v3 2/3] qapi: Do not generate empty enum
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20230315112811.22355-1-philmd@linaro.org>
 <20230315112811.22355-3-philmd@linaro.org> <87cz58ubcn.fsf@pond.sub.org>
 <ZBMfosr0JDyfjhqs@redhat.com> <873564spze.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <873564spze.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16/3/23 15:57, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
>> On Thu, Mar 16, 2023 at 01:31:04PM +0100, Markus Armbruster wrote:
>>> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>>>
>>>> Per the C++ standard, empty enum are ill-formed. Do not generate
> 
> The C standard.  The C++ standard doesn't apply here :)

I can't find how empty enums are considered by the C standard...

> But all of this falls apart with conditional members!
> 
> Example 1 (taken from qapi/block-core.json):
> 
>      { 'enum': 'BlockdevAioOptions',
>        'data': [ 'threads', 'native',
>                  { 'name': 'io_uring', 'if': 'CONFIG_LINUX_IO_URING' } ] }
> 
> Generates now:
> 
>      typedef enum BlockdevAioOptions {
>          BLOCKDEV_AIO_OPTIONS_THREADS,
>          BLOCKDEV_AIO_OPTIONS_NATIVE,
>      #if defined(CONFIG_LINUX_IO_URING)
>          BLOCKDEV_AIO_OPTIONS_IO_URING,
>      #endif /* defined(CONFIG_LINUX_IO_URING) */
>          BLOCKDEV_AIO_OPTIONS__MAX,
>      } BlockdevAioOptions;
> 
> BLOCKDEV_AIO_OPTIONS__MAX is 3 if defined(CONFIG_LINUX_IO_URING), else
> 2.
> 
> After the next patch:
> 
>      typedef enum BlockdevAioOptions {
>          BLOCKDEV_AIO_OPTIONS_THREADS,
>          BLOCKDEV_AIO_OPTIONS_NATIVE,
>      #if defined(CONFIG_LINUX_IO_URING)
>          BLOCKDEV_AIO_OPTIONS_IO_URING,
>      #endif /* defined(CONFIG_LINUX_IO_URING) */
>      #define BLOCKDEV_AIO_OPTIONS__MAX 3
>      } BlockdevAioOptions;
> 
> Now it's always 3.

Good catch... Using:

-- >8 --
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
@@ -110,8 +110,11 @@ def gen_enum(name: str,

      ret += mcgen('''
  } %(c_name)s;
+_Static_assert(%(c_last_enum)s == %(c_length)s - 1, "%(c_name)s");
  ''',
-                 c_name=c_name(name))
+                 c_name=c_name(name),
+                 c_last_enum=c_enum_const(name, members[-1].name, prefix),
+                 c_length=len(members))

      ret += mcgen('''
---

I get:

./qapi/qapi-types-block-core.h:355:1: error: static_assert failed due to 
requirement 'BLOCKDEV_AIO_OPTIONS_NATIVE == 3 - 1' "BlockdevAioOptions"
_Static_assert(BLOCKDEV_AIO_OPTIONS_IO_URING == 3 - 1, 
"BlockdevAioOptions");
^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./qapi/qapi-types-block-core.h:430:1: error: static_assert failed due to 
requirement 'BLOCKDEV_DRIVER_VVFAT == 47 - 1' "BlockdevDriver"
_Static_assert(BLOCKDEV_DRIVER_VVFAT == 47 - 1, "BlockdevDriver");
^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./qapi/qapi-types-char.h:110:1: error: static_assert failed due to 
requirement 'CHARDEV_BACKEND_KIND_MEMORY == 22 - 1' "ChardevBackendKind"
_Static_assert(CHARDEV_BACKEND_KIND_MEMORY == 22 - 1, "ChardevBackendKind");
^              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
...

