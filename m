Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF6C2C63E6
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 12:27:13 +0100 (CET)
Received: from localhost ([::1]:57744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kibuC-0006Oh-Km
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 06:27:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kibq8-0003XE-SO
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 06:23:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kibq4-00059Y-Rb
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 06:22:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606476176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gpAzRlz8VJwo9WOUbnIcQGu3/QOld+nT+PR9o/kU3Gw=;
 b=PN/6ftnuZxMeMIgSa5AHI+UXZqk6iocPnvnPNQbW1aBJmAjwAVUmrdkwUqfeVTSM8M5WbU
 UwFNNc1eoLc2h+RoYNqcozHOWxAUVyn4liB+TkM+22nq8OhNEwgfZPG8HZoJ9xDV1YrUgZ
 msQ0O4qtp5sLPyJ+0wyPUziuGMNja1M=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-2IlOEMciP0-1wIvtDUPm7g-1; Fri, 27 Nov 2020 06:22:54 -0500
X-MC-Unique: 2IlOEMciP0-1wIvtDUPm7g-1
Received: by mail-ed1-f72.google.com with SMTP id dc6so156949edb.14
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 03:22:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gpAzRlz8VJwo9WOUbnIcQGu3/QOld+nT+PR9o/kU3Gw=;
 b=AqdJAM2YAor6DqIOLlhOBHcyQmBdcCNFI3skzdqVPTwxjD8XN+fiN5pQbQP+GoJsP5
 sQ7XQ9nbC3/f4BtsFlXytWOljOIB04y5pKAkndxWCq1sQnUx9WPHuOigoj4vPmwOtaRs
 vsO7u75kj97h5kO6dHHY4vSATJFGfStUBsCyJEg+387qpduC76eUrQsSqO5XhSI6MUTg
 zJFmHUYmtrYtON9p8tl0Mm0KNQdLk4CkvZSs5XpH669G9lJp64FBvUebVOAgnRdnVm4T
 ymy5IaLGtU2lE5RUgsQvNF9GbL517hUXY7TZ9YkQrEQva+H0oq86rsMiyur5B0NkwMlY
 H/xw==
X-Gm-Message-State: AOAM533ub0tUgd5X7zphpeC8bzGMclKSJtZy2gkcAOboW/YCfZ+uGH5s
 dHpg6AhdDkiWwGBZYAHMvnDoJdYuMIVArFVlsIXU/UtiMDbTFXAEvlqdOVk+AikrFHlKtkS4FXM
 uiGjvEAq0N1jh59/hq8P4dIlJKi8FBdVylHtyu41/AUQraV3zaEJYAenSqUc5iZXdUV4=
X-Received: by 2002:a17:907:20cd:: with SMTP id
 qq13mr7151640ejb.141.1606476173251; 
 Fri, 27 Nov 2020 03:22:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3Lxu0TU9dH+9/CJhtjiWLZDbHCgd/+dFwLdkdd8OEoRBfKTFnYr7HQmS/9GNb0PjMnjzSqg==
X-Received: by 2002:a17:907:20cd:: with SMTP id
 qq13mr7151619ejb.141.1606476172978; 
 Fri, 27 Nov 2020 03:22:52 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id jw7sm4627300ejb.54.2020.11.27.03.22.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 03:22:52 -0800 (PST)
Subject: Re: [PATCH 13/36] vl: move semihosting command line fallback to
 qemu_init_board
To: Igor Mammedov <imammedo@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
 <20201123141435.2726558-14-pbonzini@redhat.com>
 <20201126181036.3ff5d605@redhat.com>
 <8866f216-911b-2803-4b15-0e794c4c71e1@redhat.com>
 <20201127113154.1c9ef2c6@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <70f2f8cc-0b5c-72e4-434b-35197c70809b@redhat.com>
Date: Fri, 27 Nov 2020 12:22:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201127113154.1c9ef2c6@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/11/20 11:31, Igor Mammedov wrote:
>> Yes, calling it around machine initialization time is also a
>> possibility.  I just wanted to get rid of it in code that I'm actually
>> looking at.:)
> I'd prefer it being moved close to CLI parsing,
> in a place where other _early call go.
> 
> We probably want qemu_init_board() being clear of not really needed clutter.
> 

Fair enough, I'd put -semihosting-config in the same bucket as 
-m/-boot/-smp (machine configuration that isn't in -M) so I'll move it 
together with them.

Paolo


