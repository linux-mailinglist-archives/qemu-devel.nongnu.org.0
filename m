Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD37342A7BB
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 16:57:20 +0200 (CEST)
Received: from localhost ([::1]:42852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maJDT-00016I-GL
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 10:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maJBs-0008G7-4a
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 10:55:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maJBm-0003fx-Jj
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 10:55:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634050532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zuG+oJeBVtyfeh6wViGwus6jGJ10fvW7j4a/r7cvgvg=;
 b=Hip54cy52P3BmQ6JTMMaK7mcF0Q1mZbsobGvMgH4R8kcNmPdAxy5X+G6XYMx2nZRWysLrv
 vB7oX7b6dlKMxJ/4zxXQgS4rKBDrLO5wK+nr7LOtNab1ouqStd28bV0Vdm5iZhoS7xTcWi
 AF0MRAUXk3u6i0JVbzSEc13eG5axAdw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-2WPmZEp9OwyFS9w41Xlwng-1; Tue, 12 Oct 2021 10:55:29 -0400
X-MC-Unique: 2WPmZEp9OwyFS9w41Xlwng-1
Received: by mail-ed1-f70.google.com with SMTP id
 d3-20020a056402516300b003db863a248eso127194ede.16
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 07:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zuG+oJeBVtyfeh6wViGwus6jGJ10fvW7j4a/r7cvgvg=;
 b=JIdNbY9Ensjja/3H71EEUdWyQn75lV/p93iLN4qaBdoBRmHz+UQSD/FgIBE4XhggC6
 fLqTyPmQYwsKhbv3vX5kKZmllA3X/Sfn//NYdXGBhbTls5eu5vijyWQ8fm5CCQWCN52i
 aBiuADx3mgEoBICuFVNyswwACGKILAqzMR03hcESMTdjSAQb6o4d/AAPKSapPCmxcX37
 AlbzZ3H0Uo1imNW5x+7Uuvh5a6AL9GivoZuPDMLuQEKzkP49Z86P9zO+UMT/UZIXUzea
 2gq1DQ4ziB9luGehcUqIIVHEgw2qesf6cXKxCgIhNUJByG9fMC7sdX/bwxabpsN8wdSt
 YNZw==
X-Gm-Message-State: AOAM533xXxO1M61LGTeSqDn1kRjnT6XFFpKOeYKkwiZdn2XpShctJyCr
 hrbF9qh9r6+3bzNIfR+eL8rPaG1OMWFpJSF8LF0Cve6X7SyO7J6h2NaukJdHmg1v6d12y7xkw5I
 AZijqbKZ65WGzS1c=
X-Received: by 2002:a17:906:9b46:: with SMTP id
 ep6mr33026648ejc.226.1634050527826; 
 Tue, 12 Oct 2021 07:55:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxrWVjjpwR3ClhoDSgHpHMvsvmQ+Md1U2eijcaKfup4rgnH95V3xro9YtyQbFexTqvlKhKGQ==
X-Received: by 2002:a17:906:9b46:: with SMTP id
 ep6mr33026626ejc.226.1634050527665; 
 Tue, 12 Oct 2021 07:55:27 -0700 (PDT)
Received: from thuth.remote.csb (p54886540.dip0.t-ipconnect.de.
 [84.136.101.64])
 by smtp.gmail.com with ESMTPSA id fx4sm5055865ejb.113.2021.10.12.07.55.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 07:55:27 -0700 (PDT)
Subject: Re: [PATCH v2 17/24] configure, meson: move netmap detection to meson
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211012111302.246627-1-pbonzini@redhat.com>
 <20211012111302.246627-18-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <1bbeccf1-ae76-e461-1a48-116a29db121d@redhat.com>
Date: Tue, 12 Oct 2021 16:55:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211012111302.246627-18-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/2021 13.12, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Message-Id: <20211007130829.632254-12-pbonzini@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure         | 40 ++++------------------------------------
>   meson.build       | 19 ++++++++++++++++++-
>   meson_options.txt |  2 ++
>   net/meson.build   |  4 +++-
>   4 files changed, 27 insertions(+), 38 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


