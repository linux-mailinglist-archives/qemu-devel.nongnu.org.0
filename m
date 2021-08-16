Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 043AC3EDC80
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 19:37:31 +0200 (CEST)
Received: from localhost ([::1]:56376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFgYD-0002JZ-QR
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 13:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1mFgX9-0001aV-ND
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 13:36:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1mFgX5-0002To-U4
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 13:36:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629135378;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YZcsez3w4gYaSDMLgr+qamEPxStqdPxNQH+twy47EFA=;
 b=Aw0UBixzvt7bgZwzoMC6nhgLVEuZnxmow9U7dTsjEYscxUr5/8qrE5lhW560JnX0gQGp5m
 SNyQS856dMsrPZhsjWaJweqRaPly4QFAKzY9ncjGhV2+Lr6qvTpx7TN40Ijuqpl7kBVJc/
 6OeNXPP3JE7PaSCXDiloB/gYOgZaVPs=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-SFRrJ8cHOKOUo2lX90OZmw-1; Mon, 16 Aug 2021 13:36:17 -0400
X-MC-Unique: SFRrJ8cHOKOUo2lX90OZmw-1
Received: by mail-qt1-f198.google.com with SMTP id
 w19-20020ac87e930000b029025a2609eb04so9600445qtj.17
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 10:36:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=YZcsez3w4gYaSDMLgr+qamEPxStqdPxNQH+twy47EFA=;
 b=p6tHfgpwl0Bfgy5ONfVpo/VxeJkSOd4jhWeo06ZaKbBIxdu+DJrHHe6Ki7XkXxzLA3
 strMbSjBJrcD0zzXriqYWGGNDk+q3yYdL+PBuumleftOgFCZw7xbJqeiV94LwZSSFiDY
 ocnK3NoEDv+M3hUWZy7u8MfSwpF6AWJaLKuA9+LtGZv2XMtA2YzfGoOBbw1QKZcswc1g
 TmgKrcA3DFE+xPSprBApLV7BrNL17em6ePokgQW9oT48KxUu5kjbmd7ZDSPNYd02T2EP
 AfRzyqyDH2Pv9NoTFJAF1ErW7GAzwIsiGqDYvLwxld7TG1CO33D6iKGo67coRdFSi/C3
 yaRQ==
X-Gm-Message-State: AOAM532IGWDd8D+rGWedDJX7QznZLleAKPVQp0aHZfr7g5+8Ftd6chky
 zCp69kbdd8f4yCmEF1cNweRtvIvK4Zzby4Y2Y/1Mn1CpVnEuHm4e2wkCQWB6vMPA42hGrnpLv/O
 /coJfHxEX4tNFpMU=
X-Received: by 2002:a37:8243:: with SMTP id e64mr33371qkd.89.1629135376682;
 Mon, 16 Aug 2021 10:36:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyH5zLCLCPb0b0Tq4kTZZZYfVtBCbsrEaMeDZEu7bz8dRfnmaVKYIum46/4ibKDYZ0PIgEEQ==
X-Received: by 2002:a37:8243:: with SMTP id e64mr33354qkd.89.1629135376478;
 Mon, 16 Aug 2021 10:36:16 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.154.241.196])
 by smtp.gmail.com with ESMTPSA id o7sm5007092qtw.80.2021.08.16.10.36.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 10:36:15 -0700 (PDT)
Subject: Re: [PATCH] tests/acceptance: Allow overwrite smp and memory
To: Ahmed Abouzied <email@aabouzied.com>, qemu-devel@nongnu.org
References: <20210802222257.50946-1-email@aabouzied.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <cfe86a3a-b4da-e3aa-9345-9313fca5a5be@redhat.com>
Date: Mon, 16 Aug 2021 14:36:11 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210802222257.50946-1-email@aabouzied.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.71, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: wainersm@redhat.com
Cc: philmd@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Ahmed,

Sorry for taking longer to reply you as I just returned from vacation.

On 8/2/21 7:22 PM, Ahmed Abouzied wrote:
> Removes the hard-coded values in setUp(). Class inheriting from
> avocado_qemu.LinuxTest can overwrite the default smp and memory instead.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/453
Thanks for working on that issue!
> Signed-off-by: Ahmed Abouzied <email@aabouzied.com>
> ---
>   tests/acceptance/avocado_qemu/__init__.py | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

I would change the patch's subject as suggested by Philippe in another 
email. Apart from that, the change looks good to me. So:

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
> index 2c4fef3e14..2639b89c84 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -441,6 +441,8 @@ class LinuxTest(Test, LinuxSSHMixIn):
>       distro = None
>       username = 'root'
>       password = 'password'
> +    smp = '2'
> +    memory = '1024'
>   
>       def _set_distro(self):
>           distro_name = self.params.get(
> @@ -471,8 +473,8 @@ def _set_distro(self):
>       def setUp(self, ssh_pubkey=None, network_device_type='virtio-net'):
>           super(LinuxTest, self).setUp()
>           self._set_distro()
> -        self.vm.add_args('-smp', '2')
> -        self.vm.add_args('-m', '1024')
> +        self.vm.add_args('-smp', self.smp)
> +        self.vm.add_args('-m', self.memory)
>           # The following network device allows for SSH connections
>           self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0-:22',
>                            '-device', '%s,netdev=vnet' % network_device_type)


