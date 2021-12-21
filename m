Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE6747BF02
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 12:34:12 +0100 (CET)
Received: from localhost ([::1]:47600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzdPG-0007cP-3r
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 06:34:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzdNi-0005a6-AU
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:32:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzdNf-0000Uz-SU
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:32:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640086351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fbLB254ObcjDasYwQ/U5UBROfP1oxslzH3mFClRR+L0=;
 b=NNg/znFcXqHclcop4eqF/qjMZgWvibK9pz0i8RXNx1CvfNril/gyOZ7oFzBKnPMUQDL4+c
 ZO5FjgBmHNn0eygaUQXwVilVyDR7zzc5OrN/koF8w1bPNYcwS1ApI+PiBcMu4QjeoAbq4s
 mK5D8CQCR5UpD3PUxrtVBn1ddGRe7ug=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-tPsgEF6DNQeW0U3qJcgEJA-1; Tue, 21 Dec 2021 06:32:26 -0500
X-MC-Unique: tPsgEF6DNQeW0U3qJcgEJA-1
Received: by mail-ed1-f72.google.com with SMTP id
 eg23-20020a056402289700b003f80a27ca2bso10191561edb.14
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 03:32:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fbLB254ObcjDasYwQ/U5UBROfP1oxslzH3mFClRR+L0=;
 b=6xG10tZv3gQauH8t5kMNTtNRLFLOmsbmQD2xgTU8A+mVNT6sw1qRVFxyYr0cF+BTpK
 AUp8N4v0S4Mo3X3DBDMiWDcF6stc1Q8RbayZYIlmjsNWcQoads2FinbNT1S5z9TISijs
 ntsScDYEJ3JAywTRBecbg8QR0mUGn441/J25RfWi6xjXvDixAH+ulFWQSyDWPFIBFK/1
 ljLuxlAUhzNwH2Y4nObIYvuoN/2Iu0un59DMv1DB+HsAelLJoUfS4ChQS9Et2sVstJs/
 Tc2mHG7T3JRqUmDT6eef4jD6Dc+y0dGljibL2W+82LLMO8AjxmUZF5MtFohybqLI7rVT
 SDlw==
X-Gm-Message-State: AOAM531SkEN9HNGoFJCe4AH1M97q+jI6VEJ5bl1mahH33LgyD8MnwBj5
 N8ShUf09l1JHRdPRDKjj4JcnWT9ECbzeSARIFSiN+bnHT4n13ki0SMiXcagN2/Gz4gRq0GPluD0
 rqiq9KPxW8PkI848=
X-Received: by 2002:a17:906:c156:: with SMTP id
 dp22mr2413887ejc.36.1640086343396; 
 Tue, 21 Dec 2021 03:32:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqQdGM3NDuwXhK+izHRe++GAVzYS8v8oAICL9ttIh89nVS0CjvtK9VHw4SWyF2U3mF9KhxXg==
X-Received: by 2002:a17:906:c156:: with SMTP id
 dp22mr2413870ejc.36.1640086343149; 
 Tue, 21 Dec 2021 03:32:23 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id qk40sm6443376ejc.2.2021.12.21.03.32.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 03:32:22 -0800 (PST)
Message-ID: <eeac2c24-eed9-0764-1ff3-6b5291014edb@redhat.com>
Date: Tue, 21 Dec 2021 12:32:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 8/8] meson: add comments in the target-specific flags
 section
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211221110526.351709-1-pbonzini@redhat.com>
 <20211221110526.351709-9-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211221110526.351709-9-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.012, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/21 12:05, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  meson.build | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


