Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E0A370EB4
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 21:04:15 +0200 (CEST)
Received: from localhost ([::1]:39614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldHO2-0006uw-5I
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 15:04:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldHK8-0005EU-Fn
 for qemu-devel@nongnu.org; Sun, 02 May 2021 15:00:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldHK6-0002hg-IO
 for qemu-devel@nongnu.org; Sun, 02 May 2021 15:00:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619982009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sDw3Zct/nwERgBdJzgS7ehM/iRppltWo+cULpCqgrNA=;
 b=cFFYAGWRSGgEx+v174llJoZZxrOshHBupqfi/+ZYxjDnoiCtAgzrOa3epQyi6L2Z2vlwS3
 FIj3kYN0r2M5j6NlkiTP1RQ/ASCW+unOWgPgTSk87eLg1L95PgQYwtMetZYxSM9zx3krrL
 0imUo3vAO6lYCCPPJ05oh2XuyUo9iaw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-t3L52Z8OOJ-e-8lOXloZVw-1; Sun, 02 May 2021 15:00:07 -0400
X-MC-Unique: t3L52Z8OOJ-e-8lOXloZVw-1
Received: by mail-wm1-f72.google.com with SMTP id
 s66-20020a1ca9450000b0290149fce15f03so479711wme.9
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 12:00:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sDw3Zct/nwERgBdJzgS7ehM/iRppltWo+cULpCqgrNA=;
 b=Cvk48bUKZbnedzJU+88TGJZLJAcvgAaKliCt4C8Y3O8LGouhGCaW6v77iRO17+xs6D
 qS85RKVJuYP6JKfmFWGL8WAVls63FOJOGZ1gCipgKnT6fZSNBna9klP0heEG5PZXUB5A
 SQH92CamXYE1f6faiuhNq4+SiRhYmOc+nkqPzmSxQe2D/pL6wahpaMqrd5wrGF4MEh8w
 2x9GHUL3hvTxvcZsOuV6+iOS/mZXgeImHO0L7uJKA4y8OZ9Ef44kRqa+FPM4kOksYRZg
 5z3Kb78jIUdR9xTpOMoXsIJdUkHXTPdw6KvEF+orZHoF9nR/u+UZOzD7tfb2xgQ8+3RM
 G4wg==
X-Gm-Message-State: AOAM531+dRnu3h5WKJxn6cvvSht3Q49Yi9POYgjYIfrT7KQCoCoygxPR
 Pq7D8S6uycIYB9hZPeYxr9cEkSVuc7FpbSrVRrTRJdSdPRrbfYR9zaYaLu4RygyB6sEApTJC14q
 v9/8P8FWgGQgNIPH+xJTmKzppbruUWDrqyiYh1jvqtXYJbW1/B8pXkEQ7wiFFFOye
X-Received: by 2002:adf:fd0c:: with SMTP id e12mr8535977wrr.111.1619982005362; 
 Sun, 02 May 2021 12:00:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoqQ4tlIMYeXZCr615KO9JBe31LEjUPT2vLv6CVTUSXXKX+WlRbdS80qDTdn6mAQoNrrG0Tg==
X-Received: by 2002:adf:fd0c:: with SMTP id e12mr8535951wrr.111.1619982005088; 
 Sun, 02 May 2021 12:00:05 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id t7sm9701816wrw.60.2021.05.02.12.00.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 May 2021 12:00:04 -0700 (PDT)
Subject: Re: [PATCH 4/4] pc-bios/s390-ccw: Allow building with Clang, too
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>
References: <20210502174836.838816-1-thuth@redhat.com>
 <20210502174836.838816-5-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d77a5d98-7bff-50e0-3781-75c9012130b4@redhat.com>
Date: Sun, 2 May 2021 21:00:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210502174836.838816-5-thuth@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/2/21 7:48 PM, Thomas Huth wrote:
> Clang unfortunately does not support generating code for the z900
> architecture level and starts with the z10 instead. Thus to be able
> to support compiling with Clang, we have to check for the supported
> compiler flags. The disadvantage is of course that the bios image
> will only run with z10 guest CPUs upwards (which is what most people
> use anyway), so just in case let's also emit a warning in that case.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure                 | 9 ++++++++-
>  pc-bios/s390-ccw/Makefile | 3 ++-
>  2 files changed, 10 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


