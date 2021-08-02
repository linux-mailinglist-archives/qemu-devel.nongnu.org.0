Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C18393DCF18
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 06:06:44 +0200 (CEST)
Received: from localhost ([::1]:53058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAPDv-0007Wp-Ro
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 00:06:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mAPCz-0006l0-AH
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 00:05:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mAPCx-0000kQ-HO
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 00:05:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627877142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wLlNV2XVOd1Ix8C8OuTNk678QSj1BbX2+PTGc00N4/M=;
 b=eHrUeVLCTLGKQBTA51hbY4SRk8XPbqU9n3UPeekSg//E1Q5l115360RIC/u7Hjk4z8fSFh
 eTtq4pLoaAO5zI3VEgfT3y79RK5JEE14+8Bqbg6yRfGCJSH+NMcCKlOrbDc+rfyZ/Vrq7q
 U6/f47xhUWVhSRbIrJpQuqGWk/CX0O8=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-bTermXOQPKi8-EjNNi3mwA-1; Mon, 02 Aug 2021 00:05:41 -0400
X-MC-Unique: bTermXOQPKi8-EjNNi3mwA-1
Received: by mail-pl1-f200.google.com with SMTP id
 d19-20020a170902c193b029012c5a07a983so12552464pld.1
 for <qemu-devel@nongnu.org>; Sun, 01 Aug 2021 21:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=wLlNV2XVOd1Ix8C8OuTNk678QSj1BbX2+PTGc00N4/M=;
 b=hIUwxdmFZsEoK1N97zknyr1/+Dxn2lhkY1rdYilA6jsK2LYHTO9FDf/mpjK8zK4ADS
 t94LGJKymYIHY31XfJfNrNgvV/WcTan45TcPEauuLeWgMf3aLu6JIW5C/yFoTcAQqc23
 6M6IUXI+ALAjNyqIEQ6lhOxs4kK+ZJeqcjAx5D99vUGpoLGcN7S7YhKliEv57hth1fgz
 xH3lpuW+kS5ELcexyuqZcc608KXvOv4mV5W/2GrwKNxrzYOdDePOrOub1KqcRQJBWWXg
 Na/APgxSj77g1bwOyri/aEnrTYkBJ6f3OEAezsuDwih+RxjX7SUo6EEKHMWRRFOgZ3wt
 yc/Q==
X-Gm-Message-State: AOAM532B1Guxxh4hQ/p/c3Pb5GkkWD0hjf2rGdoWCIbn3mnSyZ3ckoV1
 A+wOcCmx2pX4ORSqfpZ9pzelbf4t1wKWKdPiqha8HJX+M69xU1la4OCn4kmcXEntI1R+B+ZO9KB
 wMOEz4MA2ndq587VGfju2INTmWKUfFocgCLPRseAIJ7KmQVXQ9yvFfpX5P0T+b0xsBrI=
X-Received: by 2002:a17:90b:3ecc:: with SMTP id
 rm12mr13427244pjb.93.1627877140488; 
 Sun, 01 Aug 2021 21:05:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyebOxbBxHNWS+jR2b8isnqcifRtzMXAlhgOcwNMlZiOz/Jnc20a9fgjyY5GUhEjAmCJihX6w==
X-Received: by 2002:a17:90b:3ecc:: with SMTP id
 rm12mr13427228pjb.93.1627877140237; 
 Sun, 01 Aug 2021 21:05:40 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id 136sm8715653pge.77.2021.08.01.21.05.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Aug 2021 21:05:39 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] hw/net: e1000e: Correct the initial value of VET
 register
To: Bin Meng <bmeng.cn@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <20210723075512.84897-1-bmeng.cn@gmail.com>
 <20210723075512.84897-2-bmeng.cn@gmail.com>
 <CAEUhbmVcAj+Je=ynuPCaOLwsgq6a-XhTEk3KTH=AJFEnXCcPhg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <91bac370-5200-780a-96ff-5e972e7ab1c0@redhat.com>
Date: Mon, 2 Aug 2021 12:05:36 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmVcAj+Je=ynuPCaOLwsgq6a-XhTEk3KTH=AJFEnXCcPhg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.08, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/7/30 上午9:21, Bin Meng 写道:
> Hi Jason,
>
> On Fri, Jul 23, 2021 at 3:55 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>> From: Christina Wang <christina.wang@windriver.com>
>>
>> The initial value of VLAN Ether Type (VET) register is 0x8100, as per
>> the manual and real hardware.
>>
>> While Linux e1000e driver always writes VET register to 0x8100, it is
>> not always the case for everyone. Drivers relying on the reset value
>> of VET won't be able to transmit and receive VLAN frames in QEMU.
>>
>> Unlike e1000 in QEMU, e1000e uses a field 'vet' in "struct E1000Core"
>> to cache the value of VET register, but the cache only gets updated
>> when VET register is written. To always get a consistent VET value
>> no matter VET is written or remains its reset value, drop the 'vet'
>> field and use 'core->mac[VET]' directly.
>>
>> Reported-by: Markus Carlstedt <markus.carlstedt@windriver.com>
>> Signed-off-by: Christina Wang <christina.wang@windriver.com>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>>
>> ---
>>
>> Changes in v4:
>> - Only keep hw_compat_6_0[] changes
>>
>> Changes in v3:
>> - add a "init-vet" property for versioned machines
>>
>> Changes in v2:
>> - keep the 'vet' field in "struct E1000Core" for migration compatibility
>>
>>   hw/core/machine.c    | 1 +
>>   hw/net/e1000e.c      | 8 +++++++-
>>   hw/net/e1000e_core.c | 9 ++++-----
>>   3 files changed, 12 insertions(+), 6 deletions(-)
>>
> Will this series be in 6.1?
>
> Regards,
> Bin


Yes, I've applied them.

Thanks



