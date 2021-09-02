Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CAE3FEC7B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 12:53:22 +0200 (CEST)
Received: from localhost ([::1]:45446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLkLR-00026b-96
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 06:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLkKR-0000mO-QU
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 06:52:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLkJK-0001cI-B4
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 06:52:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630579868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zOtJNE36iRCRF/WQ1trRIGBYuW7H32Wc3fi221kZLNA=;
 b=Qwp5xYa7+oNlUocLFU2EMuQpZkT8c+ku7LFh+MI1voa99Kl70Txt3Wuawio/wXcsChDVQp
 QH0CiYDEq5xHxF51VVTqAGimNNbFTlp7bhaqiLh4lho2+1t1oWGtSa04n0hoIXYM0m+EqL
 S0pBqrEgOiCoFZS+5LTGV6lXk4PXltw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-VRNWAZMhMc21geU4JyGczg-1; Thu, 02 Sep 2021 06:51:05 -0400
X-MC-Unique: VRNWAZMhMc21geU4JyGczg-1
Received: by mail-wm1-f71.google.com with SMTP id
 m16-20020a7bca50000000b002ee5287d4bfso537320wml.7
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 03:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zOtJNE36iRCRF/WQ1trRIGBYuW7H32Wc3fi221kZLNA=;
 b=mco0oCZ5TLJcLV/TY1uYaw1J1FaTFVVIXWzHf4ED+IzMSJiWMLtab9nqEa6wA6v8mX
 woQJ7qDaK5JCiMWWR+NO1vuL1uvluvIKnC8lmHDSG9qHDHImt2vCGSH43Q9LF2x4YkzN
 rx3OqmehEW7wIwBx8Z+lRwMs3j+ugVdczbWxqvy95kEW0jxY8GMkYncWlrB4//4cITFl
 28j/jDWy2N9eKBNfRkb37jw2FiPEzfcqV56SSMDUxRRuHsAJxmQ+VXTvpVNErssA7P32
 5CCQFlIMgrcYF6yvsx5d01trfVYTsZoVfwz9eQJd2c4J2ssplcoXSbImc+y35fD2KF2g
 gOkw==
X-Gm-Message-State: AOAM530nIa6AmwTTHdHPBnW+iLEKaJYheP8xn6purU+Ao328MeXBNVRk
 IjKo7rxWaaRv7AfewMvaSU1yRI68qMp1F+XgxRsCBSpQfWGUTYiwPNvuM3FwK+hlIQDT0se8ni8
 pHk2C5C7g6YAtQDA=
X-Received: by 2002:a05:6000:344:: with SMTP id
 e4mr2848186wre.423.1630579864554; 
 Thu, 02 Sep 2021 03:51:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoTnTfuV8UtgPzJGN4ddpvTLgZCXcmG1YEYR33989yH4qjB3cAWnJTW8u1AK5V12ibf/V1CA==
X-Received: by 2002:a05:6000:344:: with SMTP id
 e4mr2848169wre.423.1630579864340; 
 Thu, 02 Sep 2021 03:51:04 -0700 (PDT)
Received: from thuth.remote.csb (pd9575431.dip0.t-ipconnect.de. [217.87.84.49])
 by smtp.gmail.com with ESMTPSA id u16sm1469917wmc.41.2021.09.02.03.51.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 03:51:03 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20210825092023.81396-1-thuth@redhat.com>
 <20210825092023.81396-4-thuth@redhat.com>
 <CABgObfb8GHK0F=GCmDtaB=RqZT9+JnG+RRfNK+4XQ-ofoOxumA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 3/3] softmmu/vl: Deprecate the -sdl and -curses option
Message-ID: <a03ba523-ac40-3090-442e-7cc38022a2cc@redhat.com>
Date: Thu, 2 Sep 2021 12:51:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CABgObfb8GHK0F=GCmDtaB=RqZT9+JnG+RRfNK+4XQ-ofoOxumA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.225, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: "Armbruster, Markus" <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/08/2021 15.53, Paolo Bonzini wrote:
> As an alternative, you may want to turn it into "-display sdl" rather than 
> poke at dpy. This isn't much more code, but it keeps the shortcut isolated 
> within a single "case". This follows a lot of recently cleaned up command 
> line parsing code such as -no-hpet, -enable-kvm, -smp etc.
> 
> In the end (spoiler alert for my upcoming KVM Forum presentation—slides are 
> already on sched.com <http://sched.com> :)) what really produces complexity 
> is the lack of isolation/modularity. As long as UI code doesn't care about 
> command line parsing, and command line parsing doesn't care about global 
> variables from all over the place, the cost of shortcuts is so small that it 
> may tilt in favor of keeping them.

Honestly, I'd rather like to see them removed in the end. Our user interface 
is so terribly inconsistent here that I think that these options are rather 
confusing for the users than helpful. For example, why do we have -sdl and 
-curses, but no -gtk ? And as a normal user, I'd also always wonder what's 
the difference between "-display sdl" and "-sdl", since the difference in 
the amount of characters that you have to type here is not that much that it 
justifies the shortcut option. So IMHO let's rather clean this up completely 
than dragging the shortcut options along forever.

  Thomas


