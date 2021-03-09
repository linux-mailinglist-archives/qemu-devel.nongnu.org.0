Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F8E332332
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 11:37:35 +0100 (CET)
Received: from localhost ([::1]:48142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJZk6-0005yW-D6
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 05:37:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJZcP-0006ok-5n
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:29:37 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:37563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJZcL-0006Iw-Cp
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:29:36 -0500
Received: by mail-ed1-x533.google.com with SMTP id d13so19162371edp.4
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 02:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=S3KXReOvVnm7/5sZmOG3H/7xS9cmKSrIa6x5MdAmVz0=;
 b=Zh7vwdZCdtW2AVS0fFHcS64L9qFPXW29JH3H/58wYo241A0ZAFiv17aN2/bXnSYOUg
 uBbn5WV0l4BBf1EfaXHIuUJib9i7smzzR2WY9SP+bYXISnHdq49UZMLDFpn1o033Ahfi
 CdFRB7MZPdNQZRqF1iPco6MQeZ2D2swH+ynIHnWq5r576ZMHxwmPK2vSch78c/tGrOHC
 DTOG6lEAzeFnHLbgo+sw1IOBEORoJe1R1Y8u/4YuUwYQ6pxfc0KcI687sx2C3cPtjSXb
 uXVpr5UjpJChlkY3DtZU+bfclJLCJ87+V3oH3THYWG8Defsq8aHdgVM/yMwQfkmm5+mF
 9xxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=S3KXReOvVnm7/5sZmOG3H/7xS9cmKSrIa6x5MdAmVz0=;
 b=k71vDZoHyz9MjTXKmfJYUixuoQu9EYPcQSyq369cwZZD7KHPYhdV4o0Hl6vYeVGNfm
 OtvtYdYSKu6PzZwTJcoyhJnjR9dbn5vgvnTWpIYE/Bc/ItbdJ4UFuG6WQsOw/rp2UiGs
 vgpSbgPg2XV1g6KupXK5o1a4Y+QfgCSLknw1lkDw7mdnunYeegXzYzxPyjM9brRjfpbw
 rawCFFA6cOYf5rB9kmVYvfy44f/FkGg8h0X3+kE1WPktmaNgmCg+5fWDbbuU2JUWnWHI
 C3PrN4zFryRdWgLtQs61kXJA8C9gjNhwU6g7MLqI9wM/Bdh2FmShHICH8PckcB3yEVXT
 FGeA==
X-Gm-Message-State: AOAM532Ck9lkjovvnqhSXyNu+2W1ZbRL4nABDPnqlrxIaaBJMTUJ+12o
 f0qrpNpYQ+bESRF8FoftOLx7QPFigFK8YQ==
X-Google-Smtp-Source: ABdhPJzVIqt09maoSk2gr6IidHBR4gxuJy1qtwgX4DVw/zmrh/0zar5hUDIFDKWpePnZFG5hsiv2Wg==
X-Received: by 2002:a05:6402:b70:: with SMTP id
 cb16mr3214819edb.11.1615285770372; 
 Tue, 09 Mar 2021 02:29:30 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g11sm4357590edt.35.2021.03.09.02.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 02:29:29 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E4CB71FF7E;
 Tue,  9 Mar 2021 10:29:28 +0000 (GMT)
References: <20210308201406.1240023-1-aaron@os.amperecomputing.com>
 <YEaHjKsnDbBxI1nS@strawberry.localdomain>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: [PATCH] plugins: Expose physical addresses instead of device
 offsets
Date: Tue, 09 Mar 2021 10:28:30 +0000
In-reply-to: <YEaHjKsnDbBxI1nS@strawberry.localdomain>
Message-ID: <87zgzc8vsn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, cota@braap.org,
 richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> Alex,
>
> I've now tested this change, and it is giving what appear to be valid
> and correct physical addresses for both RAM and IO accesses in all the
> cases I've thrown at it. My main concern with this patch at this point
> is that I am concerned I may be breaking your new plugin here:
>
>> +++ b/contrib/plugins/hwprofile.c
>> @@ -201,7 +201,7 @@ static void vcpu_haddr(unsigned int cpu_index, qemu_=
plugin_meminfo_t meminfo,
>>          return;
>>      } else {
>>          const char *name =3D qemu_plugin_hwaddr_device_name(hwaddr);
>> -        uint64_t off =3D qemu_plugin_hwaddr_device_offset(hwaddr);
>> +        uint64_t off =3D qemu_plugin_hwaddr_phys_addr(hwaddr);
>
> How angry is the plugin going to be that these are now physical
> addresses instead of offsets?

I think it will be fine. It's a new plugin this cycle and it only
changes the reporting.

--=20
Alex Benn=C3=A9e

