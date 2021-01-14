Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2732F64B9
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 16:36:27 +0100 (CET)
Received: from localhost ([::1]:42878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l04fi-0005bh-Al
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 10:36:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l04cF-0003Nz-PS
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:32:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l04cD-0005zr-NA
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 10:32:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610638368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tqtW1KDSvAX5s6p7okJuPtDS5DuCphHONRKVfLVY6U4=;
 b=ZJdmafzzQ6rmopYlR7wY4jWE+ehwT0eFKCcAQf9B/0HXcHb2FTcvxmRPeIyOaEVeom6Rpb
 IaUTi/qoTiaAbL+0ySnq5yL7KiAZvG94vVW19SwNcKKDnzHg5BXAUoro/o+/ZVlfNd0eK1
 eU0OVU4X8TTxGad3rM3G+8Oruhob62I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-8r_oVnd_Mj-owditT_gpOA-1; Thu, 14 Jan 2021 10:32:44 -0500
X-MC-Unique: 8r_oVnd_Mj-owditT_gpOA-1
Received: by mail-wm1-f72.google.com with SMTP id x20so2031162wmc.0
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 07:32:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tqtW1KDSvAX5s6p7okJuPtDS5DuCphHONRKVfLVY6U4=;
 b=JjuTqGWBFOcxMelUlU4+TzqWNBD4ddFXNRUXe6zmUzwRJQgMBvDx7ajVyIwAKm9YYM
 VtWD6LsI2GCo02AortUMKfq7ZuD+FmU9rDzuWOXr4u5B+S8/tqDEmx0KXFR37+/atW5Z
 xaLWP4lPoU1qoc7uBgoZLoc9SNsb+PbBtNMyOUjUNdsOEKCAjnDzXbfGWTgnVm2C5Ypt
 /gvniq9+du9D6eSG6Fi/5+5UXdeMrhCtG6vIqO+dFiDQlTTyRio6/Q2f2LvI8+UwoOU2
 wuzEDK0R1FjgzE5sDwBLIEeNaqqdQw3FRSggqESshfK7nVO1OB/QWca2qPRz2hs5WIgP
 4SjA==
X-Gm-Message-State: AOAM531UOLt6EwwWNDOjkXyS0ANdzFxbFMjS0/ndwlLdLApBj2WAK4xj
 FZCqBnBNGopY5CeW8zRGYz8lsJ39fOpMXsNy7VHa7Frs06hmjDRuyItIWwG78B59w9I/VK9njc8
 2x67Bijq8BHATaxQ=
X-Received: by 2002:adf:dd11:: with SMTP id a17mr8534957wrm.360.1610638363744; 
 Thu, 14 Jan 2021 07:32:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxk+Bq5+Nzt2pTJaXxoamNpyChmVGBH6c1zzQzow7WSxs2XaEgTecMvMs18W4d12UVEINCHPA==
X-Received: by 2002:adf:dd11:: with SMTP id a17mr8534935wrm.360.1610638363576; 
 Thu, 14 Jan 2021 07:32:43 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id t16sm9296324wmi.3.2021.01.14.07.32.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 07:32:43 -0800 (PST)
Subject: Re: [PATCH v2 1/1] security-process: update process information
To: P J P <ppandit@redhat.com>
References: <20201203142902.474883-1-ppandit@redhat.com>
 <20201203142902.474883-2-ppandit@redhat.com>
 <73cb359c-164e-13ed-dccf-1706e03ea52b@redhat.com>
 <r8pon75n-3o56-646-os49-os67578r64n@erqung.pbz>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bdf3c3ad-79e8-75bf-fe69-29e610b7e8ff@redhat.com>
Date: Thu, 14 Jan 2021 16:32:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <r8pon75n-3o56-646-os49-os67578r64n@erqung.pbz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: peter.maydell@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Petr Matousek <pmatouse@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Darren Kenny <darren.kenny@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/21 4:31 PM, P J P wrote:
> +-- On Thu, 14 Jan 2021, Philippe Mathieu-Daudé wrote --+
> | What is the status of this, is something missing?
> 
>  -> https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg04469.html
> 
>  It is up and running.^^

Ah, this is a qemu-web patch, sorry...


