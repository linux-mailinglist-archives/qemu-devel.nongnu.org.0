Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B24151A4D
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Feb 2020 13:06:19 +0100 (CET)
Received: from localhost ([::1]:57082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iywyA-0006EJ-MP
	for lists+qemu-devel@lfdr.de; Tue, 04 Feb 2020 07:06:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48704)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iywxN-0005mE-DS
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 07:05:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iywxM-00043x-Ch
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 07:05:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28693
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iywxM-00040N-6s
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 07:05:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580817927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zGXn10qIZqkk8jfo0FgYf8TrbeuaN5LTU0tIg/ZieNg=;
 b=UtHlUt7kC0C07sExebcFfkSGPt6FGqELgY/2bi9Y8DnDi7OjNI8VlNtH5wI6UULOAPMFHf
 mpTGZRSkP/m3GqkCQYrcHNfJYR94AZBJd0WZSJtqgnfwds4GyJLdKGMyWnGOD4HmrfsUvW
 oOQaj1C52S/qp2GvWmgrz83SdtPTPFo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-TdcK3JwmNpm6kQCDlplQkA-1; Tue, 04 Feb 2020 07:05:25 -0500
Received: by mail-wr1-f71.google.com with SMTP id t6so6974952wru.3
 for <qemu-devel@nongnu.org>; Tue, 04 Feb 2020 04:05:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zGXn10qIZqkk8jfo0FgYf8TrbeuaN5LTU0tIg/ZieNg=;
 b=bmAO+N0MNmB8i7i15KrZjIP30l4YRHQt8DutR8d5faZ2W0yRVs08X7N2bON5bGzRcF
 3rJmQDi39NCV0Fy5napFipLcTc2Uy6w4dc7f29BzkZFw7MMwNBu59sXsXdHdzeKtcwHu
 t9dzGubb+AZeIuDKW7w6BuQW6fAvcnpTHXxGbF6hVMfACj7DRPfnCGePflUV9IupAS1P
 na7TV14QzcXedHAnYPMP0HQCSOodRuy7B0tk92f2f71p494u0FIhlQpQTwuz2w04U9Zc
 Uksw5B2lkKDo6YiSxsMtz12RNG/6xsZ4ZL0IxpDIHhc1oH0XDkmJ1unmwKo/sFC7mGNN
 2osg==
X-Gm-Message-State: APjAAAVnOPCRecxF7myGBIxfi++Eip8UVdQBjh7DzkrlQ/UxpG7Zf2LI
 mod7RWZ7g47OryM/FBZk2Mk2pWdEBNEJ+r0MqdpKgowIDu6jMM9sGbPtRCfuuXfF5kHvFPI+2jr
 MrMA3GN/jaQcG1kg=
X-Received: by 2002:adf:e686:: with SMTP id r6mr22005566wrm.177.1580817924720; 
 Tue, 04 Feb 2020 04:05:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqyBWv8cIlVezU5IR0mukN8obfURtKZS2dod1YcNCvNoLjPq7IgQmZpwAt3F4yG7Y9A9q9Qkgg==
X-Received: by 2002:adf:e686:: with SMTP id r6mr22005554wrm.177.1580817924509; 
 Tue, 04 Feb 2020 04:05:24 -0800 (PST)
Received: from [192.168.1.35] (162.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.162])
 by smtp.gmail.com with ESMTPSA id s15sm29199738wrp.4.2020.02.04.04.05.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2020 04:05:23 -0800 (PST)
Subject: Re: [PATCH 3/4] virtiofsd: load_capng missing unlock
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, stefanha@redhat.com
References: <20200204110501.10731-1-dgilbert@redhat.com>
 <20200204110501.10731-4-dgilbert@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fd996682-b280-c872-93cf-5147b52ab097@redhat.com>
Date: Tue, 4 Feb 2020 13:05:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200204110501.10731-4-dgilbert@redhat.com>
Content-Language: en-US
X-MC-Unique: TdcK3JwmNpm6kQCDlplQkA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi David,

On 2/4/20 12:05 PM, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Missing unlock in error path.
> 
> Fixes: Covertiy CID 1413123
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>   tools/virtiofsd/passthrough_ll.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index e6f2399efc..c635fc8820 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -232,6 +232,7 @@ static int load_capng(void)
>            */
>           cap.saved = capng_save_state();
>           if (!cap.saved) {
> +            pthread_mutex_unlock(&cap.mutex);
>               fuse_log(FUSE_LOG_ERR, "capng_save_state (thread)\n");
>               return -EINVAL;
>           }
> 

What about moving the unlock call?

-- >8 --
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -231,11 +231,11 @@ static int load_capng(void)
           * so make another.
           */
          cap.saved = capng_save_state();
+        pthread_mutex_unlock(&cap.mutex);
          if (!cap.saved) {
              fuse_log(FUSE_LOG_ERR, "capng_save_state (thread)\n");
              return -EINVAL;
          }
-        pthread_mutex_unlock(&cap.mutex);

          /*
           * We want to use the loaded state for our pid,
---


