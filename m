Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 209E63A9DC3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 16:40:27 +0200 (CEST)
Received: from localhost ([::1]:45380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltWiP-0001di-OB
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 10:40:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltWh9-0000eU-O0
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 10:39:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltWh6-0002Zp-BO
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 10:39:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623854342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f8CS5MfRuAKFtEt/G3KW7BuW6zYqPnqRAmYHYkBsUQI=;
 b=Kp4PnC0QBLCD/ExJmVZataVSqd+Axg7I4vQpFtimMYrPEfzKZ0mT2TD2c92+v3IfbPT0iT
 33iPdwq4/KH4Kqfew0aHNgOEOb+Ypt/qRt3O7ndLje406inJBMaaBNlGIFz1W9kFlmxLDH
 ZYgSbTWYFDSTCl3ssqQJVP/loF8JroA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-yaGDrYfMNvm1_q1p6Bui-A-1; Wed, 16 Jun 2021 10:39:01 -0400
X-MC-Unique: yaGDrYfMNvm1_q1p6Bui-A-1
Received: by mail-wr1-f69.google.com with SMTP id
 k3-20020a5d62830000b029011a69a4d069so1129162wru.21
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 07:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f8CS5MfRuAKFtEt/G3KW7BuW6zYqPnqRAmYHYkBsUQI=;
 b=j3S5aUkfNf2S5faPw+FA6hZVoaKDoxw1UtY8Qq2ioYhTCSH0HYt2iiztLQXxqeBA9H
 3eH/jtVYQre/HDfcuQZ9b7NfnwKVqkJpnkDv7uLtCuBnzS3MNrfvyv47hP7TH6BFxhCw
 PeZI1WyqXEC74XLnfzOg2znOw46Z6w2a7IkgeIuwf78YEPVVetKxVnL8OokA7BGpHylO
 uGnFIC4AVYQWoipUjyg8nRan34dkAJmi/vSc+W9qQJqTHV+S9qZMdst0W+yjgI6hMAoh
 wEYsz8DRj2DIIWV8PI7BZgqlNkxzhVH9J2Lc6tZcCumlbkaVZ4CjOYOtV8ZExWeGNnfd
 QAyA==
X-Gm-Message-State: AOAM533IUJgWqWPK48UY1vzH/bUYRh96qjv75C54tUIuwTR63mne4rd7
 K1mYsKlNDUWYLVWjgNzy6/MloUbl+5woFpGJeep+bxGVVP9VUEFPcabuBkCn54cGSHQTYj9V85V
 LXtzSBmFdffh1VX8=
X-Received: by 2002:a5d:47a6:: with SMTP id 6mr5814633wrb.203.1623854340100;
 Wed, 16 Jun 2021 07:39:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCGtT2ECSeiIeeEZ6LZ5N+dt1C/bEaFpJ/6hqaHlBxdarrHaTMB7YfI0EIhLGhL4r29nvk4A==
X-Received: by 2002:a5d:47a6:: with SMTP id 6mr5814617wrb.203.1623854339946;
 Wed, 16 Jun 2021 07:38:59 -0700 (PDT)
Received: from [192.168.50.31] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id g10sm2396939wrq.12.2021.06.16.07.38.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 07:38:59 -0700 (PDT)
Subject: Re: [PULL v1 0/5] Merge tpm 2021/06/15 v1
To: Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-devel@nongnu.org
References: <20210615152152.2496772-1-stefanb@linux.vnet.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <84e73f5d-df78-fa4b-4469-09f859ffe4bf@redhat.com>
Date: Wed, 16 Jun 2021 16:38:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210615152152.2496772-1-stefanb@linux.vnet.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.17, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/15/21 5:21 PM, Stefan Berger wrote:
> Hello!
> 
> The patches in this PR eliminate all TPM related code if CONFIG_TPM is
> not set, thus reducing code size.
> 
> Regards,
>    Stefan

Thank you Stefan for this quick pull request :)

Phil.


