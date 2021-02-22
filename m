Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2951C321DF6
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:22:24 +0100 (CET)
Received: from localhost ([::1]:58908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEEud-0001LF-64
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:22:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEEso-0000EH-E2
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:20:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEEsm-0005W3-2s
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:20:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614014427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=quTYL0bBNZ8ordjdf/nNhCjU1BRydehHBiVfhwxY0hM=;
 b=i4453s0DUkDktmSm/6fkgh6JSuELhgISxLiMDi/BMrPj0SfxYkaekgc8ERNeK/g/kdJOIt
 CRHkjO2mOKbbA4bWwd3r8Fhzop89nZN9KDRSWwWupgd/jJ8kqPbmbgAScFS6kvcjJxVM0K
 BDjVBOzOqQvx7LMhGrhHRgsS+B2QJfw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-gcVrbPIEPeyEEXXpk1DOoA-1; Mon, 22 Feb 2021 12:20:24 -0500
X-MC-Unique: gcVrbPIEPeyEEXXpk1DOoA-1
Received: by mail-ed1-f70.google.com with SMTP id c7so318743ede.17
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 09:20:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=quTYL0bBNZ8ordjdf/nNhCjU1BRydehHBiVfhwxY0hM=;
 b=IbKuE2J2nSBpk0Sy5dalCz2Jvw3f9Yk8f9SgdqEmgAxlQpTqLnJPNhX2k3Zy2TgC65
 aA8DXneuq+D0Y9i01GV67slXAzpxWf4L5MWPTwxzGa0fXt373NypIJo7I6FSkUGcXt1I
 IhfPTPZ2aLR3ieMrv7/Y4Nb7TCUL5wZmxJ70LhFEDBonMWxchZw65ROFi9kUbFOvuNHu
 srSSfGNVWF3gCOizZmict4E+Ij1ezZOoi5NPZ7HYq/JQI67Ekifi3eCM7HXolMhZcrg5
 weDDXhtqNvC0MH3TIOlW1tl07XLd/pXUh3CvnRxDwt36s4yJV1z4ka4mBiPHtwhkSBTc
 z6DA==
X-Gm-Message-State: AOAM533kKH1OiOmeBO+8t1Dqa9WW1QTk47vKivdm5vpvGAY6YEJSs/pd
 J7v0C3NV4IEmiTA+uYnUAccP+AedBRvkHh8PXeGiX/XylzpLU+mwr6M3d7vTVKyXIufjdA23Qrh
 D/M6TcSq5FBau4iMvppWnGysEnaKsT6SdJAsN2n0U+3rS+qryBuWTq0uEUo/AOmZl
X-Received: by 2002:a17:906:4e19:: with SMTP id
 z25mr21939566eju.205.1614014422801; 
 Mon, 22 Feb 2021 09:20:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBjbeSbmCIL1aI06DYTp6jv5rqm9BYVPVlJOofSa8jpV7xTf5dnHBce0H4Sa3Gn8bTqjhwEg==
X-Received: by 2002:a17:906:4e19:: with SMTP id
 z25mr21939544eju.205.1614014422605; 
 Mon, 22 Feb 2021 09:20:22 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f1sm1184958edz.83.2021.02.22.09.20.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 09:20:22 -0800 (PST)
Subject: Re: [RFC v1 02/38] target/arm: move helpers to tcg/
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-3-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b433fc5f-a79a-c74c-1ec5-be4aa891b3bd@redhat.com>
Date: Mon, 22 Feb 2021 18:20:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210221092449.7545-3-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/21 10:24 AM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  meson.build                          |  1 +
>  target/arm/tcg/trace.h               |  1 +
>  target/arm/{ => tcg}/crypto_helper.c |  0
>  target/arm/{ => tcg}/debug_helper.c  |  0
>  target/arm/{ => tcg}/helper-a64.c    |  0
>  target/arm/{ => tcg}/helper.c        |  0
>  target/arm/{ => tcg}/iwmmxt_helper.c |  0
>  target/arm/{ => tcg}/m_helper.c      |  0
>  target/arm/{ => tcg}/mte_helper.c    |  0
>  target/arm/{ => tcg}/neon_helper.c   |  0
>  target/arm/{ => tcg}/op_helper.c     |  0
>  target/arm/{ => tcg}/pauth_helper.c  |  0
>  target/arm/{ => tcg}/sve_helper.c    |  0
>  target/arm/{ => tcg}/tlb_helper.c    |  0
>  target/arm/{ => tcg}/vec_helper.c    |  0
>  target/arm/{ => tcg}/vfp_helper.c    |  0
>  target/arm/meson.build               | 14 --------------
>  target/arm/tcg/meson.build           | 14 ++++++++++++++
>  target/arm/tcg/trace-events          | 10 ++++++++++
>  target/arm/trace-events              |  9 ---------
>  20 files changed, 26 insertions(+), 23 deletions(-)
>  create mode 100644 target/arm/tcg/trace.h
>  rename target/arm/{ => tcg}/crypto_helper.c (100%)
>  rename target/arm/{ => tcg}/debug_helper.c (100%)
>  rename target/arm/{ => tcg}/helper-a64.c (100%)
>  rename target/arm/{ => tcg}/helper.c (100%)
>  rename target/arm/{ => tcg}/iwmmxt_helper.c (100%)
>  rename target/arm/{ => tcg}/m_helper.c (100%)
>  rename target/arm/{ => tcg}/mte_helper.c (100%)
>  rename target/arm/{ => tcg}/neon_helper.c (100%)
>  rename target/arm/{ => tcg}/op_helper.c (100%)
>  rename target/arm/{ => tcg}/pauth_helper.c (100%)
>  rename target/arm/{ => tcg}/sve_helper.c (100%)
>  rename target/arm/{ => tcg}/tlb_helper.c (100%)
>  rename target/arm/{ => tcg}/vec_helper.c (100%)
>  rename target/arm/{ => tcg}/vfp_helper.c (100%)
>  create mode 100644 target/arm/tcg/trace-events
> 
> diff --git a/meson.build b/meson.build
> index 5be4e5f38c..86b07f1a1a 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1828,6 +1828,7 @@ if have_system or have_user
>      'accel/tcg',
>      'hw/core',
>      'target/arm',
> +    'target/arm/tcg',
>      'target/hppa',
>      'target/i386',
>      'target/i386/kvm',

Why add unconditionally and not such:

if config_all.has_key('CONFIG_TCG')
  trace_events_subdirs += ['target/arm/tcg']
endif
if config_all.has_key('CONFIG_KVM')
  trace_events_subdirs += ['target/i386/kvm']
endif

?


