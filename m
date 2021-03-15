Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B09F833BAF8
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 15:11:53 +0100 (CET)
Received: from localhost ([::1]:42630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLnwm-0003k7-KH
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 10:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lLnrY-0006JH-9i
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:06:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lLnrL-00021C-3S
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 10:06:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615817171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LuzzDr0oDJ5JKpqK2S7DcMpRL7Mu3FWRNUtf0IFjr1c=;
 b=b7+QOwQWw8YY/ZElD9O7fnY5xepA4gXb+q0VLWjn0HCyL9UX85ZYCnepDqmtkcEMQPn7/a
 vIMoNFUBo/2bLS8CxYj2etegwE5PEtuWdaYy40/nXyzygg2Kv2QtpUdYz/sRA+gl/v4YW6
 brZf72+IGbmrhkY69JSfEc8yOU0zw+Q=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-Jmm0ks3FNGO7ABcHJw4hHg-1; Mon, 15 Mar 2021 10:06:09 -0400
X-MC-Unique: Jmm0ks3FNGO7ABcHJw4hHg-1
Received: by mail-ot1-f69.google.com with SMTP id a20so19759655otd.21
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 07:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LuzzDr0oDJ5JKpqK2S7DcMpRL7Mu3FWRNUtf0IFjr1c=;
 b=UrtZj2MoCbKV5dJw6DpPc3QEV0RoBoxjO9a2B50OKNyvPwAvAGe8jZqGm1zJ0Zejvo
 hQprJk0RcEZYFl1se0M22DdkCIqG1KyvR7QKAUkB0NTIBuIxTdF+B0Ar3qlLUYHzS5v+
 ixkSYn5mlEi8IxLAgXclqp4ikqrpPnPBjr3jWIPBGZQ84g13DzRjakJYnhOG2+gf+oX4
 POHXz8OpFNbSRjPxX2xAPA5BIh6EsEGWi9VmtHLpZwCIVz/koNr0yPV/yfBPTrRyoMVd
 OZpFzCsKIAP2akKwwnGmONYJV7Mk1xQyQNLFnQiTLBSiBiTSYKOAyVztkxqg2UlgK8MF
 AolQ==
X-Gm-Message-State: AOAM530gJVyDT06el1zn8Z18E1mg8ia0juJ8eOL97gzE79zPF/9F6zJU
 TR54fOxL5xwuT8UAGRED0CDhbkaHsgkVGmUwbTeItRm3Be+agwaL8KLscR8DbpHuIudCY/OIP1P
 M2E4QBgHMlU8RamQ=
X-Received: by 2002:a9d:7113:: with SMTP id n19mr14018186otj.286.1615817168564; 
 Mon, 15 Mar 2021 07:06:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeHGcJre5MqDxveggtdUEu2dNVqDxZwtUModzslq6csMD8c9ETnaMPxSrqbaRhf9OjV43oKA==
X-Received: by 2002:a9d:7113:: with SMTP id n19mr14018171otj.286.1615817168352; 
 Mon, 15 Mar 2021 07:06:08 -0700 (PDT)
Received: from [192.168.0.173] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 i6sm7261052oto.47.2021.03.15.07.06.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 07:06:08 -0700 (PDT)
Subject: Re: [PATCH] Document qemu-img options data_file and data_file_raw
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-devel@nongnu.org
References: <20210301172837.20146-1-ckuehl@redhat.com>
Message-ID: <926d7366-ffef-fb11-8de2-0c20a418494d@redhat.com>
Date: Mon, 15 Mar 2021 09:06:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210301172837.20146-1-ckuehl@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Kevin Wolf <kwolf@redhat.com>, mreitz@redhat.com, hhan@redhat.com,
 stefanha@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping (+Kevin Wolf to CC)

Kevin, would this be appropriate for your tree?

On 3/1/21 11:28 AM, Connor Kuehl wrote:
> The contents of this patch were initially developed and posted by Han
> Han[1], however, it appears the original patch was not applied. Since
> then, the relevant documentation has been moved and adapted to a new
> format.
> 
> I've taken most of the original wording and tweaked it according to
> some of the feedback from the original patch submission. I've also
> adapted it to restructured text, which is the format the documentation
> currently uses.
> 
> [1] https://lists.nongnu.org/archive/html/qemu-block/2019-10/msg01253.html
> 
> Reported-by: Han Han <hhan@redhat.com>
> Co-developed-by: Han Han <hhan@redhat.com>
> Fixes: https://bugzilla.redhat.com/1763105
> Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
> ---
>   docs/tools/qemu-img.rst | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
> index b615aa8419..5cc585dc27 100644
> --- a/docs/tools/qemu-img.rst
> +++ b/docs/tools/qemu-img.rst
> @@ -866,6 +866,18 @@ Supported image file formats:
>       issue ``lsattr filename`` to check if the NOCOW flag is set or not
>       (Capital 'C' is NOCOW flag).
>   
> +  ``data_file``
> +    Pathname that refers to a file that will store all guest data. If
> +    this option is used, the qcow2 file will only contain the image's
> +    metadata.
> +
> +  ``data_file_raw``
> +    If this option is set to ``on``, QEMU will always keep the external
> +    data file consistent as a standalone read-only raw image. The default
> +    value is ``off``.
> +
> +    This option can only be enabled if ``data_file`` is set.
> +
>   ``Other``
>   
>     QEMU also supports various other image file formats for
> 


