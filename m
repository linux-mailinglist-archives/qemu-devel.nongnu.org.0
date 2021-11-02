Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2499844290F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 09:03:50 +0100 (CET)
Received: from localhost ([::1]:59160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mholp-0005ze-A1
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 04:03:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhokD-0005DI-Ls
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:02:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhok1-00017O-HU
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:02:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635840115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fLhrBCajU75YIBq93R7nLIkh2QtBWS3pWQI1KLRBDio=;
 b=O282lH+9wRkm6MewgfhdA9rDXULlqzHd3wVIIjT8wJBNV6mo6w73Hyw3b/wJmexKT1Av3W
 Kd2ZBS+g66zvobxe7dZSVLrU+UBTM7dX9Jz1T3DoqYM/TcDWvU+shE/T/ZOYGclRLmCZYt
 DvmJQvdVI/AP2astmQlssNL3Zc0JNSI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-cNUOfUbpP26MOVdlRnv3hg-1; Tue, 02 Nov 2021 04:01:54 -0400
X-MC-Unique: cNUOfUbpP26MOVdlRnv3hg-1
Received: by mail-wm1-f70.google.com with SMTP id
 145-20020a1c0197000000b0032efc3eb9bcso755903wmb.0
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 01:01:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fLhrBCajU75YIBq93R7nLIkh2QtBWS3pWQI1KLRBDio=;
 b=qIPdWExAcVskiDnteJsA78l+sH6UiU0Q3cy98EiXXOpHiKaQgWLdnT8wmRPWY/tzWN
 cHbQHj55TZNrLWqC5EqOfF+vYuthoIarc48kkso2dalBOsZfWkWbdO3DkLwL58MxsdRj
 o2ALTsDJQ7ksmCRiiFfauX6K+Il3JnZugPRSPKO14C/Twa1limYtODeMr2PwAiqZEWAR
 E9F3QQc8i1lwZTHAT+d1n52UzadOcaidKE5dM+6egacNqwwI2zSlMK8pyat5kMmeZ9mh
 4Xmf7ROf3K6cnhepvZ4oTWdNT7KTLj/zsuD76dOubtZivkCI6BEZzW54Tk1itxtEnVEC
 Rp8w==
X-Gm-Message-State: AOAM531SutYamRe6S7F/MmURdS0fQ0gdMwXiDPLk6DjR0eCCdN4iEPmZ
 9NUpS0ESw2J2L8z97gWH+x3/UVbjjBRj3SQct6PfqQZrx315NSeyrBZxQ5/NfzF4hmGvxEpnwj+
 MCjS6n/NpFJ7jKUw=
X-Received: by 2002:a5d:4fcc:: with SMTP id h12mr41309012wrw.434.1635840113021; 
 Tue, 02 Nov 2021 01:01:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtrTeRhxwu3VUoYEB4YzXzezBADP9jIe0kK01hWcIhmeROvB8vfFHabocU4OTI+e5Q/8+XEw==
X-Received: by 2002:a5d:4fcc:: with SMTP id h12mr41308991wrw.434.1635840112843; 
 Tue, 02 Nov 2021 01:01:52 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id d11sm4185080wrs.38.2021.11.02.01.01.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 01:01:52 -0700 (PDT)
Message-ID: <665aa783-b816-d9ac-750b-1b053ec072b6@redhat.com>
Date: Tue, 2 Nov 2021 09:01:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] meson.build: Allow to disable OSS again
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20211029071318.1780098-1-thuth@redhat.com>
 <21ebce18-cd60-3fa9-4b0a-97acc7fbc7c2@redhat.com>
 <cf1775ed-6655-9f88-ea84-62ae912e1cc4@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <cf1775ed-6655-9f88-ea84-62ae912e1cc4@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.14, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/2/21 08:45, Thomas Huth wrote:
> On 29/10/2021 11.32, Philippe Mathieu-Daudé wrote:
>> On 10/29/21 09:13, Thomas Huth wrote:
>>> If sys/soundcard.h is available, it is currently not possible to
>>> disable OSS with the --disable-oss or --without-default-features
>>> configure switches. Improve the check in meson.build to fix this.
>>>
>>> Fixes: 87430d5b13 ("configure, meson: move audio driver detection to
>>> Meson")
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   meson.build | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>>   oss = not_found
>>> -if not get_option('oss').auto() or have_system
>>> +if get_option('oss').enabled() or (get_option('oss').auto() and
>>> have_system)
>>
>> Shouldn't this be 'if have_system and (enabled or auto)' ?
> 
> It depends whether we want to allow "--disable-system --enable-oss" or
> not, I guess ;-)

When is that useful?

> Honestly, I don't have a preference. But maybe we could also simply use
> 'if have_system and not disabled' instead, which would then be the
> shortest solution?

This is clearer indeed.


