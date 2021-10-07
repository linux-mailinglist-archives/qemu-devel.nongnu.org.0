Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5039B4254A0
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:49:17 +0200 (CEST)
Received: from localhost ([::1]:42892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTls-0007KC-Cz
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYThZ-0004Th-A8
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:44:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYThU-0000lj-Mq
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:44:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633614283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l9hBZWv+oqIcnJJMKN+5kW5D5QoBBM5oWnA2t6Uh1ak=;
 b=JDALeiQ2iLwBuczvv+zQpOUbdGKDzy9c9VE1PP8LfbT/wt6M4a7RIYLdRFL5XI5nvfZaoi
 xK/9WKRIBP2khsoOpd2QIL4kfLLayCy0RGPYafBVbHAfNq7NwHBUu/DyzUgRcKjnGwu+5V
 SLw/D7bIQnhxf2Xdt88/i7PolGSTHyI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-8bWaVVoUOMe-2j-1FN-Qqg-1; Thu, 07 Oct 2021 09:44:38 -0400
X-MC-Unique: 8bWaVVoUOMe-2j-1FN-Qqg-1
Received: by mail-wr1-f69.google.com with SMTP id
 l6-20020adfa386000000b00160c4c1866eso4734837wrb.4
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 06:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=l9hBZWv+oqIcnJJMKN+5kW5D5QoBBM5oWnA2t6Uh1ak=;
 b=7mb2Nc3a5LLXkN79TGayGmBvhJLdgaCT2uzYnwsRMZZtnCFzvd+trjv9BR4BRVPw1P
 YDJGKmpPeDXJyRzcrNu9qxrUQY1W1nQoAfinAiUPijlU6/tmksGZpUGHBITRt4Vv9IC7
 tK6EaxGiP8asWQhSNi5lXgohZ+X8lqQllDCIbTMGKKQf84I+mXlnhh5/imfh86S215yG
 Iwyaw1R1/eczrOrueQrOsJ5sqSxjeUFG77nEeaYqiNmdp3pqgeA5C5L7dM1u4rROj1Oa
 iF2yAcTNAheoIpa5evIUp6eyqYVTXvsmiKyEtA+/Pp+AXQwlNo3ZuG5XPrNFVMtFytsr
 jtTA==
X-Gm-Message-State: AOAM532H0Jm9+rYmlNJEj9+hh0BoRExfyPY3TJTUuJ9mKnAGDy2n68/r
 AN6va1kkVrY7rzPg0DUgWqKV81Tg1BIb19PFUuGH7ZeTkJveR1oEDD2c7xJKpMtesmGZeQYUNBR
 /bXgPkh5rxDfFY1s=
X-Received: by 2002:adf:ab46:: with SMTP id r6mr5495523wrc.71.1633614277475;
 Thu, 07 Oct 2021 06:44:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIU5ACn6lbzplk1ezZekaOofIj8pUJrOMkO4TkwgxXKfL+TtlsDUb2EAZl88Dgmcd0uZIHZQ==
X-Received: by 2002:adf:ab46:: with SMTP id r6mr5495497wrc.71.1633614277316;
 Thu, 07 Oct 2021 06:44:37 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id w5sm24047215wrq.86.2021.10.07.06.44.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 06:44:36 -0700 (PDT)
Message-ID: <4ae88861-60db-022d-f66c-2d42c04d0194@redhat.com>
Date: Thu, 7 Oct 2021 15:44:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 10/24] configure, meson: move CONFIG_HOST_DSOSUF to Meson
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130829.632254-5-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211007130829.632254-5-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/7/21 15:08, Paolo Bonzini wrote:
> This is just a constant string, there is no need to pass it in config-host.mak.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure   |  6 ------
>  meson.build | 10 +++++-----
>  2 files changed, 5 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


