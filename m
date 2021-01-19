Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D822FB6D3
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:21:04 +0100 (CET)
Received: from localhost ([::1]:33424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1rsV-0005rT-Tl
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:21:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1rqp-0004d7-Et
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:19:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1rqk-0001Py-VF
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:19:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611065952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nnepRfUsO95MzBXqTMlkuAlGMiMszlIKxHxNYY0OvXQ=;
 b=ELTbAoKW7yPtPtAHTxnVBWrfhSGNtM5uPgbeGj/mvpu8nGR0Ma0Q+zkqJXUqyXdP5kUCEi
 ErGhuNdkkGi10laBMeCXsgvmZVe/J0lDD4AgbGE/6wnDjXrevCPUQg0rcVcz250MYk9+LD
 AzJwrisa1pXR03h5K/4ooJzvEzB5yqw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-QZ5CnHQiMnGCuOy2qNb5Vg-1; Tue, 19 Jan 2021 09:19:10 -0500
X-MC-Unique: QZ5CnHQiMnGCuOy2qNb5Vg-1
Received: by mail-ej1-f71.google.com with SMTP id f26so6344482ejy.9
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 06:19:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nnepRfUsO95MzBXqTMlkuAlGMiMszlIKxHxNYY0OvXQ=;
 b=ka2BYkMvRbVSJu2ysHTOTqtXWT9Bz9t8NYAfkw6Hy1ZqsDVz0kS2e8TqI9ArWjKx8P
 398rNEwOqsCA+iMP6ci+rVeDiTbSqs3eTyhkFd0M388MIr3VjGq7nSZH5fZUCb0a3rxn
 ORoEkgZcGPSZOV/bHEGbbmpXG1mmMZGNz8JS7S0pmqc6LUJahGOaumWFuS4cCOWFpL8y
 eqZ9p1QUFgFu6wdCWq8yNT3blnzCciM+iwZRDkF9lWAICU0OBav4oene6CgJDBJcrDw+
 /VMfbyxm9yKgD3+7QHkJjxUVXmWwwZ6u5AthDUtjhQukgkgmAwAdABj7YNmx7TFTtMBD
 soWA==
X-Gm-Message-State: AOAM533SiPsnIuYb/g9Wo+DQNQTyA+alYmFKXPTbJdMkoyyFHT42Uf5i
 IEt3YMUwvU2Y3GPa6HeyvRnCSgUpet1ta1mXQtxt+9kzFHCNdZMeRGSDy+bSC27KyVydtz96eGX
 doyE5RCPYm2NXHTY=
X-Received: by 2002:aa7:d9c3:: with SMTP id v3mr3488785eds.133.1611065948817; 
 Tue, 19 Jan 2021 06:19:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwVbPasF30i/VtQP7As+dW8L9Q9Zg8thxkuLf/GSCM5JF9CNXB99JUxCVojgO86NvGgLsG1xA==
X-Received: by 2002:aa7:d9c3:: with SMTP id v3mr3488760eds.133.1611065948573; 
 Tue, 19 Jan 2021 06:19:08 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id k16sm10805601ejd.78.2021.01.19.06.19.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 06:19:07 -0800 (PST)
Subject: Re: [PATCH] tests/check-block.sh: Refuse to run the iotests with
 BusyBox' sed
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210119134749.401311-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ea07c708-fe99-8375-1c4c-f51a6e672094@redhat.com>
Date: Tue, 19 Jan 2021 15:19:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210119134749.401311-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/19/21 2:47 PM, Thomas Huth wrote:
> BusyBox' sed reports itself as "This is not GNU sed version 4.0"
> when being run with the --version parameter. However, the iotests
> really need GNU sed, they do not work with the BusyBox version.
> So let's make sure that we really have GNU sed and refuse to run
> the tests with BusyBox' sed.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/check-block.sh | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


