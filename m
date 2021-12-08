Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C84946CE85
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 08:51:49 +0100 (CET)
Received: from localhost ([::1]:49702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1murjw-0000kf-4v
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 02:51:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1murgb-0006RT-78
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 02:48:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1murgZ-00022Q-1E
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 02:48:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638949686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qwYfEeqOIhsErwy/udI/eQ4HuwUjteC3X7xUTHCeBJY=;
 b=Q31oXMy6wNDv7zUQCHzJ2dsSvjVgDsj8lAKe0+Ga5o3FXd6GTURZwu8Eud6bQk6psyHr8g
 2WWTmgCjN2LPEYFK+JrSjQ4TSxFNYGKgaOxvii/w9Vs2CYOrNr14vRjQr/KI8mhrHWgt2+
 XjdnRZW9BPQ5XQbzVJ19sz0HqOPf2wc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-377-MudPi_B9MMWUX1rzcSl6OQ-1; Wed, 08 Dec 2021 02:48:05 -0500
X-MC-Unique: MudPi_B9MMWUX1rzcSl6OQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 o4-20020adfca04000000b0018f07ad171aso173526wrh.20
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 23:48:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qwYfEeqOIhsErwy/udI/eQ4HuwUjteC3X7xUTHCeBJY=;
 b=wnJjCjvEEF9U28vzSRjkw4dTB8Q1H+n78p5y9PYSHpxIXktvRVbPXj2ZFGGdnPXWBh
 /JsgCQ4QhUKehYA0DUpBbEj30k3727feFd/KVXhVF4t57G+ct4lqXw9FDVFwx/MVcMZQ
 AKPoABxadcpxW8dxe6wJxSt/Smv5hiPwfcqvH83qYPQkdU29qPmvwjC098hEMXZoSdtR
 /v6wtwuv9hdixek58g6qf26X/y7Uf6iVWet47cBEyW6Ud2q0uHe17fA3O2zaJk9s90Sc
 lB0i7TTYv0eWAff3j8lirCYGc2BdCCggnU+jq5JZPLXCxLizPzszr0xrwVD7wOT2QwLf
 4P2g==
X-Gm-Message-State: AOAM531PoIkFe2GWhEHzBTpcv75ZE3do1Z/gPPJ7+hmXP+1jyETHMtqC
 L8MErcYPNeMUv4vHQrX/evOS5c6cNsLy67C3heQ70yP09orgyrK8roQ6MgQsssMBqLGrctpzJ5t
 wlnvaeXDpQ7N+tDA=
X-Received: by 2002:a05:600c:4f8f:: with SMTP id
 n15mr13781103wmq.70.1638949684125; 
 Tue, 07 Dec 2021 23:48:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdPr/EhOs793D28HFTm4VqvBWXxfhsUUjk42H/7q8YKI3NtFJE+YDjAVWjNwmCRfgosTdG0g==
X-Received: by 2002:a05:600c:4f8f:: with SMTP id
 n15mr13781088wmq.70.1638949683961; 
 Tue, 07 Dec 2021 23:48:03 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id c4sm1937519wrr.37.2021.12.07.23.48.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 23:48:03 -0800 (PST)
Message-ID: <29fbcb88-ab07-26d7-5c81-5ed21baf40c9@redhat.com>
Date: Wed, 8 Dec 2021 08:48:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 5/6] test/libqtest: add some virtio-net failover
 migration cancelling tests
To: "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20211206222040.3872253-1-lvivier@redhat.com>
 <20211206222040.3872253-6-lvivier@redhat.com>
 <20211208024325-mutt-send-email-mst@kernel.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211208024325-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/12/2021 08.44, Michael S. Tsirkin wrote:
> On Mon, Dec 06, 2021 at 11:20:39PM +0100, Laurent Vivier wrote:
>> Add some tests to check the state of the machine if the migration
>> is cancelled while we are using virtio-net failover.
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> 
> So this one I think is needed for the release. Thomas, are you
> merging it there or should I?

rc4 has already been tagged yesterday. I don't think that Richard will still 
allow another PR at this point in time unless it fixes a really really 
critical problem. Laurent's series only adds a new qtest, so this certainly 
does not qualify, AFAIK.

  Thomas


