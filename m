Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4A35FD40F
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 07:08:24 +0200 (CEST)
Received: from localhost ([::1]:34350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiqSF-0004AA-BD
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 01:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oiqMe-0006u3-8T
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 01:02:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oiqMa-0007ad-Ly
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 01:02:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665637348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qnMlR6wAK3uhS18u8LbKe2JwEWd8NKGru9PuR9h2IAs=;
 b=R5HbOUejnPHGWQO25TSbCtlmfB/PgWErKtNTtQ6NOTmZdoR48db309gZMCQ0SAkUXM6yJX
 NxlGl0SJEgM5cz5ohaD5+r4iISkmI74qtcR4QChS5Wo+uyZ0X7PRQQ1xlCRjslbH2Mz8P+
 7viFw0aWpqliWkY+C7hOuzM+REdqwVU=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-578-_TduIPRdPt6yfMB7Xp7Kwg-1; Thu, 13 Oct 2022 01:02:27 -0400
X-MC-Unique: _TduIPRdPt6yfMB7Xp7Kwg-1
Received: by mail-pf1-f199.google.com with SMTP id
 cv12-20020a056a0044cc00b00562f6351e09so598162pfb.3
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 22:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qnMlR6wAK3uhS18u8LbKe2JwEWd8NKGru9PuR9h2IAs=;
 b=usXpX2QSgpg4r2h6LgyBwh/NtsPUunzTkLq9fx31WzLA6QZ1epLmjIuRi6vnzIE8LK
 A6nCERKyuyKFkjVS15iu/L5ZnU2NFDiq+9yNVcRjzE+UOeWx2HfiT1FIkYu/cimrMiq3
 GiyNY9w8EZWV6UuBbZR+P2hJ77kKzypRqobrN895hNb+FEH2eLzhWZONcp5WY1FvxpL7
 L9xgZwhwnWb0+JNqIGPk69kzOlsMOFb3vfhH45eOiSU1yUMl7UxWKLgjTXkQPNZB5hpx
 6hX3XFGJj7FkA7OcxWu1RNuanMlpykBKtoEqdGhRlw+D5RshygGnOjBvdqa3nmLEsHG0
 FBRw==
X-Gm-Message-State: ACrzQf0/FpxMKHZzLtEYhXJM2xm148Dfh+fQXfK2oHsuLvN1YMmE/Mzm
 LD0b9J2Xp1qOmdFwR+kCyWm74UwAxgzH+dmZbjn9ue0AkouEO18NAFJFsTgzjBsKRCbwdJElIC0
 sYh0l+jedjE7ZEW0=
X-Received: by 2002:a17:90b:3755:b0:20d:9df4:be01 with SMTP id
 ne21-20020a17090b375500b0020d9df4be01mr3987399pjb.51.1665637346479; 
 Wed, 12 Oct 2022 22:02:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4J1q5hcpEcn6XWbQOq5/wya7vKSutNAVxxIz0+myd7P7sCd/jP28hFN882M5LltrPiU1HHpA==
X-Received: by 2002:a17:90b:3755:b0:20d:9df4:be01 with SMTP id
 ne21-20020a17090b375500b0020d9df4be01mr3987363pjb.51.1665637346105; 
 Wed, 12 Oct 2022 22:02:26 -0700 (PDT)
Received: from [10.72.13.14] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 186-20020a6217c3000000b005613220346asm768286pfx.205.2022.10.12.22.02.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Oct 2022 22:02:25 -0700 (PDT)
Message-ID: <6310b693-b885-3242-9579-92f189f0d1b5@redhat.com>
Date: Thu, 13 Oct 2022 13:02:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v2] vhost-vdpa: allow passing opened vhostfd to vhost-vdpa
Content-Language: en-US
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 eperezma@redhat.com, Cindy Lu <lulu@redhat.com>
References: <1665215938-24473-1-git-send-email-si-wei.liu@oracle.com>
 <CACGkMEuc3Kwjt8r7HsU_-s-AVsAiMXddYZ0Um0sAhN6igaMn7Q@mail.gmail.com>
 <fff559ab-ce66-5830-f5da-e0d9e61adf59@oracle.com>
 <CACGkMEu6h5kHX1isY7GaVGySjE+2+hkM0pMXmdUTmC7HkoFg-Q@mail.gmail.com>
 <1c114850-c96a-b5d4-f44b-3699fc19b8dc@oracle.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <1c114850-c96a-b5d4-f44b-3699fc19b8dc@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.528, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/10/12 13:59, Si-Wei Liu 写道:
>
>
> On 10/11/2022 8:09 PM, Jason Wang wrote:
>> On Tue, Oct 11, 2022 at 1:18 AM Si-Wei Liu<si-wei.liu@oracle.com>  wrote:
>>> On 10/8/2022 10:43 PM, Jason Wang wrote:
>>>
>>> On Sat, Oct 8, 2022 at 5:04 PM Si-Wei Liu<si-wei.liu@oracle.com>  wrote:
>>>
>>> Similar to other vhost backends, vhostfd can be passed to vhost-vdpa
>>> backend as another parameter to instantiate vhost-vdpa net client.
>>> This would benefit the use case where only open file descriptors, as
>>> opposed to raw vhost-vdpa device paths, are accessible from the QEMU
>>> process.
>>>
>>> (qemu) netdev_add type=vhost-vdpa,vhostfd=61,id=vhost-vdpa1
>>>
>>> Adding Cindy.
>>>
>>> This has been discussed before, we've already had
>>> vhostdev=/dev/fdset/$fd which should be functional equivalent to what
>>> has been proposed here. (And this is how libvirt works if I understand
>>> correctly).
>>>
>>> Yes, I was aware of that discussion. However, our implementation of the management software is a bit different from libvirt, in which the paths in /dev/fdset/NNN can't be dynamically passed to the container where QEMU is running. By using a specific vhostfd property with existing code, it would allow our mgmt software smooth adaption without having to add too much infra code to support the /dev/fdset/NNN trick.
>> I think fdset has extra flexibility in e.g hot-plug to allow the file
>> descriptor to be passed with SCM_RIGHTS.
> Yes, that's exactly the use case we'd like to support. Though the 
> difference in our mgmt software stack from libvirt is that any dynamic 
> path in /dev (like /dev/fdset/ABC or /dev/vhost-vdpa-XYZ) can't be 
> allowed to get passed through to the container running QEMU on the fly 
> for security reasons. fd passing is allowed, though, with very strict 
> security checks.


Interesting, any reason for disallowing fd passing? I'm asking since 
it's the way that libvirt work and it seems to me we don't get any 
complaints in the past.


> That's the main motivation for this direct vhostfd passing support 
> (noted fdset doesn't need to be used along with /dev/fdset node).
>
> Having it said, I found there's also nuance in the 
> vhostdev=/dev/fdset/XyZ interface besides the /dev node limitation: 
> the fd to open has to be dup'ed from the original one passed via 
> SCM_RIGHTS. This also has implication on security that any ioctl call 
> from QEMU can't be audited through the original fd.


I'm not sure I get this, but management layer can enforce a ioctl 
whiltelist for safety.

Thanks


> With this regard, I think vhostfd offers more flexibility than work 
> around those qemu_open() specifics. Would these justify the use case 
> of concern?
>
> Thanks,
> -Siwei
>
>>   It would still be good to add
>> the support.
>>
>>> On the other hand, the other vhost backends, e.g. tap (via vhost-net), vhost-scsi and vhost-vsock all accept vhostfd as parameter to instantiate device, although the /dev/fdset trick also works there. I think vhost-vdpa is not  unprecedented in this case?
>> Yes.
>>
>> Thanks
>>
>>> Thanks,
>>> -Siwei
>>>
>>>
>>>
>>> Thanks
>>>
>>> Signed-off-by: Si-Wei Liu<si-wei.liu@oracle.com>
>>> Acked-by: Eugenio Pérez<eperezma@redhat.com>
>>>
>>> ---
>>> v2:
>>>    - fixed typo in commit message
>>>    - s/fd's/file descriptors/
>>> ---
>>>   net/vhost-vdpa.c | 25 ++++++++++++++++++++-----
>>>   qapi/net.json    |  3 +++
>>>   qemu-options.hx  |  6 ++++--
>>>   3 files changed, 27 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>>> index 182b3a1..366b070 100644
>>> --- a/net/vhost-vdpa.c
>>> +++ b/net/vhost-vdpa.c
>>> @@ -683,14 +683,29 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>>
>>>       assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>>>       opts = &netdev->u.vhost_vdpa;
>>> -    if (!opts->vhostdev) {
>>> -        error_setg(errp, "vdpa character device not specified with vhostdev");
>>> +    if (!opts->has_vhostdev && !opts->has_vhostfd) {
>>> +        error_setg(errp,
>>> +                   "vhost-vdpa: neither vhostdev= nor vhostfd= was specified");
>>>           return -1;
>>>       }
>>>
>>> -    vdpa_device_fd = qemu_open(opts->vhostdev, O_RDWR, errp);
>>> -    if (vdpa_device_fd == -1) {
>>> -        return -errno;
>>> +    if (opts->has_vhostdev && opts->has_vhostfd) {
>>> +        error_setg(errp,
>>> +                   "vhost-vdpa: vhostdev= and vhostfd= are mutually exclusive");
>>> +        return -1;
>>> +    }
>>> +
>>> +    if (opts->has_vhostdev) {
>>> +        vdpa_device_fd = qemu_open(opts->vhostdev, O_RDWR, errp);
>>> +        if (vdpa_device_fd == -1) {
>>> +            return -errno;
>>> +        }
>>> +    } else if (opts->has_vhostfd) {
>>> +        vdpa_device_fd = monitor_fd_param(monitor_cur(), opts->vhostfd, errp);
>>> +        if (vdpa_device_fd == -1) {
>>> +            error_prepend(errp, "vhost-vdpa: unable to parse vhostfd: ");
>>> +            return -1;
>>> +        }
>>>       }
>>>
>>>       r = vhost_vdpa_get_features(vdpa_device_fd, &features, errp);
>>> diff --git a/qapi/net.json b/qapi/net.json
>>> index dd088c0..926ecc8 100644
>>> --- a/qapi/net.json
>>> +++ b/qapi/net.json
>>> @@ -442,6 +442,8 @@
>>>   # @vhostdev: path of vhost-vdpa device
>>>   #            (default:'/dev/vhost-vdpa-0')
>>>   #
>>> +# @vhostfd: file descriptor of an already opened vhost vdpa device
>>> +#
>>>   # @queues: number of queues to be created for multiqueue vhost-vdpa
>>>   #          (default: 1)
>>>   #
>>> @@ -456,6 +458,7 @@
>>>   { 'struct': 'NetdevVhostVDPAOptions',
>>>     'data': {
>>>       '*vhostdev':     'str',
>>> +    '*vhostfd':      'str',
>>>       '*queues':       'int',
>>>       '*x-svq':        {'type': 'bool', 'features' : [ 'unstable'] } } }
>>>
>>> diff --git a/qemu-options.hx b/qemu-options.hx
>>> index 913c71e..c040f74 100644
>>> --- a/qemu-options.hx
>>> +++ b/qemu-options.hx
>>> @@ -2774,8 +2774,10 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>>>       "                configure a vhost-user network, backed by a chardev 'dev'\n"
>>>   #endif
>>>   #ifdef __linux__
>>> -    "-netdev vhost-vdpa,id=str,vhostdev=/path/to/dev\n"
>>> +    "-netdev vhost-vdpa,id=str[,vhostdev=/path/to/dev][,vhostfd=h]\n"
>>>       "                configure a vhost-vdpa network,Establish a vhost-vdpa netdev\n"
>>> +    "                use 'vhostdev=/path/to/dev' to open a vhost vdpa device\n"
>>> +    "                use 'vhostfd=h' to connect to an already opened vhost vdpa device\n"
>>>   #endif
>>>   #ifdef CONFIG_VMNET
>>>       "-netdev vmnet-host,id=str[,isolated=on|off][,net-uuid=uuid]\n"
>>> @@ -3280,7 +3282,7 @@ SRST
>>>                -netdev type=vhost-user,id=net0,chardev=chr0 \
>>>                -device virtio-net-pci,netdev=net0
>>>
>>> -``-netdev vhost-vdpa,vhostdev=/path/to/dev``
>>> +``-netdev vhost-vdpa[,vhostdev=/path/to/dev][,vhostfd=h]``
>>>       Establish a vhost-vdpa netdev.
>>>
>>>       vDPA device is a device that uses a datapath which complies with
>>> --
>>> 1.8.3.1
>>>
>>>
>


