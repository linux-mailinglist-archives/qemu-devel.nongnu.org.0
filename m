Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A97C4C6502
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 09:49:25 +0100 (CET)
Received: from localhost ([::1]:50718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nObib-0001pK-Sl
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 03:49:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nObed-0000O1-8s
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 03:45:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nObeb-0008Fq-4N
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 03:45:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646037912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5ba6ONgJSB8MRwtuB87rXseDlsLsHJ5MVvDQtS5wvMk=;
 b=VoQRTVlfTBVykB17wRT9T17OUPC5apmxI+9G6P0WAMSVXLqEotsW5SXuJRevW1XwNQuNfx
 ylTNYpH4yBeq5D8SkpyODrJXDw8TmstGvSEovIZh8/9yypVS6v1g34fdf7ABq+Na8A9ngg
 k5SqcJGNkYg5aue40KbboGdptRrYO8k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-xtKZgUWyOni7Am3qAtxeRA-1; Mon, 28 Feb 2022 03:45:08 -0500
X-MC-Unique: xtKZgUWyOni7Am3qAtxeRA-1
Received: by mail-wm1-f70.google.com with SMTP id
 n31-20020a05600c3b9f00b003812242973aso5746255wms.4
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 00:45:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5ba6ONgJSB8MRwtuB87rXseDlsLsHJ5MVvDQtS5wvMk=;
 b=DrXBw+q39ndHkT6nepQTkxUCxPpaTH/JxtsgXV7RsI/bazVvluctozTsccWi9Pb2/U
 AVSVE3dxnMrrZG3V2Y3FxnoJafFSnt1VFVaZ/z6Roqm43Tl1YzLn590fO9DJHTMikRWP
 N7l7Sx+CW43uKzjB5LkZgM0AZxV51ggkw/roegrpsllp36zu7C4waqDgeNoypNn8EZtl
 Pgsgl/1eDSQI5BFvGLF9JuAAbaO43Pgc/xai/KGkbOn/3FyR/Z+ImEBeOfN22+0AZMPH
 iaQFmy+xOeAnCJHeourZt/49yUstDpwVOMKu7qK1Ud/HVHTiWhN79Q0IGMJgDRFkx8q1
 GX0Q==
X-Gm-Message-State: AOAM533+JO9rslk99u4eK+7Fbl1erBQwqR/hblbHFllqvn1bcD+jURhc
 GQk6rO4nYemzPJnMZwprgO9liamatMf7HTrNsbPIjxEsS8eXy9cFOXQLQXVDjQk9fqCOxXEePVw
 JIKUy5QZDq0UpujY=
X-Received: by 2002:a1c:a4c6:0:b0:380:d32b:b429 with SMTP id
 n189-20020a1ca4c6000000b00380d32bb429mr12316136wme.9.1646037907554; 
 Mon, 28 Feb 2022 00:45:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxAWJ0BWxjd3iRftNho/Hn4t/d4ebThxTHok3YSH3foMX5pgxOI5DeBhjaI+WQDxvTYbNeJQ==
X-Received: by 2002:a1c:a4c6:0:b0:380:d32b:b429 with SMTP id
 n189-20020a1ca4c6000000b00380d32bb429mr12316115wme.9.1646037907245; 
 Mon, 28 Feb 2022 00:45:07 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a5d5411000000b001e688b4ee6asm10687407wrv.35.2022.02.28.00.45.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 00:45:06 -0800 (PST)
Message-ID: <cf847c44-f60b-041c-9350-c51d1e73027f@redhat.com>
Date: Mon, 28 Feb 2022 09:45:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] tests/tcg/s390x: Build tests with debian11
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>
References: <20220216115102.206129-1-david@redhat.com>
 <87wnhuc14w.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87wnhuc14w.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Beraldo Leal <bleal@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, David Miller <dmiller423@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/02/2022 15.54, Alex Bennée wrote:
> 
> David Hildenbrand <david@redhat.com> writes:
> 
>> We need a newer compiler to build upcoming tests that test for z15
>> features with -march=z15. So let's do it similar to arm64 and powerpc,
>> using an environment based on debian11 to build tests only.
>>
>> Cc: Thomas Huth <thuth@redhat.com>
>> Cc: Cornelia Huck <cohuck@redhat.com>
>> Cc: Richard Henderson <richard.henderson@linaro.org>
>> Cc: "Alex Bennée" <alex.bennee@linaro.org>
>> Cc: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
>> Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
>> Cc: Beraldo Leal <bleal@redhat.com>
>> Cc: David Miller <dmiller423@gmail.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> Acked-by: Alex Bennée <alex.bennee@linaro.org>
> 
> for now... I'll update the s390x image on my next posting.

Ok, I saw that Alex now posted a patch "tests/docker: update 
debian-s390x-cross with lcitool", so I'll skip this one here for my next 
s390x pull request.

  Thomas


