Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE575BE08
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 16:21:07 +0200 (CEST)
Received: from localhost ([::1]:59214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hhxB4-0004Zz-N2
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 10:21:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43694)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hhwUS-0003df-G6
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 09:37:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hhwUR-0000oC-3F
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 09:37:04 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39956)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hhwUQ-0000bZ-Pw
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 09:37:02 -0400
Received: by mail-wr1-f67.google.com with SMTP id p11so13911819wre.7
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2019 06:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1CA9WtdyTnv0MPeNhwuj41RMZxqwxN+BM9gARgB9QUw=;
 b=gflChbOq7i4IFkXApjmK6zFPXN41vKoplDTClcJgstGNOwHFFTE38KrrKBPXV8hin7
 X59TzGuKvHsoT8qEMDO99Ai5P1w/uIDQlzQ7VE1aqUqPklH5/f1TZ5VIIWUnp5iSgDV9
 hzeASEGXCfj7U9STjHIQ8VdA8mCPkRpvUwkWq7oPlI+1S5EtKBaH6Mo3035kCzx9UasL
 6eodNM2pAmpzlbHL3gyfA67md4C6E1w2MT351uSQ4aT4I/FTZwcmDKtebH8dgvUqD1lB
 PfXVu5KE7ed4SiXxgXkUUemGUhu839e8dq0+LlkWJiX1I82QNfY9Zzu4eDhRZkGWqm6p
 Dt1w==
X-Gm-Message-State: APjAAAV6VZLAukf6HatW5MJf9iw1x1cPUkRUMFw7SxozeA04Q8pDjiD9
 Iv1etxLS5igfGupDK/bRLxnUsw==
X-Google-Smtp-Source: APXvYqzBpEVSpJHDZKRhWj5hd4usPXHElkefgtX2hjN+Rpx5V284SOoaF7eNsLrZe5TvFpXHdybnkg==
X-Received: by 2002:a5d:6b03:: with SMTP id v3mr18911605wrw.309.1561988205534; 
 Mon, 01 Jul 2019 06:36:45 -0700 (PDT)
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id v67sm12875361wme.24.2019.07.01.06.36.44
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jul 2019 06:36:45 -0700 (PDT)
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <20190621181459.2F8207462AA@zero.eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <d4a2f006-44f8-f46f-6ddb-4d82b9c5100a@redhat.com>
Date: Mon, 1 Jul 2019 15:36:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190621181459.2F8207462AA@zero.eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-devel] [PATCH] ati-vga: Add DDC reg names for debug
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/19 8:12 PM, BALATON Zoltan wrote:
> Incremental patch to squash into last series
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/display/ati_dbg.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/display/ati_dbg.c b/hw/display/ati_dbg.c
> index b045f81d06..88b3a11315 100644
> --- a/hw/display/ati_dbg.c
> +++ b/hw/display/ati_dbg.c
> @@ -19,6 +19,8 @@ static struct ati_regdesc ati_reg_names[] = {
>      {"CRTC_GEN_CNTL", 0x0050},
>      {"CRTC_EXT_CNTL", 0x0054},
>      {"DAC_CNTL", 0x0058},
> +    {"GPIO_VGA_DDC", 0x0060},
> +    {"GPIO_DVI_DDC", 0x0064},
>      {"GPIO_MONID", 0x0068},
>      {"I2C_CNTL_1", 0x0094},
>      {"PALETTE_INDEX", 0x00b0},
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

