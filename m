Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ABA482400
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 13:34:05 +0100 (CET)
Received: from localhost ([::1]:35802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3H6i-0000ho-E9
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 07:34:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3H4r-0007e8-Sg
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:32:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3H4o-00070C-KB
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:32:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640953924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NsCll9Un1Xa4MtIU9acNU+sw1mLEwCpPrHs8/7SPr0M=;
 b=fYGnRvvSVO8c7mbwNNP93h3XQBrvFV1x5D1HXmfRCWkw/av6aBqsiK25ngbbccxQBQD2Zg
 DRKvrtOFdd7rljUNSjNabWsJRw+0u3V067ZlE85B7kp5Al6dMTVz2/yImpJXi5B9x+TVub
 niDRj4TgdA/LOC9EBPGWUZAKkG76VKI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-D8V4Z8wjNU2QwYvJDYvYOw-1; Fri, 31 Dec 2021 07:32:03 -0500
X-MC-Unique: D8V4Z8wjNU2QwYvJDYvYOw-1
Received: by mail-wr1-f70.google.com with SMTP id
 h12-20020adfa4cc000000b001a22dceda69so7498393wrb.16
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 04:32:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NsCll9Un1Xa4MtIU9acNU+sw1mLEwCpPrHs8/7SPr0M=;
 b=8QFYrYdH64LfthsZHZLHDyhWM9VHw+HV4y8MijGUE/X8sbb8dEZCSoT++dMW8iAKXC
 cqcAH3t5e7GmSwxjoAfUrX1A1AQ7WnGyVsGw2//oqiLDYL7Qf467F4LmXFbCIGdBTVqt
 GvE4Der868lTqpaqkaJsKGoJW/NXgtczJbA2GMBIWkSCa4XHQf6W+3V2PeAs0S+RcX1I
 0JbJc2U5YB6BrMC/k7f5p/gNRxYrUJIdtDjgvRK3TuAiueuWbEkALDbyniJPuFy+0zSx
 ji4x4tW6Ja7dycNCmnCA3yV2gORiRKvUZHxiY1s2zIFefQBlQp6MNl5Tou8KL8M2O/0l
 2kUQ==
X-Gm-Message-State: AOAM531Lwmkucyv55r6hoEfEweDXFqcftEDjSobdMqsVo/3bojjyF9FH
 ROD+CYgJ9Sd+yKw6Phs2/pCAAAKLCzafPdBixoztiWWEmQCUzlNyynQChD/14mg0JWmKMik7ZB2
 p5AP+XZ6TsPITHhSVmxNm5iDj0c1N/GgcGnzKCMhez5ZrpU8PLnfJxP3EPPOrG89R
X-Received: by 2002:a05:600c:384f:: with SMTP id
 s15mr30517830wmr.179.1640953921856; 
 Fri, 31 Dec 2021 04:32:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzRkq5JFEgCZh7qvnxYbQ6i1xaSnZi7eGjkEU5SlAlJa16QghtUIzME5RcFSV/aXlZXL30Oww==
X-Received: by 2002:a05:600c:384f:: with SMTP id
 s15mr30517820wmr.179.1640953921629; 
 Fri, 31 Dec 2021 04:32:01 -0800 (PST)
Received: from [192.168.1.36] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id ay39sm21451857wmb.29.2021.12.31.04.32.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Dec 2021 04:32:01 -0800 (PST)
Message-ID: <7a29cc3b-9a9d-5955-4967-cee2a5eb8924@redhat.com>
Date: Fri, 31 Dec 2021 13:32:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v6 0/8] tests/unit: Rework test-smp-parse tests
To: qemu-devel@nongnu.org
References: <20211216132015.815493-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211216132015.815493-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Philippe Mathieu-Daudé (8):
>   tests/unit/test-smp-parse: Pass machine type as argument to tests
>   tests/unit/test-smp-parse: Split the 'generic' test in valid / invalid
>   tests/unit/test-smp-parse: Add 'smp-with-dies' machine type
>   tests/unit/test-smp-parse: Add 'smp-generic-invalid' machine type
>   tests/unit/test-smp-parse: Add 'smp-generic-valid' machine type
>   tests/unit/test-smp-parse: Simplify pointer to compound literal use
>   tests/unit/test-smp-parse: Constify some pointer/struct
>   hw/core: Rename smp_parse() -> machine_parse_smp_config()

Series queued to machine-next.


