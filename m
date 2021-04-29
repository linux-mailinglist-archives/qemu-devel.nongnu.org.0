Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E60A936ECD2
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 16:56:44 +0200 (CEST)
Received: from localhost ([::1]:49174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc85s-000406-1N
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 10:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lc81j-0001hS-5O
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 10:52:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lc81h-0002JV-3e
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 10:52:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619707943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fyaJfBxrk1IY+6u5TDhLkeZOI3EKSjIzoDsVOGRTVlI=;
 b=i3H/n2ZSXZUDlGNPOz0waHsm/3tK6vfBTbJIYheLa8tn+iIV+VMt8ieUj4LAa/jHpcPcr+
 gPrq8QFEPkBLoKBO54/G2GJdak2lDRJOSqBcO/cF4v/Yu3G/Jl/VEN6f2x99q1BqH/7X9d
 KLWhtDy+otdMjMjnvmIvOAI92qW7CrA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-1SnKfA0SNyi0CcrRaIovgA-1; Thu, 29 Apr 2021 10:52:21 -0400
X-MC-Unique: 1SnKfA0SNyi0CcrRaIovgA-1
Received: by mail-wm1-f72.google.com with SMTP id
 v186-20020a1cacc30000b0290137364410e2so4648875wme.3
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 07:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fyaJfBxrk1IY+6u5TDhLkeZOI3EKSjIzoDsVOGRTVlI=;
 b=hBIRXkygrAcZtC2R11QTxML3pYnzcJlVPR868R1aU6E8LtxHHHEbsXxCGJZRZ0YwzP
 SxUsU4hyhJ1slv4rXWfTmic5cJ9UmFiIts1Jy9AJVYJ2cWfOqYZrXjdmPE23kUzAa3k0
 chW+whjYBkcj41IwZ162+BqZS1KwnlU83V76N4b5/F2neiEU18yBsvwS3w7wGRRNMEAM
 +WGVu9oK6oVTswWegFtaqqwpt1QqLo7N91GoEcG2asVfTxsXgTAegjS2lSYJadjECSUv
 238sTkPxsO1mZoynlNzjEIuop3QSns+0eDiaUE7eIDRCQL6Vqd/Qj7Oazfd4lcDieJOp
 An+Q==
X-Gm-Message-State: AOAM531kpYy21tOCP4CIx1Ixa5sg5132izxUfVEx2BOruleEIekRw+EG
 g3TlO2eRGFezJKokdiDq3yxYLUHQ/mQTlVU9vg7wisMS1Xj05zwpkflMtokDEQB6q6M6w3ZBF+C
 C5tv8ajEvBqUgxSk=
X-Received: by 2002:a5d:6383:: with SMTP id p3mr208359wru.230.1619707940747;
 Thu, 29 Apr 2021 07:52:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxojiTZUmTP1SA6laIXcRP7YaVoCxeO0qr9gxLn6jbkn+wobljxeMndNFeyUSPq+imLGCevLw==
X-Received: by 2002:a5d:6383:: with SMTP id p3mr208346wru.230.1619707940617;
 Thu, 29 Apr 2021 07:52:20 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id n8sm9871745wmq.12.2021.04.29.07.52.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 07:52:20 -0700 (PDT)
Subject: Re: [PATCH v3 3/3] hw/core/loader: clear uninitialized ROM space
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210429141326.69245-1-laurent@vivier.eu>
 <20210429141326.69245-4-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7dc74cc1-db14-ec34-274a-a23d6b44e793@redhat.com>
Date: Thu, 29 Apr 2021 16:52:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210429141326.69245-4-laurent@vivier.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/21 4:13 PM, Laurent Vivier wrote:
> As for "hw/elf_ops: clear uninitialized segment space" we need to
> clear the uninitialized space when the ELF is set in ROM.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  hw/core/loader.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index d3e5f3b423f6..8146fdcbb7a0 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -1146,9 +1146,13 @@ static void rom_reset(void *unused)
>          if (rom->mr) {
>              void *host = memory_region_get_ram_ptr(rom->mr);
>              memcpy(host, rom->data, rom->datasize);
> +            memset(host + rom->datasize, 0, rom->romsize - rom->datasize);
>          } else {
>              address_space_write_rom(rom->as, rom->addr, MEMTXATTRS_UNSPECIFIED,
>                                      rom->data, rom->datasize);
> +            address_space_set(rom->as, rom->addr + rom->datasize, 0,
> +                              rom->romsize - rom->datasize,
> +                              MEMTXATTRS_UNSPECIFIED);
>          }
>          if (rom->isrom) {
>              /* rom needs to be written only once */
> 

This is consistent with the comment from commit d60fa42e8ba
("Save memory allocation in the elf loader"):

    /* datasize is the amount of memory allocated in "data". If datasize
is less
     * than romsize, it means that the area from datasize to romsize is
filled
     * with zeros.
     */

Therefore:

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

However depending on the underlying media, there might be cases
where we want to fill with -1 instead. Just to keep in mind, if
one day it bites us.

Regards,

Phil.


