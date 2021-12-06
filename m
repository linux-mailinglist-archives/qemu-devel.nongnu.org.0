Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7109B46A63B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 20:56:22 +0100 (CET)
Received: from localhost ([::1]:57712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muK61-0003Lj-7r
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 14:56:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1muK4Y-0001X9-3z
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 14:54:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1muK4W-0005Av-65
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 14:54:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638820487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r36P8UZm07GejjIxRcZRvFIhWxIK/cyhFTthU1qqFiU=;
 b=ebHEU4Ilkl1zN1pzBSbbC1Zac/hEtFSD8bqKNfEyVPw+wMwBNnuxWqGoYhTDIjyiXiE1RM
 m8HcUj8lSOKsTYe/9+L78fIwpfelA0S2cGrISR2/pPMDAakibxQcoiUukHiso7UzLEVxaX
 +d11C5GO/LfMbknPdQfC+swSWAKlcGk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-a-iuJ5QnMrCP211RXDqx-A-1; Mon, 06 Dec 2021 14:54:46 -0500
X-MC-Unique: a-iuJ5QnMrCP211RXDqx-A-1
Received: by mail-wm1-f72.google.com with SMTP id
 g81-20020a1c9d54000000b003330e488323so149773wme.0
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 11:54:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=r36P8UZm07GejjIxRcZRvFIhWxIK/cyhFTthU1qqFiU=;
 b=IgjyJmB48Nh7+7uSBQwdKYNqzemryastN24h/kQEmrIo4puyIrYhMetLAzvVVG/itT
 8tpfbuzO7Tpn3RPFyU6pi4guh0IcM0pS51Z9UxCgC+8JvcbedCf09mzPfFvtZ21wFUeT
 FjjU1eqYDZrqnrsqfDK17RIyB/KyjIZvp7iajD3HnpslgPXiL930ROyNnE4neCxGxsO4
 E/o3L5iyIyyRrd7qfy6k+eFAE4P5ivYzSeSHdJdsZUPhHq6xli2JkfoFCmMDr06SReZ9
 H41IkjaWh+729/YA5I+7zzIomZkR2/GpPjJzJ/31CbTvSiudi+GDQONIikabdmLrac5h
 PAiQ==
X-Gm-Message-State: AOAM532FpzdrW/HGHEiBKEj5SgTHrMnNEerkSNIZNXG4sOXmdut4DPvJ
 CAaqnNhhI+dOP20iw7loJZKdxeeNf02qIsELpIdnYu2Qr4PRwvnv22czHPc0Uno8hm8R7wOhOyO
 BKD7wm+uJMwAPGF4=
X-Received: by 2002:a05:600c:1ca4:: with SMTP id
 k36mr803409wms.169.1638820483883; 
 Mon, 06 Dec 2021 11:54:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwO6lI2Wb4qLp3BxIHV0FLi40AmyEurrJ0TBA+WDgQ03K5mJvKWFhiuSDmXk6RFNd3/+QojmQ==
X-Received: by 2002:a05:600c:1ca4:: with SMTP id
 k36mr803367wms.169.1638820483636; 
 Mon, 06 Dec 2021 11:54:43 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id z8sm12804119wrh.54.2021.12.06.11.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 11:54:43 -0800 (PST)
Date: Mon, 6 Dec 2021 19:54:41 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Li Zhang <lizhang@suse.de>
Subject: Re: [PATCH v2 0/1] migration: multifd live migration improvement
Message-ID: <Ya5qgYpDrN79A+jl@work-vm>
References: <20211203115533.31534-1-lizhang@suse.de>
MIME-Version: 1.0
In-Reply-To: <20211203115533.31534-1-lizhang@suse.de>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, berrange@redhat.com, cfontana@suse.de,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Li Zhang (lizhang@suse.de) wrote:
> When testing live migration with multifd channels (8, 16, or a bigger number)
> and using qemu -incoming (without "defer"), if a network error occurs
> (for example, triggering the kernel SYN flooding detection),
> the migration fails and the guest hangs forever.
> 
> The test environment and the command line is as the following:
> 
> QEMU verions: QEMU emulator version 6.2.91 (v6.2.0-rc1-47-gc5fbdd60cf)
> Host OS: SLE 15  with kernel: 5.14.5-1-default
> Network Card: mlx5 100Gbps
> Network card: Intel Corporation I350 Gigabit (1Gbps)
> 
> Source:
> qemu-system-x86_64 -M q35 -smp 32 -nographic \
>         -serial telnet:10.156.208.153:4321,server,nowait \
>         -m 4096 -enable-kvm -hda /var/lib/libvirt/images/openSUSE-15.3.img \
>         -monitor stdio
> Dest:
> qemu-system-x86_64 -M q35 -smp 32 -nographic \
>         -serial telnet:10.156.208.154:4321,server,nowait \
>         -m 4096 -enable-kvm -hda /var/lib/libvirt/images/openSUSE-15.3.img \
>         -monitor stdio \
>         -incoming tcp:1.0.8.154:4000
> 
> (qemu) migrate_set_parameter max-bandwidth 100G
> (qemu) migrate_set_capability multifd on
> (qemu) migrate_set_parameter multifd-channels 16
> 
> The guest hangs when executing the command: migrate -d tcp:1.0.8.154:4000.
> 
> If a network problem happens, TCP ACK is not received by destination
> and the destination resets the connection with RST.
> 
> No.     Time    Source  Destination     Protocol        Length  Info
> 119     1.021169        1.0.8.153       1.0.8.154       TCP     1410    60166 → 4000 [PSH, ACK] Seq=65 Ack=1 Win=62720 Len=1344 TSval=1338662881 TSecr=1399531897
> No.     Time    Source  Destination     Protocol        Length  Info
> 125     1.021181        1.0.8.154       1.0.8.153       TCP     54      4000 → 60166 [RST] Seq=1 Win=0 Len=0
> 
> kernel log:
> [334520.229445] TCP: request_sock_TCP: Possible SYN flooding on port 4000. Sending cookies.  Check SNMP counters.
> [334562.994919] TCP: request_sock_TCP: Possible SYN flooding on port 4000. Sending cookies.  Check SNMP counters.
> [334695.519927] TCP: request_sock_TCP: Possible SYN flooding on port 4000. Sending cookies.  Check SNMP counters.
> [334734.689511] TCP: request_sock_TCP: Possible SYN flooding on port 4000. Sending cookies.  Check SNMP counters.
> [335687.740415] TCP: request_sock_TCP: Possible SYN flooding on port 4000. Sending cookies.  Check SNMP counters.
> [335730.013598] TCP: request_sock_TCP: Possible SYN flooding on port 4000. Sending cookies.  Check SNMP counters.

Should we document somewhere how to avoid that?  Is there something we
should be doing in the connection code to avoid it?

Dave

> There are two problems here:
> 1. On the send side, the main thread is blocked on qemu_thread_join and 
>    send threads are blocked on sendmsg
> 2. On receive side, the receive threads are blocked on qemu_sem_wait to 
>    wait for a semaphore. 
> 
> The patch is to fix the first problem, and the guest doesn't hang any more. 
> But there is no better solution to fix the second problem yet. 
> 
> Li Zhang (1):
>   multifd: Shut down the QIO channels to avoid blocking the send threads
>     when they are terminated.
> 
>  migration/multifd.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


