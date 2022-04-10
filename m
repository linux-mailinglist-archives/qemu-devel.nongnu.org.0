Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6F44FAF16
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Apr 2022 18:51:58 +0200 (CEST)
Received: from localhost ([::1]:42812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndan7-0007t8-BU
	for lists+qemu-devel@lfdr.de; Sun, 10 Apr 2022 12:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1ndalY-0006Lp-Lk; Sun, 10 Apr 2022 12:50:21 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:52168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1ndalX-0005Q2-72; Sun, 10 Apr 2022 12:50:20 -0400
Received: by mail-wm1-x32b.google.com with SMTP id q20so8529174wmq.1;
 Sun, 10 Apr 2022 09:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=aWf0S4fRzZcjK8IASz8G9xDayNVOLdhvC7qjae/r8/g=;
 b=F/Mukm4pCFOgnn0jN0clx/GnSLvmElZODyBPX+k53NgxmBuGW82nv7TKXZ+O1kD5LY
 rSZKNrSmwXY8600rc9Mkci0QhbXuRlA5xqhul/g8PeldUb/aj2yg6t0j0aESqmFQtMnz
 ibgqY9cbkxLcFEqyFhfE09s9RDcEVrSvSeMxC9Jq9U3OJPIhjO1ZOVzUJcMrRaODXw2G
 s0lMqC+AdWqPCkSPi1/CyhQDQIctT03tCqEyWZrHpu/PamV/VJWU51dUocTcHdFXo/yL
 yNPhdDzm5sKovDnIlMATZ5A+3Hcadr/Exc7l+c5Z3yUFKVgc2nyOXzQpDVjVXGuyxxuv
 N11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=aWf0S4fRzZcjK8IASz8G9xDayNVOLdhvC7qjae/r8/g=;
 b=Lh4WGItcA5o5Ypik0MZCtIP5h4bt5N5kUFIWxDUMNjQsH3xTgWlXSwS9XnOpyJfAmM
 hFmCrcZ7Lt/r3VomErX/w8HASL1GraKkHvcRgMw7q1q9P6O48p2PExBLyGBf9aCWxRDg
 nAq9yHQ6xfahrph+/PuEMNUO5Dg56Zl4Pqcte3BQBsI2se/Z8YJxpBTqFiBGKSMu/ZiG
 L4A/NSGoJ5TEVIKmnM4Z0L4Wzy1Ha7lqsDMAoE8zUbUCR4sD1BCoTH0LFXpXXyEnZ64L
 5bmk0lTh/qsLnA0e1Qonihx5YOHYcZSQl2oSEtCcYxsfCwjNVG+rFwpa89xKi/OmEKcC
 B0sw==
X-Gm-Message-State: AOAM532CjBx2srumaLiTXXcGjEmHrJ9UtwtmUuzpGzJQHwhFvW1YPDE7
 kkBuo1+6wWoTZz5uUPxiAyU=
X-Google-Smtp-Source: ABdhPJzzWQkI6sIjcYRCYva0FbX8kVTvjIWX3Bp3mYhjz92am8wxrdUKfbF4cSHCkrKSnKo2tTramA==
X-Received: by 2002:a05:600c:a45:b0:346:5e67:cd54 with SMTP id
 c5-20020a05600c0a4500b003465e67cd54mr26045638wmq.127.1649609416710; 
 Sun, 10 Apr 2022 09:50:16 -0700 (PDT)
Received: from smtpclient.apple (201.11.75.194.dyn.plus.net. [194.75.11.201])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a5d6788000000b002060f55843csm18218409wru.19.2022.04.10.09.50.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 10 Apr 2022 09:50:16 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH 1/1] ui/cocoa: show/hide menu in fullscreen on mouse
 ungrab/grab
From: Carwyn Ellis <carwynellis@gmail.com>
In-Reply-To: <84cbfcca-648c-8e4c-9966-28086acfd5c0@gmail.com>
Date: Sun, 10 Apr 2022 17:50:15 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <51674D9A-24E6-4DE4-9142-65F328F52D57@gmail.com>
References: <20220103114515.24020-1-carwynellis@gmail.com>
 <20220103114515.24020-2-carwynellis@gmail.com>
 <84cbfcca-648c-8e4c-9966-28086acfd5c0@gmail.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=carwynellis@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks, taking a look now and will push up another patch once I=E2=80=99ve=
 tested the changes.

Regards
Carwyn

> On 18 Feb 2022, at 18:42, Akihiko Odaki <akihiko.odaki@gmail.com> =
wrote:
>=20
> On 2022/01/03 20:45, Carwyn Ellis wrote:
>> The menu bar is only accessible when the Cocoa UI is windowed. In =
order
>> to allow the menu bar to be accessible in fullscreen mode, this =
change
>> makes the menu visible when the mouse is ungrabbed.
>> When the mouse is grabbed the menu is hidden again.
>> Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
>> ---
>>  ui/cocoa.m | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>> diff --git a/ui/cocoa.m b/ui/cocoa.m
>> index 69745c483b..42dcf47da4 100644
>> --- a/ui/cocoa.m
>> +++ b/ui/cocoa.m
>> @@ -1037,7 +1037,9 @@ QemuCocoaView *cocoaView;
>>  {
>>      COCOA_DEBUG("QemuCocoaView: grabMouse\n");
>>  -    if (!isFullscreen) {
>> +    if (isFullscreen) {
>> +        [NSMenu setMenuBarVisible: FALSE];
>> +    } else {
>>          if (qemu_name)
>>              [normalWindow setTitle:[NSString stringWithFormat:@"QEMU =
%s - (Press ctrl + alt + g to release Mouse)", qemu_name]];
>>          else
>> @@ -1052,7 +1054,9 @@ QemuCocoaView *cocoaView;
>>  {
>>      COCOA_DEBUG("QemuCocoaView: ungrabMouse\n");
>>  -    if (!isFullscreen) {
>> +    if (isFullscreen) {
>> +        [NSMenu setMenuBarVisible: TRUE];
>> +    } else {
>>          if (qemu_name)
>>              [normalWindow setTitle:[NSString stringWithFormat:@"QEMU =
%s", qemu_name]];
>>          else
>=20
> [QemuCocoaView -toggleFullscreen:] also has the calls to [NSMenu =
setMenuBarVisible:], which should be removed.
>=20
> Regards,
> Akihiko Odaki


