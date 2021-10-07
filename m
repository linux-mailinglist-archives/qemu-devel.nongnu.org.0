Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D04D14254C5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:52:03 +0200 (CEST)
Received: from localhost ([::1]:47470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYToY-00025a-Tk
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYTiW-0005nr-KZ
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:45:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYTiV-0003ZQ-6j
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:45:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633614346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zwnlKVlSNXejyeyVC9GW65Zf8G6DhtU6zw5XXTbJjZg=;
 b=NLbV4OXGsQb/ZPNJn+AEtEgTmfhK3SteasxkYWMuwgvZCcmUHmH9RmW0vCj/b7kvBbtV4u
 pmogOvWzjF6MfM8KkTGFIs6DBha6eQ8h5bfXLj1Egy2JyTRN+SmmOg47vf/z+mpr08qX3U
 thP760TESypVIvJRaO04BXvN3e3l8LM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-sSjh2e36PEe0zuvtQMZjXg-1; Thu, 07 Oct 2021 09:45:45 -0400
X-MC-Unique: sSjh2e36PEe0zuvtQMZjXg-1
Received: by mail-wr1-f71.google.com with SMTP id
 a10-20020a5d508a000000b00160723ce588so4731932wrt.23
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 06:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zwnlKVlSNXejyeyVC9GW65Zf8G6DhtU6zw5XXTbJjZg=;
 b=JSREmmrqeR0AlYAwEx+PMfD7iJJQbl6MZnKG90fjxezORWQ/vfa3MsZKb9GqMPZMjq
 yxw+6AaRVGQzGKUWkBRZICskvPdS52zugUcPgmFLpT+Ehs1EFIeHGuItabQDnIC/mkaO
 E0OLj4+hedP572iYHni0xuRZ5qlMfsqu+OPupQ95jQjAvTIahvn6P8w8HybYQFim6d4R
 9tlHC/rWHjNxwtFce9RJBJnJQ6F2eAWHCTNGHE1CU2HmBDCmdSPRgZMQqa4MalEsT/aM
 9KiTXkIj8pG5GFRyeYsh55j5O48PHgGljxe0LWeTva9c/7UYwRMdcnxf+/dkVT3TjVdg
 PHsg==
X-Gm-Message-State: AOAM533gi4SDJpU2sDr4Yaly+v2R0EQ5nke7g9+cfW1fTgS4CzDH7sUu
 rQahjZB1OTStB3L8Q2ePJzkN8UW6C9EoBmgqdbjiYBu+1uTjHyo5Hodb/PvXXkWs1c8YNHkq6vz
 9pVpMXhLOrAus/7w=
X-Received: by 2002:adf:fbd1:: with SMTP id d17mr5534343wrs.146.1633614343969; 
 Thu, 07 Oct 2021 06:45:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtxOB1Nf110/TXENNdW7NZkMyX9OqUEEZMkeDWkICPO9qNDxgg2SY2Aeid4IS9fW+BSatyCw==
X-Received: by 2002:adf:fbd1:: with SMTP id d17mr5534327wrs.146.1633614343850; 
 Thu, 07 Oct 2021 06:45:43 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id a127sm7154014wme.40.2021.10.07.06.45.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 06:45:43 -0700 (PDT)
Message-ID: <ffa80289-5d7f-7a33-9923-f9c449d7654d@redhat.com>
Date: Thu, 7 Oct 2021 15:45:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 11/24] configure, meson: get HOST_WORDS_BIGENDIAN via the
 machine object
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130829.632254-6-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211007130829.632254-6-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
> No need to pass it in config-host.mak.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure   | 4 ----
>  meson.build | 3 ++-
>  2 files changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


