Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4BF2FBDE4
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 18:44:27 +0100 (CET)
Received: from localhost ([::1]:58106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1v3K-0002MV-Ak
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 12:44:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1ufQ-00007J-2L
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:19:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1ufL-0006gx-Gg
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:19:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611076778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CRzcBAWtpaOqrNPJ5scPPqgylivFt8dSZpFbXWwt8wQ=;
 b=V2Y+nlOZMxrfJVJp5ZHQnNohSqjrG4UJKyiH56EIEr0M11nxg6QgAIV6w88zooWmQ/SqxW
 Q5R785N2o19CcRBj9wPOCUPub6hXCMlvNnEX94fIcaTpYIGM4fhYIghWV4swWuDboYoNOv
 JI/dR2zdJULs+/pAThj+aJ8SfcRqy/I=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-zTyPodR8PqG9JcQob0r2pQ-1; Tue, 19 Jan 2021 12:19:36 -0500
X-MC-Unique: zTyPodR8PqG9JcQob0r2pQ-1
Received: by mail-ed1-f72.google.com with SMTP id e25so1225194edq.6
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 09:19:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CRzcBAWtpaOqrNPJ5scPPqgylivFt8dSZpFbXWwt8wQ=;
 b=G9tLYNlXB3rFBkxhvLN9jrEcjwH/v1ETZoadEy8XYaBt8ZeeUJt0p42UB5GQM0ftSW
 mMVaR9F/6OCRm5eEncSe4kEWY2BWjlqCo98Siu7uf6iKeh2qBSCF1tz6+s+HiYzxzFme
 ehy8BBoJEM5BhsUa3xb7HdWRaC5IQrvJKxC5DZE+EVNN5D1XwTnrs9prSeEG+ZlfilOK
 Luz/AcrxmPqZMO22JpW9LoKJP4borYVZ14raVHIUZDJNEbIlJ4PRCAOZpyI8ATPpcZAj
 JB877O/e28zoBhT8xhWITZhzTuvmxD0pQ7j0l6/QUOOXozg1mNrSrWK1QcPVPipG/n0Z
 OLGA==
X-Gm-Message-State: AOAM531QjlRqCuB+JUH0Q884NKnBoI1aAg12ZwT89mivSLyPuQFVL5e6
 gbIOtQzIl1Ll4jL5S/1c2E4BcJINk8h4c621dMEB5bn2EM/1JoCcDxUbtEd2Y91uBz5dDgQeCTP
 09TG2mdRYgBWeSKE=
X-Received: by 2002:a05:6402:55:: with SMTP id
 f21mr4360414edu.38.1611076775045; 
 Tue, 19 Jan 2021 09:19:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsbFSJWpcC46oMOO9Nc6S3yQxvtee2GgQGalTSJsQdgb58iz1infaNNLAU/dIWLCkInKno9A==
X-Received: by 2002:a05:6402:55:: with SMTP id
 f21mr4360399edu.38.1611076774894; 
 Tue, 19 Jan 2021 09:19:34 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id w2sm7579104ejn.73.2021.01.19.09.19.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 09:19:34 -0800 (PST)
Subject: Re: [PATCH] pci: add romsize property
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Haibin Zhang <haibinzhang@tencent.com>,
 David Edmondson <david.edmondson@oracle.com>
References: <20201218182736.1634344-1-pbonzini@redhat.com>
 <b9b7e55a-0f90-6680-8e15-992997afdd38@redhat.com>
 <7f0cf9f5-f820-0571-f0f7-b409af19bd1f@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4122196e-375e-9221-6523-217813ef03e4@redhat.com>
Date: Tue, 19 Jan 2021 18:19:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <7f0cf9f5-f820-0571-f0f7-b409af19bd1f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: Markus Armbruster <armbru@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 dgilbert@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/19/21 6:10 PM, Paolo Bonzini wrote:
> On 19/01/21 17:51, Philippe Mathieu-Daudé wrote:
>>> +    if (pci_dev->romsize != -1 && !is_power_of_2(pci_dev->romsize)) {
>>> +        error_setg(errp, "ROM size %d is not a power of two",
>>> pci_dev->romsize);
>>> +        return;
>>> +    }
>> Some cloud providers already complained the pow2 check in the pflash
>> device (wasting host storage). Personally I find using pow2 easier
>> and safer.
> 
> This check only applies to the value that is specified on the command
> line or in a global property, not to the file (the purpose of the
> property is exactly to override the file size, no matter if the file
> size is a power of two or not).

Doh sorry I completely misunderstood the purpose of the patch.

> Even if there is no value for the property, non-power-of-two ROMs files
> are accepted and changed into the next power of two:
> 
>     pdev->romsize = pow2ceil(size);
> 
>> The pow2 check looks like a separate change however, maybe add in a
>> separate patch? Or maybe not:)
> 
> Not a separate patch for the above reason: the check is on the
> newly-introduced property.

Obviously :)

> 
> Paolo
> 


