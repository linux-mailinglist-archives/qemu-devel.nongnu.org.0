Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9304D1FB2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 19:07:41 +0100 (CET)
Received: from localhost ([::1]:56696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nReFI-0006M2-D7
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 13:07:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRdTU-0005Bv-Mv
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 12:18:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRdTQ-0000HX-Ek
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 12:18:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646759890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LlqasumeqSmtKmS3YqYlJQmk6wwALsv7vfgq5m9MAqY=;
 b=YlJ7h4c6d2BxgdkTcihVUTa5iUFlgJY80QAVtwJt3wrRJZ0czch+c4FXAo/tTRrZD2P7bp
 lXbZvRMRRgVRASGWFlwKGzG95FX9Sue8+z7BxHpCcSIE/mscLGEgwW/bGoXPwbhqMIEmkt
 dF/y8siUH7b+EUsS7/+3oPyZdsstnE0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-xxG5hWTJNb6nRenbdTVVuA-1; Tue, 08 Mar 2022 12:18:08 -0500
X-MC-Unique: xxG5hWTJNb6nRenbdTVVuA-1
Received: by mail-wr1-f70.google.com with SMTP id
 a5-20020adfdd05000000b001f023fe32ffso5674609wrm.18
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 09:18:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LlqasumeqSmtKmS3YqYlJQmk6wwALsv7vfgq5m9MAqY=;
 b=qgPsgi+IDL4hPdcZZ0wNPJ3blY/+6NuuKWEOCDqdKLT3rNkKxcWRpSgdV9w17VoWup
 f8U0NRRvzyGfFGincn0lT0/BOhypHRfH3TnhB3IF2ecdrtU1zbSBUR8hkmOnC9OUawI2
 VcNGnA0HuW2iEvPxYrdt4WWrDLJQOI3g+m3ZPHD297Dv6MLPW1IwSUJRVm8D1dMdatlq
 y6UdvRn3aMBL26Vs0wDy/6AcfCihnb/elBGejzGO65CE8L5VK93izpBVWBki92v3lHab
 fnTAzY4kR8e4g+9lU1zPxuzkYy2G7CzbpqslOp7XGxyA3RV14S1u4jZwI+DawnK5aeXA
 fEIQ==
X-Gm-Message-State: AOAM5331JQlOy8xoDrkpxrKjNpJXZRWXfAkkfmR1jw/Oqwa71wf5AR4q
 4TVT2xOK+uMioDEH9RZJvunHBOsJFqArSwdipOkdL+1LwE5clKHWGhULhV+CMClzuEqAIJI9GXp
 Oghv6UN9HPWJrto4=
X-Received: by 2002:a05:600c:1c87:b0:389:9dda:af17 with SMTP id
 k7-20020a05600c1c8700b003899ddaaf17mr4426387wms.27.1646759887121; 
 Tue, 08 Mar 2022 09:18:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzNj4U6VfoXRoqTVjXvTvPCNIR89A1UvJJXqgETC5W+MyVlVXdzB/GsHHkNqEidtMY1TmGmxw==
X-Received: by 2002:a05:600c:1c87:b0:389:9dda:af17 with SMTP id
 k7-20020a05600c1c8700b003899ddaaf17mr4426371wms.27.1646759886848; 
 Tue, 08 Mar 2022 09:18:06 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 i15-20020a05600011cf00b001edc2966dd4sm14085405wrx.47.2022.03.08.09.18.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 09:18:06 -0800 (PST)
Message-ID: <19e250c9-fa4d-3524-be82-9659d8dac450@redhat.com>
Date: Tue, 8 Mar 2022 18:18:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [qemu-web PATCH] Announce Google Summer of Code 2022
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20220308161549.73105-1-stefanha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220308161549.73105-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/03/2022 17.15, Stefan Hajnoczi wrote:
> QEMU has been accepted into Google Summer of Code 2022. Let people know
> so they can apply!
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   _posts/2022-03-07-gsoc-2022.md | 35 ++++++++++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
>   create mode 100644 _posts/2022-03-07-gsoc-2022.md

Thanks, pushed:

https://www.qemu.org/2022/03/07/gsoc-2022/

  Thomas



