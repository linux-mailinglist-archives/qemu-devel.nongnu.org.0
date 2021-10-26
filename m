Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC76543B569
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 17:21:47 +0200 (CEST)
Received: from localhost ([::1]:36640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfOGo-000659-H9
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 11:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfO98-0005K3-Fn
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:13:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mfO96-0003QK-Je
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:13:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635261228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ykTal0/5+S/liv+W7/qzcM/9C/Hy2XT7+1ke8mWd3e4=;
 b=BRyABnj01ddPZf8b0wRdZmXzG56+IpEH8pXpc+/uKvRjVRpC6H8oelOErB21Rgka/XdcuL
 TR4dpyAWQKgD0nOVldY9gS85KkKT9agipn8Jf+POoKU91GOEgPI25nlHO8vCJlXj42+zsN
 YfViwtQ2P34qNMewwI/4fIkKubjQYSQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-9-h7WVI3MtGS8NmjDfkaxw-1; Tue, 26 Oct 2021 11:13:46 -0400
X-MC-Unique: 9-h7WVI3MtGS8NmjDfkaxw-1
Received: by mail-wm1-f71.google.com with SMTP id
 i187-20020a1c3bc4000000b0032ccd252cf3so306729wma.7
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 08:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ykTal0/5+S/liv+W7/qzcM/9C/Hy2XT7+1ke8mWd3e4=;
 b=SiaHd6c7UTUwEGEAx0ZVAplKsOUUsuvzf1JqrcSoUxoC+8GwfDX0hoo1Abq9d/Exlv
 44cKfl4IgV7n4Pk+jDcHkgahPow4At2YVOe8CHqggGo5faQ8gKGQV7Qcnkvc6dXKf7/H
 YBfZCo49je0hpTe6TOgomcaHSoVAv3kbt0GtMzK7EVpqODyT+2Ndz5xNP6nI5sOObNCo
 XnBGmzXZPLwu+8v2vAtowZ/NgPNSEwWLo1KdPYPTzNLsTM7AyFUQmpclq1ZWotZuQjKW
 selHS4bhNqNu3AoHb/LrbWN2zsIzEbBeu0Lg2WtR/BfUfvdsJwbr+JWrxxbxczzTX2v4
 nEtw==
X-Gm-Message-State: AOAM532/AJszz2eUnhNdZ6wvChf5kskKU/qgUrVXQbCXpFvTD1paHzFv
 Sh7/fX7JZOcum3Re1LdoC3ZMBN3/aUFFc52PdHkttpYKbOWhwzZySs5alSrSd9jO+zkev0qhcjg
 BZARuvslcp4iT1IU=
X-Received: by 2002:a05:600c:35d0:: with SMTP id
 r16mr57207608wmq.97.1635261225521; 
 Tue, 26 Oct 2021 08:13:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsA8C617XWiN473M+hE88rAsx7dmUlSN9hB2FfLT+zIb46R8Rzrv6fjwqGqlFmtKghy4DhXQ==
X-Received: by 2002:a05:600c:35d0:: with SMTP id
 r16mr57207580wmq.97.1635261225291; 
 Tue, 26 Oct 2021 08:13:45 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id f17sm11943327wrv.89.2021.10.26.08.13.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 08:13:44 -0700 (PDT)
Message-ID: <72b6e6d9-8e4e-de18-3617-da3ff9690b2d@redhat.com>
Date: Tue, 26 Oct 2021 17:13:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 1/3] smbios: Rename SMBIOS_ENTRY_POINT_* enums
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20211026151100.1691925-1-ehabkost@redhat.com>
 <20211026151100.1691925-2-ehabkost@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211026151100.1691925-2-ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.215,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 17:10, Eduardo Habkost wrote:
> Rename the enums to match the naming style used by QAPI, and to
> use "32" and "64" instead of "20" and "31".  This will allow us
> to more easily move the enum to the QAPI schema later.
> 
> About the naming choice: "SMBIOS 2.1 entry point"/"SMBIO 3.0
> entry point" and "32-bit entry point"/"64-bit entry point" are
> synonymous in the SMBIOS specification.  However, the phrases
> "32-bit entry point" and "64-bit entry point" are used more often.
> 
> The new names also avoid confusion between the entry point format
> and the actual SMBIOS version reported in the entry point
> structure.  For example: currently the 32-bit entry point
> actually report SMBIOS 2.8 support, not 2.1.
> 
> Based on portions of a patch submitted by Daniel P. Berrangé.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> First version of this code was submitted at:
> https://lore.kernel.org/qemu-devel/20200908165438.1008942-5-berrange@redhat.com
> 
> Changes from v2:
> * Use "32" and "64" instead of "2_0" and "3_1"
> 
> Changes from v1:
> * Patch was split in two
> * Hunks included this patch are not changed from v1
> ---
>  include/hw/firmware/smbios.h | 4 ++--
>  hw/arm/virt.c                | 2 +-
>  hw/i386/pc_piix.c            | 2 +-
>  hw/i386/pc_q35.c             | 2 +-
>  hw/smbios/smbios.c           | 8 ++++----
>  5 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


