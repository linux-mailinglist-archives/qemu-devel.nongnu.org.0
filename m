Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD4D56C123
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 21:56:44 +0200 (CEST)
Received: from localhost ([::1]:57732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9u5i-0005Th-Su
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 15:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o9u3D-0004I8-TK
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 15:54:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o9u39-0002ua-Mm
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 15:54:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657310042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c/JatWN02SclRjIGqcLlx2rH36Os4o3a2wiE5RMQ5Lg=;
 b=A2KcSdl6EoB9nPoc0yUeFV+Ayedlta0FfqWUqkFcuweJWC1x5vbV6RKs2/2qS6KYzJApjt
 N5w29+UdgM44H8iVypk1f/Df/zPzi2Dyf6IHEaXq+hjm5OMZscPtwSloXm0cz8a4CSTvlN
 cfysu4anKZUU0NFZZF2+suaMR0qljdc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-WshHfTTcOxKZE44_4Ua1CA-1; Fri, 08 Jul 2022 15:54:01 -0400
X-MC-Unique: WshHfTTcOxKZE44_4Ua1CA-1
Received: by mail-wm1-f70.google.com with SMTP id
 v123-20020a1cac81000000b003a02a3f0beeso1413295wme.3
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 12:54:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=c/JatWN02SclRjIGqcLlx2rH36Os4o3a2wiE5RMQ5Lg=;
 b=YCrp/zhfVyBtfcCXvHy5l+haxBXjmWFeSH6vfKnYSSN9XM0bXukuIrGTGtbtykiuc2
 3t1Lp5sWn+HShjCW7Zd1Qn9QiEAx8ZUDDIXeRTIiUw0f7DRZWT89IhQsuxPk/enUUQt5
 DwgFAmss+9s2kxkiByUSSIPaFEgUoXdI4FYqiQ7vYJz6QX22A1iInzQ19kaXRwcHOsIz
 7va6bi2NUx0hUW+D+DPx/nN6G7g2Ol5Z2ui8khoDB2rpZXDgjF17HmaskRJeGJ442aCW
 Bzz35zcIP24ijzJatycCsF1IVBPDFDvxY+EAt+eHRPei2UL2y2NnCvrncjN7ZzzSqc8C
 M2xQ==
X-Gm-Message-State: AJIora98BuCG2FHG3AlAwPkIuUbdpmzA3NcWxXoXcE0NmDRDDbjWdSnz
 yoc+xPjIXSNUfgoRwLDewUbrg91As+tJrBy3bYLTB0p7HKxoXBzUW4xKHESPqzXXEdH0DOpMPjh
 qXjyI7/GVGTEbtz4=
X-Received: by 2002:a05:6000:381:b0:21b:9a20:7edb with SMTP id
 u1-20020a056000038100b0021b9a207edbmr5148692wrf.71.1657310040248; 
 Fri, 08 Jul 2022 12:54:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tHnJf+OuMSRJ5lv/orVoeMhzz7F3Zx8NVe7oVuZJ0taZFvphasvBwFtgR0S0pXBTCIjTAL/A==
X-Received: by 2002:a05:6000:381:b0:21b:9a20:7edb with SMTP id
 u1-20020a056000038100b0021b9a207edbmr5148672wrf.71.1657310039976; 
 Fri, 08 Jul 2022 12:53:59 -0700 (PDT)
Received: from [192.168.8.100] (tmo-099-20.customers.d1-online.com.
 [80.187.99.20]) by smtp.gmail.com with ESMTPSA id
 a16-20020a5d5090000000b0021d819c8f6dsm6181016wrt.39.2022.07.08.12.53.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 12:53:59 -0700 (PDT)
Message-ID: <cf15780a-b02e-dc88-954c-6f90d6ba5107@redhat.com>
Date: Fri, 8 Jul 2022 21:53:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: What to do with the nanomips disassembler (was: [PATCH] disas:
 Remove libvixl disassembler)
Content-Language: en-US
To: Milica Lazarevic <Milica.Lazarevic@Syrmia.com>
Cc: "cfontana@suse.de" <cfontana@suse.de>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 Djordje Todorovic <Djordje.Todorovic@syrmia.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Vince Del Vecchio <Vince.DelVecchio@mediatek.com>
References: <VE1PR03MB60454933EBCDB900C8A9AAD4F8BE9@VE1PR03MB6045.eurprd03.prod.outlook.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <VE1PR03MB60454933EBCDB900C8A9AAD4F8BE9@VE1PR03MB6045.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 04/07/2022 14.22, Milica Lazarevic wrote:
> 
> On 09/06/2022 18.31, Vince Del Vecchio wrote:
...
>     Regardless, I think we can look at converting the existing disassembler from
>     C++ to C.  That would address the current concern, right?
> 
> > Right - if it's not too much of a hassle that would be great!
> 
> Hi everyone, I am interested in taking on this task.

Since nobody else replied, I assume nobody started working on this task yet, 
so I'd say: Please go ahead and convert that file to plain C!

  Thanks,
    Thomas


