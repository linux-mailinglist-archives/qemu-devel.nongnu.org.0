Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2409A47582C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:50:35 +0100 (CET)
Received: from localhost ([::1]:51198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSnp-0006Rb-VX
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:50:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxSkh-0003f3-B3
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 06:47:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxSkU-0003y8-Jq
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 06:47:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639568825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/rTs6kP01LeJx/MEEMYsBIPXYm1B/w2T4rRNgbiVuwA=;
 b=XEGJxr1ClSCHBGv/nLzEvJdF8MXrSVY58vmPx81+T7JfxuP7H8kBbRBseHxvZX0z2fO67G
 +YwPxaVa0uxxIotZYmcNqNGJQUAMs3NIDoYM7bs44X6LrjVf4SgLpa6ls2IM0173xSThqT
 9pPseujc4t2737rXiHdwDpMiQGb/fqc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-MkyihVMKNxaJb6Xmq5vIvQ-1; Wed, 15 Dec 2021 06:47:04 -0500
X-MC-Unique: MkyihVMKNxaJb6Xmq5vIvQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 p17-20020adff211000000b0017b902a7701so5827242wro.19
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 03:47:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/rTs6kP01LeJx/MEEMYsBIPXYm1B/w2T4rRNgbiVuwA=;
 b=2eOmInOtnEbTJv6HmcsTqTTEKYr1jpZAkwWJFN9F3fIVIRl8fpij64WLEtYqY/rixp
 yxPn31jMfyQqZyBVQ9Gniy3OC485Te/ExRaa2c7VtXlP0ghDu+GTxTfTplD4jG6oxohP
 WbZnVHm6t/soffD3vNn31BLx4I4vhOhjpnQpnZzosO/2nk86lke+Gd/iWTyWNAw4Xppo
 ybNw2kNM1Zp6ZTygsbHJ55lTG3dAcnO+llYGM9qLoQzDkmFtibFrozMUbNcMzEWSlx6v
 vDp27BzYKdPm8G/8SuBjDLghquHgEODudHsGs4NmCMjUfVsRvXFpRnSNrXPOaCc84thV
 clgg==
X-Gm-Message-State: AOAM532Vh3NVXhe3XBMrphqmYtT5r/H4Y6fFoRksD1cScC87r8WX1AZQ
 ld6jD+xz1y8ysx8lGPBov4JZ8NRYtUja+lmsvsbBfbfD0Nj+EOEmluCpUkA1f0Sy+LxUveiFyTX
 D6WY2S/GH/GBEeNc=
X-Received: by 2002:a05:6000:15ca:: with SMTP id
 y10mr4112852wry.642.1639568823709; 
 Wed, 15 Dec 2021 03:47:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzlMbQKyxqWjPoQI71teQXL7AWbZsJIa9kTyKxR2/m6WovSuEEdTRkNXfZXyyQpbG3XeM2JhA==
X-Received: by 2002:a05:6000:15ca:: with SMTP id
 y10mr4112847wry.642.1639568823582; 
 Wed, 15 Dec 2021 03:47:03 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id j32sm1455202wms.40.2021.12.15.03.47.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 03:47:03 -0800 (PST)
Message-ID: <7a4f6f57-9487-e222-52a5-c3378e51bb65@redhat.com>
Date: Wed, 15 Dec 2021 12:47:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 15/18] tests/docker: updates to alpine package list
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211124130150.268230-1-berrange@redhat.com>
 <20211124130150.268230-16-berrange@redhat.com>
 <a18b26b9-f0a0-5bbc-0ecf-d97480f72030@redhat.com>
 <YbnU27X8w9MACkxe@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YbnU27X8w9MACkxe@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/21 12:43, Daniel P. Berrangé wrote:
> On Wed, Dec 15, 2021 at 12:31:33PM +0100, Philippe Mathieu-Daudé wrote:
>> On 11/24/21 14:01, Daniel P. Berrangé wrote:
>>> Cleanup the package lists by removing some entries that we don't need to
>>> directly reference
>>>
>>>   binutils: implied by the compiler toolchain
>>>   coreutils: not required by QEMU build
>>>   mesa-egl mesa-gbm: implied by mesa-dev
>>>   ninja: alias for samurai package
>>
>> I'd rather keep the alias to avoid looking for ninja or
>> for what samurai is. Anyhow,
> 
> This change was done to align with the package lists that
> lcitool will generate. In lcitool we always aim to use the
> canonical package name, rather than any alias, so it is
> explicit what impl we're using for something.

OK then.

>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


