Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1926B3D38A6
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 12:27:43 +0200 (CEST)
Received: from localhost ([::1]:34704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6sP6-00081W-8N
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 06:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m6sMK-0006tr-K0
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 06:24:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m6sMH-0006J2-HL
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 06:24:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627035884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QACSL5tIJ2/M14Eshb51ydMYgEzP9tD+aWDkTaB+WZA=;
 b=hH5dHVRZsab9s62wOIwGAgT1Lmq0hQEUJ8j7xPtIhqxRXxiecUyvexuPgY5vNHgljYKSpV
 c5oWdrwBVfy3rpQ36MpI+Ku73iGh9oW+RrCBrMDm+MCZXA1SzdNhNg4c2cJ41UVl0zYqkH
 cSHzzKufUN4X2CDSdxuN8pkxfECeGlU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-lWYHiUqoMxagEBsfsJESNA-1; Fri, 23 Jul 2021 06:24:43 -0400
X-MC-Unique: lWYHiUqoMxagEBsfsJESNA-1
Received: by mail-wm1-f71.google.com with SMTP id
 j204-20020a1c23d50000b029024e75a15714so190698wmj.0
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 03:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=QACSL5tIJ2/M14Eshb51ydMYgEzP9tD+aWDkTaB+WZA=;
 b=Xg6MlECqiU3K640TyEpRwJKDXaqKTq3wsVvbGrNIqdye5JzSy4RhWJRC3KIM2QViyQ
 trgu58BG4fPkDIl6sdbEOOOFK11isgQjVy25n7z7F/71a73rQ1eWxzNQtfxiVMcVqcO+
 4FIItzZtpHNBODtyXb/glL/7E8y06qHgPvO+2XcFDVSLxT1sJirtrmRmTyYfmvZoTzO8
 uSysbk2/rP1qQ0SEv6JPfZ8SXlLgpvKyTk/66pFh/7u1stwJhgzQdub+MELEv4Uy3sIv
 5dAzC/KbxFULZ0UnaVPvwS0+9DHDeFVbg6AyCTmxOesjTdttGyVZ22t0PK75KjFdR5Yf
 jWMw==
X-Gm-Message-State: AOAM533uTLD1f+31nucDWht2JEJ0QFOYM/aGXWDr7VO5dz2RvVNX767A
 z6qf9PKEyvu/fNodNPkxIyRBctueoORQxeiPoA38HLrhUVpe5eNoq2/MYKq1kgM8H1JLu77EMCd
 GNcLSN/Fd8IVy+SX1LgjgNrCJ3QAh+kAEmT/N8flXjmm56FGrRgwJB7pEgRexW7c=
X-Received: by 2002:a05:6000:154c:: with SMTP id
 12mr4529735wry.393.1627035882284; 
 Fri, 23 Jul 2021 03:24:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHjl3KR4ZSyCpIQKxOp4mZbbS0ZPz2eFRjbEPj5qRVXeM8ziTsUF/Mw+7xemFF64cOnV1jCQ==
X-Received: by 2002:a05:6000:154c:: with SMTP id
 12mr4529713wry.393.1627035882077; 
 Fri, 23 Jul 2021 03:24:42 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c676e.dip0.t-ipconnect.de. [91.12.103.110])
 by smtp.gmail.com with ESMTPSA id n5sm4077506wmq.17.2021.07.23.03.24.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 03:24:41 -0700 (PDT)
Subject: Re: [PATCH 2/3] MAINTAINERS: Add Peter Xu and myself as co-maintainer
 of "Memory API"
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20210723100532.27353-1-david@redhat.com>
 <20210723100532.27353-3-david@redhat.com>
 <f703ed50-de43-8943-2a07-fb6babf85ae5@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <68af7a38-9e0a-586e-7c6f-2f4c2aa7cd9c@redhat.com>
Date: Fri, 23 Jul 2021 12:24:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f703ed50-de43-8943-2a07-fb6babf85ae5@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.07.21 12:23, Philippe Mathieu-Daudé wrote:
> On 7/23/21 12:05 PM, David Hildenbrand wrote:
>> Peter and myself volunteered to help out co-maintaining "Memory API"
>> with Paolo, so let's update the MAINTAINERS file.
> 
> I'm very interested in following changes in this area
> (although I'm not assigned to work on it, I have genuine
> interest and found some flaws I'd like to fix one day).
> 
> Might I be listed as R:?

Sure thing, thanks! I can either send a v2 or you'll simply add a patch 
adding yourself (preferred) :)


-- 
Thanks,

David / dhildenb


