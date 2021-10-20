Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C42C434B0D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 14:19:19 +0200 (CEST)
Received: from localhost ([::1]:34800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdAYv-0004z5-W5
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 08:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mdAXB-0004A1-7M
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 08:17:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mdAX7-0003ij-4T
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 08:17:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634732240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fhGJmC9TY0vLpdVNFp7sx9LfsEtJ18UEX4+Y0ABarGM=;
 b=ha3ZKqyfPHyvL49YX+vYQUrNe+u2uXwrERtB/dhC41p3I0HLBG1rj5cZiT7g+nKwruDF+r
 5dMu3nMUSQv9ha+8g1rBRytkel1OljtCsj3vfYZinMB3264D/9HVGcxeIvz16A+P8yxL6Z
 gqQocShjuJpLTluhXeE8Gs9uHXKl/qA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-l4NcQOZTPDK5pyWWQmessA-1; Wed, 20 Oct 2021 08:17:19 -0400
X-MC-Unique: l4NcQOZTPDK5pyWWQmessA-1
Received: by mail-wm1-f72.google.com with SMTP id
 n189-20020a1c27c6000000b00322f2e380f2so221755wmn.6
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 05:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=fhGJmC9TY0vLpdVNFp7sx9LfsEtJ18UEX4+Y0ABarGM=;
 b=QxrJ/d8vTQrRy4HkrtFK+NZ0qaWfo+NOhFYnj1eMFJAErxXokulrNJJn0TV+nlsZ/+
 J0LKeZh2qxr6iDCWAx5j3Qe2qDXqN74JP40Beg7erf78+yGjYstzplilnIqGkC2wVuth
 HEGyC809ojr+Tyuzn+hIduvtcAQcqIWf17wqWbWL62SIjCr3rRCBp/X8tEkSTbgyfpAx
 bfEDcJ6ScdSU4NCy2F6TrWnHXJ8J3JN7tHxp9eJQ88xvMD/ZK7+S/fLQgJfCc2kQvEnj
 OlSa5dmOLX9GrJr8/HrEri+FS9x213vHXYf6mXwf1Lk4JRusdYEsA8klTnnicYpNMIho
 56cg==
X-Gm-Message-State: AOAM533X75rDjV00gylRIR4imnJpTQlMK4P8bKYWcoS88qcZjK+F6z04
 L8MZuKER0rx+9a4xVfCQ/bLBxbQy/GJTNWYFAfYK+2oT4g/d6Sg+Vf9X7Xiox3AHKO5QEJ0i32U
 Dmix/0CBjbybbYxQ=
X-Received: by 2002:a05:6000:1889:: with SMTP id
 a9mr53671274wri.400.1634732238612; 
 Wed, 20 Oct 2021 05:17:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjGtA4AGK9B37RdnKxHs2oKACMVNkuT2Pv/tOfYqupesf0aLNQE8hqQiSudZczXDnrMe1fNw==
X-Received: by 2002:a05:6000:1889:: with SMTP id
 a9mr53671102wri.400.1634732237336; 
 Wed, 20 Oct 2021 05:17:17 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c63d4.dip0.t-ipconnect.de. [91.12.99.212])
 by smtp.gmail.com with ESMTPSA id
 t21sm1778595wmi.19.2021.10.20.05.17.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 05:17:16 -0700 (PDT)
Message-ID: <81fc0417-8335-cbce-e4ad-53cbb52183a6@redhat.com>
Date: Wed, 20 Oct 2021 14:17:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH RFC 12/15] virtio-mem: Expose device memory via separate
 memslots
From: David Hildenbrand <david@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20211013103330.26869-1-david@redhat.com>
 <20211013103330.26869-13-david@redhat.com> <YWgYdWXsiI2mcfak@work-vm>
 <83270a38-a179-b2c5-9bab-7dd614dc07d6@redhat.com>
Organization: Red Hat
In-Reply-To: <83270a38-a179-b2c5-9bab-7dd614dc07d6@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.10.21 15:17, David Hildenbrand wrote:
> On 14.10.21 13:45, Dr. David Alan Gilbert wrote:
>> * David Hildenbrand (david@redhat.com) wrote:
>>> KVM nowadays supports a lot of memslots. We want to exploit that in
>>> virtio-mem, exposing device memory via separate memslots to the guest
>>> on demand, essentially reducing the total size of KVM slots
>>> significantly (and thereby metadata in KVM and in QEMU for KVM memory
>>> slots) especially when exposing initially only a small amount of memory
>>> via a virtio-mem device to the guest, to hotplug more later. Further,
>>> not always exposing the full device memory region to the guest reduces
>>> the attack surface in many setups without requiring other mechanisms
>>> like uffd for protection of unplugged memory.
>>>
>>> So split the original RAM region via memory region aliases into separate
>>> chunks (ending up as individual memslots), and dynamically map the
>>> required chunks (falling into the usable region) into the container.
>>>
>>> For now, we always map the memslots covered by the usable region. In the
>>> future, with VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE, we'll be able to map
>>> memslots on actual demand and optimize further.
>>>
>>> Users can specify via the "max-memslots" property how much memslots the
>>> virtio-mem device is allowed to use at max. "0" translates to "auto, no
>>> limit" and is determinded automatically using a heuristic. When a maximum
>>> (> 1) is specified, that auto-determined value is capped. The parameter
>>> doesn't have to be migrated and can differ between source and destination.
>>> The only reason the parameter exists is not make some corner case setups
>>> (multiple large virtio-mem devices assigned to a single virtual NUMA node
>>>  with only very limited available memslots, hotplug of vhost devices) work.
>>> The parameter will be set to be "0" as default soon, whereby it will remain
>>> to be "1" for compat machines.
>>>
>>> The properties "memslots" and "used-memslots" are read-only.
>>>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>
>> I think you need to move this patch after the vhost-user patches so that
>> you don't break a bisect including vhost-user.
> 
> As the default is set to 1 and is set to 0 ("auto") in the last patch in
> this series, there should be (almost) no difference regarding vhost-user.
> 
>>
>> But I do worry about the effect on vhost-user:
> 
> The 4096 limit was certainly more "let's make it extreme so we raise
> some eyebrows and we can talk about the implications". I'd be perfectly
> happy with 256 or better 512. Anything that's bigger than 32 in case of
> virtiofsd :)
> 
>>   a) What about external programs like dpdk?
> 
> At least initially virtio-mem won't apply to dpdk and similar workloads
> (RT). For example, virtio-mem is incompatible with mlock. So I think the
> most important use case to optimize for is virtio-mem+virtiofsd
> (especially kata).
> 
>>   b) I worry if you end up with a LOT of slots you end up with a lot of
>> mmap's and fd's in vhost-user; I'm not quite sure what all the effects
>> of that will be.
> 
> At least for virtio-mem, there will be a small number of fd's, as many
> memslots share the same fd, so with virtio-mem it's not an issue.
> 
> #VMAs is indeed worth discussing. Usually we can have up to 64k VMAs in
> a process. The downside of having many is some reduce pagefault
> performance. It really also depends on the target application. Maybe
> there should be some libvhost-user toggle, where the application can opt
> in to allow more?
> 

I just did a simple test with memfds. The 1024 open fds limit does not
apply to fds we already closed again.

So the 1024 limit does not apply when done via

fd = open()
addr = mmap(fd)
close(fd)

For example, I did a simple test by creating 4096 memfds, mapping them,
and then closing the file. The end result is

$ ls -la /proc/38113/map_files/ | wc -l
4115
$ ls -la /proc/38113/fd/ | wc -l
6

Meaning there are many individual mappings, but only very limited open files

Which should be precisely what we are doing in libvhost-user code (and
should be doing in any other vhost-user code -- once we did the mmap(),
we should let go of the fd).

-- 
Thanks,

David / dhildenb


