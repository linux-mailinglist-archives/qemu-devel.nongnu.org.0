Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B46803B3F31
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 10:27:31 +0200 (CEST)
Received: from localhost ([::1]:35472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwhBS-0000oI-Pw
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 04:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lwhAI-00006R-Vc
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:26:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lwhAH-000789-FA
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:26:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624609576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sibh6iynVbMoNHxQ2zJ8hMVTEsRrDzpQTDof1DDyGW4=;
 b=HIuB7JUIcfasWbw1iVj2PV2LmVBLEarClDTA0tRNyJ18fJ7/XlXGz418BXadbmVS5VLS2Z
 1bdBNnYLD+EJBqN0jwM6+JMDyyoP4p3UuVz1Y2D/UfFe8er+UcSn9ojyY0xQtxVf9j+xSu
 qzeVw4u6cLZjQcc+TD9maKXGc0vlsKQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-DcyX7jHINTWQGW0F5557SA-1; Fri, 25 Jun 2021 04:26:15 -0400
X-MC-Unique: DcyX7jHINTWQGW0F5557SA-1
Received: by mail-wm1-f71.google.com with SMTP id
 v25-20020a1cf7190000b0290197a4be97b7so2422659wmh.9
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 01:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sibh6iynVbMoNHxQ2zJ8hMVTEsRrDzpQTDof1DDyGW4=;
 b=l5L4iPR8GboXnDIVnR/BnxIORvWwb3earaH9p+U2KrrXFtijOSIuACs3gxQDR51/Y3
 egj32y05eMzbhlOnAsFq8hF935XvfWCeU7cSkIh2uRAgST9HFTFGvAUFGuZvzTmcuNhc
 gSwsjJUmbdHhbSn5G9WVC1hXWVzenl52GUEr7uzi6eF8n9+xKHrsz2R/LrMSKg1WEzqC
 HrxN3HBOxz5DbrEtF+aEdbDx8WSX6NHVEKQ320fI8dEtJi1mRCI9mV79E7b/TrNtKetw
 UD2QnztgynmixomRyY1CmeIJBTdp2Cq07EMAbig38/x7qJbPJqLqX823Z3ho8X9bQ8zP
 liFA==
X-Gm-Message-State: AOAM5320TPQW1hQ5F0GFVtzRqdU+DbLxPMSx9LvsfeeXuVeuapr0oUL6
 WChr/zICFA9zdRT5cb29nOUS3yLKtifem8zpAErE0GPpshk4Lxa+/RZ3kdgcKNs528jggRoIoCl
 20XwgdCRF2p+n+64=
X-Received: by 2002:adf:c843:: with SMTP id e3mr9665174wrh.25.1624609573912;
 Fri, 25 Jun 2021 01:26:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmehA1Ow50nmQ3y180gld5fWoHig4G2S+qxWDJmdHjdnZtPvpxCLjAir5YVOYdgGrJgsPMJw==
X-Received: by 2002:adf:c843:: with SMTP id e3mr9665150wrh.25.1624609573700;
 Fri, 25 Jun 2021 01:26:13 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id b11sm5556358wrf.43.2021.06.25.01.26.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 01:26:13 -0700 (PDT)
Subject: Re: [PATCH 03/11] osdep: provide ROUND_DOWN macro
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210624180423.1322165-1-pbonzini@redhat.com>
 <20210624180423.1322165-4-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cb30ce46-6c8d-4b4e-1d01-31ac05179a51@redhat.com>
Date: Fri, 25 Jun 2021 10:26:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624180423.1322165-4-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: mlevitsk@redhat.com, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/21 8:04 PM, Paolo Bonzini wrote:
> osdep.h provides a ROUND_UP macro to hide bitwise operations for the
> purpose of rounding a number up to a power of two; add a ROUND_DOWN
> macro that does the same with truncation towards zero.
> 
> While at it, change the formatting of some comments.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/qemu/osdep.h | 28 ++++++++++++++++++++++------
>  1 file changed, 22 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


