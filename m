Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E429D4CE16D
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 01:22:16 +0100 (CET)
Received: from localhost ([::1]:59384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQIBb-0000W4-Up
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 19:22:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nQI9h-0007U9-9n
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 19:20:18 -0500
Received: from [2607:f8b0:4864:20::436] (port=41950
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nQI9f-0001Rp-9q
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 19:20:16 -0500
Received: by mail-pf1-x436.google.com with SMTP id p8so8924945pfh.8
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 16:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:from:subject:to:references
 :content-language:cc:in-reply-to:content-transfer-encoding;
 bh=Ej9RttFaIxGbJ7gPW+tPAaXPkUqlYR5/RO6I9zDDiQI=;
 b=KiTEJXJIUaLBnwVuXKr110KDhnOkqC9aR9xoQHfjdlxw3B3ZARJKdrBrIUsQ6W5D0s
 4BLqXaJPvjN2s+Dispm9oCv0OJKjsy/+zqkfUr09P3lVlS/XbxTzlSk5EfqvONP9Vmg2
 pL3xrrbC6cjhzI8DegSdaUf82gTon6aujPlH+YrP25yT44tOPV97sG+/4laYV8wg8IIi
 uouoGpO7j1WhOTTXCZq7FLltlv92070JHbY9fnVGYjC83PXIs9/rzkZFeS8i/jUvjmuu
 5G67YZBYgrgFRZIKiTG2CCVzVUPAJiHHwNa+0I+Q92wq6ijxtrNykoIBDlnAM1f+csOz
 Llpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:to:references:content-language:cc:in-reply-to
 :content-transfer-encoding;
 bh=Ej9RttFaIxGbJ7gPW+tPAaXPkUqlYR5/RO6I9zDDiQI=;
 b=I7+pURbBGRGBmZvZLwuLETvQBG1VJjyhkYT0infoP6gkVv5VxoX3pCDTeSG1U3KPFd
 uMfRi+BEcU0dk/2d38jpoQIpuJW1rLnuOXODruBU3w8SBFx/KFRYOLDg0aPENMmUQ8+L
 6bRa5b2We7wi0gPf61fJsb0Ct2zKj3BuaBYRJPxajepSqIe+uDn1h2RpY4hFcsBGRA9O
 +/H8a8JWYGGoJWKJLJa5oEVRcQ0AwqyVLbAUVeAJ9nkzYXbEmZgjW3Vcngm0aLrq4AKR
 YWIxdxQ1f6RwulbGPtiJsPtTDnyorp/+u7y4BEiRplYfy5LZL+obdvCHuREhVHzA/BAg
 T7wQ==
X-Gm-Message-State: AOAM533PFfzSUr6HCWIdzR0G3wQojk4v66UfODg4LdJAQFMEct0QZYr+
 HrFzvsj9TOf9jxg0PFkiYHU=
X-Google-Smtp-Source: ABdhPJx8vftor53PqTE7CJr62EtdW1Y8/EBbqHIQH/p2829BnnWAuJStJpaWSpY0Su69+v/aROxC8g==
X-Received: by 2002:a63:3802:0:b0:378:a563:78aa with SMTP id
 f2-20020a633802000000b00378a56378aamr749323pga.462.1646439607658; 
 Fri, 04 Mar 2022 16:20:07 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a056a0010c500b004e1b283a072sm7223227pfu.76.2022.03.04.16.20.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 16:20:07 -0800 (PST)
Message-ID: <1b6a9b0c-30d2-55b9-bb25-2c41e16669dc@gmail.com>
Date: Sat, 5 Mar 2022 09:20:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: MacOS cocoa/OpenGL
To: R Kim <pileonline@protonmail.com>
References: <0P0iiNxVKqFOXz4LwSKg6b3UyehJMQubj3tBB6BzotYiRSOuZv2b45aE9c6Ese7sKSFmXttUsRg0mm_EdwC_uHQavZr7EgnL1nuTYyxG0ik=@protonmail.com>
Content-Language: en-US
In-Reply-To: <0P0iiNxVKqFOXz4LwSKg6b3UyehJMQubj3tBB6BzotYiRSOuZv2b45aE9c6Ese7sKSFmXttUsRg0mm_EdwC_uHQavZr7EgnL1nuTYyxG0ik=@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x436.google.com
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, KJ Liew <liewkj@yahoo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/03/05 0:34, R Kim wrote:
> Hello Guys,
> 
> Looks like we haven't yet official support for OpenGL on MacOS? I need 
> to apply third-party patches to make it work. It would be great if these 
> parts are imported to qemu and be official. Nowaways, it's really needed 
> Acceleration on VMs for who uses Graphical interfaces browsing, eg, chrome.
> 
> 
> I have found it:
> https://mail.gnu.org/archive/html/qemu-devel/2021-02/msg04235.html 
> <https://mail.gnu.org/archive/html/qemu-devel/2021-02/msg04235.html>
> 
> It uses Angle from Google and the developer seems to be creating you own 
> branch, with a lot of patches in 
> https://github.com/akihikodaki/qemu/tree/macos 
> <https://github.com/akihikodaki/qemu/tree/macos>
> 
> Another it this one, did small changes, but uses SDL instead of cocoa:
> Based on initial work "Virgil 3D on macOS" by 小田喜陽彦 akihikodaki. 
> https://mail.gnu.org/archive/html/qem...  > 
<https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqa3FxTDVuaWhiSFZkWWRkbHZkeTRTckc0bTJIQXxBQ3Jtc0trY3kza3JQT1dPS09vWmhCZktYSTRuWUdJMzB5MGdmV01DYUN4UGpOVTFWS3RwLUNZVGw5MzE3Zzg3WXZLNlJqNVNFZkM5QUZwRUN3UnJfOU5kVWxQaUJLdGo4N0IxVXd3X3pIb1lQUThMcmpJVktfWQ&q=https%3A%2F%2Fmail.gnu.org%2Farchive%2Fhtml%2Fqemu-devel%2F2021-02%2Fmsg04235.html>With 

> improvements: - Get rid of ANGLE as EGL libraries. Virgil 3D solely uses 
> OpenGL Core backend through SDL2 which wraps to NSOpenGL. - No patch to 
> "cocoa" display of QEMU. Minimal modification to SDL2 display to support 
> Virgil 3D on macOS. QEMU cannot have both "cocoa" and "sdl2" display in 
> the same build. - Minimal change to libepoxy and virglrenderer, 
> basically only have to make sure they built without libdrm and libEGL. - 
> Fix known issues with OpenGL Core - Performance comparable to ANGLE 
> OpenGL ES backend. WebGL Aquarium at 60 FPS. Chromium web rendering is 
> accelerated. The accelerated ArchLinux ARM is very snappy & usable with 
> Apple HVF virtualization. It matches or even exceeds the performance of 
> typical ARM Linux flavors running on RK3399 or RPi4 bare-metal. It 
> probably makes M1 MacBooks the world fastest (... most expensive) Linux 
> ARM laptops. Nested VM is possible, and there is a demo of qemu-3dfx 
> Glide passthrough from nested QEMU i386 instance running Blood 1.2 3Dfx 
> DOS game.
> 
> https://www.youtube.com/watch?v=FVv8UjGhYPU 
> <https://www.youtube.com/watch?v=FVv8UjGhYPU>
> 
> 
> What should we do to have this changes in?
> 
> Sent with ProtonMail <https://protonmail.com/> Secure Email.

Hi,

I'm adding KJ Liew, the author of the implementation with Apple's OpenGL 
and sdl2, to Cc. I found the email address at:
https://github.com/kjliew/qemu-3dfx/commit/e01af020580afe172237dfeb471643aa0b6ea60b

https://github.com/akihikodaki/qemu/tree/macos is my tree. My aim is to 
have a decent Linux desktop experience, and it has changes irrelevant 
with graphics acceleration. The patches I thought ready for submission 
are submitted to the mailing list, but the patch to support Virgil 3D is 
not because the dependent change for libepoxy is somewhat stuck:
https://github.com/anholt/libepoxy/pull/239

It also contains patches posted on the mailing list I am reviewing and 
testing.

I choose cocoa instead of sdl2 to implement Cocoa-specific code like 
HiDPI support and cursor composition.

I decided to use ANGLE because the OpenGL implementation by Apple is 
deprecated and possible bugs in the implementation would not be 
(promptly) fixed. Such bugs may require workarounds in virglrenderer, 
but they are not really great for submitting to the upstream.

Those does not mean, however, it is not appropriate to the other 
implementation you mentioned, which uses Apple's OpenGL with sdl2. It is 
reasonable to choose sdl2 if you don't need features provided by (my 
modified) cocoa. The deprecation of Apple's OpenGL may not matter much 
since there are many other programs which still rely on it. ANGLE is 
also one of them although it is switching to Metal with Apple's help:
https://bugs.chromium.org/p/angleproject/issues/detail?id=5505

The best option to get the patches for Apple OpenGL/sdl2 in is to ask 
the author for that. However, the author may not be willing to spend or 
cannot afford necessary efforts. In that case, you still need to ask the 
author if it is fine to add Signed-off-by line for the patches. The 
implication of the line is described at:
https://www.qemu.org/docs/master/devel/submitting-a-patch.html#patch-emails-must-include-a-signed-off-by-line

If you are going to submit patches, please add me to Cc. I'll review and 
propose necessary changes.

Regards,
Akihiko Odaki

