Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D398A4DCAD0
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 17:09:33 +0100 (CET)
Received: from localhost ([::1]:43052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUsgu-0006pD-Bw
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 12:09:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUseO-0004N0-64
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:06:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUseK-0000nU-CS
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 12:06:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647533211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X/fce2yE1Qf8+OUSWHxd8MAN0EtIq7rTZ5u+M/kGfag=;
 b=gleefYpMgCLRIw37zzDU4UbleI6uNS00RsT+bJhs9oXr3avFsR1yYaXhkp6CZPruB+wY/m
 M373zyB/HgeySMzhWSg+avEO/3A2Hy8nmnAwChLLPiV2/vvejgfLSKsXMtfnmbMEbWndLD
 nawytpyy9sz+iFQw24m6GqGW+6IcTL8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-mdu8m3oPOXK5U9Jn4RizbQ-1; Thu, 17 Mar 2022 12:06:50 -0400
X-MC-Unique: mdu8m3oPOXK5U9Jn4RizbQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 m12-20020a1709062acc00b006cfc98179e2so3182458eje.6
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 09:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X/fce2yE1Qf8+OUSWHxd8MAN0EtIq7rTZ5u+M/kGfag=;
 b=nBf9RHe2Cn7BQqD24mRlhbOWXTJfvDz4AEFP4RAMe2M37+D1hn/7HOLvJHPuXo43BT
 0FIqXwEtZQPJ/o+8CviJVQDCT5fYFADRfGy16rg3Y+aHahvtPNvt4+yGk5gIkybXoMxD
 57dwPf9i3zMAPzRbzw3LEes5w2dFEVXuIcdO52F7DCB9Exs2wob+JsOdZm9m/T1YnopA
 BmVkalaV21zqy+1zahj8M1OhXBbdJa6e+RigqvO7RjOyleJNFI08YMsned9EMq69rhcB
 Tgg2d5dcYvjJuAheEjKFjRWz2AYKcz3ItVW78h+VzE5p+rMC4V+HZLPszcGNbyPQkSWd
 oPfg==
X-Gm-Message-State: AOAM531pUe5u/wSe4HEiclrmpvyX2BHcgDLVJk1S1FIbRNj94B7aS6IB
 8oky/6wny0axRXB/SFsFvwbdctDkCIjysr93Kojmngq7HaPqsybc9hDFd4C/BiFs9pbh3++vamX
 QumMiY9G3QGY8tLY=
X-Received: by 2002:a17:907:1b15:b0:6d7:13bd:dd62 with SMTP id
 mp21-20020a1709071b1500b006d713bddd62mr5024465ejc.673.1647533209245; 
 Thu, 17 Mar 2022 09:06:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLuz6fnD0ya5pWy2p921+IstSgczo4fL+0u4aCAjOH/tqG/zH100ZypeTVg7lD5s34Csolfg==
X-Received: by 2002:a17:907:1b15:b0:6d7:13bd:dd62 with SMTP id
 mp21-20020a1709071b1500b006d713bddd62mr5024417ejc.673.1647533208797; 
 Thu, 17 Mar 2022 09:06:48 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a170906354800b006da9dec91f2sm2551011eja.163.2022.03.17.09.06.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 09:06:48 -0700 (PDT)
Message-ID: <a437e55d-b889-b7b5-4a73-3e87c9ee44f6@redhat.com>
Date: Thu, 17 Mar 2022 17:06:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 4/5] iotests: make qemu_img raise on non-zero rc by
 default
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220308015728.1269649-1-jsnow@redhat.com>
 <20220308015728.1269649-5-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220308015728.1269649-5-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.03.22 02:57, John Snow wrote:
> re-write qemu_img() as a function that will by default raise a
> VerboseProcessException (extended from CalledProcessException) on
> non-zero return codes. This will produce a stack trace that will show
> the command line arguments and return code from the failed process run.
>
> Users that want something more flexible (there appears to be only one)
> can use check=False and manage the return themselves. However, when the
> return code is negative, the Exception will be raised no matter what.
> This is done under the belief that there's no legitimate reason, even in
> negative tests, to see a crash from qemu-img.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>   tests/qemu-iotests/257        |  8 +++--
>   tests/qemu-iotests/iotests.py | 56 ++++++++++++++++++++++++++++++-----
>   2 files changed, 54 insertions(+), 10 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


