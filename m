Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D01304702BC
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 15:22:59 +0100 (CET)
Received: from localhost ([::1]:45324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvgna-0003sL-Vc
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 09:22:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mvgmJ-0002gT-Bs
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 09:21:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mvgmH-0002N3-58
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 09:21:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639146096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SQlD8n+EmW5VaEbpCJN/Ni7Znj6fxiKh/fKmsrDqVOA=;
 b=E/T+f7UnbhH+Fo+WcMua5tjnXUK8nYjVbWjAyO2RuJAt+i9JaqC2QU9pfr7xSUpzGLWnC+
 c5cyFKL6y3TDyYazIzkSQ2famL0CiCjanUBi6HFpRSPqLncuz4qTAcIsNkEtDifB1iEQsj
 rCALbaQfYtwv6rYxCnqaIAuO4Gg+5dE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-u5V-pkf_O0irBmYOqA5tKw-1; Fri, 10 Dec 2021 09:21:35 -0500
X-MC-Unique: u5V-pkf_O0irBmYOqA5tKw-1
Received: by mail-wr1-f71.google.com with SMTP id
 v17-20020adfedd1000000b0017c5e737b02so2334966wro.18
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 06:21:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SQlD8n+EmW5VaEbpCJN/Ni7Znj6fxiKh/fKmsrDqVOA=;
 b=AL31f3+7GCZbi1gfljXtYRFEihsdy1Lr/swdwSxhDxLFCu3Ecs+I4NorPoRd8vB0Z4
 u35SIF1qWaWUU3zc4KQ1oZSfwXZW3AlsCeYhTJzztQjHNp1JLo/B8gnygPAWlQR38veu
 OuDY7YLIj81FRrhfYKbs8ItvoJEDGUgQiTWSmSIRWhRKSYK9vNPWOUmF2TbdHuzo6RLz
 iwgg3UowX2lRPn0+PRZN8Ln8eR0PgA023OBtzBSsSa00YJVS5pNKVK34kuudLjVsWF4a
 8PLgh/+YLMmBaO50neXQKUkqbfLY8QkHus3tskzUWraAm3bMLqf1vHFPjNCLT9ye/OJA
 exHA==
X-Gm-Message-State: AOAM533iu++PSzmNYeXXkTKxErueR481gmRXl3fb1nzyCVVDxTnI/PCr
 6XTd+V8Jb63tNuHi1YHhwxn90wpaSfWtrp+qr6JLygfngkkP2sIAz/4Gxbtmc5QSy+o8YkOw89C
 H2aGvO7r2JuQ4/Pw=
X-Received: by 2002:a5d:5144:: with SMTP id u4mr14348049wrt.91.1639146094012; 
 Fri, 10 Dec 2021 06:21:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDG7KBWUfb/1e3Btwaz8LouQBe2k9zFWaz4m+RRmx8xJyYaZJd+wvBUiF0HIDYinLKJ0jD6Q==
X-Received: by 2002:a5d:5144:: with SMTP id u4mr14348002wrt.91.1639146093729; 
 Fri, 10 Dec 2021 06:21:33 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id n14sm2926192wrf.69.2021.12.10.06.21.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 06:21:33 -0800 (PST)
Message-ID: <40961f22-ca91-29fa-0488-f5549a5d314f@redhat.com>
Date: Fri, 10 Dec 2021 15:21:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 04/31] include/sysemu/block-backend: split header into
 I/O and global state (GS) API
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211124064418.3120601-1-eesposit@redhat.com>
 <20211124064418.3120601-5-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211124064418.3120601-5-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.317, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.11.21 07:43, Emanuele Giuseppe Esposito wrote:
> Similarly to the previous patches, split block-backend.h
> in block-backend-io.h and block-backend-global-state.h
>
> In addition, remove "block/block.h" include as it seems
> it is not necessary anymore, together with "qemu/iov.h"
>
> block-backend-common.h contains the structures shared between
> the two headers, and the functions that can't be categorized as
> I/O or global state.
>
> Assertions are added in the next patch.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   include/sysemu/block-backend-common.h       |  84 ++++++
>   include/sysemu/block-backend-global-state.h | 121 +++++++++
>   include/sysemu/block-backend-io.h           | 139 ++++++++++
>   include/sysemu/block-backend.h              | 269 +-------------------
>   block/block-backend.c                       |   9 +-
>   5 files changed, 353 insertions(+), 269 deletions(-)
>   create mode 100644 include/sysemu/block-backend-common.h
>   create mode 100644 include/sysemu/block-backend-global-state.h
>   create mode 100644 include/sysemu/block-backend-io.h

[...]

> diff --git a/include/sysemu/block-backend-global-state.h b/include/sysemu/block-backend-global-state.h
> new file mode 100644
> index 0000000000..77009bf7a2
> --- /dev/null
> +++ b/include/sysemu/block-backend-global-state.h

[...]

> +int blk_ioctl(BlockBackend *blk, unsigned long int req, void *buf);

I don’t quite follow what makes blk_ioctl() a GS function.  (It’s 
possible that I forgot something about this from v4, though, and can’t 
find it anymore...)

I suppose it can be said that in the context of the block layer, ioctl 
functions are generally used outside of I/O threads as something that 
kind of affects the global data state, but... bdrv_co_ioctl() is in 
block-io.h, and internally we definitely do use ioctl in I/O threads 
(various uses in file-posix.c, e.g. to zero out areas).  I also don’t 
understand why blk_ioctl() is GS, and blk_aio_ioctl() is I/O.

And if you have a virtio-scsi device in an iothread, and then create a 
scsi-generic device on it, will bdrv_co_ioctl() not run in the I/O 
thread still...?  Hm, testing (on patch 6), it appears that not – I 
think that’s because it mostly uses blk_aio_ioctl(), apart from 
*_realize() and scsi_SG_IO_FROM_DEV() (whatever that is; and this makes 
me a bit cautious, too).  Still, I’m not quite sure how it’s more global 
state than e.g. writing zeroes or, well, blk_aio_ioctl().

However, testing brought some other problems to light:

$ ls /dev/sg?
/dev/sg0

$ sudo modprobe scsi_debug max_luns=1 num_tgts=1 add_host=1

$ ls /dev/sg?
/dev/sg0 /dev/sg1

$ ./qemu-system-x86_64 \
     -object iothread,id=foo \
     -device virtio-scsi,iothread=foo \
     -blockdev host_device,filename=/dev/sg1,node-name=bar \
     -device scsi-generic,drive=bar
qemu-system-x86_64: ../block/block-backend.c:2038: 
blk_set_guest_block_size: Assertion `qemu_in_main_thread()' failed.
[1]    121353 IOT instruction (core dumped)  ./qemu-system-x86_64 
-object iothread,id=foo -device virtio-scsi,iothread=foo


And:

$ ./qemu-system-x86_64 \
     -object iothread,id=foo \
     -device virtio-scsi,iothread=foo \
     -blockdev null-co,read-zeroes=true,node-name=bar \
     -device scsi-hd,drive=bar \
     -cdrom ~/tmp/arch.iso \
     -enable-kvm \
     -m 1g
qemu-system-x86_64: ../block/block-backend.c:1918: 
blk_enable_write_cache: Assertion `qemu_in_main_thread()' failed.
[1]    127203 IOT instruction (core dumped)  ./qemu-system-x86_64 
-object iothread,id=foo -device virtio-scsi,iothread=foo

If I boot from a CD under virtio-scsi (in an iothread), I also get an 
error for blk_lock_medium(), and if I eject such a CD, for blk_eject() 
and blk_get_attached_dev_id() (called from blk_eject()).

It appears like scsi_disk_emulate_command() is always run in the BB’s 
AioContext, and so everything it (indirectly) calls cannot assume to be 
in the main thread.  As for blk_set_guest_block_size(), that one’s 
called from scsi-generic’s scsi_read_complete().

Hanna


