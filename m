Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6B431FDF6
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 18:38:59 +0100 (CET)
Received: from localhost ([::1]:34148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD9k2-0001kB-DV
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 12:38:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD9iD-0000wF-AR
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:37:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD9i6-0004sU-Ll
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:37:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613756215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/iQIYzCUzufPYt+TLigNIgms1BaZgh18m0vewYul3GY=;
 b=LGxuwhpDQPGeo3YJ9tzPPFilQiGmPHir0DIqSf1aK4rhd+psQa0aCoCetQCX8x7r8qJ55O
 v4JIff48FLY/0N7wJJ5sLr5U+rVbYtQrb9Qsa0yg+7u4FrklM7OtwC5bvKQYMHaWUCqgQo
 n8N0KXJz/Eh6ycwkc+Y0yZOdNFChjo0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-QtBgXfmsM3mI67MXUphz8A-1; Fri, 19 Feb 2021 12:36:52 -0500
X-MC-Unique: QtBgXfmsM3mI67MXUphz8A-1
Received: by mail-wr1-f70.google.com with SMTP id o10so2759772wru.11
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 09:36:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/iQIYzCUzufPYt+TLigNIgms1BaZgh18m0vewYul3GY=;
 b=MwG/YbbvMB+gnA832DEXF77b83uSC01rUko5sa8d9th15EiNTnzlc9FUuWltEMWemm
 BKL2hA4WK7vhDhHRvCGP4YysVgOJi+yvj9itWt26qUApzrNUBnNnYfEVL6FP2GGN6dNF
 DI2iRQhpTQkQvvMFlwUXvI0hh0r4r6qrRnOS/OvOleEP/GIlxLlQX5NomHaSUY+nPrzS
 SW/AhL2DfUi1dXzjMeQAGNNd4IqROJURVFm0OgG/jYlnPtJhnTA8k5iF2Wdq1FNJd3Q+
 7tpdx56f1yQqgS2kaJQm1Oi/rHeL5FhdP3/PHLNuOg2U954e/dFEOUyA6s5JGNBxvZOd
 yoXQ==
X-Gm-Message-State: AOAM530WRQS4QptojSKgjfX6saFSUEBBdsuPU1h0/yWt0sgvRZroY6ot
 QoPMXQbV02lIncrbaUtEW0nMQImNKsPBfQ+Zak4jT1P4e9A9qUMLjbdoHbM6n0BeGRvcRwQrkuw
 phBiIonFYdlWyQlU=
X-Received: by 2002:a1c:ac82:: with SMTP id v124mr9187717wme.97.1613756211000; 
 Fri, 19 Feb 2021 09:36:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1t3OYyj9ULAD5Jdke9RJ2GfDldlNhOzx1kIRp9/MAkNqEbwllnGX+7Y7ooPgmeGzNQ67jGw==
X-Received: by 2002:a1c:ac82:: with SMTP id v124mr9187679wme.97.1613756210811; 
 Fri, 19 Feb 2021 09:36:50 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id k15sm12593212wmj.6.2021.02.19.09.36.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 09:36:50 -0800 (PST)
Subject: Re: [PATCH 0/7] hw/kvm: Exit gracefully when KVM is not supported
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
References: <20210219114428.1936109-1-philmd@redhat.com>
 <89bb6db0-0411-e219-3df8-8300664b54f3@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e59f2ee6-b438-5dc8-d236-adc9b5e22988@redhat.com>
Date: Fri, 19 Feb 2021 18:36:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <89bb6db0-0411-e219-3df8-8300664b54f3@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Leif Lindholm <leif@nuviainc.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 1:34 PM, Claudio Fontana wrote:
> On 2/19/21 12:44 PM, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> This series aims to improve user experience by providing
>> a better error message when the user tries to enable KVM
>> on machines not supporting it.
>>
>> Regards,
>>
>> Phil.
> 
> Hi Philippe, not sure if it fits in this series,
> 
> but also the experience of a user running on a machine with cortex-a72,
> choosing that very same cpu with -cpu and then getting:
> 
> qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0): Invalid argument
> 
> is not super-friendly. Maybe some suggestion to use -cpu host with KVM could be good?

I agree this should be improved, but it is out of the scope of this
series :)


