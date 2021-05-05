Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04193373B54
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 14:34:12 +0200 (CEST)
Received: from localhost ([::1]:59396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leGjC-00070q-QZ
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 08:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leGhH-0006Ap-9W
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:32:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leGhF-0005zB-7V
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:32:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620217928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J4nZTMbqNGRmOr4zBY1KyUfEDzQ7QXzavxGWNiG9C2g=;
 b=KZiTrEcPunOeG/TZOnoz431zjhjCVD17saAzoCYza+QMsEhTOWIN7PlvWp7cp4n141yHDn
 h0UCUDlGTQBc1lKaKB5zXNQeCtXND/fL3gfQWD5Wo9Qt58YImJs6BFROQdAyU75ljcJ9h9
 lDjnfgmMm+mZhHHspLFD3JJ8EPpsLjk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-8kRcj5hWOjGYC64VWYN5rg-1; Wed, 05 May 2021 08:32:07 -0400
X-MC-Unique: 8kRcj5hWOjGYC64VWYN5rg-1
Received: by mail-wr1-f69.google.com with SMTP id
 93-20020adf93e60000b029010d9bb1923eso649719wrp.4
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 05:32:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J4nZTMbqNGRmOr4zBY1KyUfEDzQ7QXzavxGWNiG9C2g=;
 b=nVs6WhnTXslPMpcwBNdvEqG8GiCr0+JEgCJZDz/7B4NukXQra9DOd2ROaVzefevbJG
 4vXmBeiJyhDaCQyIWhzMV9aK1992KUcj2iWdHmns87rr3b8OSqJD/9NuNH4CVf2neVrN
 0/lc+5zBSVg2x+wpc8jU55lf4VZvzC0VL70cKGoPBnKg35LCrImeHpcjRI4ILDeNCLsM
 OkKLR/8pSpn5DZ51jtcLUKRLxBqu7B1JSxk+i+BzT8SmKhMxCNn0q9K4oeMQy5f3AGAJ
 IwqSc2dSkj/d5E4HmiCJ3DYMOxCyTtEHaV/lKHpa89m5oufNNC77DWcfDkEBv/+Ah5ve
 euOw==
X-Gm-Message-State: AOAM533LtRJuTpgoumq9DglnvXmLuq4iLUnqWV86NVkLuDj5LBHfzCBJ
 YB/Y6Zn4qFj/DAeIJRZIHWL7ZjFH/Q7uMoRT20A7mDgj46myIOYUN3WiAHxX0OXGBaSPCpuD3BA
 JO44JUtvWXgXwHys=
X-Received: by 2002:a1c:7501:: with SMTP id o1mr33542592wmc.65.1620217925556; 
 Wed, 05 May 2021 05:32:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZuRTODI+0bjRrn8hoJ6pHrWFkS9S7o5/qBDeIjKvAIDp9Z6aXvDNHas61czDHJuUW4vcwKA==
X-Received: by 2002:a1c:7501:: with SMTP id o1mr33542570wmc.65.1620217925367; 
 Wed, 05 May 2021 05:32:05 -0700 (PDT)
Received: from [192.168.1.19]
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id f11sm5934257wmq.41.2021.05.05.05.32.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 05:32:05 -0700 (PDT)
Subject: Re: [PATCH 2/2] net/tap: fix error reporting when bridge helper
 forgets to send an FD
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210505121236.532755-1-berrange@redhat.com>
 <20210505121236.532755-3-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d249a2d4-2155-b221-037d-22b82afc94f7@redhat.com>
Date: Wed, 5 May 2021 14:32:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210505121236.532755-3-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 2:12 PM, Daniel P. Berrangé wrote:
> The recv_fd() method returns -1 on error, 0 on end of file, or an FD
> number on success.
> 
> Technically 0 is also a valid FD number, so the return value is
> ambiguous.
> 
> The caller doesn't even consider the possibility of 0 meaning end
> of file, so just blindly assume it is a valid FD.
> 
> IOW if the bridge helper exits with 0 status code and forgets to
> send an FD, QEMU will accidentally try to use STDIN as a TAP FD.
> 
> Fortunately we get an error shortly thereafter
> 
>  $ qemu-system-x86_64 -netdev bridge,br=br99,helper=/bin/true,id=ns0
>  qemu-system-x86_64: -netdev bridge,br=br99,helper=/bin/true,id=ns0:
>    Unable to query TUNGETIFF on FD 0: Inappropriate ioctl for device
> 
> It is better if we correctly diagnose this broken bridge helper
> though. To do this we need to return the FD in an output parameter
> to remove the ambiguity and then fix the caller to check for the
> end of file condition. With this done we now get
> 
>   $ qemu-system-x86_64 -netdev bridge,br=br99,helper=/bin/true,id=ns0
>   qemu-system-x86_64: -netdev bridge,br=br99,helper=/bin/true,id=ns0:
>     bridge helper did not send a file descriptor
> 
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/166
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  net/tap.c | 32 ++++++++++++++++++++++----------
>  1 file changed, 22 insertions(+), 10 deletions(-)

> +        /*
> +         * ret == 0 means EOF, and if status == 0 then helper
> +         * exited cleanly but forgot to send us an FD. Opps...

Opps or Oops?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


