Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9217369987
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 20:26:04 +0200 (CEST)
Received: from localhost ([::1]:40218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la0V9-0006le-8k
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 14:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1la0SF-0006FO-Tc
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 14:23:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1la0SD-0000qx-6J
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 14:23:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619202179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A18kDWp4Vy93j3X5zYtAzoKqesKPbHO49Euefe1kzS0=;
 b=G5AXAgbV7kXt+I/+eEZkza+/hc+FMN2giqHmRrBLzZWZEyUma5HXiCpIHBV0EMaVxp92bs
 Rn8T5jV1RL8fhA6NG7lubrUSMQh6P4UhaIMcMpA68iNmmrwxqic+b/zc74HKdFzo/3TXBD
 KfnTyy1J1/modm5KFVTJiRhPx+Sndw8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-ORSdyAPpOBuJNy_VCFsxWQ-1; Fri, 23 Apr 2021 14:22:57 -0400
X-MC-Unique: ORSdyAPpOBuJNy_VCFsxWQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 y7-20020a1c4b070000b02901357a988015so941255wma.5
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 11:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A18kDWp4Vy93j3X5zYtAzoKqesKPbHO49Euefe1kzS0=;
 b=pofI1/NU/m/PQ07NnRge9+XUnfYPDi6gTddLFEAmYQ/WMQ+7Mka70Qj1Pp208d3nKg
 BVyRBgH+OVtAz8HQyi/NG+FPtA83ELW5zAtcYzZP2AQeudiTm6wtLD42LUJWbhjIBzPX
 68sy7yL9WyDc32KcpSynX7Ep0Xk6rJ48fXC1QgoDjGAalYBeBxzn4qYGcHw7dgnQGUDJ
 wCG7T5YBADKYzeiE+WjU2wJk7gRY8WslKEDbO/oYx7/Nn/oB4lu8C+vEZszm5IFHp7C/
 kev/Fze/4l8INgoxSG/xHcXswwFHdmZ/OARU/YrXgLqvGddLgrisyB6VY0LCsAn+ikE6
 nOCg==
X-Gm-Message-State: AOAM531imY61lBc13NYNzT8mYIYAhDD/m43yZUHHMsH1TpCSQBThhThv
 SjrgKvej+8Cs+VkeRQ7ghaq4z6tH5TYE7NmxxCCW2O+KGH5ps/y6mbLvmOshP1YcoDAxqf4i6g7
 NtHRp4SHuz6BX22E=
X-Received: by 2002:adf:dbc2:: with SMTP id e2mr6167139wrj.398.1619202176214; 
 Fri, 23 Apr 2021 11:22:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzn6a8PKIL7kpkCwJYIIpetvLrmM7tgEE92TACFFBZHs5p/Lb40OV8h3uN4cTx2u5jE/R4ktg==
X-Received: by 2002:adf:dbc2:: with SMTP id e2mr6167120wrj.398.1619202175964; 
 Fri, 23 Apr 2021 11:22:55 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id i15sm10463015wru.12.2021.04.23.11.22.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 11:22:55 -0700 (PDT)
Subject: Re: [PATCH] pc-bios/s390-ccw/netboot: Use "-Wl, " prefix to pass
 parameter to the linker
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
References: <20210423153646.593153-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0b67fd26-5ac9-120b-9e5c-0b423cb5cc2f@redhat.com>
Date: Fri, 23 Apr 2021 20:22:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210423153646.593153-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 5:36 PM, Thomas Huth wrote:
> We are using the compiler to do the linking of the bios files. GCC still
> accepts the "-Ttext=..." linker flag directly and is smart enough to
> pass it to the linker, but in case we are compiling with Clang, we have
> to use the official way with the "-Wl," prefix instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  pc-bios/s390-ccw/netboot.mak | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


