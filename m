Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4575485F8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 17:33:51 +0200 (CEST)
Received: from localhost ([::1]:50488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0m4c-0008AN-0e
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 11:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1o0m2L-00050E-BE
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 11:31:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1o0m2I-0008Js-KU
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 11:31:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655134284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7TOf0kg82/nK7C3R03StvxAEtut8TpPb29FQxU+fZeg=;
 b=bd2xxicmuJvsQnFDfIWLLuBsFWm97GSwWDoTgVx53pLkfN+cWivi4nN0Ms1MifKNHZsZb2
 WJal0iCddSJ/w8qdvI0qg/9fdZiqbSswoGcRGPYskl1iDOvwUSb2h5Nea4k6pFiCgzfCoJ
 F2iiHmo4z2TXmYCZBAdELv3ZCcIdtJY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-SLSSikmAPeCPUCKUkNCztg-1; Mon, 13 Jun 2022 11:31:23 -0400
X-MC-Unique: SLSSikmAPeCPUCKUkNCztg-1
Received: by mail-wm1-f69.google.com with SMTP id
 m22-20020a7bcb96000000b0039c4f6ade4dso2641623wmi.8
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 08:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=7TOf0kg82/nK7C3R03StvxAEtut8TpPb29FQxU+fZeg=;
 b=aQwdmRmlYUVj++YoPh721a8hXf1ccg/yWjv0rEqNVM6Ar/0CF49JH7ujrXjU0wg2Vx
 eQbtsTAca1EEq/ZU/pDCPKuNv2oy+v6zqP5VWwKloS3K9FZYgCDpJT+vgxc3vTWmGsXU
 pZ86x4jl8zNPmxdDghUuT7D+Qwo3p/3Zv7amSmwVVX7GL/ErS77nI6lO80l8Qq7LTZDW
 wejviVWMwp0fqTAmx2niYOZ5qklk75DiTQECAca/d6lk3UwrJXJKVqcEJEa90gFYN81G
 cQitZ+it5ogm3V1BvT7CcfWHh9/zWAkmwuHk/jK77SeNTgCSk4Dz/l4Lik1OAcXW28sP
 6rMw==
X-Gm-Message-State: AJIora8yZ4rCeATqxYSMTFomHqdkgkILTTeoTyKhDYYfvtnel6ByNgLg
 Zo7tEVL0e8dgD/rDssmLy0wChrNzNxdV9mwIs9J472kp9PPzYESfj4F1ErKWYVa6RjrwNlzT1P9
 1HX91Xw8x/AlCjJY=
X-Received: by 2002:adf:e8cd:0:b0:210:2b10:ab22 with SMTP id
 k13-20020adfe8cd000000b002102b10ab22mr414908wrn.476.1655134282106; 
 Mon, 13 Jun 2022 08:31:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t1+PG7j9tcPV38o54Kae7ZUstTM/wNDKPSUyN3wEImBMvzmRtsXIBh13rTKVtDbcntuvuTiw==
X-Received: by 2002:adf:e8cd:0:b0:210:2b10:ab22 with SMTP id
 k13-20020adfe8cd000000b002102b10ab22mr414876wrn.476.1655134281846; 
 Mon, 13 Jun 2022 08:31:21 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:bd00:963c:5455:c10e:fa6f?
 (p200300cbc706bd00963c5455c10efa6f.dip0.t-ipconnect.de.
 [2003:cb:c706:bd00:963c:5455:c10e:fa6f])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a5d50c7000000b0021031c894d3sm8985091wrt.94.2022.06.13.08.31.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 08:31:21 -0700 (PDT)
Message-ID: <2041c609-75e7-4743-d33a-dee0339a361e@redhat.com>
Date: Mon, 13 Jun 2022 17:31:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Li Zhang <zhlcindy@gmail.com>, Igor Mammedov <imammedo@redhat.com>
Cc: Li Zhang <lizhang@suse.de>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Yanan Wang <wangyanan55@huawei.com>,
 QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220613104402.10279-1-lizhang@suse.de>
 <20220613161937.333a6b82@redhat.com>
 <CAD8of+pp-3bKX44Q0++gRofx4gmzzjpq1N2HfgRacXT196pR7w@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 1/1] Fix the coredump when memory backend id conflicts
 with default_ram_id
In-Reply-To: <CAD8of+pp-3bKX44Q0++gRofx4gmzzjpq1N2HfgRacXT196pR7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.06.22 16:37, Li Zhang wrote:
> On Mon, Jun 13, 2022 at 4:19 PM Igor Mammedov <imammedo@redhat.com> wrote:
>>
>> On Mon, 13 Jun 2022 12:44:02 +0200
>> Li Zhang <lizhang@suse.de> wrote:
>>
>>> When no memory backend is specified in machine options,
>>> a default memory device will be added with default_ram_id.
>>> However, if a memory backend object is added in QEMU options
>>> and id is the same as default_ram_id, a coredump happens.
>>>
>>> Command line:
>>> qemu-system-x86_64 -name guest=vmtest,debug-threads=on \
>>> -machine pc-q35-6.0,accel=kvm,usb=off,vmport=off \
>>> -smp 16,sockets=16,cores=1,threads=1 \
>>> -m 4G \
>>> -object memory-backend-ram,id=pc.ram,size=4G \
>>> -no-user-config -nodefaults -nographic
>>>
>>> Stack trace of thread 16903:
>>>     #0  0x00007fb109a9318b raise (libc.so.6 + 0x3a18b)
>>>     #1  0x00007fb109a94585 abort (libc.so.6 + 0x3b585)
>>>     #2  0x0000558c34bc89be error_handle_fatal (qemu-system-x86_64 + 0x9c89be)
>>>     #3  0x0000558c34bc8aee error_setv (qemu-system-x86_64 + 0x9c8aee)
>>>     #4  0x0000558c34bc8ccf error_setg_internal (qemu-system-x86_64 + 0x9c8ccf)
>>>     #5  0x0000558c349f6899 object_property_try_add (qemu-system-x86_64 + 0x7f6899)
>>>     #6  0x0000558c349f7df8 object_property_try_add_child (qemu-system-x86_64 + 0x7f7df8)
>>>     #7  0x0000558c349f7e91 object_property_add_child (qemu-system-x86_64 + 0x7f7e91)
>>>     #8  0x0000558c3454686d create_default_memdev (qemu-system-x86_64 + 0x34686d)
>>>     #9  0x0000558c34546f58 qemu_init_board (qemu-system-x86_64 + 0x346f58)
>>>     #10 0x0000558c345471b9 qmp_x_exit_preconfig (qemu-system-x86_64 + 0x3471b9)
>>>     #11 0x0000558c345497d9 qemu_init (qemu-system-x86_64 + 0x3497d9)
>>>     #12 0x0000558c344e54c2 main (qemu-system-x86_64 + 0x2e54c2)
>>>     #13 0x00007fb109a7e34d __libc_start_main (libc.so.6 + 0x2534d)
>>>     #14 0x0000558c344e53ba _start (qemu-system-x86_64 + 0x2e53ba)
>>>
>>> Signed-off-by: Li Zhang <lizhang@suse.de>
>>
>> Acked-by: Igor Mammedov <imammedo@redhat.com>
>>
>>
>> CCing David as he probably would be the one to merge it
>>
> 
> Thanks for your review.


Acked-by: David Hildenbrand <david@redhat.com>


Paolo, can you queue this?

https://lore.kernel.org/qemu-devel/20220613104402.10279-1-lizhang@suse.de/

-- 
Thanks,

David / dhildenb


