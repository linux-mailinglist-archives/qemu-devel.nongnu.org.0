Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6B16076C0
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 14:18:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olqyY-0000Ov-CI
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 08:18:10 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olqxd-0007ET-7s
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 08:17:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1olqxS-0006j6-3N
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 08:17:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1olqxE-0003iv-5A
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 08:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666354605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6H7jbTfy6PW9zULXoLcu+Tixb11MlRy8+pnk/j9Xvsg=;
 b=TjeoogvU5wIL0p8ooz1x/YMdMFAIpCm9bEcgyHCSUfXnUWR5rSPYsAWsYJqadeTk3zrcTx
 gjKG9aB/Y0VIj0AXJfwS2JXU2ORjDZtIc19z1g/B3yOpIjHebTDUHEQQMT9OWqBNUS3odN
 TOCxnVGNvzjNWxeBxBswG9V/So/QYB0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-635-n4WvbnkxOiidvwuXzDFkVg-1; Fri, 21 Oct 2022 08:16:44 -0400
X-MC-Unique: n4WvbnkxOiidvwuXzDFkVg-1
Received: by mail-qt1-f200.google.com with SMTP id
 17-20020ac85711000000b0039ccd4c9a37so2404219qtw.20
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 05:16:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6H7jbTfy6PW9zULXoLcu+Tixb11MlRy8+pnk/j9Xvsg=;
 b=H3h3ClD1fkH+1l64KpZignJDrBX6jrotW8/6K+EM2X4lgTPT8b6L9Q+pC8vzc6Ekjs
 woxe4tIznYi4U5qsLTaLig3Wuwe1o6bO626IypKS00GXUVwenC7VphphM1XP3ncfzZMO
 hvfJAgw381/rJ32nddymRlQK2ughfa5B1R8vzBzS8lkZXHhF4Mu38fqsFRoyOqOao0Wm
 tGJOBJv58ldcqtpWXmj9y9iYlXR2NuCvbq66iqrBuYaO8YrozMTePI8QA5hgd9jBsQuL
 HsEzASHP2a4qyecvXT1U+Cs3igNGDltr7TSvmtas9obutDfeZXEhuzqWYjyO4Rmi0fdu
 occQ==
X-Gm-Message-State: ACrzQf2df/brtznLs9gAq8ZsDKy/HFn2/DLZBIpLZef9syanz5fw5FAn
 4GlNN3cbhI0ndNhyogvxHWWhmq28fn4wPCOlOXqxU73alx0Mkv7KbbXbZzVJxdYlVGdp/UdEXV2
 pVLEYf7OE3judqEU=
X-Received: by 2002:a05:6214:1c85:b0:4af:7393:3d91 with SMTP id
 ib5-20020a0562141c8500b004af73933d91mr16532896qvb.74.1666354603432; 
 Fri, 21 Oct 2022 05:16:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7o4sHjvgfqRFCIvkiC5tgAYSIgdsKK51pjpVF3p8e4U1hBUm3UhULjSkmSvB0gGaEnRwpT+w==
X-Received: by 2002:a05:6214:1c85:b0:4af:7393:3d91 with SMTP id
 ib5-20020a0562141c8500b004af73933d91mr16532878qvb.74.1666354603184; 
 Fri, 21 Oct 2022 05:16:43 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-178-110.web.vodafone.de.
 [109.43.178.110]) by smtp.gmail.com with ESMTPSA id
 h24-20020ac85158000000b00304fe5247bfsm7866493qtn.36.2022.10.21.05.16.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 05:16:42 -0700 (PDT)
Message-ID: <dca85549-6356-d185-eb29-9d0a8f5f1421@redhat.com>
Date: Fri, 21 Oct 2022 14:16:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/4] ui: fix tab indentation
Content-Language: en-US
To: Amarjargal Gundjalam <amarjargal16@gmail.com>, qemu-devel@nongnu.org
Cc: kraxel@redhat.com
References: <cover.1666110191.git.amarjargal16@gmail.com>
 <fb5ec3a9f6f22bcf090a5805f514d36e7da54336.1666110191.git.amarjargal16@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <fb5ec3a9f6f22bcf090a5805f514d36e7da54336.1666110191.git.amarjargal16@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/10/2022 18.25, Amarjargal Gundjalam wrote:
> The TABs should be replaced with spaces, to make sure that we have a
> consistent coding style with an indentation of 4 spaces everywhere.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/370
> 
> Signed-off-by: Amarjargal Gundjalam <amarjargal16@gmail.com>

  Hi!

Thanks for tackling this! Some comments below...

> diff --git a/ui/vnc-enc-zywrle.h b/ui/vnc-enc-zywrle.h
> index 9b7f698975..f74ad81749 100644
> --- a/ui/vnc-enc-zywrle.h
> +++ b/ui/vnc-enc-zywrle.h
> @@ -51,14 +51,14 @@ static const unsigned int zywrle_param[3][3]={
>           {0x0000F000, 0x00000000, 0x00000000},
>           {0x0000C000, 0x00F0F0F0, 0x00000000},
>           {0x0000C000, 0x00C0C0C0, 0x00F0F0F0},
> -/*	{0x0000FF00, 0x00000000, 0x00000000},
> +/*    {0x0000FF00, 0x00000000, 0x00000000},

I think this curly brace was meant to be aligned with the other curly braces 
above and below ... could you add some spaces?

>           {0x0000FF00, 0x00FFFFFF, 0x00000000},
>           {0x0000FF00, 0x00FFFFFF, 0x00FFFFFF}, */
>   };
>   #else
>   /* Type B:Non liner quantization filter. */
>   static const int8_t zywrle_conv[4][256]={
> -{	/* bi=5, bo=5 r=0.0:PSNR=24.849 */
> +{    /* bi=5, bo=5 r=0.0:PSNR=24.849 */

This likely was also meant to be aligned with the numbers below... could you 
add some spaces?

Same applies for the other "bi=5" comments that you've changed.

  Thomas


