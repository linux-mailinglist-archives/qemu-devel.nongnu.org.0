Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD9F607313
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 10:57:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olnql-0007Ky-H4
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 04:57:55 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olnT0-0002U9-E9
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 04:33:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1olnSW-0002L9-LD
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 04:33:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1olnSU-0006zK-C5
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 04:32:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666341167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UtmwzBKAXY7FDry+PhkiaoLN81OrUSbrew++0WyszTg=;
 b=W6NLh212j2zNoSw/jxb0h8F+5XoBzTuK5KnO4002/RK8q4SydT4QS9XF2B8xOP74nTMsJn
 a/4JYwns0xvztXbFHCBSGQMMefYoulBPdVVAeeZP5L5nu8mE8+gkeyDdOid2A9+SEfloqT
 UtGyB0mf4aIZIONprKgf7SNbdf2XOSU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-260-A7XyOnXIPs6FuQGmItvLcQ-1; Fri, 21 Oct 2022 04:32:46 -0400
X-MC-Unique: A7XyOnXIPs6FuQGmItvLcQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 h26-20020adfaa9a000000b002364ad63bbcso576103wrc.10
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 01:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UtmwzBKAXY7FDry+PhkiaoLN81OrUSbrew++0WyszTg=;
 b=Ee83sri8TwUiRGxwZ+lm2MB2x4AgTOuaXy10dtgBfv6Hrs8XD6/rKSchSUuXrqVKro
 pDddD1fCWaKRXf1ayK1JWvsswQMLq3iaTxj1uSemAVNbyRHIFKlVuMnafhd0vKn4ET/k
 Unv7JoV2c21noG2E6H7lEGLNvC7g+OsnlB/bkqEnfdNIVmHhIT0kLPMLpym8iOqza1DP
 Nl2HpTMyLKscOgk0P6mspYSGZuGv7qX5HjQ/4fU1R2zdzzxQGPjJKPy0ZTapD2lhwQjW
 CYV8Mnqxn9MaTQGRdw8stVaRYEzcjANYm87ZSSX1StJTJN0bjA2oa+4ehkPzp+5a71Ar
 8vrw==
X-Gm-Message-State: ACrzQf3d4IgHtO/+iTtt1D/IQAGqv7e2rnb+Cyd+ycDbW5znWJ6xQwqP
 /k+AhNMpBGBJxqpv1M0h6SESTKdZN9aRZ9DFVz8fcdn7suj+31wPnU/lq50nEozTTcgdmwdmIjX
 L61xtXMsvUfqdBzE=
X-Received: by 2002:a05:6000:1d94:b0:22c:c4d1:3622 with SMTP id
 bk20-20020a0560001d9400b0022cc4d13622mr11189561wrb.63.1666341164874; 
 Fri, 21 Oct 2022 01:32:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4U8mA/Q01/4JZg7gTeppehxx6YglbE+y5RJVk/vUd3xNGK/zhvIOVNx+7QuAJ4kQS8+WVP6w==
X-Received: by 2002:a05:6000:1d94:b0:22c:c4d1:3622 with SMTP id
 bk20-20020a0560001d9400b0022cc4d13622mr11189535wrb.63.1666341164538; 
 Fri, 21 Oct 2022 01:32:44 -0700 (PDT)
Received: from redhat.com ([2.54.40.233]) by smtp.gmail.com with ESMTPSA id
 i9-20020a5d6309000000b0022afcc11f65sm18212833wru.47.2022.10.21.01.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 01:32:44 -0700 (PDT)
Date: Fri, 21 Oct 2022 04:32:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Qemu Devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v6 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
Message-ID: <20221021042449-mutt-send-email-mst@kernel.org>
References: <20221020123506.26363-1-ani@anisinha.ca>
 <20221020083810-mutt-send-email-mst@kernel.org>
 <CAARzgwwd_How_h+9sHWPOrWWZ7CbX+DN-uy-KiGf1VVyVmrLnA@mail.gmail.com>
 <20221020084311-mutt-send-email-mst@kernel.org>
 <CAARzgwxfKbrxAqb15GXp4j1enDPUhGBsL5jUzFtDvJkGM-7azw@mail.gmail.com>
 <20221020150857-mutt-send-email-mst@kernel.org>
 <CAARzgwwDjjHL-1fEeuySNZm8NbnGNaeE5h6zrPz_zaANfs5dsw@mail.gmail.com>
 <CAARzgww8P4Za=+r8q2a30TCY7Uzw6g2tgHeLLKr7R+WV-7qQVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAARzgww8P4Za=+r8q2a30TCY7Uzw6g2tgHeLLKr7R+WV-7qQVg@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On Fri, Oct 21, 2022 at 05:45:15AM +0530, Ani Sinha wrote:
> And have multiple platform specific branches in bits that have fixes for those
> platforms so that bits can run there. Plus the existing test can be enhanced to
> pull in binaries from those branches based on the platform on which it is being
> run.
> 

What a mess.
Who is going to be testing all these million platforms?
All this does nothing at all to help developers avoid
bugs and when they do trigger debug the issue. Which is
after all why we have testing.
Yes once in a very long while we are going to tweak
something in the tests, and for that rare occurence
it makes sense to periodically rebuild everything,
otherwise code bitrots.

But the test is supposed to run within a VM anyway, let's
have an image and be done with it.

-- 
MST


