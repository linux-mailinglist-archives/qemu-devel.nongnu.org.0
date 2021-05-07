Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 680A3376964
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 19:18:58 +0200 (CEST)
Received: from localhost ([::1]:48398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf47t-00027u-4s
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 13:18:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf44U-0000cB-7M
 for qemu-devel@nongnu.org; Fri, 07 May 2021 13:15:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf44H-0004Bb-FE
 for qemu-devel@nongnu.org; Fri, 07 May 2021 13:15:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620407711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uTyDKyOPg1mkUq53+v02Ub+Jg9GMqLoeGEEmOXgo2O4=;
 b=J3pUZVegE1EI0yumEL1F333rtd+6ni1Qn/gUm+vXtWW4iZN0zxf85IUTTGXIukSpcp7fiG
 pkfT6gp1OK92wY9ytDwCUW7vUE1pSrxUY+H4cMqYJF95BL4dHDjxUWNeNlyNE/QWs2RCz7
 gD5RFZfDX0cm0PdtlQF4iRcORky1dP8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-K0UMR9fDNmuXSoAm1TBY0Q-1; Fri, 07 May 2021 13:15:10 -0400
X-MC-Unique: K0UMR9fDNmuXSoAm1TBY0Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 67-20020adf81490000b029010756d109e6so3821887wrm.13
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 10:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uTyDKyOPg1mkUq53+v02Ub+Jg9GMqLoeGEEmOXgo2O4=;
 b=Ddbb4omWR0W8Ek4Uw65zRdgKrEoGZ6RQsHX0ANOn7PXwBLMlMhAZ9armay9YeEYcHO
 5Elf4Mzjz84F54XYiWode/XZ1ag0K6t3FKtq/Vvb8N2uTiKqbfsZCpv6apI+FU+p/wog
 F6SHCjlMSodISfCv2l59BbTOFaT1FFNp4r0gv7BFptG6EO07XLQj81x5T7zQHj1QB3Jf
 ZBycM2g3lfEud9ERgi9ldTJIlWyPxBXidNjyJQMsdEz7hPZNok2zW7siPN2Hb78ekaO2
 ratEwNAXOHJMxSA6tFyJzLBywrU3otNL2oVZ+7R7NC4N4hlBzdUlEmsK2UrzHx+/UqEs
 nGQw==
X-Gm-Message-State: AOAM532yA8k4K7nF0YryxrONjIhlv9ZlQh/uvVDSvxZZgUvMdu8Mj4pd
 2rOsok8uyCUCPDES6bEnQsDHQdfIUHL0WhlbmjNbHOAflLcWryKYclMfubxrzjvzwgSdgEe7R0k
 o0bgzMMpsbOD2Lg0=
X-Received: by 2002:a05:600c:4f49:: with SMTP id
 m9mr17638984wmq.78.1620407708955; 
 Fri, 07 May 2021 10:15:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjem0ls7raS3UMzqyfwEq7FubFHH9scruWbZ08QkLcYKMtrComMFpoArXPNd6k+bOrLlo08w==
X-Received: by 2002:a05:600c:4f49:: with SMTP id
 m9mr17638973wmq.78.1620407708837; 
 Fri, 07 May 2021 10:15:08 -0700 (PDT)
Received: from [192.168.1.19] (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr.
 [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id a9sm7539023wmj.1.2021.05.07.10.15.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 10:15:08 -0700 (PDT)
Subject: Re: [NOTFORMERGE PATCH v3 17/17] configure: libSLiRP buildsys kludge
To: qemu-devel@nongnu.org
References: <20210507144315.1994337-1-philmd@redhat.com>
 <20210507144315.1994337-18-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <781a5288-f1f7-de29-cdc0-b71fe38e7468@redhat.com>
Date: Fri, 7 May 2021 19:15:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210507144315.1994337-18-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/7/21 4:43 PM, Philippe Mathieu-Daudé wrote:
> Only enable -Walloca when libSLiRP is not built.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  configure | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

> +# Kludge pending an alloca() call removed from libSLiRP, see:
> +# https://lists.freedesktop.org/archives/slirp/2021-May/000150.html

FYI it has already been merged, thanks to Marc-André :)


