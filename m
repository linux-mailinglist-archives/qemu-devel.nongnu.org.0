Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F786434BCF
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 15:07:35 +0200 (CEST)
Received: from localhost ([::1]:56638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdBJe-00028u-LY
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 09:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mdBEy-0007QJ-Fh
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 09:02:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mdBEm-0003cA-Rl
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 09:02:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634734952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vF0TDl//PE/wE5o24UNInITXBkDbjdY8Jy1efbbDS8s=;
 b=et1knp1ZlBZx0XSjr+obejqq3CaJ97oOodP7gu2lWwVNnYKoH6PNMSbDZ7LihjTuluEGSc
 4rw/us0/18wwxkl56C7X1cGzIOf5QFpla/tQVeNsC01Icog9145zC59EQbdnfaNss96leC
 CePjCB07vUBDeLxr1WKiFSkqxZUbg0Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-IAZYWU5mPCOdQoATEIDIwQ-1; Wed, 20 Oct 2021 09:02:29 -0400
X-MC-Unique: IAZYWU5mPCOdQoATEIDIwQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 o22-20020a1c7516000000b0030d6f9c7f5fso4172537wmc.1
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 06:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vF0TDl//PE/wE5o24UNInITXBkDbjdY8Jy1efbbDS8s=;
 b=gic+V0PNcVABroIX5e8hOpsF7qlePb2PB2/B8emsJeFQKOLqzT4sLhYTUmp1KRpb9P
 JOAw+o8fZ7aV8TYwfhVwQBAxXDqhTMpyZSndtQllVgkmoo+Ut3a6QJ8ESZcBx/UWpqKL
 O4m87SJJkpJmMmpYdCYGoLKB3K5YxQLiNb8sJmNfPDi7Pez+VJTvE8GzDNs8ymgMdcYf
 awiTXnG0XqUTaXXNKxeDSXaAlFAeXJ0dcV2scy0q0fp1eMNTgxT4WlTIv/lEapqdW9+K
 kvCM7kevms2ZjOh6LgPgF01fcOebCMKYt35yJ2UoLHKlHvX3VtYfXqyLc8TzSyNl4MaW
 3f4w==
X-Gm-Message-State: AOAM532X9PxJatoWjumzkvj+x+px+VTQ7GzLRWV03SYhHeT/pmKUmUEI
 GuHFMyVxvjhLYhK+ny8Is65hxKHAn8SxRDfj4n5h5+AsSZjeNyVTCsnX+uD6M9wZXRUF7zfFNB1
 ODGsM4UTCmYuriqM=
X-Received: by 2002:a5d:508b:: with SMTP id a11mr53580317wrt.417.1634734948000; 
 Wed, 20 Oct 2021 06:02:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwERc5ivYzJiVSUUQDCtlOJZ+uqL5xZzJkyNc9VQzTER4Qja6uejPRv5U1NED4zNdyH5rCXtQ==
X-Received: by 2002:a5d:508b:: with SMTP id a11mr53580282wrt.417.1634734947688; 
 Wed, 20 Oct 2021 06:02:27 -0700 (PDT)
Received: from [192.168.1.36] (33.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.33])
 by smtp.gmail.com with ESMTPSA id g70sm2003337wme.29.2021.10.20.06.02.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 06:02:27 -0700 (PDT)
Message-ID: <a786c24d-0efc-e2ed-acdd-cd5d1ad9f640@redhat.com>
Date: Wed, 20 Oct 2021 15:02:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 4/6] hw/riscv: sifive_e: Use MachineState::ram and
 MachineClass::default_ram_id
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20211020014112.7336-1-bmeng.cn@gmail.com>
 <20211020014112.7336-5-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211020014112.7336-5-bmeng.cn@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/21 03:41, Bin Meng wrote:
> Using memory_region_init_ram(), which can't possibly handle vhost-user,
> and can't work as expected with '-numa node,memdev' options.
> 
> Use MachineState::ram instead of manually initializing RAM memory
> region, as well as by providing MachineClass::default_ram_id to
> opt in to memdev scheme.
> 
> While at it add check for user supplied RAM size and error out if it
> mismatches board expected value.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> 
> ---
> 
> Changes in v2:
> - add RAM size check
> - assign mc->default_ram_size
> 
>  hw/riscv/sifive_e.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


