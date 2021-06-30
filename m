Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 991BB3B7EE0
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 10:24:22 +0200 (CEST)
Received: from localhost ([::1]:34450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyVW9-0001M1-5s
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 04:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lyVVM-0000Ue-9N
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 04:23:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lyVVI-0005hQ-H4
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 04:23:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625041407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RcdVS5ge6Kq+scNrD/jypqwDqfA+smpRyyAYKtGXzsc=;
 b=ZoElIUCSlfEImKC9gOTJfH+ok2oNrh2wNONhRdXGvBzghdEbqlsTtpGXLqU7DX4H2Xxysf
 fox0lwcoyCZ5RfcY0rq560UNd+8xOhqh7QYt2VmNOEj+LVZRV5UwAH/TkJqChZmxpCTvxB
 5GdvO5FIOYQ/OY1La7ZzJfqpB5wloLI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-r5DWpzGyOoug5LghkZGLxw-1; Wed, 30 Jun 2021 04:23:25 -0400
X-MC-Unique: r5DWpzGyOoug5LghkZGLxw-1
Received: by mail-wm1-f71.google.com with SMTP id
 k8-20020a05600c1c88b02901b7134fb829so256434wms.5
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 01:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RcdVS5ge6Kq+scNrD/jypqwDqfA+smpRyyAYKtGXzsc=;
 b=FFjVXwm/zgHQvkuVmRD7xiZXbq3nrH0jyaWNCeL2uG4ALu07xwRjMvpVO+mzM+60b8
 I53uGWbyHvCwqOP5QJl26mP9lsvyCHmVNs+vfG5w4u5fOtLZncUNIotAsJDQ9T7yPUED
 s7YrPNZTA5PkpkB+3mXptiUCvZTrqUbthQUTm6D4hmNBmBdIfKZSKhwIAjrUS4br/s/r
 JkHlrZzB4ZUMCyT63YZmAGis/UNJPT1ZECjmE8dN1lSikCIKAbCj2ykB22ai7efFNCAj
 hDw2yUmzeaHmvy5Kd78aobdteBRBahiEZ0luxSCo8W8NCTz4pZwzTg0bdCiCQTvBVk+S
 URLg==
X-Gm-Message-State: AOAM530sNR1/8DHybCSgIvLE5kJ8ijvcqAsST+ve/Jf9uOAeVFLrpWay
 2OmjhwV7IxahaVvxD5gt3EROeD1+moKcd1tEb51Xs2Q1iT/LrjfGWchTcKKXCah6svwTy8RBWoi
 gKER+6Ck7/xbcXoM=
X-Received: by 2002:a05:600c:2243:: with SMTP id
 a3mr3262795wmm.86.1625041404456; 
 Wed, 30 Jun 2021 01:23:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQiSb9szd3pR2u0HxP9hnM8bPTyhwtyFKD43Uw64rNJH+sAxZPSi4y8svP4y1ivVpNyBaCtg==
X-Received: by 2002:a05:600c:2243:: with SMTP id
 a3mr3262773wmm.86.1625041404265; 
 Wed, 30 Jun 2021 01:23:24 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-110-55.mobile.abo.orange.fr.
 [92.184.110.55])
 by smtp.gmail.com with ESMTPSA id k13sm20815523wrp.73.2021.06.30.01.23.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 01:23:23 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] hw/i386/pc: pc_system_ovmf_table_find: Assert that
 flash was parsed
To: Dov Murik <dovmurik@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210630054625.3424178-1-dovmurik@linux.ibm.com>
 <20210630054625.3424178-2-dovmurik@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <68909288-cb5b-559e-7c85-fb6094d07ad8@redhat.com>
Date: Wed, 30 Jun 2021 10:23:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630054625.3424178-2-dovmurik@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/30/21 7:46 AM, Dov Murik wrote:
> Add assertion in pc_system_ovmf_table_find that verifies that the flash
> was indeed previously parsed (looking for the OVMF table) by
> pc_system_parse_ovmf_flash.
> 
> Now pc_system_ovmf_table_find distinguishes between "no one called
> pc_system_parse_ovmf_flash" (which will abort due to assertion failure)
> and "the flash was parsed but no OVMF table was found, or it is invalid"
> (which will return false).
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> ---
>  hw/i386/pc_sysfw.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thank you Dov,

Phil.


