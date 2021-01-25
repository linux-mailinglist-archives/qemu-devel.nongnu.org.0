Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 156E73023BE
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 11:38:37 +0100 (CET)
Received: from localhost ([::1]:51024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3zGW-0005aC-4s
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 05:38:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3zEm-0004cj-FV
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 05:36:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3zEj-0000eb-TI
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 05:36:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611571004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vXHgEQaJVc7Ml0uRoGVD/Fyq2ceokn1OXtZdar7EwK0=;
 b=jKd8ZoCDM4wE29jh/xeXhK/yDD7GsxohYCLZ+qPnVBXWpQxt02dYjy6bA/5SJ5u7CdxOq/
 by9/n4eiW4Npus5ABAD+FyY//LzUVGp1HlQ1SyX+CDpjjPBjEIOKhwXk0DmbO+AxuW2Z06
 fLCNGcYgE7Wk1ucyCA57scep3lSzwO0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-O_1bXMiQPeatWeOnZc-0oQ-1; Mon, 25 Jan 2021 05:36:42 -0500
X-MC-Unique: O_1bXMiQPeatWeOnZc-0oQ-1
Received: by mail-ed1-f69.google.com with SMTP id x13so7134707edi.7
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 02:36:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vXHgEQaJVc7Ml0uRoGVD/Fyq2ceokn1OXtZdar7EwK0=;
 b=t9TKpv/I5/BT8gW62Hz3eE1fqWI3rKKfSp01e/FwCyyiu5hfzqzf/M+lJR7/NTVRks
 LtH0adMlmPMw9DYu9wLv8qU3/Ur7T70LdIMTmMPx7w+UfWonbdBR2z/K/f86Cp3HWjkp
 73odceMOyYDiGBIWAq3TX1F4CYN6pw+HR8faPS9uaD/1lmbktS9krqt4THO9Y36HkDGu
 EKETHunlBtOqIhuYb90g7xSKhRoXugFUoMkTJ3k/1Xl96CZaa1G52fk/r2gJrDfQnm36
 pidmmoFtD6UKIrs6RPCX/90vimV5V/g/S/RuiFzKyGj27zx7oQn0EX4op6DKo4sMzUys
 dbGw==
X-Gm-Message-State: AOAM532CBOwoSpSt80MQRkBDk7A1asA8wV0EuDFQx3GIxp/bFOBqFuuk
 cHeUOTxuuoNLh5mV+eQNSJqzXI9UvqBS9kFrPqlGGwWNOwyyFQzgyz6X7Bs51OeHuL4QQ8HIrfS
 XfW86+uCRSExtUqA=
X-Received: by 2002:a17:906:f0d7:: with SMTP id
 dk23mr830773ejb.131.1611571001287; 
 Mon, 25 Jan 2021 02:36:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9Vm2nCSmLt7vs47oN0oSI7cdeK1i+TGifzYWxrpMqnHVhM6TJ4NOL13Q6wNJG5S8IshBkMg==
X-Received: by 2002:a17:906:f0d7:: with SMTP id
 dk23mr830764ejb.131.1611571001095; 
 Mon, 25 Jan 2021 02:36:41 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e10sm8088485ejx.48.2021.01.25.02.36.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 02:36:40 -0800 (PST)
Subject: Re: [PATCH v1] gitlab-ci.yml: Speed up CI by using "meson test
 --no-rebuild"
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210125090339.134019-1-thuth@redhat.com>
 <e8699ffe-3260-3033-cc13-ae9c3f86cbf1@redhat.com>
 <20210125095655.GD3527172@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cc741037-6c97-86e2-9979-9e8848f06897@redhat.com>
Date: Mon, 25 Jan 2021 11:36:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210125095655.GD3527172@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/01/21 10:56, Daniel P. Berrangé wrote:
> When I suggested use of --no-rebuild, I was actally thinking that
> we would change the Makefile(s) to enable to pass the --no-rebuild
> arg to meson. eg
> 
>    make check MESON_ARGS=--no-rebuild
> 
> is that, or something similar possible ?

It would but "make check" is not using Meson yet.  Upon switching, you 
will indeed be able to do something like that ("make check 
MTESTARGS=--no-rebuild" in the patch I am using).

Paolo


