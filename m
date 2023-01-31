Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5733B682FF3
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 15:58:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMr9R-0005gD-NB; Tue, 31 Jan 2023 08:58:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMr9P-0005fn-Co
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 08:58:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMr9O-00015B-3G
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 08:58:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675173495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=456xjmqocIvNrmlzuhjNLfoVOc2d70px+xPDRgFYxTQ=;
 b=VnJzl5hAo0kTiE8ekJzu0o5BehkBnPLJDFOZoIcyCdtOqQCY7t/go/49tefRFhJSEgZdtk
 RNhynAl7x08zDINccW/nN53MyeBhe09vdkaVEJhjCkU+ZNULnfFb1XwWEp+vYVpgoUOhAY
 mpZtChfDdeM+S3zYVB8vK+NWgfNcZ5A=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-428-saSs_yRGM72BbD3DSz_u0g-1; Tue, 31 Jan 2023 08:58:11 -0500
X-MC-Unique: saSs_yRGM72BbD3DSz_u0g-1
Received: by mail-qv1-f70.google.com with SMTP id
 j12-20020a056214032c00b0053782e42278so7829505qvu.5
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 05:58:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=456xjmqocIvNrmlzuhjNLfoVOc2d70px+xPDRgFYxTQ=;
 b=kCr95dOCt0ABjXaV5WRmMqdui9h5rkhSCYcLcsWi8ROYjkuHBdKgYOPdVT4+HH6MQY
 DNuN18O8av5angLMOUjGQEazt5ccJVqH0btCIarZkvQLlv5jdJAcMHiCwI4hbHsXX3KC
 nK7CsK4HfXO/JSVXdueE+C6hLvqdl1Xr6ugjhoKyXS0WG8HPj0NhMTdljbJqHlZ4Rs/F
 PZy1ZLifEyG9sHTTnz25zXnEzfes1D4SIQbdWZR6ZevLDXEZLnppyg0T7UIp5C3CQIr/
 ajFDgY/vhgGjuGOaM21Hu1D2RKh+Pji5xPlrxqcs390GjJS5dk+5aPe3rYqQv0MY36t1
 UVaA==
X-Gm-Message-State: AO0yUKWOXuazTEs/1WQM4PXYDP3TTiQ159pthtc5fc52egEKLWwFQUGW
 Gco3ZG40OMbWQyYNm/XJCSrWr4q73O3OR7AI/C3X+d6mzJ3ZCcuDK6EO1gRZDjOuRqogbzZmchk
 4mHMvY++KuffAbBI=
X-Received: by 2002:a05:6214:8e3:b0:537:8125:b537 with SMTP id
 dr3-20020a05621408e300b005378125b537mr24025666qvb.11.1675173491013; 
 Tue, 31 Jan 2023 05:58:11 -0800 (PST)
X-Google-Smtp-Source: AK7set+3PPgH3EDqSh43P3mvz3WF3IxriWPHAVWi/UKZG6n0XDA/FWwwv46j/hU2nwwuElFmOm02pg==
X-Received: by 2002:a05:6214:8e3:b0:537:8125:b537 with SMTP id
 dr3-20020a05621408e300b005378125b537mr24025650qvb.11.1675173490795; 
 Tue, 31 Jan 2023 05:58:10 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-155.web.vodafone.de.
 [109.43.176.155]) by smtp.gmail.com with ESMTPSA id
 b4-20020a378004000000b0070736988c10sm9995286qkd.110.2023.01.31.05.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 05:58:10 -0800 (PST)
Message-ID: <c4cf1d51-5cf8-ab87-6def-38a45e5861b5@redhat.com>
Date: Tue, 31 Jan 2023 14:58:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 06/20] hw/i386/pc_{q35,piix}: Minimize usage of
 get_system_memory()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Ani Sinha
 <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-trivial@nongnu.org
References: <20230131115326.12454-1-shentey@gmail.com>
 <20230131115326.12454-7-shentey@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230131115326.12454-7-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 31/01/2023 12.53, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/pc_piix.c | 2 +-
>   hw/i386/pc_q35.c  | 7 ++++---
>   2 files changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


