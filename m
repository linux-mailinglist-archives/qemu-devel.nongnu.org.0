Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A47341EA3
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:45:06 +0100 (CET)
Received: from localhost ([::1]:55498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNFR3-0007AU-5F
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:45:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNFOk-00058V-6T
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:42:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNFOe-0004SU-Nx
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:42:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616161353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xMG4OSx1c8wUB1Y0SbDa6Sf7HSb/fXCz62BHvrdv8B4=;
 b=NYSO/MJ6+MJqy3mS8Bw6Nn7+aCnLOD11aZZFcQz3ZwH4l2zAzJAFk7NpYlBHf4hMZxse5h
 4oFB/5e6owB0yxQyfT2Vrkixb3PScyI4sMWdGP2wSvb6McTSuREc47o8v5m4aSg+QCMdSd
 8jqYzP8LIcf/FLMqU6lxLIRpdjIVbnM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-8VAjLW3dPJyMPUHT95-rVw-1; Fri, 19 Mar 2021 09:42:31 -0400
X-MC-Unique: 8VAjLW3dPJyMPUHT95-rVw-1
Received: by mail-wr1-f71.google.com with SMTP id r12so21884554wro.15
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 06:42:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xMG4OSx1c8wUB1Y0SbDa6Sf7HSb/fXCz62BHvrdv8B4=;
 b=qdxY4ITVhKSU+dlTz3VgkKzALNqefJz/383IpDN0NiZneJwRgs/S9oAOJLfGbFqNfc
 v9zVzZ9lnvyJO3IfeXI+CbPGnFajmXMabMFtIe7X/GGQtK7JsnGPHhtYOXbt58IB20HP
 cWn1fEECX5Tw7m0AaVD6OFD9hDzRDvp99bl81n7V8V4auAV/tCYUOjT/6v0D0lQw7gAw
 rHFHiTP93nbhkLBk15bX8yoSvR2OZj7uTFJwvPB9seWxhgYH6Jmp+r0doGyu5Zr/XXjO
 sv48kVn/BCu2t6jS004wpeSDjHw/FrTdkjJuJsE6QdcCyyY4LZE/d2O9+ygtrwN37YSt
 Q27Q==
X-Gm-Message-State: AOAM530q64szooBqWWZRYwYFGIe+C5zvhypo46TRcb8aPdhnFCzDIJVh
 i7blFfymudQPy6HK5tCVuPKiie0m3sZtd2qMMOzed2qBftdj3BPutHTBMx8zc1ZjIuqSnmuNzcX
 TBD5cr4NgJcvR8xs=
X-Received: by 2002:a5d:4445:: with SMTP id x5mr4778375wrr.30.1616161350732;
 Fri, 19 Mar 2021 06:42:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOEG/M402IlXDKucqrH1Yh2dPokOuIbmXPzMwDypfoeMeyrxHa1zQcdf/KeQyg7urr89LaQQ==
X-Received: by 2002:a5d:4445:: with SMTP id x5mr4778357wrr.30.1616161350567;
 Fri, 19 Mar 2021 06:42:30 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id q15sm8012644wrr.58.2021.03.19.06.42.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 06:42:30 -0700 (PDT)
Subject: Re: [PATCH v2 4/6] iotests: Revert "iotests: use -ccw on s390x for
 040, 139, and 182"
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210319132537.2046339-1-laurent@vivier.eu>
 <20210319132537.2046339-5-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6a50dfd3-2ece-b43d-4035-19dc17673541@redhat.com>
Date: Fri, 19 Mar 2021 14:42:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210319132537.2046339-5-laurent@vivier.eu>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/19/21 2:25 PM, Laurent Vivier wrote:
> Commit f1d5516ab583 introduces a test in some iotests to check if
> the machine is a s390-ccw-virtio and to select virtio-*-ccw rather
> than virtio-*-pci.
> 
> We don't need that because QEMU already provides aliases to use the correct
> virtio interface according to the machine type.

And get_virtio_scsi_device() is removed because we use the alias
instead.

> 
> This patch removes all virtio-*-pci and virtio-*-ccw to use virtio-*
> instead. This also enables virtio-mmio devices (virtio-*-device)
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> cc: Cornelia Huck <cohuck@redhat.com>
> ---
>  tests/qemu-iotests/040        |  2 +-
>  tests/qemu-iotests/051        | 12 +-----------
>  tests/qemu-iotests/051.out    |  2 +-
>  tests/qemu-iotests/051.pc.out |  2 +-
>  tests/qemu-iotests/068        |  4 +---
>  tests/qemu-iotests/093        |  3 +--
>  tests/qemu-iotests/139        |  9 ++-------
>  tests/qemu-iotests/182        | 13 ++-----------
>  tests/qemu-iotests/238        |  4 +---
>  tests/qemu-iotests/240        | 10 +++++-----
>  tests/qemu-iotests/257        |  4 ++--
>  tests/qemu-iotests/307        |  4 +---
>  tests/qemu-iotests/iotests.py |  5 -----
>  13 files changed, 19 insertions(+), 55 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


