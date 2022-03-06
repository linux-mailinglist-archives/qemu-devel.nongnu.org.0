Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9C64CEDFA
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 22:45:33 +0100 (CET)
Received: from localhost ([::1]:40964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQyh2-0005Cx-D5
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 16:45:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQyfi-0004WS-IA
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 16:44:12 -0500
Received: from [2a00:1450:4864:20::432] (port=33475
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQyfg-0002Je-VN
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 16:44:10 -0500
Received: by mail-wr1-x432.google.com with SMTP id j17so20560426wrc.0
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 13:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=g2shSzDHwIxrxHQMTlsHmgoenWq0EmlLyz99cJo8Mi0=;
 b=TVHJf/ICxYEp0sN5YzV4HyK8H2FGFmJDcjgI5JCFVVBBmTn7GtwRwnoQFpAX+La7hf
 9hXrTNVoYRhMb5j/ALXrxFaE1kyIx5ueh8Cweoxj7wg2V7jtPqzHAmOMvDzBYbjFcC0a
 ykrXT6mf5vQtyiY8u2ToNxaTW7TFVhebgeHu9K7SosoRr7CjB4a+M75PLcNzxhrHI4Th
 D+0HraPWmpc1cmEIZWTvSlnabks01e20CeB5vfMY5AJHBp1Wogd3uAlrZTrDpcqUcFF7
 RvY+l1+m/KKJNKt3zYehzz0pZTUPPcJRUU23V04MePR43/SQseshoL++kwvYOGVRKnOP
 vP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=g2shSzDHwIxrxHQMTlsHmgoenWq0EmlLyz99cJo8Mi0=;
 b=Sfk+sJB4rBGLFsnoR64lije0+KiNW+/85NDOTxXp7CrDT2QquXCkENd5ux8viW4olj
 DKgRMkUpCaso4FV1UdRnL4WvY7vCzHEOO8+YrbfyK570pLGOONZWzUIwngroZE2Bu8+6
 ZRiPesTOXVnvj/nEaPo5pJZs7CevHG9wwxVOTwBpZaqzDaUfnWZGVAqIyk7ovHSqgn0t
 gsFgWg6JjJsiqxiIQiXK1Hy0vBG2rTz3OpQoAQu7aKm2yJpFqK/xGdEImJjBt50w//3/
 NQFnPOveJmI0MvvwkAp1rBJblKFgoJRkwjiKZqiFAURzNYLUQ4JeVLBPhpQQHBI1oAfD
 aH3A==
X-Gm-Message-State: AOAM530uXcSJp1DptXnwGxL+YJaLekE593fhN5Tdp9APDT0sQADBEDwe
 vwfI++WTjHg33pGSSAnK7RY=
X-Google-Smtp-Source: ABdhPJzsgd0aRNPoWJXYwydjiHdMdDDYgQbNPbxNQMFjUY4lwCLgvyNB0bskihdoh90Ni8bjWpAoSw==
X-Received: by 2002:a5d:624d:0:b0:1e6:f18c:d264 with SMTP id
 m13-20020a5d624d000000b001e6f18cd264mr6293942wrv.546.1646603047350; 
 Sun, 06 Mar 2022 13:44:07 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a05600c1d1000b003816edb5711sm18542012wms.26.2022.03.06.13.44.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 13:44:06 -0800 (PST)
Message-ID: <a6c37996-80c6-4b98-2605-0bd141acae5d@gmail.com>
Date: Sun, 6 Mar 2022 22:44:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2] coreaudio: Always return 0 in handle_voice_change
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
References: <20220306123410.61063-1-akihiko.odaki@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220306123410.61063-1-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/3/22 13:34, Akihiko Odaki wrote:
> handle_voice_change() is a CoreAudio callback function as of CoreAudio type
> AudioObjectPropertyListenerProc, and for the latter MacOSX.sdk/System/
> Library/Frameworks/CoreAudio.framework/Headers/AudioHardware.h
> says "The return value is currently unused and should always be 0.".
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>   audio/coreaudio.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

