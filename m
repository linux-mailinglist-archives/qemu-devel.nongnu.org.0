Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3339F36D5F9
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 12:54:31 +0200 (CEST)
Received: from localhost ([::1]:55542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbhps-0004So-SG
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 06:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbhoc-0003xd-On
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 06:53:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbhob-0008QA-4z
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 06:53:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619607188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bZNn8e+ILy1xbV0J9WLcfmqkDCdCVTKBDUv1kpZhdfw=;
 b=bjGvha7tkfC4ZM0bvFVVZ7RJ1cd1XmP5wE6gssouijreIdZfPTWDveEmARX2OyOUqSWEtN
 fJNOMhfDHMp6cnLx7z4UQ3hSM0UyaNQTs6STaRslaRoBL4ScblfXxYW0wgovvzwJsyt71W
 VMVgjN2thCCyj+fLEfnjUJm7Olb9xfY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-Rxb0pFWgMAme8b62x6zsCQ-1; Wed, 28 Apr 2021 06:53:06 -0400
X-MC-Unique: Rxb0pFWgMAme8b62x6zsCQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 d78-20020a1c1d510000b0290132794b7801so5008416wmd.1
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 03:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bZNn8e+ILy1xbV0J9WLcfmqkDCdCVTKBDUv1kpZhdfw=;
 b=K/TLlzTsHW3H8+Q5u04NRRo6JgK7j3B6vgUgG7yj/a0W3GMTtYsez7U83xSqdgzVSi
 2s+Jj99UhFgcAVlzu8kYlG8ORVIxGhs/sJZJh/3tK7srcHCJws5hLlMDqhiYvdd5J0+9
 OAqmzz7F9JQ+TFUxWtlIS7qL22CaUHdFTs2L/ii1ShSreaYZrCWdfHCPGFC2xBG5TxWM
 bhxXZ4lIlRcPTvorMtsQmeYGZJMa2G10xEKqNOoUjgwB5/Wkh6YGjPdQnYGS8p/AJza6
 a9xi6/rTV5/cvpn1xO8fby78c2giK39w8bQfb8wC4rmxkQd/W/OpSiXZ+tlDFB77bn+2
 rrOg==
X-Gm-Message-State: AOAM532VCnkzTdCSlz6fWqGbfFSDtD64IP0wlcsJHcRheKhQsqKcUrQj
 78kBq+/cn+zMfjSHJUJ2Q611eSspABFp4LqoBgkeVcXizyMUuCZVCZGjltpWCAbvWTftFLlZ13c
 ThrQlCas4VjkXtcA=
X-Received: by 2002:a1c:7516:: with SMTP id o22mr3734607wmc.91.1619607185098; 
 Wed, 28 Apr 2021 03:53:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxD+F2kHnnRelDxQ8tchWQRf/JYPSn94kdHDmjlGMME1xVzNCMbqaAy3uSzh0W9UmVrYy9CNg==
X-Received: by 2002:a1c:7516:: with SMTP id o22mr3734581wmc.91.1619607184891; 
 Wed, 28 Apr 2021 03:53:04 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id n5sm6002570wrx.92.2021.04.28.03.53.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 03:53:04 -0700 (PDT)
Subject: Re: [PATCH] hw/ide: Fix crash when plugging a piix3-ide device into
 the x-remote machine
To: Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>
References: <20210416125256.2039734-1-thuth@redhat.com>
 <YIkpzdUkgHs4vYCe@stefanha-x1.localdomain>
 <1fea2e39-c1c7-215f-843e-fc593ff7f47c@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <23798c16-2724-c55f-459d-e0402439661a@redhat.com>
Date: Wed, 28 Apr 2021 12:53:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1fea2e39-c1c7-215f-843e-fc593ff7f47c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 11:32 AM, Thomas Huth wrote:
> On 28/04/2021 11.24, Stefan Hajnoczi wrote:
>> On Fri, Apr 16, 2021 at 02:52:56PM +0200, Thomas Huth wrote:
>>> @@ -158,7 +166,11 @@ static void pci_piix_ide_realize(PCIDevice *dev,
>>> Error **errp)
>>>         vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_pci, d);
>>>   -    pci_piix_init_ports(d);
>>> +    rc = pci_piix_init_ports(d);
>>> +    if (rc) {
>>> +        error_setg_errno(errp, -rc, "Failed to realize %s",
>>> +                         object_get_typename(OBJECT(dev)));
>>> +    }
>>
>> Is there an error message explaining the reason for the failure
>> somewhere. I can't see one in the patch and imagine users will be
>> puzzled/frustrated by a generic "Failed to realize" error message. Can
>> you make it more meaningful?
> 
> Do you have a suggestion for a better message?

At this point it is hard to do better... Else we'd need to propagate
a meaningful Error* from ide_init_ioport(), and emit something like
"Failed to initialize the ISA bus"?


