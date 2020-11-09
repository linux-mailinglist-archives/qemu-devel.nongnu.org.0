Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A222AC2AF
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 18:42:19 +0100 (CET)
Received: from localhost ([::1]:38216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcBBK-0001Fh-4K
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 12:42:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcB3t-0001JZ-LY
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 12:34:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcB3r-0007Hx-Nv
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 12:34:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604943275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/YA/zI+SorLSwHx6kjpxB1sToc2IcMJfrShRAloZVVo=;
 b=Fhhreb+c4R2tW6asbwNegN2OSM63DQ7B47oy+ZIH4oJbcQ0fl6+qaL6sGCbx2sH2aRw+jp
 Qr5NfRAHYq5iILXLmzIMa4kBicDUXamwuf57k2dh2T/XgiKWgeh2JO+omQEYYO8IywcGzI
 yv+g5Z8GCL6120oagcRhkbNOLYKrJW0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-X0Gz-FdHPO2Uzsisz-YQkw-1; Mon, 09 Nov 2020 12:34:33 -0500
X-MC-Unique: X0Gz-FdHPO2Uzsisz-YQkw-1
Received: by mail-wr1-f72.google.com with SMTP id e18so4600668wrs.23
 for <qemu-devel@nongnu.org>; Mon, 09 Nov 2020 09:34:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/YA/zI+SorLSwHx6kjpxB1sToc2IcMJfrShRAloZVVo=;
 b=q9xM2VGGAtNG8ZN3ENx3fvkmfWcJ4VYUH01dNdq2FzOSV6wPn3hGIBULaxj5rQkQih
 O2Ty2Kf7mPT9C3Z9pE3+9LSGXbRPYPsXxR/j8WBtN8HukgMpBzuDPQq959dtwo7rEScb
 3UHP6TjIyg7UnoItBllnYHaeZP+uKtEKkX63Bf+2Xkd4gIABszsaNCcvplPnj/sQhP0s
 Ao5qpDLGEaCNOFDNJwPi76+PKmq804N1W/T/5E6QurhnwmdNM9J+fxIBmy0PA5vkuUvw
 6KlR+u7sqbk56gYvo7sJVba5twDiIoRnsLFtJmCXxh3BplppcV4ueteRLRCkWri7qyFQ
 NKfQ==
X-Gm-Message-State: AOAM5322TMjod9/VFFtttDXXnfX5yjRJrFERByb2EFrKNtUMo8RgoRQl
 fIE5yN9Pmg05A3t/ArtZC89WP9MSBu/xs7bUIRe8RlSHXSgXKyaolGCUC5aIj+qUm0j8FKIbcqo
 +ehFsjTgGx9M5cHw=
X-Received: by 2002:a7b:cb09:: with SMTP id u9mr232621wmj.49.1604943272319;
 Mon, 09 Nov 2020 09:34:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZMCIhDcC/iPiN3fmnfuhZs/rGkCLQIN3nrBHEhRRp71tCTx6Nj1cV5wqhuWkCdaJGIlr60A==
X-Received: by 2002:a7b:cb09:: with SMTP id u9mr232592wmj.49.1604943272112;
 Mon, 09 Nov 2020 09:34:32 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o11sm15144716wre.39.2020.11.09.09.34.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2020 09:34:31 -0800 (PST)
Subject: Re: [RFC v1 09/10] i386: split cpu.c and defer x86 models registration
To: Claudio Fontana <cfontana@suse.de>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201109172755.16500-1-cfontana@suse.de>
 <20201109172755.16500-10-cfontana@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5eea7128-159f-da26-ef0b-37f888a4ea29@redhat.com>
Date: Mon, 9 Nov 2020 18:34:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201109172755.16500-10-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 00:04:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/11/20 18:27, Claudio Fontana wrote:
> |softmmu/vl.c | 2 +- target/i386/accel/hvf/hvf-cpu-type.c | 78 +++++ 
> target/i386/accel/hvf/meson.build | 1 + 
> target/i386/accel/kvm/kvm-cpu-type.c | 161 ++++++++++ 
> target/i386/accel/kvm/kvm-cpu-type.h | 41 +++ 
> target/i386/accel/kvm/kvm.c | 3 +- target/i386/accel/kvm/meson.build | 7 
> +- target/i386/accel/tcg/meson.build | 3 +- 
> target/i386/accel/tcg/tcg-cpu-type.c | 176 +++++++++++ 
> target/i386/accel/tcg/tcg-cpu-type.h | 25 ++|

Name the files just cpu.c/cpu.h?

(As an aside, I would skip the accel/ directory for the sake of 
conciseness).

Paolo


