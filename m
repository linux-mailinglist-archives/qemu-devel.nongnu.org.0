Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6876AC7F5
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 17:30:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZDib-0007Wc-RZ; Mon, 06 Mar 2023 11:29:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZDiZ-0007WO-Qe
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 11:29:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZDiX-0003ok-Qr
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 11:29:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678120180;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type: content-transfer-encoding:content-transfer-encoding;
 bh=DYFP8HuE+yaNzeKTTTVNqRqJhb/S7jiZ0JcSofqiuRU=;
 b=SM+dgYotPcIyJwBMcjTrixQXUUZy7N1HohFGAoJIXdl6jLlWUke/zfiC4Oo8T8b0XbnfOW
 PEffQY5Y8KVs1GA2yt+um0uDJuIhIEDIEU5Y013jIBkolRbqgP1OeWLsJMUWCstxoh9YKj
 gfwcdbqKcPfkUDaXJUf7ZFSE/teAChk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-Qa814mcDPVWkIq3_X3xLfw-1; Mon, 06 Mar 2023 11:29:38 -0500
X-MC-Unique: Qa814mcDPVWkIq3_X3xLfw-1
Received: by mail-ed1-f69.google.com with SMTP id
 w11-20020a05640234cb00b004b3247589b3so14887862edc.23
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 08:29:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678120177;
 h=content-transfer-encoding:subject:reply-to:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DYFP8HuE+yaNzeKTTTVNqRqJhb/S7jiZ0JcSofqiuRU=;
 b=YKzJA+TGpNcG+1MOkbVO/jenSAq/IVDpvfBSzJy4mnEwGQb+Ipkd1BFqblQ8QwHGJs
 No172V4gKqjTcmQWBFhg7TXWNjtBeMVb3pFI05dEF9oM1OtcvAhx7d2BjUwI1eE/kRX0
 MchFQI3TiEP9j4Lb1OUXLDtnUzZcAswTyMDKG7wqCwmvESt8alqC2l//NQFfQ24nQHtZ
 Y8bqsQR+k394PuK57PlH70wkkfx+FB+kgWc8Yi1FQhTiUHQpHQeNNnDCKlL/VDswuZXW
 bAKcTSbITV4AVK5Fr5NBAk2/L+pTxsfmWQ6blnM7RBJ3iYW8szNE/oK3hbEFN3gLBd1Z
 38lA==
X-Gm-Message-State: AO0yUKWRE7Mc52VzwZa2R+n9liuAIdk/Lh7YB5NJKkn+ZCJl7LWVRcpX
 PJC3x3wwBO36YZuU5CVdfSLkNQKfrMiGIeRkIa1bRHkai/+CLNtSr3lFka6oUSHP23Jfvh5idZg
 kbf+7Iq1bB9eoKwM39pWMET9wqLpWnvRDlsjt/pbZFJZ3CJ1oamlzRODubq9hc+t7COuaCJvnEL
 E=
X-Received: by 2002:a17:906:da89:b0:8b1:7de6:e292 with SMTP id
 xh9-20020a170906da8900b008b17de6e292mr14890423ejb.9.1678120177401; 
 Mon, 06 Mar 2023 08:29:37 -0800 (PST)
X-Google-Smtp-Source: AK7set/wyuFHbxDX/+lcHjnLlx2Nkm7CeI7Shdjq4qxCXPT/2t+nGQRlBbeQ12jrS6iK7BAuPFccfg==
X-Received: by 2002:a17:906:da89:b0:8b1:7de6:e292 with SMTP id
 xh9-20020a170906da8900b008b17de6e292mr14890395ejb.9.1678120177010; 
 Mon, 06 Mar 2023 08:29:37 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 fx14-20020a1709069e8e00b008e56a0d546csm4734899ejc.123.2023.03.06.08.29.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 08:29:36 -0800 (PST)
Message-ID: <52e4dfe2-128e-2a1a-b627-6aceebfbb5b0@redhat.com>
Date: Mon, 6 Mar 2023 17:29:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: qemu-devel <qemu-devel@nongnu.org>, KVM list <kvm@vger.kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: KVM Forum 2023: Call for presentations
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: "kvm-forum-2023-pc@redhat.com" <kvm-forum-2023-pc@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

###########################
KVM Forum 2023
June 14-15, 2023
Brno, Czech Republic
https://kvm-forum.qemu.org/
###########################

KVM Forum is an annual event that presents a rare opportunity for 
developers and users to discuss the state of Linux virtualization 
technology and plan for the challenges ahead. Sessions include updates 
on the state of the KVM virtualization stack, planning for the future, 
and many opportunities for attendees to collaborate.

This year's event will be held in Brno, Czech Republic on June 14-15, 
2023.  It will be in-person only and will be held right before the 
DevConf.CZ open source community conference.

June 14 will be at least partly dedicated to a hackathon or "day of 
BoFs". This will provide time for people to get together and discuss 
strategic decisions, as well as other topics that are best solved within 
smaller groups.


CALL FOR PRESENTATIONS
======================

We encourage you to submit presentations at 
https://kvm-forum.qemu.org/2023/cfp.  Suggested topics include:

* Scalability and Optimization

* Hardening and security

* Confidential computing

* Testing

* KVM and the Linux Kernel:
   * New Features and Ports
   * Device Passthrough: VFIO, mdev, vDPA
   * Network Virtualization
   * Virtio and vhost

* Virtual Machine Monitors and Management:
   * VMM Implementation: APIs, Live Migration, Performance Tuning, etc.
   * Multi-process VMMs: vhost-user, vfio-user, QEMU Storage Daemon
   * QEMU without KVM: Hypervisor.framework and other hypervisors
   * Managing KVM: Libvirt, KubeVirt, Kata Containers

* Emulation:
   * New Devices, Boards and Architectures
   * CPU Emulation and Binary Translation


IMPORTANT DATES
===============

The deadline for submitting presentations is April 2, 2023 - 11:59 PM PDT.

Accepted speakers will be notified on April 17, 2023.


ATTENDING KVM FORUM
===================

Admission to KVM Forum and DevConf.CZ is free. However, registration is 
required and the number of attendees is limited by the space available 
at the venue. You can register for KVM Forum 2023 at

    https://kvm-forum.qemu.org/2023/register/

The DevConf.CZ program will feature technical talks on a variety of 
topics, including cloud and virtualization infrastructure—so make sure 
to register for DevConf.CZ as well if you would like to attend.

We are committed to fostering an open and welcoming environment at our 
conference. Participants are expected to abide by the Devconf.cz code of 
conduct and media policy:

    https://www.devconf.info/coc/
    https://www.devconf.info/media-policy/


GETTING TO BRNO
===============

Brno has a small international airport with flights from London 
(Stansted) and other European cities.

Other nearby airports include Vienna, Bratislava and Prague. Travelling 
to Brno is easiest from Vienna Schwechat Airport, from where there are 
direct buses operated by RegioJet:

    https://regiojet.com/?fromLocationId=10204055&toLocationId=10202002

More detailed information will be posted on the DevConf.CZ website 
closer to the conference.


CONTACTS
========

Reach out to us should you have any questions. The program committee may 
be contacted as a group via email: kvm-forum-2023-pc@redhat.com.


