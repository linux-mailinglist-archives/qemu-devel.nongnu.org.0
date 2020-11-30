Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FA92C899E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 17:34:56 +0100 (CET)
Received: from localhost ([::1]:41296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjm8c-0002s2-Vf
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 11:34:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kjm69-0001wG-R5
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 11:32:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kjm67-0001fY-7s
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 11:32:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606753937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HugyYPFDV4vPBFQp8xH2hoBwib4lXHFd37LUMwVYIdo=;
 b=GjP8VMS6M7QjgdRAQaJOWBKJVfmV6mSE6fjKlQ5ZdxtwVhjXxYsC5mDVfvY87i5ci3Ci3D
 2gYRl/zDGapnieOQKBB4JEYOG08Mony+1wHXEADwMtYbIWKT02Xx4QOQCSzHjaTlBFvrQi
 opFtWpYYcjTFEmUGv9Z7rL5de5A/1Eo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-QRUe4RSbOsis_XZmxELCLg-1; Mon, 30 Nov 2020 11:32:13 -0500
X-MC-Unique: QRUe4RSbOsis_XZmxELCLg-1
Received: by mail-ed1-f69.google.com with SMTP id dc6so4845754edb.14
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 08:32:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HugyYPFDV4vPBFQp8xH2hoBwib4lXHFd37LUMwVYIdo=;
 b=FQexEJ9CX8oW2NsuA0OlqEwV9beu7DOCtiJOehhcTAfhT9RUx22rqtV+9Ucjk4FwWK
 DXGxKF+P2or+FbU4wf8cAWRLi6o3eD8CP32z+ZTixFSgnmUj1VUCaj6zKBHyIX1bmSvQ
 KQhsfZTs5ST63GDx2DTzrLsCwEGXd88JPQSUpqX2FChjKgQNc2B37QOGebjlyTRS5XHK
 e04KN3qr9GHK8en0rViw24/UWK5W6z7Abxrs9v1ga2vfOZuUnjnTk2bAFr3n+z8aOOPo
 RMbOuZQYSl7thXUiH94Ww3A4fcI0m5OxjSpm2DQIuB6SRUXHDgWOVfgVMrFHe0/Dx4HF
 bwRw==
X-Gm-Message-State: AOAM5317FbBeg85ymg1SLi0tMtu7v+knKnhgvZZkIVE7PyRTzPdaKOj7
 4lXpWMM1nWNWr0QzIMxPnhE3ELwCQ+i/t9ktYRCjMJNo2/vuhkRD0dWvDpyw/qMFTsaAKS0jTzC
 AW9xSckTJjF9uwaA=
X-Received: by 2002:a50:d09b:: with SMTP id v27mr2970084edd.181.1606753932581; 
 Mon, 30 Nov 2020 08:32:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8udxATjnwT3WDGzHDx/gHnBj+2+vV7DIB8YgU/C3p7H+1P9RP271Ht6EgVRBG5OAKBqCEMQ==
X-Received: by 2002:a50:d09b:: with SMTP id v27mr2970052edd.181.1606753932353; 
 Mon, 30 Nov 2020 08:32:12 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f10sm6624224ejc.59.2020.11.30.08.32.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 08:32:10 -0800 (PST)
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20201130122538.27674-1-kwolf@redhat.com>
 <01d32c8c-5023-6323-bed8-ede08f6ac8a3@redhat.com>
 <20201130153051.GG2039965@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <62faf2d5-96a5-8fce-d2ed-f0d095882e70@redhat.com>
Date: Mon, 30 Nov 2020 17:32:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201130153051.GG2039965@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, lvivier@redhat.com, thuth@redhat.com,
 pkrempa@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/11/20 16:30, Daniel P. Berrangé wrote:
> { 'struct': 'QCryptoSecretCommon',
>    'base': 'Object',
>    'state': { 'rawdata': '*uint8_t',
>               'rawlen': 'size_t' },
>    'data': { '*format': 'QCryptoSecretFormat',
>              '*keyid': 'str',
>              '*iv': 'str' } }
> 
> { 'struct': 'QCryptoSecret',
>    'base': 'QCryptoSecretCommon',
>    'data': { '*data': 'str',
>              '*file': 'str' } }

No, please don't do this.  I want to keep writing C code, not a weird 
JSON syntax for C.

I'd much rather have a FooOptions field in my struct so that I can just 
do visit_FooOptions in the UserCreatable.complete() method, that's feasible.

Paolo


