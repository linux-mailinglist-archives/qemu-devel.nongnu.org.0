Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC5433D97B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 17:32:35 +0100 (CET)
Received: from localhost ([::1]:37520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMCcT-0001oI-KJ
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 12:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMCN2-0006wC-RD
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:16:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMCMv-0000w4-AC
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:16:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615911386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KE5U4GzWQcwmLt7W2e9BZESmBsG8uJjZyTRUix6ez4g=;
 b=XvEzex33XeqJHY5hfqWlrK/As3Ric2X9C7tvt7+f+Imt9sUn3+3/DIqCmkjthJfEjBRPrD
 nUntAnsjzvPoy5LFUrJUggZAFbNQ9X5RRxodSJCa9eDhG9MSBqmoYXe0j2GeVT05tv78ay
 d1SO7Glrxi7euyZC16CiGzAloDZRmHk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-T3jPAQXBOWWWhrIdw-QoJw-1; Tue, 16 Mar 2021 12:16:24 -0400
X-MC-Unique: T3jPAQXBOWWWhrIdw-QoJw-1
Received: by mail-wr1-f71.google.com with SMTP id p15so16759662wre.13
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 09:16:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KE5U4GzWQcwmLt7W2e9BZESmBsG8uJjZyTRUix6ez4g=;
 b=aypIi8MYZy4EVo30Tbf2tW9Llh4EYTmkQD9lJ8X8o0cpop2kioV93qsNntpWFgKus0
 sM31aiIzVKHYk/bPhxj8UACA1+jnWTr/NXNfnkdHxCdSS3ArH9TDffQTWY4RvXMuXBQw
 OweVdhGDWl1Z9RCDClSEc/SNjVud17ygv7icd5m/PIUfEUyAkcXUcjHcyzCeVhG+4S0Y
 9B8dYXqHGhkEK1hncrxh5LWqPv0xqHU3gyA5PsuWaiZUv9EVrT0zTdaSgJHjfoS89M/K
 dKc9h0IzIUAmoogo1+4I8RFESzYIUqG9URyo76iw3BT0Ps1gb75iSIw8pxVeXAqmBppH
 HzFA==
X-Gm-Message-State: AOAM5319OlTMgZhq1UCcfmLD2tVoTUa4hLyIW8g0ZyStBPrN44KB+2X2
 2H2K9VY+7c5DvKIQKd0yf7WxcFxhBEI3sImAshqEVw/fi79p0abajUXqOih+18DTeFTRHrT1IDE
 g1EcwU5Nc6+Ry2KwwQ60UOfjc3yybUqYIakU1BVe3GjiBQ4lgwd0eXL/77PhcmKap
X-Received: by 2002:a7b:cd8f:: with SMTP id y15mr357210wmj.185.1615911382924; 
 Tue, 16 Mar 2021 09:16:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQ2mwr2+oxySvbVZ1CV11D3eYNqSQQ9bjWOd8NKM+/S/0wnNzNTONClRvObK/6DIKrinDDEw==
X-Received: by 2002:a7b:cd8f:: with SMTP id y15mr357200wmj.185.1615911382779; 
 Tue, 16 Mar 2021 09:16:22 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id z2sm22365152wrv.47.2021.03.16.09.16.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 09:16:22 -0700 (PDT)
Subject: Re: [PATCH 1/9] qemu-edid: use qemu_edid_size()
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210316143812.2363588-1-kraxel@redhat.com>
 <20210316143812.2363588-2-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a477eebb-f547-237c-a536-3f53179edf14@redhat.com>
Date: Tue, 16 Mar 2021 17:16:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316143812.2363588-2-kraxel@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 3:38 PM, Gerd Hoffmann wrote:
> So we only write out that part of the edid blob
> which has been filled with data.
> Also use a larger buffer for the blob.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  qemu-edid.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


