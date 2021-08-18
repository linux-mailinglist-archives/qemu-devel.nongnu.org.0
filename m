Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDA63EFEBD
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 10:10:40 +0200 (CEST)
Received: from localhost ([::1]:41620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGGek-0000kb-F7
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 04:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGGdC-0008JT-AU
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 04:09:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGGd8-0001FG-SD
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 04:09:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629274138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6M03kD2t+FvQY9ER7LqvHR0FrYbvrq6IJyuKvLTNbSk=;
 b=X7NZUbpKL7Su/ImJMiICXn+MlJG/z4bmyS7A6ElKhkulIPOIINNdI2GIjbKTehQU7injsX
 Dcipl/5b/4S2QeqLjj5+T1CpMpXw4CZu3GuaT/694zh0LI58iYn3TyitfQZg3SWnoD5QJX
 opiaNJwsFsfHWhJj9LnSsqFdtWmZ0z8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-Rxrb0chjOPCsZoe6ramhzw-1; Wed, 18 Aug 2021 04:08:54 -0400
X-MC-Unique: Rxrb0chjOPCsZoe6ramhzw-1
Received: by mail-wm1-f69.google.com with SMTP id
 b196-20020a1c80cd0000b02902e677003785so1948675wmd.7
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 01:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6M03kD2t+FvQY9ER7LqvHR0FrYbvrq6IJyuKvLTNbSk=;
 b=f7Yq9OSoSVipJz4KOFXio7S6WTE86+O0t2mkJC1yfYQgBPtIpiySMDSTrmUu2Bg/F5
 HIBveVkIbXeyeegTzjlLAMy6ZYSCQlA4DgeFwuXRQUDCPuf53jBOp7nRqKQam3S1r+88
 dK6tsNRDynTkKxzywm7Lvwt7kvnymofOUz9+7mjMmizK1qZ2ZAxO97CHzHJfG1xW7AVr
 8qUcRbUApJ2ytVDM5/jL3AFva4MRrMDi5+wMH8kFzC14zAFlv5+dtl61kb2u/h5hFihz
 Pd15x2pOZT4HPqlPt2tWi4mmHshjeJB4fLZKq5xIeeHxFg18004YmrXQwsdlEch0uT7x
 KWNA==
X-Gm-Message-State: AOAM530Dc4kgm2U+YTk1Jtxau2MCBFXmybRS65xbdPJVs7S6C2XzM2bC
 5jhuVPY1sG8r5wzwdkjtmve3ZfG6uwI0JbVD3CvW7LVZG0okPnZEwbLfobhJRH9Ik+TEqxQ4Ncv
 jYlEB8o/9zbfy3bI=
X-Received: by 2002:adf:f9d2:: with SMTP id w18mr8859590wrr.402.1629274133919; 
 Wed, 18 Aug 2021 01:08:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzf4Ll6ONEPUqz0C96jiEDYmdsA+c6mKaIHll1LPzGPxug39yth8uA1D9LoxZjDcTiN8ioXpw==
X-Received: by 2002:adf:f9d2:: with SMTP id w18mr8859561wrr.402.1629274133666; 
 Wed, 18 Aug 2021 01:08:53 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id j7sm4392349wmi.37.2021.08.18.01.08.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 01:08:53 -0700 (PDT)
Subject: Re: [PATCH v4] vga: don't abort when adding a duplicate isa-vga device
To: "Jose R. Ziviani" <jziviani@suse.de>, qemu-devel@nongnu.org
References: <20210817192629.12755-1-jziviani@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b9eee101-e88b-f085-0430-73704d742014@redhat.com>
Date: Wed, 18 Aug 2021 10:08:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817192629.12755-1-jziviani@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.961, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-trivial@nongnu.org, thuth@redhat.com, mark.cave-ayland@ilande.co.uk,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/17/21 9:26 PM, Jose R. Ziviani wrote:
> If users try to add an isa-vga device that was already registered,
> still in command line, qemu will crash:
> 
> $ qemu-system-mips64el -M pica61 -device isa-vga
> RAMBlock "vga.vram" already registered, abort!
> Aborted (core dumped)
> 
> That particular board registers the device automaticaly, so it's
> not obvious that a VGA device already exists. This patch changes
> this behavior by displaying a message and exiting without crashing.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/44
> Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
> ---
> v3 to v4: Used object_resolve_path_type instead of qemu_ram_block_by_name
>           and copied the message from virgl, to give the same user exp.
> v2 to v3: Improved error message
> v1 to v2: Use error_setg instead of error_report
> 
>  hw/display/vga-isa.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


