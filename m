Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C876A1099
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 20:33:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVHKt-0008Sj-5H; Thu, 23 Feb 2023 14:32:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVHKn-0008RU-Ai
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 14:32:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVHKl-0005VX-G1
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 14:32:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677180769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I+RWWaPoklZyflzke74PfhnmXPubLzSkKmx/U88pOXc=;
 b=GVS6jQLKUynliBnFzv2Cg1hRSYiFcDajI4yU9kA+MAbVuGdT9Uasa4506SHazL5bpX80oD
 c2aNQXqNEnR9S88UqY0cjlIkYelxq0dFzAfuoQcB5UCkvclRc6d7qYj5E3W0avulDTr/ZV
 RCQSUtqG68IZ9SP5fqoB5OeziBv7XSs=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-439-ps6MiTEZNtmUuXXoSsU4yg-1; Thu, 23 Feb 2023 14:32:48 -0500
X-MC-Unique: ps6MiTEZNtmUuXXoSsU4yg-1
Received: by mail-qt1-f199.google.com with SMTP id
 cr14-20020a05622a428e00b003b82d873b38so5715734qtb.13
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 11:32:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I+RWWaPoklZyflzke74PfhnmXPubLzSkKmx/U88pOXc=;
 b=kbCbaOh41aXd9tlpRthP6e5rEm9U/wqL4b35FM9iNzry59F38kN6qPXqUdqaGWbV0t
 +9rYUZXN2U4Wt/w5QbqFOv4D9hWcJjsSUhHEBShFybmlDDLrxXhIjRs6SUeoGanXIMvo
 7wt0wK33pDYLghwLPqLm8F4O5vnnMGLTfRQ7UqxKYd8LxnzduYX5yV42iNiq7FENBYJW
 AYGjbQKwrSMaABoVB3FvvZ0T38f/mDlhQ4Vr8EJa0pFMVqYw7bvcI7drMJPKSUW1mKAG
 u8Mzm44MkV855pOT/cxJ5PtrOHENOE9p6Ra3YztwtF/rFV9PdPFRGQmcwPMlDYdBVtZa
 b4jg==
X-Gm-Message-State: AO0yUKXKx552gShN9asZMDOuIIIGPXy2XN+YMx2BA3oMqtFD6QyLMAzY
 gzSfxGiwwgMMJpUM0SmxYF6/FWREVelJ74GuJ1+P6W4kRFu+8hGKTp/I7ivx6KoGnQfg2X+2NN8
 OmIAJcJV+iWcuSODsdONpMpGi5KmhKIwG1fUVWw00c4c0VTxQGgetW0p9AkiPkrPhuejNFkdv
X-Received: by 2002:ac8:5910:0:b0:3ba:26a0:d0ee with SMTP id
 16-20020ac85910000000b003ba26a0d0eemr26230144qty.52.1677180766199; 
 Thu, 23 Feb 2023 11:32:46 -0800 (PST)
X-Google-Smtp-Source: AK7set/4nCIPEJslZE7dtVqF3lF/Z5glTXaWBuFpMdYG67rT27S0efRY3wAVqdqqof5SzQ89OGRKXw==
X-Received: by 2002:ac8:5910:0:b0:3ba:26a0:d0ee with SMTP id
 16-20020ac85910000000b003ba26a0d0eemr26230110qty.52.1677180765887; 
 Thu, 23 Feb 2023 11:32:45 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 hf18-20020a05622a609200b003bfaff2a6b9sm2000830qtb.10.2023.02.23.11.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 11:32:45 -0800 (PST)
Date: Thu, 23 Feb 2023 20:32:41 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Yangming via <qemu-devel@nongnu.org>
Cc: Yangming <yangming73@huawei.com>, "mst@redhat.com" <mst@redhat.com>,
 "ani@anisinha.ca" <ani@anisinha.ca>, "wangzhigang (O)"
 <wangzhigang17@huawei.com>, "zhangliang (AG)" <zhangliang5@huawei.com>,
 David Hildenbrand <david@redhat.com>
Subject: Re: VM crashed while hot-plugging memory
Message-ID: <20230223203241.28d38c29@imammedo.users.ipa.redhat.com>
In-Reply-To: <d9e62d4914a24b63af9f94a0e99b32c9@huawei.com>
References: <d9e62d4914a24b63af9f94a0e99b32c9@huawei.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 10 Feb 2023 09:30:18 +0000
Yangming via <qemu-devel@nongnu.org> wrote:

> Hello all:
> 
> I found VM crashed while hot-plugging memory.
> 
> Base infomation:
> qemu version: qemu-master
> requirements: hugepages, virtio-gpu
> 
> It happens by the following steps:
> 1. Booting a VM with hugepages and a virtio-gpu device.
> 2. Connecting VNC of the VM.
> 3. After the VM booted, hot-plugging 512G memory.
> 4. Then you can find that the image in vnc is blocked and the worse thing is that the VM crashed.
> 
> Actually the vcpu is blocked because of dead lock.
> 
> Analysis:
> As when hot-pluging the BQL is held, at the meanwhile, virtio-gpu is trying to hold the BQL for writing date. Then a vcpu is blocked waiting for hugepages hot-plugging, specifically, waiting for touching pages. If the blocked vcpu stops for several seconds, the soft lockup will happen, if it stops for a long time, e.g. 30s, the VM will crash.
> 
> I am wandering if there are some ideas to avoid VM soft lockup and even VM crash ?

Maybe David can suggest something
(CCed)

> 
> Thank you!
> kind regards!


