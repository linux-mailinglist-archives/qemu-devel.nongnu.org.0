Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7FB6F7F7E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 11:05:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1purLa-0002i7-D4; Fri, 05 May 2023 05:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1purLX-0002hp-V6
 for qemu-devel@nongnu.org; Fri, 05 May 2023 05:03:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1purLV-0006Em-SV
 for qemu-devel@nongnu.org; Fri, 05 May 2023 05:03:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683277401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z74B51iQ/W/nGgdOwrHPKGumnAVq89Jp/frJqX4LwJA=;
 b=X3f6ZxCub3Xy9cw3QlkcoXLj+Ryvpd4nWxktmDaHVPoZH/mAlb6hsOto6Lwiiw1KcNmjGM
 miXBqmwldHEDG5EDOHhMUIcb25l2pBo4mVGRwjGIE9+gftsN1rdg4PyHXq1mAaj9eF6p8Z
 QYzKEV7fl00GkQEIKc4gJXGBLiQWJSs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-uSqHsHMqOA2Hg3fmxKtBiw-1; Fri, 05 May 2023 05:03:20 -0400
X-MC-Unique: uSqHsHMqOA2Hg3fmxKtBiw-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-965f0c4ae32so12533266b.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 02:03:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683277399; x=1685869399;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z74B51iQ/W/nGgdOwrHPKGumnAVq89Jp/frJqX4LwJA=;
 b=TjcUsy83BbC5qvvB2DjlD30s7OeJ9P0Hrg7Qi7pix7cheD2nC4sU0cgHgBAta26uIz
 vZ2wNcMnNWYxQmhIoaP7DmdS/xwAdjq47a9r0vsKMvX39YaJ5XR0qP4a+CK9wQWy5Rzn
 pvGIKS0hB3F7g+AA5PnOP9nB3mCFXLyDHqRKuODrrjw5NZeXJhbKxUPYLXbXGRNcN13o
 a2tjmFP5MG8Ygx883+Tdj8zMy75CIQDYP9N9pUn+7TnVMTF5u6cFn/zYtx0DZ5iS4UEJ
 E8Kl0gzYzrCAJ1XmANDj4o8AOwhCbQLXUTsawDpKRUHMU7R4+pzR34IqnpENsO9JE3Va
 W1RQ==
X-Gm-Message-State: AC+VfDzN2yDoAOcLctD++iL6upJwY4vSI5EKKAJm5BnaA4yC7Tcvc9Rj
 eBm6FLKDgC6NSFb3oXAv1zje429hjegMA+sY/aMdKebMsMmTdRJBJqagffBdxmZsQS+6jQiWWcY
 tSMW0wTzmDTUt7IU=
X-Received: by 2002:a17:906:6a14:b0:960:7643:c972 with SMTP id
 qw20-20020a1709066a1400b009607643c972mr547514ejc.55.1683277398975; 
 Fri, 05 May 2023 02:03:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ46Kr+328WE5Um5HjRcxeZTvfz/UBAwIsBDRLYF5WyVNJ0gxB7TWKyGQAYw6iHXR/m4GWTZ+w==
X-Received: by 2002:a17:906:6a14:b0:960:7643:c972 with SMTP id
 qw20-20020a1709066a1400b009607643c972mr547470ejc.55.1683277398552; 
 Fri, 05 May 2023 02:03:18 -0700 (PDT)
Received: from ?IPV6:2003:cf:d738:349d:9681:f818:3410:5693?
 (p200300cfd738349d9681f81834105693.dip0.t-ipconnect.de.
 [2003:cf:d738:349d:9681:f818:3410:5693])
 by smtp.gmail.com with ESMTPSA id
 hz17-20020a1709072cf100b0094e96e46cc0sm676166ejc.69.2023.05.05.02.03.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 02:03:17 -0700 (PDT)
Message-ID: <dfec96a1-84c3-3639-6f09-204c2d12244a@redhat.com>
Date: Fri, 5 May 2023 11:03:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/4] vhost-user-fs: Internal migration
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, German Maglione
 <gmaglione@redhat.com>, Anton Kuchin <antonkuchin@yandex-team.ru>,
 Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Eugenio Perez Martin <eperezma@redhat.com>
References: <20230411150515.14020-1-hreitz@redhat.com>
 <e8cc4521-50a1-2e38-1fb3-8cfa7b0c967e@redhat.com>
 <CAJSP0QUFFYWwD5+8+1q41sNErJVNbkfnQ3VtB4z-HZUV8S0=zw@mail.gmail.com>
Content-Language: en-US
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <CAJSP0QUFFYWwD5+8+1q41sNErJVNbkfnQ3VtB4z-HZUV8S0=zw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 04.05.23 23:14, Stefan Hajnoczi wrote:
> On Thu, 4 May 2023 at 13:39, Hanna Czenczek <hreitz@redhat.com> wrote:
>> On 11.04.23 17:05, Hanna Czenczek wrote:
>>
>> [...]
>>
>>> Hanna Czenczek (4):
>>>     vhost: Re-enable vrings after setting features
>>>     vhost-user: Interface for migration state transfer
>>>     vhost: Add high-level state save/load functions
>>>     vhost-user-fs: Implement internal migration
>> I’m trying to write v2, and my intention was to keep the code
>> conceptually largely the same, but include in the documentation change
>> thoughts and notes on how this interface is to be used in the future,
>> when e.g. vDPA “extensions” come over to vhost-user.  My plan was to,
>> based on that documentation, discuss further.
>>
>> But now I’m struggling to even write that documentation because it’s not
>> clear to me what exactly the result of the discussion was, so I need to
>> stop even before that.
>>
>> So as far as I understand, we need/want SUSPEND/RESUME for two reasons:
>> 1. As a signal to the back-end when virt queues are no longer to be
>> processed, so that it is clear that it will not do that when asked for
>> migration state.
>> 2. Stateful devices that support SET_STATUS receive a status of 0 when
>> the VM is stopped, which supposedly resets the internal state. While
>> suspended, device state is frozen, so as far as I understand, SUSPEND
>> before SET_STATUS would have the status change be deferred until RESUME.
> I'm not sure about SUSPEND -> SET_STATUS 0 -> RESUME. I guess the
> device would be reset right away and it would either remain suspended
> or be resumed as part of reset :).
>
> Unfortunately the concepts of SUSPEND/RESUME and the Device Status
> Field are orthogonal and there is no spec that explains how they
> interact.

Ah, OK.  So I guess it’s up to the implementation to decide whether the 
virtio device status counts as part of the “configuration” that “[it] 
must not change”.

>> I don’t want to hang myself up on 2 because it doesn’t really seem
>> important to this series, but: Why does a status of 0 reset the internal
>> state?  [Note: This is all virtio_reset() seems to do, set the status to
>> 0.]  The vhost-user specification only points to the virtio
>> specification, which doesn’t say anything to that effect. Instead, an
>> explicit device reset is mentioned, which would be
>> VHOST_USER_RESET_DEVICE, i.e. something completely different. Because
>> RESET_DEVICE directly contradicts SUSPEND’s description, I would like to
>> think that invoking RESET_DEVICE on a SUSPEND-ed device is just invalid.
> The vhost-user protocol didn't have the concept of the VIRTIO Device
> Status Field until SET_STATUS was added.
>
> In order to participate in the VIRTIO device lifecycle to some extent,
> the pre-SET_STATUS vhost-user protocol relied on vhost-user-specific
> messages like RESET_DEVICE.
>
> At the VIRTIO level, devices are reset by setting the Device Status
> Field to 0.

(I didn’t find this in the virtio specification until today, turns out 
it’s under 4.1.4.3 “Common configuration structure layout”, not under 
2.1 “Device Status Field”, where I was looking.)

> All state is lost and the Device Initialization process
> must be followed to make the device operational again.
>
> Existing vhost-user backends don't implement SET_STATUS 0 (it's new).
>
> It's messy and not your fault. I think QEMU should solve this by
> treating stateful devices differently from non-stateful devices. That
> way existing vhost-user backends continue to work and new stateful
> devices can also be supported.

It’s my understanding that SET_STATUS 0/RESET_DEVICE is problematic for 
stateful devices.  In a previous email, you wrote that these should 
implement SUSPEND+RESUME so qemu can use those instead.  But those are 
separate things, so I assume we just use SET_STATUS 0 when stopping the 
VM because this happens to also stop processing vrings as a side effect?

I.e. I understand “treating stateful devices differently” to mean that 
qemu should use SUSPEND+RESUME instead of SET_STATUS 0 when the back-end 
supports it, and stateful back-ends should support it.

>> Is it that a status 0 won’t explicitly reset the internal state, but
>> because it does mean that the driver is unbound, the state should
>> implicitly be reset?
> I think the fundamental problem is that transports like virtio-pci put
> registers back in their initialization state upon reset, so internal
> state is lost.
>
> The VIRTIO spec does not go into detail on device state across reset
> though, so I don't think much more can be said about the semantics.
>
>> Anyway.  1 seems to be the relevant point for migration.  As far as I
>> understand, currently, a vhost-user back-end has no way of knowing when
>> to stop processing virt queues.  Basically, rings can only transition
>> from stopped to started, but not vice versa.  The vhost-user
>> specification has this bit: “Once the source has finished migration,
>> rings will be stopped by the source. No further update must be done
>> before rings are restarted.”  It just doesn’t say how the front-end lets
>> the back-end know that the rings are (to be) stopped.  So this seems
>> like a pre-existing problem for stateless migration.  Unless this is
>> communicated precisely by setting the device status to 0?
> No, my understanding is different. The vhost-user spec says the
> backend must "stop [the] ring upon receiving
> ``VHOST_USER_GET_VRING_BASE``".

Yes, I missed that part!

> The "Ring states" section goes into
> more detail and adds the concept of enabled/disabled too.
>
> SUSPEND is stronger than GET_VRING_BASE though. GET_VRING_BASE only
> applies to a single virtqueue, whereas SUSPEND acts upon the entire
> device, including non-virtqueue aspects like Configuration Change
> Notifications (VHOST_USER_BACKEND_CONFIG_CHANGE_MSG).
>
> You can approximate SUSPEND today by sending GET_VRING_BASE for all
> virtqueues. I think in practice this does fully stop the device even
> if the spec doesn't require it.
>
> If we want minimal changes to vhost-user, then we could rely on
> GET_VRING_BASE to suspend and SET_VRING_ENABLE to resume. And
> SET_STATUS 0 must not be sent so that the device's state is not lost.

So you mean that we’d use SUSPEND instead of SET_STATUS 0, but because 
we have no SUSPEND, we’d ensure that GET_VRING_BASE is/was called on all 
vrings?

> However, this approach means this effort needs to be redone when it's
> time to add stateful device support to vDPA and the QEMU vhost code
> will become more complex. I think it's better to agree on a proper
> model that works for both vhost-user and vhost-vdpa now to avoid more
> hacks/special cases.

Agreeing is easy, actually adding SUSPEND+RESUME to the vhost-user 
protocol is what I’d prefer to avoid. :)

The question is whether it’s really effort if we were (in qemu) to just 
implement SUSPEND as a GET_VRING_BASE to all vrings for vhost-user.  I 
don’t think there is a direct equivalent to RESUME, because the back-end 
is supposed to start rings automatically when it receives a kick, but 
that will only happen when the vCPUs run, so that should be fine.

>> Naturally, what I want to know most of all is whether you believe I can
>> get away without SUSPEND/RESUME for now.  To me, it seems like honestly
>> not really, only when turning two blind eyes, because otherwise we can’t
>> ensure that virtiofsd isn’t still processing pending virt queue requests
>> when the state transfer is begun, even when the guest CPUs are already
>> stopped.  Of course, virtiofsd could stop queue processing right there
>> and then, but…  That feels like a hack that in the grand scheme of
>> things just isn’t necessary when we could “just” introduce
>> SUSPEND/RESUME into vhost-user for exactly this.
>>
>> Beyond the SUSPEND/RESUME question, I understand everything can stay
>> as-is for now, as the design doesn’t seem to conflict too badly with
>> possible future extensions for other migration phases or more finely
>> grained migration phase control between front-end and back-end.
>>
>> Did I at least roughly get the gist?
> One part we haven't discussed much: I'm not sure how much trouble
> you'll face due to the fact that QEMU assumes vhost devices can be
> reset across vhost_dev_stop() -> vhost_dev_start(). I don't think we
> should keep a copy of the state in-memory just so it can be restored
> in vhost_dev_start().

All I can report is that virtiofsd continues to work fine after a 
cancelled/failed migration.

> I think it's better to change QEMU's vhost code
> to leave stateful devices suspended (but not reset) across
> vhost_dev_stop() -> vhost_dev_start(), maybe by introducing
> vhost_dev_suspend() and vhost_dev_resume(). Have you thought about
> this aspect?

Yes and no; I mean, I haven’t in detail, but I thought this is what’s 
meant by suspending instead of resetting when the VM is stopped.

Hanna


