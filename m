Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8AE3DB961
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 15:33:53 +0200 (CEST)
Received: from localhost ([::1]:47730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Se8-0000IH-21
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 09:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m9Sb4-0004sg-4r
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:30:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m9Sb1-0003uH-Mt
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:30:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627651838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DCVgNop8zdWkcO/n6NDpXjcNDHqYZTExmZkVuLdngAQ=;
 b=DEecJF3WJ9FK4CFtdBgfpeqI6YEBmxFxl5ASMIKOzj94vSF9qo/uhvyfgfsm/AVtvoyiYB
 D/kuxJiVFgEIf3/65HO5QUFC183xjC+C09wHdH4MkagoNZMnfOy9A1G9Ms8XDW+Ga6qulY
 3SSKBJewoEZiwBdYI22kxK3cm1CqhkA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-SqI9a6CvPLOA84wHftserw-1; Fri, 30 Jul 2021 09:30:37 -0400
X-MC-Unique: SqI9a6CvPLOA84wHftserw-1
Received: by mail-wm1-f70.google.com with SMTP id
 q188-20020a1ca7c50000b0290241f054d92aso1606225wme.5
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 06:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DCVgNop8zdWkcO/n6NDpXjcNDHqYZTExmZkVuLdngAQ=;
 b=CDf+T1NX0DI0/jlmO0fKRubc6Z2JxUuUMPERKOsDxEsCQN/UyvucrFxDeSJZ17JOtV
 qrH2PC9Vvt6wHuquLnx2iw/0VdebIvouFe6bsVOfHyeRr7DKQYNOtMqSYOUu8UsGz97h
 4rppFISfhP3IYQm8Jr4yvReX34FosDvjp3qVRKepwtJhqDzSI2JDl0xlZs4VDd2ON6PA
 8mgF5Xs6YjnXv4UYf5r8v2sLAjRT6fvxRjtht/9lRz2neSWhjrFpPBH7lZARwDjJS++x
 AnmHihMJuMjvr+9bNZkFM0/wKDnaWH/RQhC4kDjPvuHiPwMK5nQehgmeCx4njRz8d4RI
 3+gA==
X-Gm-Message-State: AOAM531abHNOO0Xo+nWuWnPh68ibNBb7/S9NoGnifezN2r8ikbuQD2dO
 qGJMLa7kCUE81fFK5wjw9GSzafl8ALpBvS4ws8N+dx1+/TM8DdO6xz72TGOpmp70V7va/m5KZac
 2x+WJrjNjOssnzzA=
X-Received: by 2002:adf:90c6:: with SMTP id i64mr3162120wri.168.1627651836382; 
 Fri, 30 Jul 2021 06:30:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfbbUoPiT7paRzrZAV7kKA6rw709m8luMr5HiGBNHpbd+Rrw/ofiB7J8SIYYJPGwdltvW67w==
X-Received: by 2002:adf:90c6:: with SMTP id i64mr3162110wri.168.1627651836261; 
 Fri, 30 Jul 2021 06:30:36 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id 9sm1722494wmf.34.2021.07.30.06.30.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 06:30:35 -0700 (PDT)
Subject: Re: [PATCH] hw/acpi: use existing references to pci device struct
 within functions
To: Ani Sinha <ani@anisinha.ca>, qemu-devel@nongnu.org
References: <20210729131910.520775-1-ani@anisinha.ca>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b8e38012-360a-43ff-3746-f42df0156469@redhat.com>
Date: Fri, 30 Jul 2021 15:30:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729131910.520775-1-ani@anisinha.ca>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.125, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 3:19 PM, Ani Sinha wrote:
> There is no need to use fresh typecasts to get references to pci device structs
> when there is an existing reference to pci device struct. Use existing reference.
> Minor cleanup.
> 
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  hw/acpi/pcihp.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


