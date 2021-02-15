Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F74831C281
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 20:35:34 +0100 (CET)
Received: from localhost ([::1]:39820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBjef-0006p8-AR
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 14:35:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lBjVS-0001RD-MO
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 14:26:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lBjVR-0005lT-97
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 14:26:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613417160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/CWgUHvVincpTOUQrrG1QFsc/2KWGXf2e7kb4yQaoHE=;
 b=AvkOzNKpZVjp/Rpd+t19s2NSP8aRNzP5y+wI8mIJFSyzni4UX/IEfKOphvaoIwlTsxz3si
 uA5n9Nhc78zep6GKnvJ+nkV3Id9YLkDzf9F7A9XFCaA9XP+XTLeCHCWqPUfWL4zDwWo/2Z
 Hgl9Us7CVQlYs1Ql1OiGlFfsi/6xI7w=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-F-tNqHUMMQWFECb4MX3Cpw-1; Mon, 15 Feb 2021 14:25:56 -0500
X-MC-Unique: F-tNqHUMMQWFECb4MX3Cpw-1
Received: by mail-ua1-f70.google.com with SMTP id z24so3598145uao.0
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 11:25:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/CWgUHvVincpTOUQrrG1QFsc/2KWGXf2e7kb4yQaoHE=;
 b=JzSzEG2uLpKtbQ1yTac0KZEsYX7PIHk6GqANfAcB+/3fkkokRpGNBhzDCumMCUfXy4
 GukzvdseMGVCCEPZiwV6Q9CcwjYHBT1+8DL/lYovapyCmRqrTYnluJfHa9vmJHecI/fB
 +4uNAWdjpeOjBeeqTGd4ZLDHWTMIMUBCfB9wBwYxPfGDAezOSOyxUCmVTQisxEFiChhf
 rTlAfQnFgTwtAiS1yR9IXoZNpPZPAQNKbAaA1zrfLazKYj3W409TvCzCxW+DNiV1mrsD
 yBgj4KRMxP8taHp09K3GmcbalUOBsL1U3v2kLaDqf516op/I11LFXOqX2Mmi2qQ+z3jC
 kaEg==
X-Gm-Message-State: AOAM5338sUr0BwOylMtp2cmqdEvw5d/Xi1Mo2FRX7gs1R0us6LuTwBdO
 EccJACNHxaP91sebWwQ6vJ0P+ZtOCyRfIIU0MekO27Ar6M63pRLPbY/TPVFDrQuAiXn2BSGCUA3
 mFG+ZQNEolPmcPUWKPYgFXl+kSOq4HPw=
X-Received: by 2002:a05:6102:22db:: with SMTP id
 a27mr9223963vsh.1.1613417155983; 
 Mon, 15 Feb 2021 11:25:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/heXTXAtQLc/NIt4wGs5aURGFMNpJcwa6Yi2LK7x3g69my5cWPNkqdZ8uoVeImUE+4nNvxtTP4FP0fk44r7M=
X-Received: by 2002:a05:6102:22db:: with SMTP id
 a27mr9223949vsh.1.1613417155792; 
 Mon, 15 Feb 2021 11:25:55 -0800 (PST)
MIME-Version: 1.0
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-19-crosa@redhat.com>
In-Reply-To: <20210203172357.1422425-19-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 15 Feb 2021 16:25:30 -0300
Message-ID: <CAKJDGDbcB=rxtoNBx=2TAX8M_2x2euzTHQS+sDVjf2JOq3=p2A@mail.gmail.com>
Subject: Re: [PATCH 18/22] Acceptance Tests: set up existing ssh keys by
 default
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>, Eric Auger <eauger@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 3, 2021 at 2:25 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> It's questionable wether it's necessary to create one brand new pair
> for each test.  It's not questionable that it takes less time and
> resources to just use the keys available at "tests/keys" that exist
> for that exact reason.
>
> If a location for the public key is not given explicitly, the
> LinuxTest will now set up the existing pair of keys as the default.
> This removes the need for a lot of boiler plate code.
>
> To avoid the ssh client from erroring on permission issues, a
> directory with restricive permissions is created for the private key.
> This should still be a lot cheaper than creating a new key.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


