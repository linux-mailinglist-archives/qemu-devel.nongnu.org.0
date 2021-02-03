Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B4130E182
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 18:54:48 +0100 (CET)
Received: from localhost ([::1]:60456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7MMZ-0006wa-4u
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 12:54:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7MBB-00018n-2K
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:43:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7MB8-0007EV-ED
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:42:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612374177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EhwUVKFEH4ml0P4zH+oaKy3tU2CgNNxSWs5dV+F8ie4=;
 b=Vzm5MnGauuG7ruFiCpnH/qbNMXxSLUz3bu9o0ctp8WaKvPnDBl/WO+/xj0j37A0Ex+GBXK
 QHt4ZWcR8Hj6Sh+CLURcGvYkvhciI0TGvg+FUfz4LJ3Hm2tIKzb3KgFJcTCeRN7ekh6QsJ
 mVtUA4yJ0Eh4HKxZw+wxZhWihIXSKbQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-xxMtqhChNU-sbAKr7ke8Tg-1; Wed, 03 Feb 2021 12:42:56 -0500
X-MC-Unique: xxMtqhChNU-sbAKr7ke8Tg-1
Received: by mail-ej1-f72.google.com with SMTP id d15so142395ejc.21
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 09:42:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EhwUVKFEH4ml0P4zH+oaKy3tU2CgNNxSWs5dV+F8ie4=;
 b=mapAlLgzxl+FNpTbpc0aGxS2h/LPpdaquxI2Mpa+v+crL2/9g9d1Jp7Vp+xW2R+gXM
 i6qiqoKeq/0ghFh9MXAi8f0hGCpT2Xx3UCpydU9QJnEkqjrtLt/BrMgQh9M0ptXHrQpj
 xhHp1I7BP5N3qK8i9hcA2BRWHQ7s1+rR5F1yOfkZgPUdQ9ELnC6+GNeklQYS93c7kk9b
 x5p1UINNZfejS1e6+QBeCnWMpGzf8Oj0E0qv8yOgM/bhzEDOZJKfCzInhD+ANG9aGeQ2
 WZfQ/kd8VYEa6Z6tftlmcUDlrhKJbAbH/j9572G8yGRvScs7O0j9CNm22GijLdNCoUBR
 Fu/g==
X-Gm-Message-State: AOAM532O0LGHF/F9TLypBC4ACfT3JiS/fEkYKmP2owotNgEKAz/0Dx3o
 KF2mKHVTkW7incfj7dGSDdUbUUfodYMW5/jj/DJj+8uxultZxNVSr6Ax9B+AZuYaI3fGe4ZTfS3
 swPG+AsFkcA8N8DY=
X-Received: by 2002:a50:b765:: with SMTP id g92mr4211133ede.317.1612374174933; 
 Wed, 03 Feb 2021 09:42:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzyI5HTVXI9vxzKkiHrK6+2ozFuEjI+yaTJy3E3n/S4NfIkGczGXpLAeaDnMMK4ydhj+Rg/hA==
X-Received: by 2002:a50:b765:: with SMTP id g92mr4211101ede.317.1612374174775; 
 Wed, 03 Feb 2021 09:42:54 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id r4sm1214242edv.27.2021.02.03.09.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 09:42:54 -0800 (PST)
Subject: Re: [PATCH 12/22] Acceptance tests: clarify ssh connection failure
 reason
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-13-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0831fc4d-57c9-2cf7-c8c8-82ece7fb6f43@redhat.com>
Date: Wed, 3 Feb 2021 18:42:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210203172357.1422425-13-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 6:23 PM, Cleber Rosa wrote:
> If the connection to the ssh server fails, it may indeed be a "sshd"
> issue, but it may also not be that.  Let's state what we know: the
> establishment of the connection from the client side was not possible.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/linux_ssh_mips_malta.py | 2 +-
>  tests/acceptance/virtiofs_submounts.py   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


