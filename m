Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DFB31F94D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 13:18:58 +0100 (CET)
Received: from localhost ([::1]:60750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD4kL-00058W-RD
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 07:18:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD4h5-0002gG-Oo
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:15:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD4h1-0006PA-UP
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 07:15:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613736930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k7UkzvW7YzAkDU1Z3fCAUqBMPy3CC83kWNUoEw+T4Xs=;
 b=A7pJfdAkDNk8Tfnqcf9iBYPkRbGFsOTnAmaPJp205sE/qju8eyzFw5aak7/XHHvgjOr06D
 yYbc8QOuVqfvwkRcfXhGw7vU92RgdQjUxVf828KFloVwOKKKZddSGPp3/ji8v7uSn/dnkh
 415fWJ9sMoF/I16/vkW2m8roJhnqu68=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-RJwZ-79cM0eVuHOqc4lsaQ-1; Fri, 19 Feb 2021 07:15:29 -0500
X-MC-Unique: RJwZ-79cM0eVuHOqc4lsaQ-1
Received: by mail-wr1-f71.google.com with SMTP id x14so1771139wrr.13
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 04:15:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k7UkzvW7YzAkDU1Z3fCAUqBMPy3CC83kWNUoEw+T4Xs=;
 b=MtuRY3Hn7ntoD1uHtuLQ5dI58MjwAARWk3kZXFhZ0zwXCNt8n47nMrOFWqBFJVYvvi
 HoDp6NV/TZyueOr9QQpdXNyvM96L82YuTPk3RaO4Zea4YuffEy4DvDgl++zB6qT+EXM4
 8DUDhJ3QQX9o/9Hp2Bqlu3nwXf+WLMqfDV4xw0FLnnDOvHlRs2nsqyneCz8MRii/vJdt
 fF5t0itzRAcxSVTZS3N+GtjN/O0xhPWZad/47fjx4x+GmDjIKm2GHTs7GjiG8Lv9+mM2
 bagZEEuJoRRcAk/YgICzwxgS6e0QHLMu7gXzqOQyCEw+Dnr4EAGHgN7LK/yRGOoTr6zc
 N2Hw==
X-Gm-Message-State: AOAM5308b0w/FzVTrQEqXvEsGG39zT3OB8RWnEU0UlpSZjIJjSPf/lwW
 0jlCDFYxagO4Yw+a9utQey4K+5tzF+Y+c6I0XQBoje0dJhnTGOQVXc2F+ZRlNG1ijJsg1OjVr5W
 ER1GW0ZuvqKmG/KQ=
X-Received: by 2002:a5d:6d0c:: with SMTP id e12mr8682317wrq.136.1613736928161; 
 Fri, 19 Feb 2021 04:15:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmQclYO9ZhqzgZzBU9ISHEPtCdoxK2Zha9Xp+WzEh2+CWGZrXpFAc+rT0z/qrpMS6UCHdkEA==
X-Received: by 2002:a5d:6d0c:: with SMTP id e12mr8682284wrq.136.1613736927988; 
 Fri, 19 Feb 2021 04:15:27 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d15sm13126267wru.80.2021.02.19.04.15.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 04:15:27 -0800 (PST)
Subject: Re: [PATCH 0/7] hw/kvm: Exit gracefully when KVM is not supported
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210219114428.1936109-1-philmd@redhat.com>
 <YC+oZWDs3PnWHPQo@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9540912b-1a81-1fd2-4710-2b81d5e69c5f@redhat.com>
Date: Fri, 19 Feb 2021 13:15:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YC+oZWDs3PnWHPQo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
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
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 1:00 PM, Daniel P. Berrangé wrote:
> On Fri, Feb 19, 2021 at 12:44:21PM +0100, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> This series aims to improve user experience by providing
>> a better error message when the user tries to enable KVM
>> on machines not supporting it.
> 
> Improved error message is good, but it is better if the mgmt apps knows
> not to try this in the first place.

I am not sure this is the same problem. This series addresses
users from the command line (without mgmt app).

> IOW, I think we want "query-machines" to filter out machines
> which are not available with the currently configured accelerator.
> 
> libvirt will probe separately with both TCG and KVM enabled, so if
> query-machines can give the right answer in these cases, libvirt
> will probably "just work" and not offer to even start such a VM.

Yes, agreed. There are other discussions about 'query-machines'
and an eventual 'query-accels'. This series doesn't aim to fix
the mgmt app problems.


