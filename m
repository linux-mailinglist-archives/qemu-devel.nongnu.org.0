Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C96FC39662C
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 18:59:34 +0200 (CEST)
Received: from localhost ([::1]:52682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnlGH-0001cT-S0
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 12:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lnlDc-0008SS-Lc
 for qemu-devel@nongnu.org; Mon, 31 May 2021 12:56:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lnlDY-0001LA-QF
 for qemu-devel@nongnu.org; Mon, 31 May 2021 12:56:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622480203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DEN/ALSOsbHY7uyO9SfixisqvqH0nFy7JL1BU6gwWuk=;
 b=S8Mqpp6Vgp3vA7HxTpFa3hhGvgPEPgcXcoVuFOjiaY/dMgcRsk54WiyFKa1RZqDKEfGf2V
 nGSWArKqZdnQJ27nv1+OOsJi7QK20lRXpk7j2uN1Qi6YOLCzLbPKhE4vfvsnnBu5no43xK
 tOhLWMFdwKm/mcoC5kjb0JbzQOdg3wk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-hzj7eEq4NNW4uANnN5Xd8A-1; Mon, 31 May 2021 12:56:42 -0400
X-MC-Unique: hzj7eEq4NNW4uANnN5Xd8A-1
Received: by mail-wr1-f71.google.com with SMTP id
 u20-20020a0560001614b02901115c8f2d89so4136819wrb.3
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 09:56:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DEN/ALSOsbHY7uyO9SfixisqvqH0nFy7JL1BU6gwWuk=;
 b=jFVYo9byjqxPcvNmNiE3CpCEcQ+m0CL1UOXi2Df9S62/En7XGljwP9LailzFMxFr4B
 yd/bwEjdfwNrOjfoRUAQ21ZgjkhV3D6C8cp6PHiq6yB3NSeZuDEUsbM1yQ4Gncvkuvyp
 R00CHiWKjHSMI0soJG4MtlTXeIdJnzIXhZORDPWeju0/dGL9HuzMHsrXuMjPfR8sAOEK
 wQOOFygRkU03uQ/6JI8xRipMqb7xNvIpdRT+nEwVyHUieqy6aWnQYTRDIUgi2vq5dbLh
 9afLCIA1jG2pVp2Xmbfcwl3VnwtP2Cws7SWg/2SF6X9NCsBfZqt6H5AzEIMzhPqnJSuQ
 Xo3Q==
X-Gm-Message-State: AOAM532S9qj8s+Apmk5XrbNpgf5o2M2trl6u/YRuNNcSNIsNiRayQx1M
 y1754UReQzvY3LuwTcdAW7Z2xN9aqxZDIkO887lHmxZX/BtEstuVCQBNCgWjG9skKCFSvopMH7c
 H4asAw35AplVnUvraEMbOjOXVsy6LgagUySV8SqL9wBCk1zRCc+huP+Kpq85qbQr6v+Q=
X-Received: by 2002:a5d:6584:: with SMTP id q4mr3233139wru.230.1622480200684; 
 Mon, 31 May 2021 09:56:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRXINcTV+mcOM01DVDk2ckMbzODj/CXfoYUyX2R2sqNKOIq/Ib/pKiJjsGNySnQ/5eu7f/QA==
X-Received: by 2002:a5d:6584:: with SMTP id q4mr3233119wru.230.1622480200475; 
 Mon, 31 May 2021 09:56:40 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h46sm346586wrh.44.2021.05.31.09.56.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 09:56:39 -0700 (PDT)
Subject: Re: [PATCH] oslib-posix: Remove OpenBSD workaround for
 fcntl("/dev/null", F_SETFL, O_NONBLOCK) failure
To: Brad Smith <brad@comstyle.com>, qemu-devel@nongnu.org
References: <YGYECGXQhdamEJgC@humpty.home.comstyle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a1330d92-d57b-8d03-c310-69270560bf0c@redhat.com>
Date: Mon, 31 May 2021 18:56:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YGYECGXQhdamEJgC@humpty.home.comstyle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/04/21 19:34, Brad Smith wrote:
> OpenBSD prior to 6.3 required a workaround to utilize fcntl(F_SETFL) on memory
> devices.
> 
> Since modern verions of OpenBSD that are only officialy supported and buildable
> on do not have this issue I am garbage collecting this workaround.
> 
> 
> Signed-off-by: Brad Smith <brad@comstyle.com>
> 
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index 36820fec16..7b4bec1402 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -273,17 +273,6 @@ int qemu_try_set_nonblock(int fd)
>           return -errno;
>       }
>       if (fcntl(fd, F_SETFL, f | O_NONBLOCK) == -1) {
> -#ifdef __OpenBSD__
> -        /*
> -         * Previous to OpenBSD 6.3, fcntl(F_SETFL) is not permitted on
> -         * memory devices and sets errno to ENODEV.
> -         * It's OK if we fail to set O_NONBLOCK on devices like /dev/null,
> -         * because they will never block anyway.
> -         */
> -        if (errno == ENODEV) {
> -            return 0;
> -        }
> -#endif
>           return -errno;
>       }
>       return 0;
> 

Queued, thanks.

Paolo


