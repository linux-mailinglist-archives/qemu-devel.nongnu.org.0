Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C18594B517C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 14:18:39 +0100 (CET)
Received: from localhost ([::1]:57660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJbFW-0005Aw-Tf
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 08:18:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nJab3-0003Ja-It
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:36:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nJaaz-0004Uc-Tf
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:36:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644842204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r+JYv3TRKPFmOfzQuV1e/iemVnQpn5Ww3eAFlWYvTUU=;
 b=fBpPElft7NrRvZcPpFHb2KshYgrLcgA75MTxROGQWVjPZANeKGZ0qH2z3z3B8KNy8NDTT9
 RuIJc/Lug7lqMnrzDcjvoiD/2tYuNxFrstLbwq0o2Z0lpRK0NLbRzF67C2TwXKKaH8PR6D
 tLOL0aKqhJr4yk3bHVAf8a4bGL7pbZs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-OcHVRBIVOKuQYDqhRYuqig-1; Mon, 14 Feb 2022 07:36:38 -0500
X-MC-Unique: OcHVRBIVOKuQYDqhRYuqig-1
Received: by mail-ed1-f71.google.com with SMTP id
 f9-20020a056402354900b0040fb9c35a02so10175960edd.18
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 04:36:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r+JYv3TRKPFmOfzQuV1e/iemVnQpn5Ww3eAFlWYvTUU=;
 b=B7tO8zcxvnT2TN5ycas6ZH8YCfof91SIZdgaFhs/CjfFNsv/2Tx7tUBK5MAZNSMt10
 DewE1XjYchhWRI9XEMjO8KXNTxOGvJlcEUdU7CtNj/9o0Asuwy295ES5KJ+W5t79/R5y
 6rVw45ByoPJ92HecVVyZHyItB1Vvy1yeh/1WHh4P+4bA7BEPu/xyaivnn9P7NX7bQivz
 hynKiwwTbjcdV4eJ12oSLIMr4hUKSGI8oajfeRUgkS3Ui1BuYZg0KlQFY3Y9L68lQier
 ek+iwijD7R3sweh3o9z/sBXCHE0bK4fHQPq9GUf1ULhxGfKRbix3iRbzpylPwpK6Skvp
 cKvQ==
X-Gm-Message-State: AOAM53166pgQ0vWnTtPDdv+nbztLnqv1IRyILPcquj9weDW9PMzGOTcw
 Z7H1NPhkNUHmOk6G53+NYiZ/3hF9nodcWSYgtuu7RqmMa9CDmzIECOBAbhE98lUSIuoBcz/BZI5
 fnR7NRaZpaggX7W0=
X-Received: by 2002:a17:906:19c2:: with SMTP id
 h2mr11320997ejd.394.1644842197022; 
 Mon, 14 Feb 2022 04:36:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbEMQIwIROVj+wY+UoTVorqh7wWhHK1RGBX+oQIkDHO5REMNW4Fsg+/YUMnHL7B0KVLWe9WQ==
X-Received: by 2002:a17:906:19c2:: with SMTP id
 h2mr11320977ejd.394.1644842196776; 
 Mon, 14 Feb 2022 04:36:36 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id q10sm10643530ejn.3.2022.02.14.04.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 04:36:36 -0800 (PST)
Date: Mon, 14 Feb 2022 13:36:34 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>, QEMU Developers <qemu-devel@nongnu.org>,
 David Hildenbrand <david@redhat.com>
Subject: Re: 9 TiB vm memory creation
Message-ID: <20220214133634.248d7de0@redhat.com>
In-Reply-To: <alpine.DEB.2.22.394.2202141048390.13781@anisinha-lenovo>
References: <alpine.DEB.2.22.394.2202141048390.13781@anisinha-lenovo>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Feb 2022 10:54:22 +0530 (IST)
Ani Sinha <ani@anisinha.ca> wrote:

> Hi Igor:
> 
> I failed to spawn a 9 Tib VM. The max I could do was a 2 TiB vm on my
> system with the following commandline before either the system
> destabilized or the OOM killed killed qemu
> 
> -m 2T,maxmem=9T,slots=1 \
> -object memory-backend-file,id=mem0,size=2T,mem-path=/data/temp/memfile,prealloc=off \
> -machine memory-backend=mem0 \
> -chardev file,path=/tmp/debugcon2.txt,id=debugcon \
> -device isa-debugcon,iobase=0x402,chardev=debugcon \
> 
> I have attached the debugcon output from 2 TiB vm.
> Is there any other commandline parameters or options I should try?
> 
> thanks
> ani

$ truncate -s 9T 9tb_sparse_disk.img
$ qemu-system-x86_64 -m 9T \
  -object memory-backend-file,id=mem0,size=9T,mem-path=9tb_sparse_disk.img,prealloc=off,share=on \
  -machine memory-backend=mem0

works for me till GRUB menu, with sufficient guest kernel
persuasion (i.e. CLI limit ram size to something reasonable) you can boot linux
guest on it and inspect SMBIOS tables comfortably.


With KVM enabled it bails out with:
   qemu-system-x86_64: kvm_set_user_memory_region: KVM_SET_USER_MEMORY_REGION failed, slot=1, start=0x100000000, size=0x8ff40000000: Invalid argument

all of that on a host with 32G of RAM/no swap.


