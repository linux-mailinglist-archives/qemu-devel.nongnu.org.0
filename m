Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B74A37B4A9
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 05:40:46 +0200 (CEST)
Received: from localhost ([::1]:33038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgfjp-0005VY-08
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 23:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgfif-0004hf-3h
 for qemu-devel@nongnu.org; Tue, 11 May 2021 23:39:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgfic-0005EK-9C
 for qemu-devel@nongnu.org; Tue, 11 May 2021 23:39:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620790768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=46SYdU6dj5cbgwM+AJutVCt93/auOeOXtO5BAwy/o/U=;
 b=O9v8FYeBoirnmnCDOPAuXDtPY6MdFXPDh387HYMAGX35pAbUJKxBDpx+bP0HD9FNCpEN0d
 3AA4TBcwQKBSfTY68ALqEL3KTl2GuIgaNR3WASG2mz/lUMf7YHKwOW8UYi3diDK9ZKvr7+
 w3NiCXzkMRHIjskMImtNHQjfn+ATXkE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-Wfck6iacNByS2K0vnwemMg-1; Tue, 11 May 2021 23:39:27 -0400
X-MC-Unique: Wfck6iacNByS2K0vnwemMg-1
Received: by mail-wr1-f71.google.com with SMTP id
 65-20020adf82c70000b0290107593a42c3so9597413wrc.5
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 20:39:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=46SYdU6dj5cbgwM+AJutVCt93/auOeOXtO5BAwy/o/U=;
 b=A7SgHy+CSOK5vyvJsrDgxOcFlERJ1JJq+VSiyxLojIsDe9/O/WcnKXKBMEifrDOLl3
 Sv4BkhUdbalrd+BuLJiiCG6dCPDb6XM+d1E30Hq68CKWJuUVZKTTaE21PUfuOChlgwxm
 eKWwtUTT/fydYajhduQvA1izP4jFwk5k0Txxpn1+U+a8LRQQrytaAxT331TT+F5FnvfM
 SnCaDU0ToXGsgnBJm9tx/sFQ7b6k96SGsxfTyz6EeBcHYmDuNQ9s6xpJy9A4X3psH0wE
 L/u1W/rKU9EbU8cxijAvGQNRdSOc0oCpyvq3o2nuGRLfrbMYqstSLeX9TRMxasnDe0p9
 bgIw==
X-Gm-Message-State: AOAM530kkD/aTkS9nRM8dWDMl0B8AbnuqlOQC+hRqUhuOMyGV8B3fM3S
 AiKnzS+WC2fIomQGehVvue/5HdF43ScRJVs+pSr7qGa+Sq9oDABoB4dokpNVPimYMZbF+UTrYfC
 e923pNNuuyx3BYx0=
X-Received: by 2002:a05:600c:b4c:: with SMTP id
 k12mr9121826wmr.186.1620790766058; 
 Tue, 11 May 2021 20:39:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaKuypEnkwmHBMC3V7JRAmXkhi7X/yOHhDlzlGakJTR+o2Ds7K7r2pOU4aUrkVjZVo8g+VBw==
X-Received: by 2002:a05:600c:b4c:: with SMTP id
 k12mr9121803wmr.186.1620790765822; 
 Tue, 11 May 2021 20:39:25 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id h14sm33507629wrq.45.2021.05.11.20.39.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 20:39:25 -0700 (PDT)
Subject: Re: making a qdev bus available from a (non-qtree?) device
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <YJrKRsF4/38QheKn@apples.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8a68cd84-1ddf-361d-0f0d-bcf03e94363b@redhat.com>
Date: Wed, 12 May 2021 05:39:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJrKRsF4/38QheKn@apples.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: qemu-block@nongnu.org, stefanha@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/21 8:17 PM, Klaus Jensen wrote:
> Hi all,
> 
> I need some help with grok'ing qdev busses. Stefan, Michael - David
> suggested on IRC that I CC'ed you guys since you might have solved a
> similar issue with virtio devices. I've tried to study how that works,
> but I'm not exactly sure how to apply it to the issue I'm having.

The experts on this topic are Peter/Markus/Eduardo.

> Currently, to support multiple namespaces on the emulated nvme device,
> one can do something like this:
> 
>   -device nvme,id=nvme-ctrl-0,serial=foo,...
>   -device nvme-ns,id=nvme-ns-0,bus=nvme-ctrl-0,...
>   -device nvme-ns,id-nvme-ns-1,bus=nvme-ctrl-0,...
> 
> The nvme device creates an 'nvme-bus' and the nvme-ns devices has
> dc->bus_type = TYPE_NVME_BUS. This all works very well and provides a
> nice overview in `info qtree`:
> 
>   bus: main-system-bus
>   type System
>     ...
>     dev: q35-pcihost, id ""
>       ..
>       bus: pcie.0
>     type PCIE
>     ..
>     dev: nvme, id "nvme-ctrl-0"
>       ..
>       bus: nvme-ctrl-0
>         type nvme-bus
>         dev: nvme-ns, id "nvme-ns-0"
>           ..
>         dev: nvme-ns, id "nvme-ns-1"
>           ..
> 
> 
> Nice and qdevy.
> 
> We have since introduced support for NVM Subsystems through an
> nvme-subsys device. The nvme-subsys device is just a TYPE_DEVICE and
> does not show in `info qtree` (I wonder if this should actually just
> have been an -object?). Anyway. The nvme device has a 'subsys' link
> parameter and we use this to manage the namespaces across the subsystem
> that may contain several nvme devices (controllers). The problem is that
> this doesnt work too well with unplugging since if the nvme device is
> `device_del`'ed, the nvme-ns devices on the nvme-bus are unrealized
> which is not what we want. We really want the namespaces to linger,
> preferably on an nvme-bus of the nvme-subsys device so they can be
> attached to other nvme devices that may show up (or already exist) in
> the subsystem.

IIUC, while we can have unattached drives, we can't (by design) have
qdev unattached to qbus.

Not sure this is a good suggestion (bad design IMO) but you could add
a fake nvme qbus to hold the lingering nvme devices...

> The core problem I'm having is that I can't seem to create an nvme-bus
> from the nvme-subsys device and make it available to the nvme-ns device
> on the command line:
> 
>   -device nvme-subsys,id=nvme-subsys-0,...
>   -device nvme-ns,bus=nvme-subsys-0
> 
> The above results in 'No 'nvme-bus' bus found for device 'nvme-ns', even
> though I do `qbus_create_inplace()` just like the nvme device. However,
> I *can* reparent the nvme-ns device in its realize() method, so if I
> instead define it like so:
> 
>   -device nvme-subsys,id=nvme-subsys-0,...
>   -device nvme,id=nvme-ctrl-0,subsys=nvme-subsys-0
>   -device nvme-ns,bus=nvme-ctrl-0
> 
> I can then call `qdev_set_parent_bus()` and set the parent bus to the
> bus creates in the nvme-subsys device. This solves the problem since the
> namespaces are not "garbage collected" when the nvme device is removed,
> but it just feels wrong you know? Also, if possible, I'd of course
> really like to retain the nice entries in `info qtree`.
> 
> 
> Thanks,
> Klaus


