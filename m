Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F7A6C33B7
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 15:09:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peceP-0006lR-D5; Tue, 21 Mar 2023 10:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ernunes@redhat.com>)
 id 1peceN-0006k6-6w
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 10:07:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ernunes@redhat.com>)
 id 1peceL-0004EQ-LA
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 10:07:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679407660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nPkHS650sHCu8CXj8J3icSUphD+Wq3/pC9b8F9xFWFM=;
 b=PjmD0ouOQmr1AFWGuooTvaL5Iz9dZcI1WnkF7IslNtqN5juhBx13+3H/VNriQDJJaH2JP0
 /0ovYw+g80PN8uEMjVp5ZioT6EnM/ARD405STVYK0rBhQLjQyY172A5nGmlk4+rNvI/8ZY
 F7hKEVPG8mkzeJCBnxcdBWuetJg1Q5U=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-v3VHQXfvNu6EGPPuk1hHOg-1; Tue, 21 Mar 2023 10:07:38 -0400
X-MC-Unique: v3VHQXfvNu6EGPPuk1hHOg-1
Received: by mail-ed1-f72.google.com with SMTP id
 h11-20020a0564020e8b00b004e59d4722a3so22033234eda.6
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 07:07:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679407658;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nPkHS650sHCu8CXj8J3icSUphD+Wq3/pC9b8F9xFWFM=;
 b=lW/D7esDYNMHmIfBbnORpIIdI09T+jJVFoE8PvOnZFTCG43u7mx3c1Q+dUKyVUUVlH
 Ad+v2oUJhaV9cJ66DwIj4yeHUROXw6bZRL572pvD5eNwUV7nMiBM9OEN0wf2aHnOmtAf
 pEJ6WDgbdK3pARywdqXjCufZuBvVMg18qET1bHaHQ2dgadQ4x8pg8FFptoknEU3ol/qp
 u0dRwo0lfLaJCyC4lis42Sa9Lzgn7hRn2ZMLCKkxKNL2GSQcbQMdQ4l9ZmRh5G8bS22c
 oWXrgMRV1JCJ0aX3mHsiPHgmsSSfDwNxLe/ivNkR6/Z+yAGM60x2OfqqeaIvVZvOoHsJ
 GZTQ==
X-Gm-Message-State: AO0yUKWMfLzEEGVoesCILPnZNURPza1CctnyWMHGLZ5Gzib/a6Fkcux8
 +cwYoE0WpBwKurnNuqeNB2BbXZOJRxYAmRVQVmI+pj73OFYgRYyIdynUMGTULPL/Yi1n0KCNr3v
 eAC1oMSI2djQcAB4=
X-Received: by 2002:a17:906:8448:b0:931:ed29:4db5 with SMTP id
 e8-20020a170906844800b00931ed294db5mr2664382ejy.73.1679407657899; 
 Tue, 21 Mar 2023 07:07:37 -0700 (PDT)
X-Google-Smtp-Source: AK7set8Vj/aPuD/Pb1nf/U97CS0X2K9JvAEir9QvNcj4fWmv6hhKJDNzci2xeSeVkFSgGvD34n+RlA==
X-Received: by 2002:a17:906:8448:b0:931:ed29:4db5 with SMTP id
 e8-20020a170906844800b00931ed294db5mr2664357ejy.73.1679407657576; 
 Tue, 21 Mar 2023 07:07:37 -0700 (PDT)
Received: from [10.43.17.81] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 pv15-20020a170907208f00b0091ec885e016sm5829079ejb.54.2023.03.21.07.07.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 07:07:36 -0700 (PDT)
Message-ID: <b28e075c-029f-2b41-1c76-8ad5633b8f71@redhat.com>
Date: Tue, 21 Mar 2023 15:07:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PULL 0/7] ui/ fixes for 8.0
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, berrange@redhat.com,
 Stefan Weil <sw@weilnetz.de>
References: <20230321090334.1841607-1-marcandre.lureau@redhat.com>
Content-Language: en-US
From: Erico Nunes <ernunes@redhat.com>
In-Reply-To: <20230321090334.1841607-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ernunes@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 21/03/2023 10:03, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The following changes since commit aa9e7fa4689d1becb2faf67f65aafcbcf664f1ce:
> 
>   Merge tag 'edk2-stable202302-20230320-pull-request' of https://gitlab.com/kraxel/qemu into staging (2023-03-20 13:43:35 +0000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/marcandre.lureau/qemu.git tags/ui-pull-request
> 
> for you to fetch changes up to 49152ac47003ca21fc6f2a5c3e517f79649e1541:
> 
>   ui: fix crash on serial reset, during init (2023-03-21 11:46:22 +0400)
> 
> ----------------------------------------------------------------
> ui/ fixes for 8.0
> 
> ----------------------------------------------------------------
> 
> Erico Nunes (1):
>   ui/sdl2: remove workaround forcing x11
> 
> Marc-André Lureau (6):
>   win32: add qemu_close_socket_osfhandle()
>   ui/spice: fix SOCKET handling regression
>   ui/dbus: fix passing SOCKET to GSocket API & leak
>   ui/gtk: fix cursor moved to left corner
>   ui: return the default console cursor when con == NULL
>   ui: fix crash on serial reset, during init


May I also suggest this one as a fix for 8.0:
https://lists.nongnu.org/archive/html/qemu-devel/2023-02/msg05667.html

It was already reviewed about a month ago.

Thanks

Erico


