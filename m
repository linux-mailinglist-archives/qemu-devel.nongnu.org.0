Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F4E374F4D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 08:20:27 +0200 (CEST)
Received: from localhost ([::1]:53578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leXN3-0000LG-Lj
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 02:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leXKT-0007aJ-46
 for qemu-devel@nongnu.org; Thu, 06 May 2021 02:17:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leXKR-0005HN-78
 for qemu-devel@nongnu.org; Thu, 06 May 2021 02:17:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620281862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JyCDDQQt0PBD8sgF6y6Zb/Qy/Unx7n5TIUjrDwIEmnY=;
 b=I2+u8DWI6jEFJRXzxlrjBW5Cv9KrMlseXkAmDKCv3/AfwjElSZUjEww4mGn9ZLN509uqQB
 ftml2p1zwg+0+H77SPOktrF9FPe5h9wMDX8/M6NemQkcb2V207sDJ5YrkP41dAcWysB7lM
 M24itAtUCOe0RF8sEIJS0F4iMzI1qhM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-9qlvFY9UPteMNDOHjr_hzg-1; Thu, 06 May 2021 02:17:40 -0400
X-MC-Unique: 9qlvFY9UPteMNDOHjr_hzg-1
Received: by mail-wr1-f71.google.com with SMTP id
 a12-20020a5d6cac0000b0290109c3c8d66fso1738627wra.15
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 23:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JyCDDQQt0PBD8sgF6y6Zb/Qy/Unx7n5TIUjrDwIEmnY=;
 b=HCYPo5o5V3UIk0vX90xGmECOtpIdn7gnmkfORUcqKgK+DnN+CbzaAmD2SZb9ItMKEn
 F+8XtADT71ngrXGoi5to7dpAMv1jKtlj1Z283HZPI96yx/YHZsA1rafGfpTq3qlHd//R
 SNW7/Lp+mSY47rQtDuDAAnSAPPhWIDMDHzXnXcqJnwmo75SH575TzDAmH2Ks0EuopS9j
 jTCgEAy5x+i7cC9t/BI7Ff9ag8F2eQ/NtEOx2qgWRifKDRY/FBSjQu1un+VlenD9RqVE
 I5h1k3ZJGsc736Aa/f6AaMcsFllikw+QuEOG07HK8/OzODyb19jfWkHQYtY3ixSjE3Gz
 VpGg==
X-Gm-Message-State: AOAM533UODqtLi2mcUK5rHf3+b82PdqnX7QxnPKeAPL6WvGfpjfjEmdM
 fnuv8JEpDWUsIbqCBzvJ/DxQAB9UdMLECBEFo4oXoBcLoiF2Gu/hyVOJC0cw42mYCv8R5YBWdY8
 B0cgBRhOGY1wnUrdmkxvyeJyVFkYefgwcmK2AivrWFJphKkUvGhY9jgj0TRY1eI7N
X-Received: by 2002:a05:6000:1152:: with SMTP id
 d18mr2881450wrx.211.1620281859272; 
 Wed, 05 May 2021 23:17:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKn0EOyn7Q1YLGpVb1+x68ukmto60RcxaBjjzESQYAUIoUHC9EzdyyfuU1LAJL3jvJXWI8XQ==
X-Received: by 2002:a05:6000:1152:: with SMTP id
 d18mr2881434wrx.211.1620281859147; 
 Wed, 05 May 2021 23:17:39 -0700 (PDT)
Received: from [192.168.1.19] (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr.
 [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id r2sm2561159wrv.39.2021.05.05.23.17.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 23:17:38 -0700 (PDT)
Subject: Re: [PATCH 04/10] pckbd: split out interrupt line changing code
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <aed90d92-4e34-6f33-005f-10cf176e5483@t-online.de>
 <20210505192133.7480-4-vr_qemu@t-online.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9c32d3c0-244c-e6c1-6169-fad7db41b6a1@redhat.com>
Date: Thu, 6 May 2021 08:17:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210505192133.7480-4-vr_qemu@t-online.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 9:21 PM, Volker Rümelin wrote:
> Split out the interrupt line changing code from kbd_update_irq().
> This is a preparation for the next patch. There is no functional
> change.
> 
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
>  hw/input/pckbd.c | 32 ++++++++++++++++++++++----------
>  1 file changed, 22 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


