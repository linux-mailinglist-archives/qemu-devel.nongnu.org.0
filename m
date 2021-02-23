Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A64B3228D0
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 11:26:24 +0100 (CET)
Received: from localhost ([::1]:53138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEUtb-0003x1-67
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 05:26:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEUr3-0002ZZ-MY
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 05:23:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lEUr1-0001Y2-Kj
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 05:23:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614075822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ONA6MzE+62MBdXsLezMBnFy0YNeeXhI4RdnsmP3EC78=;
 b=CFaRKqiT9aSKfkiSq7xM7vNR769L1YDjl9NevVnUGXjBC6R4N+7gW+Sc8Kc8OZpnsdGj27
 UmOOoh8k3wmMcR/RTXox2Osa3Z3TKmEJXKWJHaYUpuvk2W5krNGLho/lgy0KJTRD/QDW9Z
 Vru9ZJiABEsRr86uamsvjnfTu7cPIZk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-wNM-vuyYP5CH-SyaN0Ax0w-1; Tue, 23 Feb 2021 05:23:40 -0500
X-MC-Unique: wNM-vuyYP5CH-SyaN0Ax0w-1
Received: by mail-ej1-f71.google.com with SMTP id ia14so5178756ejc.8
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 02:23:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ONA6MzE+62MBdXsLezMBnFy0YNeeXhI4RdnsmP3EC78=;
 b=nCkb89KB3nBbKOWqANMyIm1F3yqy1Lu1g0T430Kc/Rk7Wp7vAN7MEgwmOO1Fkv1KiE
 IfaCk1gkQMaj4gX6RL24d7QcxtHuXHoLIJZUCjgeIL7RzLsQH/O+Af9XpaQCPbdSpYbY
 j4poGGDYksWGc/k+3L4ZB7+jFebUvN/0x/x4cj1vx2ZELC5JDi7dA0z2xtMSZJVDPKzX
 zD0m42yo37IPZIvWG+gTPttW9LRkph5Fa+f7pB3sVyAB6367gJnH6BfVTM2cGlE3zuWD
 p0eOAD4TJBXfnRFaxd3mLONaqTqOSVqiaq8o2ysxyT7eyb4Nbrhfu1QLScBxGhDxX1Dw
 q2rg==
X-Gm-Message-State: AOAM533XztCtIRQP04VYBs3PBmtNlQ7FCMbv71ZZygzM25QRc7nTh1G8
 0CjB4FPwoiyxOQX6IjsVysBSOOnZ7SwHJpiPpdIdps9m686b5TeKL9V53RpJJx8jvVKelgNLzqJ
 MrRGaiR29lcWPy4o=
X-Received: by 2002:a05:6402:35ca:: with SMTP id
 z10mr27619552edc.174.1614075819699; 
 Tue, 23 Feb 2021 02:23:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0r6P7ShOobLZvmLHL0jbX0EFtTOUmvbuENZSBK+/eSQdmkpQppmQa8Fu1UMjnNqUPQ3uk1Q==
X-Received: by 2002:a05:6402:35ca:: with SMTP id
 z10mr27619538edc.174.1614075819545; 
 Tue, 23 Feb 2021 02:23:39 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ly8sm6400713ejb.124.2021.02.23.02.23.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 02:23:38 -0800 (PST)
Subject: Re: romfile resize
To: Jiatong Shen <yshxxsjt715@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <CALqm=df_dH41LQfG+X2_qL2z68DPAF9vT=9HGSEbBMWec_zLQA@mail.gmail.com>
 <ef18782e-99d8-8406-152f-46c03bbd3280@redhat.com> <YDTO5yIR1IyxbVZt@work-vm>
 <CALqm=ddLcPh2wUcYTwrf5uXG1Oyakocef449dyQ8NUeb6CY2Ow@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <948fee76-e315-4155-c665-2379def3cae3@redhat.com>
Date: Tue, 23 Feb 2021 11:23:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CALqm=ddLcPh2wUcYTwrf5uXG1Oyakocef449dyQ8NUeb6CY2Ow@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-discuss@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/02/21 10:57, Jiatong Shen wrote:
> 
>    Thank you very much for the answer. so if romfile on destination got 
> a larger size than source, why romfile check still does not
> pass? because dest got enough space to hold romfile.

Because QEMU checks that memory areas have the same size on the source 
and destination.  You're right that it's overly strict, but it's a case 
that has never been an issue before; probably because the ROM size 
should be fixed for each QEMU "machine type", and it's better to have a 
consistent set of ROM files on all your hosts.

You can create a dummy file with the right size, or copy it from the source.

Paolo


