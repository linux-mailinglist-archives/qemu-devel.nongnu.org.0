Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E75902AB760
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 12:42:39 +0100 (CET)
Received: from localhost ([::1]:48522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kc5ZG-0002p1-Vk
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 06:42:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1kc5XM-0001K9-Ag
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 06:40:40 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:43520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1kc5XH-0001Lc-Nw
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 06:40:38 -0500
Received: by mail-pg1-x543.google.com with SMTP id r10so6915118pgb.10
 for <qemu-devel@nongnu.org>; Mon, 09 Nov 2020 03:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:cc:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HTCqXuUJIzeOT4smBI4fCee0OmE9G94C6dAdN6fXyS4=;
 b=S6l0WutpnOiIt+WyGGHwGF6AcDvW1ToctuI8gFKUCocfBbCs4L1kXgQ7zKjoqV0YoP
 Kfb13380125afuCWdVfdGTToek9VDqFoXlaaGJe7inkLtgD5aXtC2QWM6UQPSEmxFV4Q
 /PcoMQmBH+c0ce+6EDYmS4lXshTbggIbxMJ7ZfkJ2Y4RXMWnHzZyuAvJvFlcbbZxNETG
 +2FRYk7MBBhk27BjjY1iQwRjKTLRJpCY7tz032G80YK1afETlyE13tNh8c5lgdcFjsX9
 I9PzPXMmnNB/Otu1UAMfDNVpCC3NIN2//DXw40kyPjJVyz45Fee5SnXN4ehbIdDvgHUR
 8RvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:cc:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HTCqXuUJIzeOT4smBI4fCee0OmE9G94C6dAdN6fXyS4=;
 b=hSD8iYKoaTBkIk4i+gZ9WPjkiq7qUvcfS+UOeiW5Lnhn1ttFTbNxUwKXEh865+G6x+
 o/KP9mlsXREdk3TMKkQqtXvSmMvXKhcG9c469YR/87vNOtTHiV/TNdNnqiD8PMPvdP2W
 7b+mgPepmk0kfEkBO3iUeSYMlXLoyNvkepXqQ/uOIzRvG38fFGDEukSancFoT9yqGLjM
 5LGGi6caQZEyeLzzDlxQl0lOIN/nIWPCFGEeYLIpr0bwgjfVsxHcDE6vuGB2ryFfKihP
 XdECA7wkmmlrpGt9kaIsPIWxeDhqosO6vHMC/XTYxoLykooXCI1tm7MTkMN/L5/yo0Cm
 TEqw==
X-Gm-Message-State: AOAM531rPaj8bJY5pRi2aTZfrr5rTI+4HgV/yi2HfokeTVvfo4cV9QKZ
 ypb0aWgt302sCer/2XDhnlSCk8yT9Tmcepw6
X-Google-Smtp-Source: ABdhPJwAQR9Lxq//Prm4m+PU8Wf/Y1IAFHBIwh34wU77vuY9pzIX4MuoclMo7SFN6DpmjSFPt0zUaw==
X-Received: by 2002:a17:90a:aa89:: with SMTP id
 l9mr12709073pjq.0.1604922031154; 
 Mon, 09 Nov 2020 03:40:31 -0800 (PST)
Received: from [10.2.24.220] ([61.120.150.77])
 by smtp.gmail.com with ESMTPSA id ii20sm11705331pjb.57.2020.11.09.03.40.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Nov 2020 03:40:30 -0800 (PST)
Subject: Re: [External] [PATCH 1/1] pvpanic: Advertise the PVPANIC_CRASHLOADED
 event support
To: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <1604346639-27090-1-git-send-email-alejandro.j.jimenez@oracle.com>
From: zhenwei pi <pizhenwei@bytedance.com>
Message-ID: <a595f137-b1d2-56b6-9391-f1c5c80beabf@bytedance.com>
Date: Mon, 9 Nov 2020 19:40:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1604346639-27090-1-git-send-email-alejandro.j.jimenez@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Paolo

This patch seems getting ignored. Because no maintainers found for 
hw/misc/pvpanic.c, I also send this to you(hope it doesn't disturb you).


About this patch:
Looks good. And also test it, works fine.

Reviewed-by: zhenwei pi <pizhenwei@bytedance.com>

On 11/3/20 3:50 AM, Alejandro Jimenez wrote:
> Advertise both types of events supported when the guest OS
> queries the pvpanic device. Currently only PVPANIC_PANICKED is
> exposed; PVPANIC_CRASHLOADED must also be advertised.
> 
> Fixes: 7dc58deea79a ("pvpanic: implement crashloaded event handling")
> Signed-off-by: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
> Acked-by: Mark Kanda <mark.kanda@oracle.com>
> ---
>   hw/misc/pvpanic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
> index 598d547..a55ce8e 100644
> --- a/hw/misc/pvpanic.c
> +++ b/hw/misc/pvpanic.c
> @@ -66,7 +66,7 @@ struct PVPanicState {
>   /* return supported events on read */
>   static uint64_t pvpanic_ioport_read(void *opaque, hwaddr addr, unsigned size)
>   {
> -    return PVPANIC_PANICKED;
> +    return PVPANIC_PANICKED | PVPANIC_CRASHLOADED;
>   }
>   
>   static void pvpanic_ioport_write(void *opaque, hwaddr addr, uint64_t val,
> 

-- 
zhenwei pi

