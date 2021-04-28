Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C9E36D4DD
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 11:35:04 +0200 (CEST)
Received: from localhost ([::1]:52720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbgb1-0001x3-Do
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 05:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lbgZ2-0001PH-8O
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 05:33:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lbgYx-0002fM-TK
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 05:32:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619602375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EGWaJrcMiHs5cYsCEDV6Ych53V8aZClsOUvxyZU99Lo=;
 b=MgZ/W/OHYf1viITi4inVSleuQNq4YOl/8y51/FFz+f+68a5tWLwgoI6BJOdGJZ/FuuQKlO
 ewmnWw/vgq/LLzS9nf32pNdi6gn4d5YO/HdFpFIJ/Y1a4bntHouSU9wAmU5Xs6E+mpCJeK
 9xwGx3//YGsSjxpeFxWn9WKxmsJkujU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-JCvO0ur2PAagGPCZlyNqGQ-1; Wed, 28 Apr 2021 05:32:52 -0400
X-MC-Unique: JCvO0ur2PAagGPCZlyNqGQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 65-20020adf82c70000b0290107593a42c3so10500658wrc.5
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 02:32:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EGWaJrcMiHs5cYsCEDV6Ych53V8aZClsOUvxyZU99Lo=;
 b=A7xci4FzCAXpsRsOQS24urTactWX5L1yo8Ln3A2LwyfvI7AZoWhirZatrjoL2tJjb1
 GSizyQinAnWf0eNPmT9qP16My6rkUT3MPzr6OAgkMAOwUz1/hS67DR6LdhQaYVC73eU2
 IlNOQavmgoX/ALE/84C3UKqNDwtYVYmmKE2mwMh9IzufwOZa4LxmqWNk7j+Xz2hCYKot
 9EucUJFoq08tQGzRj/JBwq6L9XhEIbQ6lq61vqreZWAYyQGLLdBSQIQUTx06VVsIU8/7
 smFpuHeYqgeSsJPNvVVRK1UMO8q/iXs4pz0IPpRJkcQ4aGNwueEGyZhiQaHtZoWpRTQf
 4/1Q==
X-Gm-Message-State: AOAM530tCSOb2lXQ4LnOGGyXS351qfkcRLxLTI1iOi3cVtG4az5Kxc8m
 02k0BeCrDgeguvODi9PWMhVt+MXVpFHRMBsEzjiG864o3SxDeFOB/zjpdyxLgtY2Q/ciy0KhS16
 Ea8CbZSHfjtR95Pk=
X-Received: by 2002:a1c:e409:: with SMTP id b9mr3411320wmh.189.1619602371619; 
 Wed, 28 Apr 2021 02:32:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymQAsgfJwLIF7x77K+RVgshw4bhTQhqqe1Fldj6jSM81eJYrMscHyPzJ0XyNFdVF4fOOAL3Q==
X-Received: by 2002:a1c:e409:: with SMTP id b9mr3411286wmh.189.1619602371364; 
 Wed, 28 Apr 2021 02:32:51 -0700 (PDT)
Received: from thuth.remote.csb (pd9e839c7.dip0.t-ipconnect.de.
 [217.232.57.199])
 by smtp.gmail.com with ESMTPSA id g19sm3018639wme.48.2021.04.28.02.32.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 02:32:50 -0700 (PDT)
Subject: Re: [PATCH] hw/ide: Fix crash when plugging a piix3-ide device into
 the x-remote machine
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <20210416125256.2039734-1-thuth@redhat.com>
 <YIkpzdUkgHs4vYCe@stefanha-x1.localdomain>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <1fea2e39-c1c7-215f-843e-fc593ff7f47c@redhat.com>
Date: Wed, 28 Apr 2021 11:32:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <YIkpzdUkgHs4vYCe@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
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

On 28/04/2021 11.24, Stefan Hajnoczi wrote:
> On Fri, Apr 16, 2021 at 02:52:56PM +0200, Thomas Huth wrote:
>> @@ -158,7 +166,11 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
>>   
>>       vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_pci, d);
>>   
>> -    pci_piix_init_ports(d);
>> +    rc = pci_piix_init_ports(d);
>> +    if (rc) {
>> +        error_setg_errno(errp, -rc, "Failed to realize %s",
>> +                         object_get_typename(OBJECT(dev)));
>> +    }
> 
> Is there an error message explaining the reason for the failure
> somewhere. I can't see one in the patch and imagine users will be
> puzzled/frustrated by a generic "Failed to realize" error message. Can
> you make it more meaningful?

Do you have a suggestion for a better message?

  Thomas


