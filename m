Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9772239F664
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 14:21:47 +0200 (CEST)
Received: from localhost ([::1]:41510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqajq-0007eA-MQ
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 08:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqadQ-0001gy-5g
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 08:15:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqadN-0005fT-UR
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 08:15:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623154504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S3725HCAvfcRmDw6zAmgSpQQyu0Oa7gjI2N/s12zscY=;
 b=FfzJhrDTvEkdNIGEcQJThlnLuLwKkqUXW0pQAU6mHRgcCTadAA1PUPERy3Tca8UILsYtnl
 0ncmAGk5jNcxpDQBq48I+xjU5e4LYH6zqllRfkgeiKsdpBUFRVIQXG2gU/rmVYSGKelIe/
 ug/E9wgU0g9BENgybW5yxXrwW2vFwG8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-QenPmYm3P72wCvt1Z8hkoA-1; Tue, 08 Jun 2021 08:15:03 -0400
X-MC-Unique: QenPmYm3P72wCvt1Z8hkoA-1
Received: by mail-wm1-f70.google.com with SMTP id
 k5-20020a05600c1c85b02901ac8b854c50so678237wms.5
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 05:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S3725HCAvfcRmDw6zAmgSpQQyu0Oa7gjI2N/s12zscY=;
 b=XoKbtFV6aRyJTKs1xqugKX+Twz89KUIL4/rzJsGk7k7lzB7gjxL25AFnmar7o+yr6F
 1NdoqkIPmHm38lTuVN6HcbRC4fkk9AGUtXkq7fFYmBp6CGJHLm9F6UBp9v/iYaG7BwcA
 0X+pP2tfD742RcTbcQra0jFpFlWb49vv5CcyluJNHv9c1zgdVvXkqGfZ2/fGZ4z8kM0/
 kk+9Ak/pY6OrkIj3JFmaQDGZ1xNUzaYGmVOjaDoQSHfTaTacrO1LH8bsb7Oqxry6x7B9
 vT/ta4O/TbQf79bgMRrvO5JnOHfKIIB7Ch2FyPfbzhul7WA/sg3EjXjEuEjPMeovVRVQ
 89cw==
X-Gm-Message-State: AOAM530Xw84zxI8tc5jTr7fdOufGKbiLjYIfuCCzYS3/B7IIwuSP8Dk5
 FzSB2SQJI7vBhwFG/H+yf08QA8/AhfoHslSTQ+rAajha+VzkEyN0GjiaD8/S2mnqCu/NczvlEyi
 6Jq/alj+MbbNkg94jbVQDwu/Ey16aHZPOYEseKBnTc6Cm83QkA/1hFs/k3c7vr5e+
X-Received: by 2002:a05:600c:354d:: with SMTP id
 i13mr1681200wmq.67.1623154502476; 
 Tue, 08 Jun 2021 05:15:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxp8+i3L8kVoESgrOETG53oQWBvJsEJvO0CfcjxS4nGHXiCHt3Vz9HFx7vMGaMAkK9AH5vTfA==
X-Received: by 2002:a05:600c:354d:: with SMTP id
 i13mr1681172wmq.67.1623154502240; 
 Tue, 08 Jun 2021 05:15:02 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id x10sm9031531wrt.26.2021.06.08.05.15.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 05:15:01 -0700 (PDT)
Subject: Re: [PATCH 02/26] configure: drop unused variables for xts
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210608112301.402434-1-pbonzini@redhat.com>
 <20210608112301.402434-3-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fc03535a-2018-b732-21d5-ab2ccc5f25df@redhat.com>
Date: Tue, 8 Jun 2021 14:15:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210608112301.402434-3-pbonzini@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/21 1:22 PM, Paolo Bonzini wrote:
> All XTS configuration uses qemu_private_xts.  Drop other variables as
> they have only ever been used to generate the summary (which has since
> been moved to meson.build).
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure | 4 ----
>  1 file changed, 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


