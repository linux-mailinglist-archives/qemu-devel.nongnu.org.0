Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DEF379D67
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 05:09:49 +0200 (CEST)
Received: from localhost ([::1]:34066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgImK-0003pj-3o
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 23:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lgIlT-00039j-8C
 for qemu-devel@nongnu.org; Mon, 10 May 2021 23:08:55 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:35447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lgIlR-0004Yh-En
 for qemu-devel@nongnu.org; Mon, 10 May 2021 23:08:54 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 h14-20020a17090aea8eb02901553e1cc649so508626pjz.0
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 20:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gmSSzkEDwOJNpYsuyaEROdzUVSmg63FJvPLXFx1HH7U=;
 b=HSrtjSLZLjfloIvUvNKd18+F9yp2MCUIVEhFXTqnt6pNp/rCRiThRir3STtjM1LkTr
 5jv0XT+bmQr4tUVQIY+VDIh5cLWj9bhsPHLDLStbjU9Kqe1zkuJNJXIJhzpXhsPV9hId
 saldlg5F48mlFdQ8PNLlwQOxslsEUQUBZYgEYNVg3Xxedcbrq3K058nquMjTs+7p6Sru
 d5hJUU4CivEUdKuS6kSaNW4ZB1ZBfXHHn2Zr90JkNCUWLmeAVa0b8Po5SsXHS1W3vA/m
 DPiZVCBl6lHE+pJhVNW3pEf6LNetKfYdtPQJzd+7kch/OZF13XsgVTzWzc1ZGnCEmvtP
 /F2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gmSSzkEDwOJNpYsuyaEROdzUVSmg63FJvPLXFx1HH7U=;
 b=E4bRWFnzke0sJnng8khkebZxyi3hHksSU+L8WEV+k3veWqWv1RUNPGS/GV0vxqszJP
 M5A9MLWdAVxp2CyXl75xQTswTcFKUlk/y1oIFFf2JxzHZdq4IvtFkTAZ5WyIl90zTNcq
 veR65zel+dvqOsLcBXFdbpj6ry+30n5HDcNvHpuk4OoVQ13dyEWhb1YPXiZbl1APD27K
 F5M+BUVfX+OgvrfmIrIh2LjlU1jTCvuheG2lU84uJDMUtGGknOei+sc+2HRwBLDyJEiz
 IRpGLORoo0KX/EMBqE6jC11rW/rqBidpry+ckMBlJnLXr+BETZWyl334WsrKPjkA9hgC
 C/kQ==
X-Gm-Message-State: AOAM533eXySeqRvv7hobiwGxTkBPU2or6Dpim6e99IDbIgLBmbeLMmik
 xBVAFlrCYuWA4VhDp8do3rk=
X-Google-Smtp-Source: ABdhPJzRPyjaS8FH8AD8LVDj9HbPBtfzJg7nIElvyIZJh4cGouTkWy4RlirkTlrZQMsI5mZ93X1xng==
X-Received: by 2002:a17:902:e74b:b029:ed:8636:c532 with SMTP id
 p11-20020a170902e74bb02900ed8636c532mr28303446plf.51.1620702531089; 
 Mon, 10 May 2021 20:08:51 -0700 (PDT)
Received: from localhost.localdomain (p912131-ipoe.ipoe.ocn.ne.jp.
 [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id x26sm12263301pfm.134.2021.05.10.20.08.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 20:08:50 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] ui/cocoa: capture all keys and combos when mouse
 is grabbed
To: gustavo@noronha.eti.br, qemu-devel@nongnu.org
References: <20210504233232.28423-1-gustavo@noronha.eti.br>
 <20210504233232.28423-2-gustavo@noronha.eti.br>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-ID: <12f86bf7-8059-eea7-a03c-1ac1abfd4ab8@gmail.com>
Date: Tue, 11 May 2021 12:08:46 +0900
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210504233232.28423-2-gustavo@noronha.eti.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: 'Peter Maydell ' <peter.maydell@linaro.org>,
 'Markus Armbruster ' <armbru@redhat.com>, 'Gerd Hoffmann ' <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/05/05 8:32, gustavo@noronha.eti.br wrote:> @@ -344,6 +361,32 @@ 
- (id)initWithFrame:(NSRect)frameRect
>           kbd = qkbd_state_init(dcl.con);
>   
>       }
> +
> +    CGEventMask mask = CGEventMaskBit(kCGEventKeyDown) | CGEventMaskBit(kCGEventKeyUp) | CGEventMaskBit(kCGEventFlagsChanged);
> +    eventsTap = CGEventTapCreate(kCGHIDEventTap, kCGHeadInsertEventTap, kCGEventTapOptionDefault,
> +                                 mask, handleTapEvent, self);
> +    if (!eventsTap) {
> +        warn_report("Could not create event tap, system key combos will not be captured.\n");
> +        return self;
> +    } else {
> +        COCOA_DEBUG("Global events tap created! Will capture system key combos.\n");
> +    }
> +
> +    CFRunLoopRef runLoop = CFRunLoopGetCurrent();
> +    if (!runLoop) {
> +        warn_report("Could not obtain current CF RunLoop, system key combos will not be captured.\n");
> +        return self;
> +    }
> +
> +    CFRunLoopSourceRef tapEventsSrc = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, eventsTap, 0);
> +    if (!tapEventsSrc ) {
> +        warn_report("Could not obtain current CF RunLoop, system key combos will not be captured.\n");
> +        return self;
> +    }
> +
> +    CFRunLoopAddSource(runLoop, tapEventsSrc, kCFRunLoopDefaultMode);
> +    CFRelease(tapEventsSrc);
> +
>       return self;
>   }
>   

These statements should be in "if (self)" block which they follow, or it 
may rely on "self" even if it failed to allocate and initialize "self".

Regards,
Akihiko Odaki

