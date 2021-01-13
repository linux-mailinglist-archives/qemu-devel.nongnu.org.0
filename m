Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 915392F4674
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 09:30:19 +0100 (CET)
Received: from localhost ([::1]:51878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzbXm-0008FP-MY
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 03:30:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kzbWx-0007qO-AZ
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 03:29:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kzbWv-0006ib-Nc
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 03:29:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610526564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eFUuij5+qd7ANtmamgwB6ayljYwIr3aP2kBf4O5E3Yw=;
 b=gZMOXy070cGKJq5KE/tgf8DN11yBRIiGikZTzXG6g/RwDkoWzilOPOQCZRxCaOdV9wXrFi
 78D22lFjKoDOy6bkfj4SRjg5RbYUL5lwzEaCuLSaqU+eMwauFrPeO320z9q1CUJ5K7Zj/I
 widLJ9yBPPPl1uuWs8F2gRcPupN5kSc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-lMy9CFI0NmyBkZeazZq7zQ-1; Wed, 13 Jan 2021 03:29:23 -0500
X-MC-Unique: lMy9CFI0NmyBkZeazZq7zQ-1
Received: by mail-ej1-f71.google.com with SMTP id m4so593994ejc.14
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 00:29:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eFUuij5+qd7ANtmamgwB6ayljYwIr3aP2kBf4O5E3Yw=;
 b=gzWBdgxjV9D18b+1EPNwUt2FlJXANc05lYOdny2lfhLlapXXFuZPhunh8Fx8Qh+U/R
 ETyDzHvbnmmv3Rg2iIo5r+I3dluH2itG6ECzF7j+OZLy2DyrdDEjt9PbMcCTOgbhmYNN
 30qWIQZ9y0qO7XN1b7BDMY11xE11CyrlTWX9YYxBeBY6MKTzkU/4otpqi2QMpYsAWz/G
 qnKyNla2xqPgSykhLbnW8IJC7+qyhBKuY4yozN2Wsoq6aO/Zzzz70pmAORxSxiaypRqr
 37ujqf/45SAMC/myN0n0KiwB3BT79id5J2Jgos0cBWZXf48zlJkCtEd7cLb0mEdP4oNY
 DisQ==
X-Gm-Message-State: AOAM533FMx8F5TiQga4zJ99hGQGlGjnu/EoGRE4Oqifanzwapi20btCN
 DJqWVzNmV6y+iHXE8+43ff25l+30pFck5Zp50d4CRBDd4VC52pBQGIILJE6VFEFXKvqTqKAgmQY
 TALkQQzDzK6JmVPLUnxtr9on+d2gkQ+eq6P/WSwdb0s3skqiUBvi7+IlWbd9A4htdC1U=
X-Received: by 2002:a17:907:2061:: with SMTP id
 qp1mr727956ejb.222.1610526561737; 
 Wed, 13 Jan 2021 00:29:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzK7L4DRKr9J4GRVodrIMUaAPAZEJab+WaNXFqX3ITgb2uU6Xf2nkLOFUXuZpmgEKZIuutnOA==
X-Received: by 2002:a17:907:2061:: with SMTP id
 qp1mr727944ejb.222.1610526561554; 
 Wed, 13 Jan 2021 00:29:21 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ck27sm501483edb.13.2021.01.13.00.29.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 00:29:20 -0800 (PST)
Subject: Re: absolute firmware path made relocatable in qemu 5.2.0
To: Dave <dave@0bits.com>
References: <abd662c1-9a4a-9c77-6533-875ab1924695@0bits.com>
 <c9b36f34-8783-9c11-ffb9-afd25fdf9ac0@redhat.com>
 <428592f1-a5fd-7e6a-f181-28f31343518a@0bits.com>
 <CABgObfaZECGDvgsvebx44h84okDMKWZFw1ZtqcXk8W9SaD38Zg@mail.gmail.com>
 <3ab19db3-7339-79d5-9f4f-aee7165b531a@0bits.com>
 <536bbda3-ebcb-e098-2625-5de4db08422e@redhat.com>
 <e132f0dd-e9ee-5519-e539-ceb760b7c6a6@0bits.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a4eeffea-ff71-ed97-d9f7-9d09b77f6769@redhat.com>
Date: Wed, 13 Jan 2021 09:29:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <e132f0dd-e9ee-5519-e539-ceb760b7c6a6@0bits.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/01/21 08:51, Dave wrote:
> 
> [,br=bridge][,helper=helper][,sndbuf=nbytes][,vnet_hdr=on|off][,vhost=on|off] 
> 
>                  use network helper 'helper' 
> (default=/nonexistent/libexec/qemu-bridge-helper) to
> -netdev bridge,id=str[,br=bridge][,helper=helper]
>                  using the program 'helper 
> (default=/nonexistent/libexec/qemu-bridge-helper)
> 
> See that it will call /nonexistent/libexec/qemu-bridge-helper by default.

Nice catch; fortunately, only the help is wrong.  That's not easy to fix 
but I'll see what I can do.

Paolo


