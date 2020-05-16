Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 631321D5EE4
	for <lists+qemu-devel@lfdr.de>; Sat, 16 May 2020 07:23:47 +0200 (CEST)
Received: from localhost ([::1]:53440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZpIY-0008MO-Fz
	for lists+qemu-devel@lfdr.de; Sat, 16 May 2020 01:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZpHh-0007rK-Et
 for qemu-devel@nongnu.org; Sat, 16 May 2020 01:22:53 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:35090
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jZpHg-00065e-4n
 for qemu-devel@nongnu.org; Sat, 16 May 2020 01:22:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589606570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pc4wAVmTMgosydwiJpo/FiIoHx8jQlFXAHTZecLNUSI=;
 b=Oq+7anYIQoopc1sVlhSQwLDPyQ+DT3B/0q+UwBdkvRny/JE9idM32uWAEBRtYT5sEXoNgO
 MW8SfdY9XOYpEp+twlfMHD/WZaJqD9TrTcergicIOqwnsu4Wb45bqLURITE74imEbRwZ2/
 +W4a4d8GtZTKXmA3ItsQ56yDvcRhqc8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-laQJqoWtMd-6Y9GNTCk42Q-1; Sat, 16 May 2020 01:22:48 -0400
X-MC-Unique: laQJqoWtMd-6Y9GNTCk42Q-1
Received: by mail-wr1-f72.google.com with SMTP id z5so2190720wrt.17
 for <qemu-devel@nongnu.org>; Fri, 15 May 2020 22:22:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pc4wAVmTMgosydwiJpo/FiIoHx8jQlFXAHTZecLNUSI=;
 b=NjjMe8Rv5nZbrsi5bsPh8JAPbYFNXk8pCjBVlW8MgADeg6ln9E99qV/hi6xBc9ufYj
 yVsC8b2J6TAhaH4fOHXwgBMoVHM6qQ/EYmfBQ5sLJH3yBoW6SGQfwG7xQgBzEq7a/Jmz
 0hgoV8pife0jKj9RFPEaCn/ihsqtmuQiprFT4npocQ5A/NhuY1wkN1Svh+eWoRw2Z+T3
 WyGzVcKFXOWoym10gMuCISjxAy9DayQdcp1uq6AwgaTvc6PN0FObNHLM/YfQGozX1j+w
 EmNKyobAW0buI9sOYbqVWTIciZS9SnUJ/aNBDg24D2IwDrUkkGBaH/NyXkgRGVZ4li0i
 7z6Q==
X-Gm-Message-State: AOAM533bK+jsoCRvu08/kM+Abzc14P/Wzoc1AC1CeXtvcSJ/oIg4PqER
 W0e+4It79eGvh0DJ9LXS071ajxa5OYZRgtn+JQgBS1NHF0pzWCRn4tZCedHNS140uqNmfixXbQX
 271DlHj5FyS+aqxc=
X-Received: by 2002:a7b:cf10:: with SMTP id l16mr7335034wmg.87.1589606566682; 
 Fri, 15 May 2020 22:22:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZ5H3xRFJnTHhOkKQ/Z99G1qGy4pBFAoplOQclw1/P6z5So2NmFed8W7Tr+X+BLuHnJky7ag==
X-Received: by 2002:a7b:cf10:: with SMTP id l16mr7335013wmg.87.1589606566471; 
 Fri, 15 May 2020 22:22:46 -0700 (PDT)
Received: from [192.168.1.39] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id p8sm6467501wre.11.2020.05.15.22.22.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2020 22:22:45 -0700 (PDT)
Subject: Re: [PATCH 1/1] 9pfs: include linux/limits.h for XATTR_SIZE_MAX
To: Dan Robertson <dan@dlrobertson.com>, Greg Kurz <groug@kaod.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
References: <20200515203015.7090-1-dan@dlrobertson.com>
 <20200515203015.7090-2-dan@dlrobertson.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b2a11de1-db41-47b6-e79e-3092866aacea@redhat.com>
Date: Sat, 16 May 2020 07:22:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200515203015.7090-2-dan@dlrobertson.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/16 01:22:50
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

On 5/15/20 10:30 PM, Dan Robertson wrote:
> linux/limits.h should be included for the XATTR_SIZE_MAX definition used

Maybe rewrite as <linux/limits.h> in subject & description (maintainer 
could do it for you).

> by v9fs_xattrcreate.
> 

Fixes: 3b79ef2cf48

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Dan Robertson <dan@dlrobertson.com>
> ---
>   hw/9pfs/9p.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index a2a14b5979..68c2df7333 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -28,6 +28,7 @@
>   #include "sysemu/qtest.h"
>   #include "qemu/xxhash.h"
>   #include <math.h>
> +#include <linux/limits.h>
>   
>   int open_fd_hw;
>   int total_open_fd;
> 
> 


