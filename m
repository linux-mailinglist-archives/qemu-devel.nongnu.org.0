Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B7D72E32
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jul 2019 13:51:15 +0200 (CEST)
Received: from localhost ([::1]:50698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqFne-0003kq-Ol
	for lists+qemu-devel@lfdr.de; Wed, 24 Jul 2019 07:51:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34752)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hqFnT-0003K4-6E
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 07:51:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hqFnS-0000q7-77
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 07:51:03 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40869)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hqFnR-0000pi-Sx
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 07:51:02 -0400
Received: by mail-wm1-f68.google.com with SMTP id v19so41371356wmj.5
 for <qemu-devel@nongnu.org>; Wed, 24 Jul 2019 04:51:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hoauA5wtETm8lV1g1iQSKGOUwe6cPMTzx9JO5YjsnWs=;
 b=StQzzH1ax6MFpQnc8N7i9VPLhI8NB27ECVRRu8jVfHYLqcV8p4bm8+GtLxxL1jHIoe
 5oTGzGL9fNGwe1POzJgMBlgozpBpPUnVzKuJrqUX7iw4mFotVRSWr613/7IM3DieyJtt
 S3Wr70tRLThfLz0Fk9+Vy6eY/ql5zBVlEUuu5gRd+Uu1iJQ4nglJr98IPIchdMpc+Y/8
 IzHx1r66vdbRo45Q84FUGZB0PgBnuAm+sKZfg29x8ORu8JZ+4EvK7e9WsQBxbYzbhvJ3
 y67SwcagwrkQEwDrPHtlSirG8hCk1BhFnDTzjwaRY2vMH8RlNu3gDLg+K8eMlQByypxb
 9jmg==
X-Gm-Message-State: APjAAAV+r1wKU3hvCFYdTF4imdJD0CVA4hCkasF/lDKmq26jdzsdAMNO
 6MQb3p4xq1YmJOq+9LIe5e5mRQ==
X-Google-Smtp-Source: APXvYqyUCII8sotbC5Z5st/zztEx4AzaDe8XGSa5bnc/VAbKwFyTGfY6VUWSRrnaD1Ff2XDsaMcPlQ==
X-Received: by 2002:a1c:dc07:: with SMTP id t7mr77171562wmg.164.1563969060692; 
 Wed, 24 Jul 2019 04:51:00 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:10f7:67c8:abb4:8512?
 ([2001:b07:6468:f312:10f7:67c8:abb4:8512])
 by smtp.gmail.com with ESMTPSA id c3sm48886974wrx.19.2019.07.24.04.50.59
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jul 2019 04:50:59 -0700 (PDT)
To: Stefano Garzarella <sgarzare@redhat.com>, qemu-devel@nongnu.org
References: <20190724112531.232260-1-sgarzare@redhat.com>
 <20190724112531.232260-3-sgarzare@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <08e22ee6-8216-8563-e35a-8c02fc201fc9@redhat.com>
Date: Wed, 24 Jul 2019 13:50:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190724112531.232260-3-sgarzare@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-devel] [PATCH v3 2/3] elf-ops.h: Map into memory the ELF
 to load
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
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Julio Montes <julio.montes@intel.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/07/19 13:25, Stefano Garzarella wrote:
> @@ -582,7 +596,7 @@ static int glue(load_elf, SZ)(const char *name, int fd,
>          *highaddr = (uint64_t)(elf_sword)high;
>      return total_size;

Isn't the success case missing a g_mapped_file_unref?  It has to be done
unconditionally since now rom_add_elf_program adds a separate reference.

Related to this, the comment

            /* rom_add_elf_program() seize the ownership of 'data' */

refers to the g_free(data) that you are removing and is best changed to just
            /*
             * rom_add_elf_program() takes its own reference to
             * mapped_file.
             */

Thanks,

Paolo

>   fail:
> -    g_free(data);
> +    g_mapped_file_unref(mapped_file);
>      g_free(phdr);
>      return ret;
>  }
> 


