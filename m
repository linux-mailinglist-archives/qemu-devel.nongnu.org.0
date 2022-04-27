Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF8E51165A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 13:37:13 +0200 (CEST)
Received: from localhost ([::1]:49922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njfyq-0007PW-GD
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 07:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1njftx-00007a-03
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:32:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1njftv-0001iK-ET
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:32:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651059126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mcAMG+UkEU2zVV7TSDuNUztHbcW8aVA6N40kP4NBXqo=;
 b=bUP5tnF69oUZUUOGZm1gR1O8tB8NZoWXAEDfHZWLft8Z5zzGfpraaasLUwxf1r+Dt2YpkC
 HZf1C6WjLf3keepsrnG6+Nj8/3wAy/c+D1y8lXblVMx4qEzqAqhX76DxDL4Mbm/p0/Xvg3
 plTr0uV5Whov6qFe68lrGHBnO7lvr5Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-aOnq3Ef9NpaKqbsoG9fgig-1; Wed, 27 Apr 2022 07:32:05 -0400
X-MC-Unique: aOnq3Ef9NpaKqbsoG9fgig-1
Received: by mail-wm1-f72.google.com with SMTP id
 i131-20020a1c3b89000000b00393fbb0718bso1550969wma.0
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 04:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=mcAMG+UkEU2zVV7TSDuNUztHbcW8aVA6N40kP4NBXqo=;
 b=1GLtAbwDnC2BI0Uc+dX9kW0IeFc1QDpxOCXberUUnzMPhzjaJCtPl5OU218ZLZiSSF
 DugvRHlZWxpelApJwtglglcWzs2Lrnvoq75oGUIPPVR+k/PZh1ZIwjqhyIYvNOvutcRM
 2MTz9Z/+xvBj7uYABLK7xn4ZuF3QV86KoKnzyjjJCYXBXv4ZiBNrXPSMEO0XdR1w1i5G
 W4MnYXuEY+QWm9WQL3UMSGWp6ek70J7B7Bw+Rtcfx1D+pQrfis/dxrCZaCxNc8TVs/nB
 2nBCWf6GE5AIP2Px2T248iInUtRUxwTOwEz5hJNq3fcWaFAhEUTYSWPkwDcNQJetVrPz
 ZFYQ==
X-Gm-Message-State: AOAM5309yX9EYx7wkhTU++1eyBAeu2nMdZN2Hzmb9t7DQI7DWkO8JFki
 v/5JwyvMsmZ1WavSAol6PFIjNjP4TJDtNX2Kt6y9cbAHiZwG+xtHbg6TP6qjOYh2kWcBN3nAcjx
 gZskI2592JK1dPgI=
X-Received: by 2002:a7b:c0d0:0:b0:392:a02c:28ab with SMTP id
 s16-20020a7bc0d0000000b00392a02c28abmr34605553wmh.2.1651059124222; 
 Wed, 27 Apr 2022 04:32:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwu/Hi7+Wg6wstiNzcPJdX6ILzuhH1Mquttg80JKOuxHLkeCBU5snB5GM7FzoUoptIv07nW+w==
X-Received: by 2002:a7b:c0d0:0:b0:392:a02c:28ab with SMTP id
 s16-20020a7bc0d0000000b00392a02c28abmr34605533wmh.2.1651059124024; 
 Wed, 27 Apr 2022 04:32:04 -0700 (PDT)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 o26-20020adfa11a000000b0020ade8b8fc5sm6684230wro.107.2022.04.27.04.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 04:32:02 -0700 (PDT)
Message-ID: <cdaf04de-5e4d-5d8e-bec1-a1c2cce8a324@redhat.com>
Date: Wed, 27 Apr 2022 13:32:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Gautam Agrawal <gautamnagrawal@gmail.com>
References: <20220413172246.73708-1-gautamnagrawal@gmail.com>
 <CAFEAcA8Zs9SStbHYPgprODCav1BkMFqKhizt5Yp_XmZ05bfLLQ@mail.gmail.com>
 <CAG-ETXv8cDEsN5a=raQRTMky6uBh9EpJAhB7pNd3GDOwACX7Aw@mail.gmail.com>
 <CAFEAcA_ZQVcpiapKFheGZYUL=eW5P4EDGB868caYPWziQf2jQg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2] Warn user if the vga flag is passed but no vga device
 is created
In-Reply-To: <CAFEAcA_ZQVcpiapKFheGZYUL=eW5P4EDGB868caYPWziQf2jQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: stefanha@gmail.com, qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/04/2022 15.27, Peter Maydell wrote:
> On Sat, 23 Apr 2022 at 11:00, Gautam Agrawal <gautamnagrawal@gmail.com> wrote:
>>
>> I will make changes in hw/ppc/spapr.c . In hw/hppa/machine.c ,
>> vga_interface_type is used inside if condition to check for graphics
>> device creation, but I am not able to find any relation with creation
>> of vga interface. Could you kindly provide some pointers about it?
> 
> It's exactly the same as all the other places that look
> at vga_interface_type -- it looks at it and decides
> whether to create a graphics device. (Arguably it should
> not really be saying "anything except 'none' means create
> the 'artist' graphics device", but that's a separate bug;
> all you need to care about is "did we create a graphics
> device because the user passed a -vga option".)

Agreed, that looks like a separate issue that we should fix one day... 
something for another BiteSizeTask ticket maybe? Same problem exists in the 
hw/mips/fuloong2e.c by the way.

  Thomas


