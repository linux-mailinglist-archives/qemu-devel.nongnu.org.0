Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7DC3D0131
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 20:05:54 +0200 (CEST)
Received: from localhost ([::1]:38284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5u7t-00085l-7l
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 14:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5u5x-00051c-E5
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:03:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5u5w-0008Ru-0S
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:03:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626804231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ltTJgAUCtkd8qgfcYJsubtS+OQhsZwzjjtiJz40XHew=;
 b=OurjYbx94diDorHvkVwWYF+fSExqdxqW2OEZvq1W1tk+6SEzkRD5+rCVtkgt1vr332Cko+
 IeUSNDPYJc4cRS03v++3JXO9+jjip+fGmcdXCgqKgLzCojJds6aiYLPZJTjsGrTXOeuuBe
 1TCbboaHAmQ8c5emMQ8qH+yCi2gsLuo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-7GC1W0WBPGS92eywextLzA-1; Tue, 20 Jul 2021 14:03:50 -0400
X-MC-Unique: 7GC1W0WBPGS92eywextLzA-1
Received: by mail-wm1-f70.google.com with SMTP id
 y6-20020a7bc1860000b0290227b53c7cefso41038wmi.1
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 11:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ltTJgAUCtkd8qgfcYJsubtS+OQhsZwzjjtiJz40XHew=;
 b=JavMmv+EjPQqPv+R5abdj4O7bu19YHx3uat9Ma92aRQZVyyrG1ig3otdPjrwviQQnm
 n2YhVGyVSxUfhr/G5UEqqktndQ1+w7R6Fa3lxORXWYeY3d8cnrezi+/zPX166moI74DX
 lmiggUI1gdw+K+tYwuc5etY3lo7QzC5f5cOZhvd9iRzi7GY585G+lN2dQoRwJmgczYFt
 f7T5CN7m2pH6vITgeyd9k+UGHp8wSGtUSQkFyBYQSSUt9AEoIdWs0nuV2m+zl9mGj1hZ
 LUxiVczN4CcZD88VizAN4mi/q4JXbzWhS2Qjih0rbScEt8Cv2QIL9vu5n+aoD/nqy9Uv
 t3Ag==
X-Gm-Message-State: AOAM531Td1+Fp7Af9nu7aUrjQHxC1cbdsWhRF1vwOT5+z0uM7JG4pnKk
 kaqPt8sGKi8wRyhyy+CZ/kwWVYJT2K09vV9Aiyy7HMoKrUWNRgDY26rT531s4QGmytvLH0Xpghg
 JnbmQt6KO7QqhEP8=
X-Received: by 2002:adf:a1c4:: with SMTP id v4mr36982889wrv.217.1626804228895; 
 Tue, 20 Jul 2021 11:03:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0/RXLaLhlegJGa2y6S7n2d1DJKuM5mNZMO9StyRNaUyL/oL5iJeampSw9xW4V73ulsR2x7w==
X-Received: by 2002:adf:a1c4:: with SMTP id v4mr36982865wrv.217.1626804228786; 
 Tue, 20 Jul 2021 11:03:48 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id f2sm24381150wrq.69.2021.07.20.11.03.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 11:03:48 -0700 (PDT)
Subject: Re: [PATCH 07/16] vfio: Avoid error_propagate() after
 migrate_add_blocker()
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210720125408.387910-1-armbru@redhat.com>
 <20210720125408.387910-8-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1bf18b91-455b-315c-2457-332782a9e601@redhat.com>
Date: Tue, 20 Jul 2021 20:03:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720125408.387910-8-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Kirti Wankhede <kwankhede@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 2:53 PM, Markus Armbruster wrote:
> When migrate_add_blocker(blocker, &errp) is followed by
> error_propagate(errp, err), we can often just as well do
> migrate_add_blocker(..., errp).  This is the case in
> vfio_migration_probe().
> 
> Prior art: commit 386f6c07d2 "error: Avoid error_propagate() after
> migrate_add_blocker()".
> 
> Cc: Kirti Wankhede <kwankhede@nvidia.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/vfio/migration.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


