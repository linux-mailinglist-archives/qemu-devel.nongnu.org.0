Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E713E4ADAD8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 15:10:42 +0100 (CET)
Received: from localhost ([::1]:33032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHRCb-0001Bw-Uw
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 09:10:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nHPZo-0004Mn-3a
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 07:26:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nHPZl-0002MG-4E
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 07:26:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644323187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FbZAwW+3yJjOVOdAl5iH5EpcGvf1x7YFIZP3lozwBrQ=;
 b=CEopviU6Pz71rzgRbRQzlJ5UMC5uTGTiWX15J2sRhkvOXVfUqwG7LB7hNmMtEIYgdvSjSV
 s+WoR2AUYhRJ/ea/D5GQHarz6FeAeAhdmSUAirBqfbz+CLwPr6BNZPd8fmyZp939vDoUVd
 PZlZzuAIVSzOfPe26N5QrrmXSOU/UOA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-Lrl6jJTQM8aYu0Z2S3DvlQ-1; Tue, 08 Feb 2022 07:26:25 -0500
X-MC-Unique: Lrl6jJTQM8aYu0Z2S3DvlQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 k11-20020a50c8cb000000b0040f84c5bc66so2717717edh.4
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 04:26:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FbZAwW+3yJjOVOdAl5iH5EpcGvf1x7YFIZP3lozwBrQ=;
 b=qoyhifELCiPSqWqgm+W9Kz9DCxFqHbP1EpY6DsJPAoJAJ6vt1a0xKu3sUuOeFXzMnZ
 W4qyiIjpjiIEUZOCRc8Abg7T5e6iVqjBuKiLlL61FDMSWeC7I+feFQPInCmVbYOhOsIc
 vNmpJzmG3cMVZRPl8yJ2BjE1ubzAcBhAszc/SSMHrsPwT10gdXm4IkYMrbwGtYthIq5l
 G2Q3rJaI6T/4Wzm4t/Bxb/qFskW5AUpbEXcX+2Vsk7pv7e5762kWaiRRhZzVno8X9poE
 bBzZitPmMyIneHdfXxN6GPO4o/HSvGH8UuIXo+5XPg2fUe6NaiekcqZY+43ib3b4sfJR
 RsIA==
X-Gm-Message-State: AOAM532JcyD9CoarwfovRmupB1SaYOl4k9jQ8iYOCKrFxZtcUfx3SDK5
 /4VmC+TumIT5WDWQC/jZMx4ntpeF6Z5NsLVihkwPBZ1r4RhSg+bRb0YO73lfvj9Fm7qD2zzgiYs
 Ehy5jZT0dg0pKiV8=
X-Received: by 2002:a17:906:7a5b:: with SMTP id
 i27mr1349070ejo.260.1644323184028; 
 Tue, 08 Feb 2022 04:26:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqYWf0H4f7LC89qY5qfjd+WKF5Gnt0rbxxDf7eZFVee61hhurDKMX5YAEVh+nSPNBOUFyUYg==
X-Received: by 2002:a17:906:7a5b:: with SMTP id
 i27mr1349048ejo.260.1644323183711; 
 Tue, 08 Feb 2022 04:26:23 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id y27sm2772645ejd.19.2022.02.08.04.26.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 04:26:23 -0800 (PST)
Message-ID: <fa751536-64c1-ab6c-9919-81493ac2ba84@redhat.com>
Date: Tue, 8 Feb 2022 13:26:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/6] tests/qemu-iotests: Allow to run "./check -n" from
 the source directory, too
To: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>
References: <20220208101311.1511083-1-thuth@redhat.com>
 <20220208101311.1511083-4-thuth@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220208101311.1511083-4-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.02.22 11:13, Thomas Huth wrote:
> For better integration of the iotests into the meson build system, it
> would be very helpful to get the list of the tests in the "auto" group
> during the "configure" step already. However, "check -n -g auto"
> currently only works if the binaries have already been built. Re-order
> the code in the "check" a little bit so that we can use the -n option
> without building the binaries first.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qemu-iotests/check | 52 ++++++++++++++++++++++------------------
>   1 file changed, 29 insertions(+), 23 deletions(-)

I don’t love how this patch completely separates dry_run from running 
the tests, and how finding source_iotests is replicated from 
testenv.py.  For the latter, we should at least assert somewhere that 
source_iotests == env.source_iotests.

Wouldn’t it instead be possible to pass args.dry_run to TestEnv and have 
it just skip all build-dir-related stuff, which I think is just the 
self.init_binaries() call (and perhaps the self.qemu_prog check in the 
`for suffix, machine in machine_map` loop)?

Hanna


