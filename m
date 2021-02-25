Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C99332519E
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 15:40:38 +0100 (CET)
Received: from localhost ([::1]:57874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFHoj-0004cP-Hq
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 09:40:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFHje-0007IG-AL
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 09:35:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFHja-0006B2-4R
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 09:35:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614263717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wFskUGOvUFWjjrWFGCbYGZ9C8IrWp9+h4phElJdnxxE=;
 b=MeKCqQbwIwGMJ7vhkvXzGglemf2i9N/YwoDNMFUHcnm8L6ZRykBPAQWC31R+kxOoV7IYBn
 jTqG+Odf04tck+0Wdc0qx7LDvFC9qgngylPdba+bMHRNZpJM+N4l3rjAeNQSLoSRFAJ10o
 2DpU+NO6RZqHyqzL1iQUzmmIh9N+Cr0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-tDNj_UAjN8ukVUt1BHEAsA-1; Thu, 25 Feb 2021 09:35:15 -0500
X-MC-Unique: tDNj_UAjN8ukVUt1BHEAsA-1
Received: by mail-ed1-f71.google.com with SMTP id q1so2775525edv.5
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 06:35:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wFskUGOvUFWjjrWFGCbYGZ9C8IrWp9+h4phElJdnxxE=;
 b=azRVzuhzRdAonHX2KTKQIBtvIDh1mbXWwbZD0VxTHmcwwxrB4fvMqrLRZj6hPRASQk
 4Fh9w/hShdFkosahPpnJt+4nycBvmAApGs+uz/N9kxXDbM9h/qNE0f+WpeykAB0kYp5N
 WdT5rR0NrZIroSEFcqdtokLBuBZk2xvCaZpASViQyxoioLSTwNEEzXWmYBbuolJysXqN
 4MtNUmSHhPonTTzatVz1FlbR09M0L6RJ8UiQV+zbbmHthOCcnpElk2UX/tIMmmoANOHV
 wwgI6A/2oZ+MBCTlLg9Fbv8byBUSljLZjJf5hXCg+hTOjZdF0jKrzsOJGIXMwPpyPnd1
 bg4Q==
X-Gm-Message-State: AOAM5307+6YNAQLyeutSk5EnxmJCm3n+f0/+lCMt9wxiZ3+o9wklip3v
 ng6MLN/LcdLN36piBa/i/9Br5OCsq5wiRl2XmTmkCd3dBof8EWOZL8vTv67V/7snAd0pl3M2nFj
 k2JbPgqUvUMrC0L0=
X-Received: by 2002:a05:6402:105a:: with SMTP id
 e26mr3115925edu.60.1614263714261; 
 Thu, 25 Feb 2021 06:35:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQjVIsRAG1Wohf/mMUsNSVSoae5DqtZttpXlgvEC+L4SsVt0IgzeUHEl2za86IfXK3a8k3aQ==
X-Received: by 2002:a05:6402:105a:: with SMTP id
 e26mr3115916edu.60.1614263714123; 
 Thu, 25 Feb 2021 06:35:14 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r10sm3267616edd.49.2021.02.25.06.35.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 06:35:13 -0800 (PST)
Subject: Re: [PATCH 5/6] sungem: switch to use qemu_receive_packet() for
 loopback
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <20210224055401.492407-1-jasowang@redhat.com>
 <20210224055401.492407-6-jasowang@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1735083d-6abc-d3c8-7b42-0f626482cbcf@redhat.com>
Date: Thu, 25 Feb 2021 15:35:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224055401.492407-6-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 6:54 AM, Jason Wang wrote:
> This patch switches to use qemu_receive_packet() which can detect
> reentrancy and return early.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/net/sungem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>



