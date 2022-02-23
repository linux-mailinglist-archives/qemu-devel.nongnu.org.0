Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C93D4C19FB
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 18:41:25 +0100 (CET)
Received: from localhost ([::1]:51898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMvdj-0000vw-QI
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 12:41:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nMvbm-00006o-9F
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 12:39:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nMvbf-00063B-NX
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 12:39:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645637950;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n8YAx+WAA4UBUKEP6AUr/Ri1QBor8biqnXoHuh6HkJI=;
 b=DOemNScK9i5ugylynuNokAZnqQujSO/mnsjQPUKb5zpn3rgPY5fFv/NMDMoAIgYlGYUg+x
 4ZxKuwMJy1v30LP/geMdTJ5Zpq53iGyoB49W4jrHUxk9MAjZt0ivsrFB3DCWp67MkNXLZZ
 J9gU1VJm/3OmZn8+TTttaRbpSQqBOjA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-cuNMi7KkNlyKtYa-PsW9lw-1; Wed, 23 Feb 2022 12:39:08 -0500
X-MC-Unique: cuNMi7KkNlyKtYa-PsW9lw-1
Received: by mail-wr1-f72.google.com with SMTP id
 g15-20020adfbc8f000000b001e9506e27ddso7483275wrh.22
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 09:39:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=n8YAx+WAA4UBUKEP6AUr/Ri1QBor8biqnXoHuh6HkJI=;
 b=tVhp2+NOQT2RisYEAQGMxWUNOfI6c+KxY8v7aPnKYphF/WCDu6UZoHgDMhLgUpRHKh
 f3yppX36BpuMhsIN4BE0HecMu2KEmcfu+cPUU0iE/QF2mLPkcb/OBhlsLc8Fs1Gz9LSg
 lCBHEiXjyBox/EAj45GxylnrUgnjgkoUnmiyxpR09opFpFXwLoCKEtrBLhL57p4Z3jz3
 PhPX480ZzJhd+NtYARw4Qtm68xQynNYTY2nQxY3roGX9qtzahnru9GCLOyOd1GgoZ17E
 459EfuH8Nmod+gsadnqF8JHDYbTYQZWRjnstcXE+YzHLLncAW7B80sMihXMQmwcXF3iU
 qDeQ==
X-Gm-Message-State: AOAM531XX0VOklI7Yzw9ewHfZ3KKfKzReel+jO82ZTn0BO7L7X1Gokn6
 JNBSa1E/e7wQgzFyLqqWw5EPzcSuPYR5M3wiLaIk0aF8WIU7qUAl4bel3CLY5/SJbNMl7C1Cd92
 GxJH0bvWi03eAKlaJGV5d/T2Aa6SYgu7cVvmEjfH44xpEFhQrG1qbo6eEd9NvjwhPdEHdHw==
X-Received: by 2002:a7b:c341:0:b0:37b:ed90:7dad with SMTP id
 l1-20020a7bc341000000b0037bed907dadmr612283wmj.138.1645637944053; 
 Wed, 23 Feb 2022 09:39:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx3XYO5cTHI66UZ2LsKn4BFM/R/kGPp4S+8eCTnlocmRXvvAScQJft5TqjjdLK0C9ujVs3FIQ==
X-Received: by 2002:a7b:c341:0:b0:37b:ed90:7dad with SMTP id
 l1-20020a7bc341000000b0037bed907dadmr612262wmj.138.1645637943688; 
 Wed, 23 Feb 2022 09:39:03 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id r11sm142496wmb.19.2022.02.23.09.39.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 09:39:03 -0800 (PST)
Subject: Re: Fix a potential Use-after-free in virtio_iommu_handle_command()
 (v6.2.0).
To: Thomas Huth <thuth@redhat.com>, wliang@stu.xidian.edu.cn,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <1b79118e.25c5.17f2702b9d5.Coremail.wliang@stu.xidian.edu.cn>
 <3ce08bdb-fecd-549a-5c09-0b5fa65de4ba@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <a300d2f3-e545-7793-2601-fec1cbbd601a@redhat.com>
Date: Wed, 23 Feb 2022 18:39:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <3ce08bdb-fecd-549a-5c09-0b5fa65de4ba@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2/23/22 5:02 PM, Thomas Huth wrote:
> On 23/02/2022 15.36, wliang@stu.xidian.edu.cn wrote:
>> Hi all,
>>
>> I find a potential Use-after-free in QEMU 6.2.0, which is in
>> virtio_iommu_handle_command() (./hw/virtio/virtio-iommu.c).
>>
>> Specifically, in the loop body, the variable 'buf' allocated at line
>> 639 can be freed by g_free() at line 659. However, if the execution
>> path enters the loop body again and the if branch takes true at line
>> 616, the control will directly jump to 'out' at line 651. At this
>> time, 'buf' is a freed pointer, which is not assigned with an
>> allocated memory but used at line 653. As a result, a UAF bug is
>> triggered.
>>
>>
>>
>> 599    for (;;) {
>> ...
>> 615        sz = iov_to_buf(iov, iov_cnt, 0, &head, sizeof(head));
>> 616        if (unlikely(sz != sizeof(head))) {
>> 617            tail.status = VIRTIO_IOMMU_S_DEVERR;
>> 618            goto out;
>> 619        }
>> ...
>> 639            buf = g_malloc0(output_size);
>> ...
>> 651out:
>> 652        sz = iov_from_buf(elem->in_sg, elem->in_num, 0,
>> 653                          buf ? buf : &tail, output_size);
>> ...
>> 659        g_free(buf);
>> 660    }
>>
>>
>> We can fix it by set ‘buf‘ to NULL after freeing it:
>>
>>
>>
>> 651out:
>> 652        sz = iov_from_buf(elem->in_sg, elem->in_num, 0,
>> 653                          buf ? buf : &tail, output_size);
>> ...
>> 659        g_free(buf);
>> +++buf = NULL;
>> 660    }
>>
>>
>> I'm looking forward to your confirmation.
Thank you for the report. Yes setting buff to null after the g_free
looks the right thing to do here. Please feel free to send the patch.
>
>  Hi,
>
> thanks for your report and patch - but to make sure that the right
> people get attention, please use the scripts/get_maintainer.pl script
> to get a list of people who should be on CC:, or look into the
> MAINTAINERS file directly (for the next time - this time, I've CC:ed
> them now already).
Thanks you Thomas for the cc ;-)

Eric
>
>  Thanks,
>   Thomas
>


