Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A4E475389
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 08:13:40 +0100 (CET)
Received: from localhost ([::1]:57240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxOTq-00089Z-ME
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 02:13:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxOKX-0005BY-JP
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:04:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxOKU-000552-Uq
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:04:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639551837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ud06VA0SnB2gM+uk2nw4CpKdkoQKBaz6HvcfK4GUEzk=;
 b=aU6vG5LMNeK4k7RPQxuVv9p/ylvhH4uCOz3gffDleeQlUOKLho7c61Oq/K7FoKmnHg0upP
 cJmxoggZzEv0aUsjzOKu6MD1fzqiGkofM8TZNxqsjcXRo92VnP5o/GHDGLGJRoYjDJwrAy
 UDkiF6NsEjYmY3lVUu7Bcm3BXSy5IN4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-BT0KdPnOPMSGfZ0UzeQqaA-1; Wed, 15 Dec 2021 02:03:54 -0500
X-MC-Unique: BT0KdPnOPMSGfZ0UzeQqaA-1
Received: by mail-wm1-f69.google.com with SMTP id
 138-20020a1c0090000000b00338bb803204so12201464wma.1
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 23:03:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ud06VA0SnB2gM+uk2nw4CpKdkoQKBaz6HvcfK4GUEzk=;
 b=4QeKi0YiKiZR1wsmUzW8nUjx4qwN6QbCbTK2ktTcXUU+lgTTjrax+X8UgJ8J4kdL1w
 utMDapemZ1KLHFCqkJqlb7rxdGZsow6kfCPSgXkwz890Cu9mRu+1OMgd9Cg9q6txo+0T
 WhG/I62Vy3lFCctbl2s4Oi+oKI6Dm3m7S2LYvVprZnek9hoBJoqR/FPm5ETKQ7yzSGzz
 YcZW1/Zp6CXNLGpd6vov7Ni89yFTbgcDT9GHWkzDL9XbaSznUIGK8/gGjhkNvdKb0oiq
 3aSgVjq2yWDz648iswjqe/nx82jCntBdj47zkhGVFyHFD6Nw2v4pZ20u8qnv6o8bI+5J
 KCow==
X-Gm-Message-State: AOAM5327Ww8137jaVGIQbNk7Csi/NP3FQVJ+jAKEhxXeMZmkRiM/YRXk
 wmMTWps23KwH6oJoJNkpkHt86h76UjSscikS9IQC8H4hAGyEgrr7Pi/tXDXwtYMF2erS/4Ac8j/
 0LY2v6c9JDZtft+g=
X-Received: by 2002:a5d:6c6c:: with SMTP id r12mr3065595wrz.532.1639551832892; 
 Tue, 14 Dec 2021 23:03:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLM1xDP6p2s9GhzFoS6CCiGkNLjDxKcAmLNn43grHXhfqVgxLRNlzh1Rf1iif/qCI9Ymbmzw==
X-Received: by 2002:a5d:6c6c:: with SMTP id r12mr3065577wrz.532.1639551832677; 
 Tue, 14 Dec 2021 23:03:52 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id e3sm1089286wrp.8.2021.12.14.23.03.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 23:03:52 -0800 (PST)
Message-ID: <f30cf42d-30e9-4529-6531-1ef9d236005a@redhat.com>
Date: Wed, 15 Dec 2021 08:03:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: modify NetdevUserOptions through QMP in QEMU 6 - how?
To: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <CABMV8QOQzLRjm1bMTPz66FXOWaO7kYiZOG1G3ZmLHnznxVv1Yg@mail.gmail.com>
 <007f7313-eeb2-ee6a-ae2e-9341324388c0@redhat.com>
 <20211214094355-mutt-send-email-mst@kernel.org>
 <CACGkMEvNyWxo-p3edf7Gdmv0tU8XLxzZfH4hOgzZZvtvNDH+KQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CACGkMEvNyWxo-p3edf7Gdmv0tU8XLxzZfH4hOgzZZvtvNDH+KQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Alexander Sosedkin <asosedkin@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-discuss@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/12/2021 04.31, Jason Wang wrote:
> On Tue, Dec 14, 2021 at 10:53 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>>
>> On Mon, Dec 13, 2021 at 09:02:15AM +0100, Thomas Huth wrote:
>>>   Hi!
>>>
>>> On 10/12/2021 18.02, Alexander Sosedkin wrote:
>>>> With QEMU 5 I could totally issue a QMP netdev_add
>>>> with the same ID to adjust the NetdevUserOptions I want,
>>>> such as restrict or hostfwd. No deleting needed,
>>>> just a netdev_add with what I want changed as a param.
>>>
>>> I'm a little bit surprised that this worked, since AFAIK there is no code in
>>> QEMU to *change* the parameters of a running netdev... likely the code added
>>> a new netdev with the same ID, replacing the old one?
>>>
>>>> With QEMU 6 it started failing, claiming the ID is already used.
>>>> And if I do netdev_del + netdev_add, I just lose connectivity.
>>>> What's even stranger, I still see old netdev attached in info network:
>>>>
>>>>> netdev_del {'id': 'net0'}
>>>> {}
>>>>> human-monitor-command {'command-line': 'info network'}
>>>> virtio-net-pci.0:
>>>> index=0,type=nic,model=virtio-net-pci,macaddr=52:54:00:12:34:56
>>>>    \ net0: index=0,type=user,net=10.0.2.0,restrict=off
>>>
>>> I think that's "normal" - there used to be problems in the past that the
>>> devices (virtio-net-pci in this case) did not like the netdevs to be removed
>>> on the fly. So the netdevs are kept around until you remove the device, too
>>> (i.e. issue a device_del for the virtio-net-pci device).
>>>
>>>>> netdev_add {'type': 'user', 'id': 'net0', 'restrict': False, 'hostfwd': [{'str': 'tcp:127.0.0.1:58239-:22'}]}
>>>> {}
>>>>> human-monitor-command {'command-line': 'info network'}
>>>> unseal: virtio-net-pci.0:
>>>> index=0,type=nic,model=virtio-net-pci,macaddr=52:54:00:12:34:56
>>>>    \ net0: index=0,type=user,net=10.0.2.0,restrict=off
>>>> net0: index=0,type=user,net=10.0.2.0,restrict=off
>>>>
>>>> What's the correct QMP command sequence to modify NetdevUserOptions?
>>>
>>> AFAIK there is no way to modify running netdevs - you'd have to delete the
>>> netdev and the device, and then add both again. But I might have missed
>>> something here, so I CC:-ed some people who might be more familiar with the
>>> details here.
>>>
>>>   Thomas
>>>
>>>
>>>> Please CC me on replies.
>>
>>
>> Wow this really goes to show how wide our feature matrix is.
>>
>> Yes it's probably an unintended side effect but yes it
>> did work it seems, so we really should not just break it
>> without warning.
>>
>>
>> Probably this one:
>>
>> commit 831734cce6494032e9233caff4d8442b3a1e7fef
>> Author: Markus Armbruster <armbru@redhat.com>
>> Date:   Wed Nov 25 11:02:20 2020 +0100
>>
>>      net: Fix handling of id in netdev_add and netdev_del
>>
>>
>>
>> Jason, what is your take here?
> 
> I might be wrong, but I agree with Thomas. Adding a netdev with the
> same ID looks wrong, if it works, it looks like a bug. 

It certainly calls for trouble as soon as you try to delete the netdev again 
- does it delete the first (inactive) instance? Does it delete the second 
active one? Does it delete both? (Otherwise it will leave a dangling 
instance behind) ...
So if changing netdev parameters on the fly is something that we want, we 
should implement this properly instead indeed, and not via such an 
accidental bug.

  Thomas


