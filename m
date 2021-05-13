Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7742037F4FB
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 11:44:29 +0200 (CEST)
Received: from localhost ([::1]:51458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh7tH-0000VE-I9
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 05:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lh7pt-0003uW-6y
 for qemu-devel@nongnu.org; Thu, 13 May 2021 05:40:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lh7pk-0005ir-Nu
 for qemu-devel@nongnu.org; Thu, 13 May 2021 05:40:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620898843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L/gV9M6IKDRh0fouctFItwvsokJA/aX5OA5GJ5fZiMQ=;
 b=Kf/dTMuTlNdu0CLnqtCSx6Hhj/GW5pvx2pwj+edUkid6v4bcqpmcue1wD5unTRu1gOtPGm
 FwminfW7V/sScpudHEPkwpXMzgV5e4xhRRJjjUC937HC39oJFVBYz5BV0u1l9hAvycwF2g
 gXnPbLBWx4s3hOWOwefAqKZW7Vqlp2Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-77j4Q0mIP8W2xeXtjbaAug-1; Thu, 13 May 2021 05:40:42 -0400
X-MC-Unique: 77j4Q0mIP8W2xeXtjbaAug-1
Received: by mail-wm1-f72.google.com with SMTP id
 b128-20020a1c1b860000b029015b52bdb65aso676461wmb.5
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 02:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L/gV9M6IKDRh0fouctFItwvsokJA/aX5OA5GJ5fZiMQ=;
 b=FTpJvxHRCvQHwYt4kwWuEAjNala4tqHcCBNLIIqwSRR4DK+RQFmxgFpjsrBZCi8yNb
 vYX52w3VLDAlhOkz4OxllxxdLkisYDmMvPmjeQMWWWzCo+8dnmh9N1bJONuH8ZBc79Br
 n5978357UcZ5H3yu36XSgivXKTo+7s+7JWIFcN1H4dbDX8XCrLshvMrwcnoVKoNp6bX1
 UZo49C/HMKOZFkSwEeF4e6+QNprjK9eiyFFuWjSQB2oACz62U6PUYnD7ZSDpgMj8x9fa
 58kp5KKrbUFUd9Rx5oglUbNubuLuzeAZMj+T9XuVP9Mz/1g0gszd5kWyUQM/GLQFNjRQ
 QXAQ==
X-Gm-Message-State: AOAM530XRtRKtm4NFFWgaB/RbeKbIJpvMevx9iKQVjgCa1hsiZ639QT2
 3hg04lSbZSu4STX3yGgo8TaIorCaDZUHAos3V0HPdiZbCrGjWc+1Mgqtk32Wy5qjCsLNtjvnF2a
 rEBFbKK+9UeGhqC0=
X-Received: by 2002:a7b:c196:: with SMTP id y22mr43504269wmi.1.1620898840634; 
 Thu, 13 May 2021 02:40:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdIwhgGUBs1SeKFVRwVlt+cbOl+oqi9rI1JDgrrvVAW7Gxc3zt6iUgiBSF0fe0+lJdIsrT7g==
X-Received: by 2002:a7b:c196:: with SMTP id y22mr43504256wmi.1.1620898840515; 
 Thu, 13 May 2021 02:40:40 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id 61sm2489147wrm.52.2021.05.13.02.40.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 02:40:40 -0700 (PDT)
Subject: Re: [PATCH 08/10] iotests: use 'with open()' where applicable
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210512214642.2803189-1-jsnow@redhat.com>
 <20210512214642.2803189-9-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b41a1c37-59f4-a62e-5381-2aaef4e520ae@redhat.com>
Date: Thu, 13 May 2021 11:40:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512214642.2803189-9-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 11:46 PM, John Snow wrote:
> More pylint 2.8.x warning hushing: use open's context manager where it's
> applicable to do so to avoid a warning.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/iotests.py | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


